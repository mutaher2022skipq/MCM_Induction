# MCM Online Induction System – Comprehensive Reanalysis (Nov 2025)

**Scope:** Full project walkthrough after recent fixes, covering flows, fee logic, admin tooling, CSV status, backend/security checks, and actionable findings.

---

## 1. Project Structure & Responsibilities

| App | Key Models | Responsibilities | Forms / URLs / Templates |
| --- | --- | --- | --- |
| `accounts` | `User`, `EmailVerification` | Two-step signup (class selection + personal info), age gating, email verification, login/logout, password reset | Forms: `ClassSelectionForm`, `StudentSignupForm`; URLs under `accounts/`; templates in `templates/accounts/*` |
| `admissions` | `Application`, `AdmissionSession`, `FormFieldVisibility`, `FeeConfig`, `FeeCategoryConfig`, `MessageTemplate` | Student dashboard, application form, challan/fee slip handling, roll-slip generation, admin dashboards, analytics, exports, broadcast messaging | Forms: `ApplicationForm`; URLs under `admissions/`; templates in `templates/admissions/*` & `templates/admin_portal/*` |
| `notifications` | `Notification` | In-app notifications & mark-as-read endpoints | Simple URLs under `notifications/` |

**Global:** Root `mcm_admission/urls.py` mounts all apps. Settings define `AUTH_USER_MODEL`, media/static dirs, and contact info (`ADMISSION_CONTACT_EMAIL/PHONE`).

---

## 2. Registration & Applicant Flow (VIII & XI)

1. **Signup Step 1 (`accounts:signup_step1`)**
   - Shows only open classes (`AdmissionSession.is_open=True`).
   - Age validation: VIII (12–14 on Apr 1 next year); XI (15–17 on Jul 1 next year).
   - Stores `class_applied` + `dob` in session.

2. **Signup Step 2 (`accounts:signup_step2`)**
   - Collects user credentials/contact details.
   - Saves inactive user with `class_applied`, `dob`, `role='student'`.
   - Sends email verification code and redirects to `/accounts/verify-email/`.

3. **Email Verification**
   - Confirms code, activates user, auto-logins, redirects to `admissions:dashboard`.

4. **Dashboard & Application (`admissions:dashboard`, `complete_application`)**
   - Ensures `Application` exists and syncs `class_name` with user’s class.
   - Displays dynamic fee preview (`get_dynamic_fee_for_application`), progress, notifications.
   - `complete_application` populates defaults, enforces XI document requirements, handles shaheed logic, and sets status to `payment_pending`.

5. **Challan & Fee Payment**
   - `print_challan`: recalculates fee per class/category/date, sets challan no/date, shows template.
   - `upload_fee_slip`: uploads proof, toggles `payment_status='under_review'`, `status='submitted'`.

6. **Admin Verification**
   - Manual (`verify_challan_list/verify_challan_action`) or bulk (`bulk_applicant_action` + Celery task).
   - On verification: assigns roll number, generates roll-slip PDF, emails applicant with contact info, creates notification.

7. **Roll-Slip Download**
   - Dashboard link (`download_roll_slip_dashboard`) or secure token route for email link.

8. **Admin Controls**
   - `admin_dashboard`: toggle sessions, filter applicants, view counts.
   - `fee_management_dashboard`: edit deadlines, per-category fees (VIII), flat fees (XI).
   - Analytics exports, CSV/Excel exports, broadcast template management.

---

## 3. Flow Testing & Observations

| Step | Status | Notes |
| --- | --- | --- |
| Signup Step 1 | ✅ | Age rules enforced, hidden fields controlled via `FormFieldVisibility`. |
| Signup Step 2 | ✅ | Creates inactive user, triggers email code. |
| Email Verification | ✅ | Activates+logs user, clears session placeholders. |
| Application Form | ⚠️ | `ApplicationForm` lacks `mobile_no` in `fields`, so `clean_mobile_no` never runs; manual POST field bypasses validation. |
| Category Selection | ✅ | Required for military categories; shaheed fields auto-reset for civilians. |
| Fee Calculation | ✅ | `get_dynamic_fee_for_application` handles VIII (per category) & XI (flat). Legacy fallback map available. |
| Document Upload | ✅ | XI marksheets validated (size/type). Photo validator added. |
| Final Submission | ✅ | Status transitions to `payment_pending`/`submitted`. |
| Roll-Slip Generation | ✅ | PDF via ReportLab; email + notification triggered with latest contact info. |

Broken redirects/URL gaps: none detected (all referenced routes exist).  
Incorrect form fields: only `ApplicationForm` missing `mobile_no` (see Findings).

---

## 4. Fee Logic Review

- **Config Models**: `FeeConfig` stores deadlines (`normal`, `late`, `final`), stop flag, and base/double/triple fees (for XI fallback). `FeeCategoryConfig` ties categories to tiered amounts for VIII.
- **Runtime Calculation** (`get_dynamic_fee_for_application`):
  - Stops new challans if `stop_after_final` and date past `final_deadline`.
  - Class XI: returns flat `base/double/triple` by date.
  - Class VIII: looks up category row; falls back to config base fees if missing.
- **Fee Preview** (`fee_preview_ajax`): AJAX endpoint powers admin UI (JS file `static/js/fee_preview_ajax.js`).
- **Admin Controls**: `fee_management_dashboard` ensures deadlines/fees editable; `fee_config_edit` and `fee_category_edit` provide detail pages.
- **Contact data** in all notifications now sourced from settings (`mcmcoord@gmail.com` + `051-3752010`).

Deadlines and doubling/tripling logic are correctly enforced; no mismatched tiers observed.

---

