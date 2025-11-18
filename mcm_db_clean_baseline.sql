--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts_emailverification; Type: TABLE; Schema: public; Owner: mcm_user
--

CREATE TABLE public.accounts_emailverification (
    id bigint NOT NULL,
    code character varying(6) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    is_used boolean NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.accounts_emailverification OWNER TO mcm_user;

--
-- Name: accounts_emailverification_id_seq; Type: SEQUENCE; Schema: public; Owner: mcm_user
--

CREATE SEQUENCE public.accounts_emailverification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accounts_emailverification_id_seq OWNER TO mcm_user;

--
-- Name: accounts_emailverification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mcm_user
--

ALTER SEQUENCE public.accounts_emailverification_id_seq OWNED BY public.accounts_emailverification.id;


--
-- Name: accounts_user; Type: TABLE; Schema: public; Owner: mcm_user
--

CREATE TABLE public.accounts_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    role character varying(20) NOT NULL,
    phone character varying(15),
    province character varying(100),
    class_applied character varying(10),
    dob date,
    father_name character varying(100)
);


ALTER TABLE public.accounts_user OWNER TO mcm_user;

--
-- Name: accounts_user_groups; Type: TABLE; Schema: public; Owner: mcm_user
--

CREATE TABLE public.accounts_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_user_groups OWNER TO mcm_user;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: mcm_user
--

CREATE SEQUENCE public.accounts_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accounts_user_groups_id_seq OWNER TO mcm_user;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mcm_user
--

ALTER SEQUENCE public.accounts_user_groups_id_seq OWNED BY public.accounts_user_groups.id;


--
-- Name: accounts_user_id_seq; Type: SEQUENCE; Schema: public; Owner: mcm_user
--

CREATE SEQUENCE public.accounts_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accounts_user_id_seq OWNER TO mcm_user;

--
-- Name: accounts_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mcm_user
--

ALTER SEQUENCE public.accounts_user_id_seq OWNED BY public.accounts_user.id;


--
-- Name: accounts_user_user_permissions; Type: TABLE; Schema: public; Owner: mcm_user
--

CREATE TABLE public.accounts_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_user_user_permissions OWNER TO mcm_user;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mcm_user
--

CREATE SEQUENCE public.accounts_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accounts_user_user_permissions_id_seq OWNER TO mcm_user;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mcm_user
--

ALTER SEQUENCE public.accounts_user_user_permissions_id_seq OWNED BY public.accounts_user_user_permissions.id;


--
-- Name: admissions_admissionsession; Type: TABLE; Schema: public; Owner: mcm_user
--

CREATE TABLE public.admissions_admissionsession (
    id bigint NOT NULL,
    class_name character varying(10) NOT NULL,
    is_open boolean NOT NULL
);


ALTER TABLE public.admissions_admissionsession OWNER TO mcm_user;

--
-- Name: admissions_admissionsession_id_seq; Type: SEQUENCE; Schema: public; Owner: mcm_user
--

CREATE SEQUENCE public.admissions_admissionsession_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admissions_admissionsession_id_seq OWNER TO mcm_user;

--
-- Name: admissions_admissionsession_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mcm_user
--

ALTER SEQUENCE public.admissions_admissionsession_id_seq OWNED BY public.admissions_admissionsession.id;


--
-- Name: admissions_application; Type: TABLE; Schema: public; Owner: mcm_user
--

CREATE TABLE public.admissions_application (
    id bigint NOT NULL,
    shaheed_status character varying(5),
    photo character varying(100),
    status character varying(20) NOT NULL,
    submission_date date NOT NULL,
    challan_image character varying(100),
    admin_remarks text,
    total_fee integer NOT NULL,
    amount integer NOT NULL,
    payment_proof character varying(100),
    payment_status character varying(20) NOT NULL,
    fee_type character varying(20) NOT NULL,
    entry character varying(100) NOT NULL,
    category character varying(50),
    name character varying(100) NOT NULL,
    father_name character varying(100) NOT NULL,
    mother_name character varying(100) NOT NULL,
    dob date,
    guardian character varying(100) NOT NULL,
    form_b character varying(50),
    father_cnic character varying(15) NOT NULL,
    mother_cnic character varying(15) NOT NULL,
    domicile character varying(50) NOT NULL,
    religion character varying(50) NOT NULL,
    father_occupation character varying(100) NOT NULL,
    army_no character varying(50),
    rank character varying(50),
    shaheed_in character varying(50),
    arm character varying(50) NOT NULL,
    arm_info character varying(100),
    postal_address text NOT NULL,
    mobile_no character varying(15) NOT NULL,
    landline_no character varying(15),
    test_center character varying(200) NOT NULL,
    roll_number character varying(20),
    challan_no character varying(20),
    challan_date date,
    user_id bigint NOT NULL,
    CONSTRAINT admissions_application_amount_check CHECK ((amount >= 0)),
    CONSTRAINT admissions_application_total_fee_check CHECK ((total_fee >= 0))
);


ALTER TABLE public.admissions_application OWNER TO mcm_user;

--
-- Name: admissions_application_id_seq; Type: SEQUENCE; Schema: public; Owner: mcm_user
--

CREATE SEQUENCE public.admissions_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admissions_application_id_seq OWNER TO mcm_user;

--
-- Name: admissions_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mcm_user
--

ALTER SEQUENCE public.admissions_application_id_seq OWNED BY public.admissions_application.id;


--
-- Name: admissions_formfieldvisibility; Type: TABLE; Schema: public; Owner: mcm_user
--

CREATE TABLE public.admissions_formfieldvisibility (
    id bigint NOT NULL,
    field_name character varying(100) NOT NULL,
    is_visible boolean NOT NULL
);


ALTER TABLE public.admissions_formfieldvisibility OWNER TO mcm_user;

--
-- Name: admissions_formfieldvisibility_id_seq; Type: SEQUENCE; Schema: public; Owner: mcm_user
--

CREATE SEQUENCE public.admissions_formfieldvisibility_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admissions_formfieldvisibility_id_seq OWNER TO mcm_user;

--
-- Name: admissions_formfieldvisibility_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mcm_user
--

ALTER SEQUENCE public.admissions_formfieldvisibility_id_seq OWNED BY public.admissions_formfieldvisibility.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: mcm_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO mcm_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: mcm_user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_id_seq OWNER TO mcm_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mcm_user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: mcm_user
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO mcm_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mcm_user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_permissions_id_seq OWNER TO mcm_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mcm_user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: mcm_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO mcm_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: mcm_user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_permission_id_seq OWNER TO mcm_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mcm_user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: mcm_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO mcm_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: mcm_user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_admin_log_id_seq OWNER TO mcm_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mcm_user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: mcm_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO mcm_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: mcm_user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_content_type_id_seq OWNER TO mcm_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mcm_user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: mcm_user
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO mcm_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: mcm_user
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_migrations_id_seq OWNER TO mcm_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mcm_user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: mcm_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO mcm_user;

--
-- Name: notifications_notification; Type: TABLE; Schema: public; Owner: mcm_user
--