## 5. Category Logic

- Category choices cover all requested groups (officers, JCOs, civilians, regional quotas, Navy/Airforce).
- `ApplicationForm.clean()` requires shaheed details for retired military categories; clears those fields for others.
- UI hides optional military fields using `FormFieldVisibility`.
- Fee logic respects categories via `FeeCategoryConfig` linking.
- Observed issue: `Application.status_label` is referenced in `complete_application` but no such field exists on the model (legacy artifact) – harmless but dead code.

---

## 6. CSV Import Testing

- **Result:** ❌ No CSV import functionality exists.
  - Only `export_applicants_csv` and `export_applicants_excel` are implemented.
  - Requirements (college_number constant, class/house updates, duplicate handling) remain unmet.
- **Recommendation:** Build admin-only upload form & view:
  - Accepts CSV, validates headers (`college_number`, `class`, `house`, etc.).
  - Uses `college_number` to match `Application`/`User`.
  - Handles duplicates, invalid rows, and provides summary report.

---

## 7. Admin Panel Review

- **Induction Control:** `AdmissionSession` toggles via dashboard or `/toggle-admission/<session_id>/`.
- **XI Enable/Disable:** same mechanism; each class has its own `AdmissionSession`.
- **Fee Deadlines & Tiers:** `fee_management_dashboard` UI + preview JS allow adjusting deadlines and category fees.
- **Analytics & Exports:** ChartJS data via `analytics_data`, PDF export uses WeasyPrint template with updated contact info; CSV/Excel exports include class and XI-specific columns.
- **Broadcast Messaging:** template creation, preview, and Celery-based dispatch available; ensures in-app + email notifications.
- **Improvements:** consider adding dashboard widgets indicating upcoming deadlines, and integrate CSV import once built.

---

## 8. Backend & Security Checks

- **POST simulations**: logic reviewed for `complete_application`, `upload_fee_slip`, `bulk_applicant_action`, etc. All CSRF-protected (except `create_message_template` was fixed earlier).
- **Validation**: CNIC + phone validation added but phone still bypassed (see Finding #1). XI file validators enforce size/type.
- **Authentication**: staff-only views decorated with `@user_passes_test(staff_required)` or `@staff_member_required`.
- **Celery fallback**: `bulk_verify_applications_task` handles roll-slip email generation; logging replaces `print`.
- **Security gaps**: No brute-force rate limiting on login/email verification; consider throttling.

---

## 9. Models, DB & Files

- `Application` has indexes on `user`, `roll_number`, `status`, `category`, `test_center`. Relationships (OneToOne with `User`, FK configs) are appropriate.
- Media folders (photos, fee_slips, roll_slips, xi/marksheets) configured via `MEDIA_ROOT`.
- `status_label` references in views correspond to non-existent field—should be removed to avoid confusion.

---

## 10. Logs & Errors

- No runtime logs available, but code now uses `logging`. Key try/except blocks cover PDF/email generation, Celery tasks, and external interactions.
- `ApplicationForm` re-logs form errors at DEBUG level for easier diagnostics.
- Missing migrations: none detected (latest migration `0013_feeconfig_feecategoryconfig` is applied).

---

## 11. Findings & Action Items

| # | Severity | Issue | Details / Files | Suggested Fix |
| --- | --- | --- | --- | --- |
| 1 | ⚠️ High | `mobile_no` never validated | `admissions/forms.py` adds `clean_mobile_no`, but `ApplicationForm.fields` omits `mobile_no`. `complete_application` uses raw POST `phone`. | Add `mobile_no` to form `fields`, remove manual POST handling, rely on form validation and `clean_mobile_no`. |
| 2 | ⚠️ High | CSV import missing | No view or model logic satisfies required CSV ingestion/class-house updates. | Implement admin CSV upload view using `college_number` to match applicants; add duplicate checks & error reporting. |
| 3 | ⚠️ Medium | `status_label` dead code | `complete_application` assigns `app.status_label`, but model has no such field. | Remove `status_label` references or introduce field if still needed. |
| 4 | ⚠️ Medium | No rate limiting on verification/login | `resend_code` uses 60-second delay but unlimited attempts; login lacks throttling. | Add attempt counters or integrate Django AXES / throttling middleware. |
| 5 | ⚠️ Medium | CSV exports lack phone validation | Export includes raw `mobile_no`; if validation stays bypassed, data may be inconsistent. | Resolves automatically once Finding #1 is fixed. |
| 6 | ⚠️ Low | No automated tests | No unit tests for fee tiers, admin toggles, Celery tasks, or forms. | Add tests covering `get_dynamic_fee_for_application`, `ApplicationForm` validation, and key view flows. |
| 7 | ⚠️ Low | Logging only to default handler | No log configuration for production (file rotation, severity separation). | Configure Django logging dict with handlers for Celery/tasks, errors, etc. |

---

## 12. Recommended Next Steps

1. **Fix Phone Validation**: Add `mobile_no` to `ApplicationForm.fields`, update templates to use form field, remove manual `phone` POST usage.
2. **Build CSV Import**: New admin page with secure upload, header validation, duplicate detection, and summary output (success vs. errors).
3. **Clean Dead Code**: Remove `status_label` assignments or reintroduce field if admin UI actually needs it.
4. **Security Hardening**: Add throttling/rate limiting for login/email verification; ensure Celery broker credentials stored securely.
5. **Testing**: Introduce automated tests for critical flows to catch regressions (fees, session toggles, form validation).
6. **Logging**: Configure log handlers (file + console) with proper levels for production monitoring.

---

**Report prepared:** Comprehensive reanalysis complete – ready for implementation prioritization.