CREATE TABLE public.notifications_notification (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    message text NOT NULL,
    link character varying(200),
    is_read boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.notifications_notification OWNER TO mcm_user;

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: mcm_user
--

CREATE SEQUENCE public.notifications_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_notification_id_seq OWNER TO mcm_user;

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mcm_user
--

ALTER SEQUENCE public.notifications_notification_id_seq OWNED BY public.notifications_notification.id;


--
-- Name: accounts_emailverification id; Type: DEFAULT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.accounts_emailverification ALTER COLUMN id SET DEFAULT nextval('public.accounts_emailverification_id_seq'::regclass);


--
-- Name: accounts_user id; Type: DEFAULT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.accounts_user ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_id_seq'::regclass);


--
-- Name: accounts_user_groups id; Type: DEFAULT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.accounts_user_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_groups_id_seq'::regclass);


--
-- Name: accounts_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.accounts_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_user_permissions_id_seq'::regclass);


--
-- Name: admissions_admissionsession id; Type: DEFAULT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.admissions_admissionsession ALTER COLUMN id SET DEFAULT nextval('public.admissions_admissionsession_id_seq'::regclass);


--
-- Name: admissions_application id; Type: DEFAULT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.admissions_application ALTER COLUMN id SET DEFAULT nextval('public.admissions_application_id_seq'::regclass);


--
-- Name: admissions_formfieldvisibility id; Type: DEFAULT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.admissions_formfieldvisibility ALTER COLUMN id SET DEFAULT nextval('public.admissions_formfieldvisibility_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: notifications_notification id; Type: DEFAULT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.notifications_notification ALTER COLUMN id SET DEFAULT nextval('public.notifications_notification_id_seq'::regclass);


--
-- Data for Name: accounts_emailverification; Type: TABLE DATA; Schema: public; Owner: mcm_user
--

COPY public.accounts_emailverification (id, code, created_at, is_used, user_id) FROM stdin;
18	185632	2025-11-06 23:12:47.945369+05	t	20
19	989691	2025-11-06 23:21:20.644946+05	t	21
\.


--
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: mcm_user
--

COPY public.accounts_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, role, phone, province, class_applied, dob, father_name) FROM stdin;
20	pbkdf2_sha256$260000$MF0BH42TwiNYiyergBsInT$8vH1pT9gYh25S6zG5Zrr50jWKhJHE1YWST5QhxUVlcM=	2025-11-06 23:13:40.62019+05	f	aimer			vetanity@gmail.com	f	t	2025-11-06 19:45:53.543491+05	student	03169228410	\N	\N	2013-02-28	akmal
1	pbkdf2_sha256$260000$rWs4UrBbDSE4pOClsz6qgX$4WlNRxdc1R2TwTrB00MyPZJboYjjWhbeZWWfdshloQU=	2025-11-06 23:14:59.58322+05	t	mcm_user			mutaherkhan395@gmail.com	t	t	2025-10-10 19:51:11.552354+05	student	\N	\N	\N	\N	\N
21	pbkdf2_sha256$260000$4pYI2qKHfHEz1CpY50Ke1w$w3S4gL4VpKwcSGT2x/aMASxKf89NVizZZatkfxd/3XA=	2025-11-06 23:22:08.778128+05	f	sikander			mutaher.khan.skipq@gmail.com	f	t	2025-11-06 23:21:20.130561+05	student	03349137252	\N	\N	2013-02-08	gull shah
\.


--
-- Data for Name: accounts_user_groups; Type: TABLE DATA; Schema: public; Owner: mcm_user
--

COPY public.accounts_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: accounts_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: mcm_user
--

COPY public.accounts_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: admissions_admissionsession; Type: TABLE DATA; Schema: public; Owner: mcm_user
--

COPY public.admissions_admissionsession (id, class_name, is_open) FROM stdin;
1	VIII	t
2	XI	t
\.


--
-- Data for Name: admissions_application; Type: TABLE DATA; Schema: public; Owner: mcm_user
--

COPY public.admissions_application (id, shaheed_status, photo, status, submission_date, challan_image, admin_remarks, total_fee, amount, payment_proof, payment_status, fee_type, entry, category, name, father_name, mother_name, dob, guardian, form_b, father_cnic, mother_cnic, domicile, religion, father_occupation, army_no, rank, shaheed_in, arm, arm_info, postal_address, mobile_no, landline_no, test_center, roll_number, challan_no, challan_date, user_id) FROM stdin;
5	\N		draft	2025-11-06		\N	3000	0		pending	Single	8th Class Entry-2026	\N				\N		\N						\N	\N	\N		\N			\N		\N	\N	\N	20
6	\N		draft	2025-11-06		\N	3000	0		pending	Single	8th Class Entry-2026	\N				\N		\N						\N	\N	\N		\N			\N		\N	\N	\N	21
\.


--
-- Data for Name: admissions_formfieldvisibility; Type: TABLE DATA; Schema: public; Owner: mcm_user
--

COPY public.admissions_formfieldvisibility (id, field_name, is_visible) FROM stdin;
1	photo	t
2	name	t
3	father_name	t
4	mother_name	t
5	dob	t
6	guardian	t
7	form_b	t
8	father_cnic	t
9	mother_cnic	t
10	domicile	t
11	religion	t
12	father_occupation	t
13	army_no	t
14	rank	t
15	category	t
16	shaheed_status	t
17	shaheed_in	t
18	arm	t
19	arm_info	t
20	postal_address	t
21	mobile_no	t
22	landline_no	t
23	test_center	t
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: mcm_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: mcm_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: mcm_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add application	7	add_application
26	Can change application	7	change_application
27	Can delete application	7	delete_application
28	Can view application	7	view_application
29	Can add email verification	8	add_emailverification
30	Can change email verification	8	change_emailverification
31	Can delete email verification	8	delete_emailverification
32	Can view email verification	8	view_emailverification
33	Can add form field visibility	9	add_formfieldvisibility
34	Can change form field visibility	9	change_formfieldvisibility
35	Can delete form field visibility	9	delete_formfieldvisibility
36	Can view form field visibility	9	view_formfieldvisibility
37	Can add admission session	10	add_admissionsession
38	Can change admission session	10	change_admissionsession
39	Can delete admission session	10	delete_admissionsession
40	Can view admission session	10	view_admissionsession
41	Can add notification	11	add_notification
42	Can change notification	11	change_notification
43	Can delete notification	11	delete_notification
44	Can view notification	11	view_notification
45	Can add admission session	12	add_admissionsession
46	Can change admission session	12	change_admissionsession
47	Can delete admission session	12	delete_admissionsession
48	Can view admission session	12	view_admissionsession
49	Can add form field visibility	13	add_formfieldvisibility
50	Can change form field visibility	13	change_formfieldvisibility
51	Can delete form field visibility	13	delete_formfieldvisibility
52	Can view form field visibility	13	view_formfieldvisibility
53	Can add application	14	add_application
54	Can change application	14	change_application
55	Can delete application	14	delete_application
56	Can view application	14	view_application
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: mcm_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2025-11-06 17:51:21.178689+05	2	shazad	3		6	1
2	2025-11-06 17:51:21.19642+05	17	usman	3		6	1
3	2025-11-06 19:44:27.970566+05	16	aimer	3		6	1
4	2025-11-06 19:44:27.97256+05	19	jameel	3		6	1
5	2025-11-06 19:44:27.97256+05	18	usman	3		6	1
6	2025-11-06 23:17:25.271435+05	2	Class XI (Open)	1	[{"added": {}}]	10	1
7	2025-11-06 23:19:01.455951+05	14	akbar	3		6	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: mcm_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	accounts	user
7	admissions	application
8	accounts	emailverification
9	admissions	formfieldvisibility
10	admissions	admissionsession
11	notifications	notification
12	accounts	admissionsession
13	accounts	formfieldvisibility
14	accounts	application
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: mcm_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
64	contenttypes	0001_initial	2025-11-06 23:57:37.452165+05
65	contenttypes	0002_remove_content_type_name	2025-11-07 00:02:00.791363+05
66	auth	0001_initial	2025-11-07 00:02:00.810565+05
67	auth	0002_alter_permission_name_max_length	2025-11-07 00:02:00.823+05
68	auth	0003_alter_user_email_max_length	2025-11-07 00:02:00.833866+05
69	auth	0004_alter_user_username_opts	2025-11-07 00:02:00.84483+05
70	auth	0005_alter_user_last_login_null	2025-11-07 00:02:00.855462+05
71	auth	0006_require_contenttypes_0002	2025-11-07 00:02:00.85989+05
72	auth	0007_alter_validators_add_error_messages	2025-11-07 00:02:00.874414+05
73	auth	0008_alter_user_username_max_length	2025-11-07 00:02:00.885394+05
74	auth	0009_alter_user_last_name_max_length	2025-11-07 00:02:00.898562+05
75	auth	0010_alter_group_name_max_length	2025-11-07 00:02:00.936229+05
76	auth	0011_update_proxy_permissions	2025-11-07 00:02:00.950704+05
77	auth	0012_alter_user_first_name_max_length	2025-11-07 00:02:00.963479+05
78	accounts	0001_initial	2025-11-07 00:02:00.985371+05
79	admin	0001_initial	2025-11-07 00:02:00.996266+05
80	admin	0002_logentry_remove_auto_add	2025-11-07 00:02:01.006224+05
81	admin	0003_logentry_add_action_flag_choices	2025-11-07 00:02:01.017383+05
82	admissions	0001_initial	2025-11-07 00:02:01.032434+05
83	admissions	0002_auto_20251105_1133	2025-11-07 00:04:35.732924+05
84	admissions	0003_alter_application_category	2025-11-07 00:04:35.761493+05
85	admissions	0004_auto_20251105_2154	2025-11-07 00:05:35.289306+05
86	admissions	0005_alter_application_category	2025-11-07 00:05:35.313019+05
87	admissions	0006_alter_application_category	2025-11-07 00:05:35.334644+05
88	sessions	0001_initial	2025-11-07 00:05:35.34331+05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: mcm_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
jul1olxm0duakkfyrosa864oh85cwi89	.eJxVi70KwjAQgN8ls5Q0Xv4cBWcn53K5XEjRRmiaSXx3I3TQ9ft5iQnblqdWeZ3mKE5CicMvC0h3Ll-BRM9WtjrsqA63HhRc-LpeFpwf5z39-zPW3GcJhnxCkETaKZU06RRcMoQjHhkkeEzWkhojOB0jW-RgTSR04PtoxPsD2Qs4uA:1vBX4V:3iqRYwIESj2Fs3kua_shwCXSEG4eP_Go5T74-F4dCcE	2025-11-05 16:32:03.334849+05
zb1ehcqrhdvxywe467zd4smaokbvuoxb	.eJxVjL0OgjAURt-ls2noPzoZE2cn56bcXizBFqR0Mr67JWFh_c4535fMmPyQXhajG97kQmJZXcCFjsElmsdh_lxfG6IwRXIi1pU12JJxsYOvOmfHsXMw1sdKHMBU0prpPmX6rEJyER_LfXu87eqhDy6HGmt27lspO9UYjoJDr5lGAUYIhdozbxrPAY1mpuUVCCMbz1oAZFIowxX5_QHLO0fc:1vH4ca:OiGZcHtbD2oBW-adPUy2I8m7kbNIx2kP00GSRVRx9TY	2025-11-20 23:22:08.781121+05
t7o20zcp4dnbciktdbko0ho2k56apn6w	e30:1vBXTD:_Gmt9v_FnwrtLU_fin3YQ-8HLKnApxMCX0eCMNWtOVE	2025-11-05 16:57:35.176078+05
e7vneqcljtzfg0imy5xt9tebqt38as2t	.eJxVi7sOgjAUht-lsyGlN6mjibOTM_nP6SElCiaUTsZ3FxMGXb_LS_Woa-5rkaUfkzqp1qnDLyTwXeavAfOzzmtpdlSa2xbMmOS6XCaMj_Oe_v0ZJW-zYwSAtdgYuRv4GKE7bw0hAYGdpIFa7cUGRCEh56FBxrg2hqQpqPcHGqs5Hw:1vBY1W:buVm6UEp7sMOUBaKUZqM0bY2SqACr6MOuSyqrxEoKdU	2025-11-05 17:33:02.695345+05
bkapi4p7of1me7lmlci8917ttqsz4mdb	.eJxVi70OwiAQgN-F2TQcUDgcTZydnJuDg9BoaVLayfju1qSDrt_PSwy0rWXYWlqGkcVZgDj9skDxkepXUIzzVtfWHah19z2oNKXbcp1ofF6O9O8v1Mo-ZxnRAHrEXrHTGpAtZ_YOMWRWRnlDDMEbcIZULzNqhaCyAWkteCveH56ENlI:1vBY2d:fanEZVypxcFofq-kwq0rbvuLlsYbiB9pt3TqTSfDKxM	2025-11-05 17:34:11.727345+05
spv2su89kfuxnsn83nf2az7kds8i5b7s	.eJxVi7sOwiAUht-F2TSF9sjB0cTZyZkcfjA02jYpZTK-uzbpoOt3eSkvdc2-lrT4IaqTMurwy4LgkaZNCDDXaS3Njkpz-waTjOm6XEYZnuc9_fuzlLzNdwYn2x-pg24pWM2QAGsiJ2a4TlMwthcLAzhm3YJCFCFyZJig3h_HozfF:1vEUo9:qzUvh_-lzZ12PjEZ3HzI4TcnYut82UtfGEsR7fQialQ	2025-11-13 20:43:25.446414+05
lo0s0nl6zs3crt21lthcj9io5k2a7t95	.eJxVjDsOwjAQRO_iGln-4Q8lPWew7N01DiBbipMKcXcSKQUU08x7M28W07rUuA6a44Tswiw7_XY5wZPaDvCR2r1z6G2Zp8x3hR908FtHel0P9--gplG3tVRKoSaJwvocXHCCINCWpHMoTmaXnTGGbAGEMyXUACUUix6DN16wzxfzWzi3:1v9K0A:sZyacJPP05fA2I11TpxPO5nr9WKv4OCTBeq3r1Kr9Dg	2025-10-30 14:10:26.174382+05
\.


--
-- Data for Name: notifications_notification; Type: TABLE DATA; Schema: public; Owner: mcm_user
--

COPY public.notifications_notification (id, title, message, link, is_read, created_at, user_id) FROM stdin;
\.


--
-- Name: accounts_emailverification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mcm_user
--

SELECT pg_catalog.setval('public.accounts_emailverification_id_seq', 19, true);


--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mcm_user
--

SELECT pg_catalog.setval('public.accounts_user_groups_id_seq', 1, false);


--
-- Name: accounts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mcm_user
--

SELECT pg_catalog.setval('public.accounts_user_id_seq', 21, true);


--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mcm_user
--

SELECT pg_catalog.setval('public.accounts_user_user_permissions_id_seq', 1, false);


--
-- Name: admissions_admissionsession_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mcm_user
--

SELECT pg_catalog.setval('public.admissions_admissionsession_id_seq', 2, true);


--
-- Name: admissions_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mcm_user
--

SELECT pg_catalog.setval('public.admissions_application_id_seq', 6, true);


--
-- Name: admissions_formfieldvisibility_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mcm_user
--

SELECT pg_catalog.setval('public.admissions_formfieldvisibility_id_seq', 23, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mcm_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mcm_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mcm_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mcm_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 7, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mcm_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mcm_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 88, true);


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mcm_user
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 2, true);


--
-- Name: accounts_emailverification accounts_emailverification_pkey; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.accounts_emailverification
    ADD CONSTRAINT accounts_emailverification_pkey PRIMARY KEY (id);


--
-- Name: accounts_user accounts_user_email_b2644a56_uniq; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_email_b2644a56_uniq UNIQUE (email);


--
-- Name: accounts_user_groups accounts_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_groups accounts_user_groups_user_id_group_id_59c0b32f_uniq; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_group_id_59c0b32f_uniq UNIQUE (user_id, group_id);


--
-- Name: accounts_user accounts_user_pkey; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq UNIQUE (user_id, permission_id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: accounts_user accounts_user_username_key; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_username_key UNIQUE (username);


--
-- Name: admissions_admissionsession admissions_admissionsession_class_name_key; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.admissions_admissionsession
    ADD CONSTRAINT admissions_admissionsession_class_name_key UNIQUE (class_name);


--
-- Name: admissions_admissionsession admissions_admissionsession_pkey; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.admissions_admissionsession
    ADD CONSTRAINT admissions_admissionsession_pkey PRIMARY KEY (id);


--
-- Name: admissions_application admissions_application_pkey; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.admissions_application
    ADD CONSTRAINT admissions_application_pkey PRIMARY KEY (id);


--
-- Name: admissions_application admissions_application_roll_number_key; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.admissions_application
    ADD CONSTRAINT admissions_application_roll_number_key UNIQUE (roll_number);


--
-- Name: admissions_application admissions_application_user_id_key; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.admissions_application
    ADD CONSTRAINT admissions_application_user_id_key UNIQUE (user_id);


--
-- Name: admissions_formfieldvisibility admissions_formfieldvisibility_field_name_key; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.admissions_formfieldvisibility
    ADD CONSTRAINT admissions_formfieldvisibility_field_name_key UNIQUE (field_name);


--
-- Name: admissions_formfieldvisibility admissions_formfieldvisibility_pkey; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.admissions_formfieldvisibility
    ADD CONSTRAINT admissions_formfieldvisibility_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: notifications_notification notifications_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notification_pkey PRIMARY KEY (id);


--
-- Name: accounts_emailverification_user_id_4f5b1661; Type: INDEX; Schema: public; Owner: mcm_user
--

CREATE INDEX accounts_emailverification_user_id_4f5b1661 ON public.accounts_emailverification USING btree (user_id);


--
-- Name: accounts_user_email_b2644a56_like; Type: INDEX; Schema: public; Owner: mcm_user
--

CREATE INDEX accounts_user_email_b2644a56_like ON public.accounts_user USING btree (email varchar_pattern_ops);


--
-- Name: accounts_user_groups_group_id_bd11a704; Type: INDEX; Schema: public; Owner: mcm_user
--

CREATE INDEX accounts_user_groups_group_id_bd11a704 ON public.accounts_user_groups USING btree (group_id);


--
-- Name: accounts_user_groups_user_id_52b62117; Type: INDEX; Schema: public; Owner: mcm_user
--

CREATE INDEX accounts_user_groups_user_id_52b62117 ON public.accounts_user_groups USING btree (user_id);


--
-- Name: accounts_user_user_permissions_permission_id_113bb443; Type: INDEX; Schema: public; Owner: mcm_user
--

CREATE INDEX accounts_user_user_permissions_permission_id_113bb443 ON public.accounts_user_user_permissions USING btree (permission_id);


--
-- Name: accounts_user_user_permissions_user_id_e4f0a161; Type: INDEX; Schema: public; Owner: mcm_user
--

CREATE INDEX accounts_user_user_permissions_user_id_e4f0a161 ON public.accounts_user_user_permissions USING btree (user_id);


--
-- Name: accounts_user_username_6088629e_like; Type: INDEX; Schema: public; Owner: mcm_user
--

CREATE INDEX accounts_user_username_6088629e_like ON public.accounts_user USING btree (username varchar_pattern_ops);


--
-- Name: admissions_admissionsession_class_name_d1d88c1b_like; Type: INDEX; Schema: public; Owner: mcm_user
--

CREATE INDEX admissions_admissionsession_class_name_d1d88c1b_like ON public.admissions_admissionsession USING btree (class_name varchar_pattern_ops);


--
-- Name: admissions_application_roll_number_2de241e5_like; Type: INDEX; Schema: public; Owner: mcm_user
--

CREATE INDEX admissions_application_roll_number_2de241e5_like ON public.admissions_application USING btree (roll_number varchar_pattern_ops);


--
-- Name: admissions_formfieldvisibility_field_name_a904b27c_like; Type: INDEX; Schema: public; Owner: mcm_user
--

CREATE INDEX admissions_formfieldvisibility_field_name_a904b27c_like ON public.admissions_formfieldvisibility USING btree (field_name varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: mcm_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: mcm_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: mcm_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: mcm_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: mcm_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: mcm_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: mcm_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: mcm_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: notifications_notification_user_id_b5e8c0ff; Type: INDEX; Schema: public; Owner: mcm_user
--

CREATE INDEX notifications_notification_user_id_b5e8c0ff ON public.notifications_notification USING btree (user_id);


--
-- Name: accounts_emailverification accounts_emailverification_user_id_4f5b1661_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.accounts_emailverification
    ADD CONSTRAINT accounts_emailverification_user_id_4f5b1661_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_groups accounts_user_groups_group_id_bd11a704_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_group_id_bd11a704_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_groups accounts_user_groups_user_id_52b62117_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_52b62117_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_permission_id_113bb443_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_permission_id_113bb443_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_user_id_e4f0a161_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_user_id_e4f0a161_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admissions_application admissions_application_user_id_2cd0290f_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.admissions_application
    ADD CONSTRAINT admissions_application_user_id_2cd0290f_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_notification notifications_notification_user_id_b5e8c0ff_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mcm_user
--

ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notification_user_id_b5e8c0ff_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO mcm_user;


--
-- PostgreSQL database dump complete
--

