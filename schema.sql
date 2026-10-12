--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

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
-- Name: attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attachments (
    id integer NOT NULL,
    server_id integer NOT NULL,
    original_name character varying(500) NOT NULL,
    stored_filename character varying(500) NOT NULL,
    uploaded_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.attachments OWNER TO postgres;

--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attachments_id_seq OWNER TO postgres;

--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    server_id integer NOT NULL,
    author character varying(100) DEFAULT 'Аноним'::character varying,
    comment_text text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: environments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.environments (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.environments OWNER TO postgres;

--
-- Name: environments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.environments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.environments_id_seq OWNER TO postgres;

--
-- Name: environments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.environments_id_seq OWNED BY public.environments.id;


--
-- Name: information_systems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.information_systems (
    id integer NOT NULL,
    code character varying(100) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.information_systems OWNER TO postgres;

--
-- Name: information_systems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.information_systems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.information_systems_id_seq OWNER TO postgres;

--
-- Name: information_systems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.information_systems_id_seq OWNED BY public.information_systems.id;


--
-- Name: operating_systems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operating_systems (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.operating_systems OWNER TO postgres;

--
-- Name: operating_systems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.operating_systems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.operating_systems_id_seq OWNER TO postgres;

--
-- Name: operating_systems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.operating_systems_id_seq OWNED BY public.operating_systems.id;


--
-- Name: requirements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requirements (
    id integer NOT NULL,
    code character varying(100) NOT NULL,
    description text,
    created_at date DEFAULT CURRENT_DATE
);


ALTER TABLE public.requirements OWNER TO postgres;

--
-- Name: requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requirements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.requirements_id_seq OWNER TO postgres;

--
-- Name: requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requirements_id_seq OWNED BY public.requirements.id;


--
-- Name: server_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.server_documents (
    id integer NOT NULL,
    server_id integer NOT NULL,
    original_filename text NOT NULL,
    stored_filename text NOT NULL,
    file_size integer,
    uploaded_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.server_documents OWNER TO postgres;

--
-- Name: server_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.server_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.server_documents_id_seq OWNER TO postgres;

--
-- Name: server_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.server_documents_id_seq OWNED BY public.server_documents.id;


--
-- Name: server_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.server_history (
    id integer NOT NULL,
    server_id integer NOT NULL,
    changed_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255),
    ip_address character varying(50),
    dbms_version character varying(100),
    launch_year integer,
    cpu_cores integer,
    ram_gb integer,
    disk_gb integer,
    os_name character varying(255),
    env_name character varying(255),
    role_name character varying(255),
    is_name character varying(255),
    requirement_codes text
);


ALTER TABLE public.server_history OWNER TO postgres;

--
-- Name: server_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.server_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.server_history_id_seq OWNER TO postgres;

--
-- Name: server_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.server_history_id_seq OWNED BY public.server_history.id;


--
-- Name: server_information_systems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.server_information_systems (
    server_id integer NOT NULL,
    is_id integer NOT NULL
);


ALTER TABLE public.server_information_systems OWNER TO postgres;

--
-- Name: server_requirements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.server_requirements (
    server_id integer NOT NULL,
    requirement_id integer NOT NULL
);


ALTER TABLE public.server_requirements OWNER TO postgres;

--
-- Name: server_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.server_roles (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.server_roles OWNER TO postgres;

--
-- Name: server_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.server_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.server_roles_id_seq OWNER TO postgres;

--
-- Name: server_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.server_roles_id_seq OWNED BY public.server_roles.id;


--
-- Name: servers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    ip_address inet NOT NULL,
    dbms_version character varying(100),
    os_id integer,
    environment_id integer,
    server_role_id integer,
    cpu_cores integer DEFAULT 4,
    ram_gb integer DEFAULT 16,
    disk_gb integer DEFAULT 100,
    is_id integer,
    requirement_code character varying(100),
    launch_year integer,
    is_archived boolean DEFAULT false NOT NULL,
    archived_at timestamp without time zone
);


ALTER TABLE public.servers OWNER TO postgres;

--
-- Name: servers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servers_id_seq OWNER TO postgres;

--
-- Name: servers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servers_id_seq OWNED BY public.servers.id;


--
-- Name: system_requirements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_requirements (
    is_id integer NOT NULL,
    requirement_id integer NOT NULL
);


ALTER TABLE public.system_requirements OWNER TO postgres;

--
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: environments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.environments ALTER COLUMN id SET DEFAULT nextval('public.environments_id_seq'::regclass);


--
-- Name: information_systems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.information_systems ALTER COLUMN id SET DEFAULT nextval('public.information_systems_id_seq'::regclass);


--
-- Name: operating_systems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operating_systems ALTER COLUMN id SET DEFAULT nextval('public.operating_systems_id_seq'::regclass);


--
-- Name: requirements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requirements ALTER COLUMN id SET DEFAULT nextval('public.requirements_id_seq'::regclass);


--
-- Name: server_documents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_documents ALTER COLUMN id SET DEFAULT nextval('public.server_documents_id_seq'::regclass);


--
-- Name: server_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_history ALTER COLUMN id SET DEFAULT nextval('public.server_history_id_seq'::regclass);


--
-- Name: server_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_roles ALTER COLUMN id SET DEFAULT nextval('public.server_roles_id_seq'::regclass);


--
-- Name: servers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers ALTER COLUMN id SET DEFAULT nextval('public.servers_id_seq'::regclass);


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.attachments VALUES (1, 24, 'Практическая_3_Ашихмин_А.А[1].docx', '743f6390ef3b44c0a1ef3e53c4e0f180_3__.1.docx', '2026-09-22 09:25:30.100697');
INSERT INTO public.attachments VALUES (2, 23, 'Лаба 10 проект.docx', 'b1c2878c587c4f2c8c8935e96e77cd88_10_.docx', '2026-09-28 10:47:06.796129');
INSERT INTO public.attachments VALUES (3, 22, 'AS IS DFD.bp1', '2c007b43bba94c178a95122269df7a8d_AS_IS_DFD.bp1', '2026-09-28 10:47:59.792072');
INSERT INTO public.attachments VALUES (4, 24, 'TO BE DFD сервер финал.bp1', '429134674d704c7cab7f2cf7eaebb0c4_TO_BE_DFD_.bp1', '2026-09-28 11:02:07.781078');


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.comments VALUES (1, 13, 'Арнольд', 'Доделать сервер', '2026-09-17 10:28:55.985629');
INSERT INTO public.comments VALUES (2, 13, 'Арнольд02', 'Понял доделаю', '2026-09-17 10:29:13.784625');
INSERT INTO public.comments VALUES (3, 14, 'Георгий', 'Отличная работа!', '2026-09-17 10:35:15.270786');
INSERT INTO public.comments VALUES (4, 14, 'ллллллл', 'фигня', '2026-09-17 12:55:06.154883');
INSERT INTO public.comments VALUES (5, 14, 'ллллллл2', '2', '2026-09-17 13:50:42.795048');
INSERT INTO public.comments VALUES (6, 14, '1', '1', '2026-09-17 14:59:37.782529');
INSERT INTO public.comments VALUES (7, 24, '1', '21', '2026-09-25 10:36:47.842362');
INSERT INTO public.comments VALUES (8, 23, '3232', 'Я здесь', '2026-09-28 09:41:01.158516');
INSERT INTO public.comments VALUES (9, 22, '1', '1', '2026-09-29 09:26:05.596596');
INSERT INTO public.comments VALUES (10, 24, '2', 'ккук', '2026-10-08 10:52:11.831623');


--
-- Data for Name: environments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.environments VALUES (1, 'prod');
INSERT INTO public.environments VALUES (2, 'dev');
INSERT INTO public.environments VALUES (3, 'test');
INSERT INTO public.environments VALUES (5, 'Test1');
INSERT INTO public.environments VALUES (7, 'test444');
INSERT INTO public.environments VALUES (9, '2');


--
-- Data for Name: information_systems; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.information_systems VALUES (1, 'IS0000901', 'ИС "Предсменный экзаменатор"');
INSERT INTO public.information_systems VALUES (3, 'IS-002', '1С:Предприятие (ERP / УПП)');
INSERT INTO public.information_systems VALUES (4, 'IS-003', 'Корпоративный портал (Bitrix24)');
INSERT INTO public.information_systems VALUES (5, 'IS-004', 'Система документооборота (СЭД)');
INSERT INTO public.information_systems VALUES (6, 'IS-005', 'Система мониторинга (Zabbix)');
INSERT INTO public.information_systems VALUES (7, 'IS-006', 'Кадровый учет и расчет зарплаты (ЗУП)');
INSERT INTO public.information_systems VALUES (8, 'IS-007', 'Сервис электронного юридического учета');
INSERT INTO public.information_systems VALUES (9, 'IS-008', 'Система управления инцидентами (Service Desk / Jira)');
INSERT INTO public.information_systems VALUES (10, 'IS-009', 'Централизованное хранилище данных (DWH)');
INSERT INTO public.information_systems VALUES (11, 'IS-321', 'TESTMEGA1');
INSERT INTO public.information_systems VALUES (13, 'IS999999', 'ZVER');
INSERT INTO public.information_systems VALUES (14, '129', 'ddw');
INSERT INTO public.information_systems VALUES (15, '213', 'nbs');


--
-- Data for Name: operating_systems; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.operating_systems VALUES (1, 'Astra Linux');
INSERT INTO public.operating_systems VALUES (2, 'Windows');
INSERT INTO public.operating_systems VALUES (3, 'Astra Linux Special Edition');
INSERT INTO public.operating_systems VALUES (4, 'Astra Linux Common Edition');
INSERT INTO public.operating_systems VALUES (6, 'RED OS');
INSERT INTO public.operating_systems VALUES (7, 'Ubuntu Server 22.04 LTS');
INSERT INTO public.operating_systems VALUES (8, 'Ubuntu Server 24.04 LTS');
INSERT INTO public.operating_systems VALUES (9, 'Debian 12 (Bookworm)');
INSERT INTO public.operating_systems VALUES (10, 'RHEL (Red Hat Enterprise Linux) 9');
INSERT INTO public.operating_systems VALUES (11, 'Rocky Linux 9');
INSERT INTO public.operating_systems VALUES (12, 'AlmaLinux 9');
INSERT INTO public.operating_systems VALUES (13, 'Windows Server 2019');
INSERT INTO public.operating_systems VALUES (14, 'Windows Server 2022');
INSERT INTO public.operating_systems VALUES (15, 'Test1');


--
-- Data for Name: requirements; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.requirements VALUES (1, 'CAP12492311123', NULL, '2026-09-17');
INSERT INTO public.requirements VALUES (4, 'CAP', '23O43I41', '2026-09-17');
INSERT INTO public.requirements VALUES (6, 'TEST222333444', NULL, '2026-09-17');


--
-- Data for Name: server_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: server_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.server_history VALUES (1, 24, '2026-09-25 13:55:53.232953', 'TESERAKTNORNIKEL1', '127.0.1.21', '55', 2008, 7, 33, 504, 'AlmaLinux 9', 'dev', 'Шлюз безопасности / Firewall', 'Централизованное хранилище данных (DWH)', 'CAP12492311123');
INSERT INTO public.server_history VALUES (2, 24, '2026-09-25 13:56:18.107587', 'TESERAKTNORNIKEL1', '127.0.1.21', '55', 2008, 7, 33, 505, 'AlmaLinux 9', 'dev', 'Шлюз безопасности / Firewall', 'Централизованное хранилище данных (DWH)', 'CAP12492311123');
INSERT INTO public.server_history VALUES (3, 24, '2026-09-25 13:56:37.113813', 'Теперьтак', '127.0.1.21', '55', 2008, 7, 33, 505, 'AlmaLinux 9', 'dev', 'Шлюз безопасности / Firewall', 'Централизованное хранилище данных (DWH)', 'CAP12492311123');
INSERT INTO public.server_history VALUES (4, 24, '2026-09-28 09:39:35.109643', 'Теперьтак1', '127.0.1.21', '55', 2008, 7, 33, 505, 'AlmaLinux 9', 'dev', 'Шлюз безопасности / Firewall', 'Централизованное хранилище данных (DWH)', 'CAP12492311123');
INSERT INTO public.server_history VALUES (5, 23, '2026-09-28 09:39:50.746363', 'megazver', '120.10.2.2', '123', 2014, 8, 32, 500, 'Windows Server 2022', 'prod', 'Сервер терминалов (RDS / VDI)', 'nbs', 'CAP12492311123');
INSERT INTO public.server_history VALUES (6, 22, '2026-09-28 10:52:22.552241', 'SERVER1012TEST', '192.18.19.1', '1', 2025, 8, 32, 500, NULL, 'test', 'Приложение', 'ddw', 'CAP');
INSERT INTO public.server_history VALUES (7, 22, '2026-09-29 14:35:15.946229', 'SERVER1012TEST', '192.18.19.1', '1', 2026, 8, 32, 500, NULL, 'test', 'Приложение', 'ddw', 'CAP');


--
-- Data for Name: server_information_systems; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: server_requirements; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.server_requirements VALUES (15, 1);
INSERT INTO public.server_requirements VALUES (17, 1);
INSERT INTO public.server_requirements VALUES (19, 1);
INSERT INTO public.server_requirements VALUES (15, 4);
INSERT INTO public.server_requirements VALUES (20, 6);
INSERT INTO public.server_requirements VALUES (8, 1);
INSERT INTO public.server_requirements VALUES (1, 1);
INSERT INTO public.server_requirements VALUES (21, 6);
INSERT INTO public.server_requirements VALUES (18, 4);
INSERT INTO public.server_requirements VALUES (24, 1);
INSERT INTO public.server_requirements VALUES (23, 1);
INSERT INTO public.server_requirements VALUES (22, 4);


--
-- Data for Name: server_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.server_roles VALUES (1, 'СУБД');
INSERT INTO public.server_roles VALUES (2, 'Приложение');
INSERT INTO public.server_roles VALUES (3, 'Сервер СУБД (Database Server)');
INSERT INTO public.server_roles VALUES (4, 'Сервер приложений (App Server)');
INSERT INTO public.server_roles VALUES (5, 'Веб-сервер (Web Server / Reverse Proxy)');
INSERT INTO public.server_roles VALUES (6, 'Контроллер доменной службы (Active Directory / IPA)');
INSERT INTO public.server_roles VALUES (7, 'Файловое хранилище (NAS / SAN / MinIO)');
INSERT INTO public.server_roles VALUES (8, 'Сервер резервного копирования (Backup / Veeam)');
INSERT INTO public.server_roles VALUES (9, 'Сервер мониторинга и логирования (Zabbix / ELK)');
INSERT INTO public.server_roles VALUES (10, 'Сервер виртуализации (KVM / Proxmox / ESXi)');
INSERT INTO public.server_roles VALUES (11, 'Шлюз безопасности / Firewall');
INSERT INTO public.server_roles VALUES (12, 'Сервер терминалов (RDS / VDI)');
INSERT INTO public.server_roles VALUES (13, 'Test1');


--
-- Data for Name: servers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.servers VALUES (11, 'server05', '192.10.10.19', NULL, 11, 3, 11, 8, 32, 500, NULL, NULL, NULL, false, NULL);
INSERT INTO public.servers VALUES (13, 'server07', '168.192.12.45', '1', 3, 2, 1, 7, 33, 499, NULL, NULL, NULL, false, NULL);
INSERT INTO public.servers VALUES (14, 'Test1', '200.10.10.19', '13', 13, 1, 7, 8, 32, 500, 1, 'CAP120498239', NULL, false, NULL);
INSERT INTO public.servers VALUES (15, 'TEST2', '201.19.19.20', '12', 15, 5, 13, 8, 32, 500, 11, 'CAP12492311123', NULL, false, NULL);
INSERT INTO public.servers VALUES (16, 'TESTCAP1', '168.10.10.11', '12', 12, 2, 6, 8, 32, 500, 1, NULL, 2020, false, NULL);
INSERT INTO public.servers VALUES (12, 'server06', '170.18.18.10', NULL, 13, 2, 3, 8, 32, 500, 3, NULL, NULL, false, NULL);
INSERT INTO public.servers VALUES (20, 'МЕГАТЕСТ', '168.10.10.2', '12', 14, 2, 5, 8, 32, 500, 13, NULL, 1991, false, NULL);
INSERT INTO public.servers VALUES (8, 'server02', '14.0.0.1', '14.2', 1, 1, 1, 10, 32, 439, NULL, NULL, NULL, false, NULL);
INSERT INTO public.servers VALUES (1, 'vnrzffalcont2', '172.31.33.48', NULL, 1, 1, 1, 4, 16, 100, NULL, NULL, NULL, false, NULL);
INSERT INTO public.servers VALUES (2, 'vnrzfpprexam01', '172.31.34.73', NULL, 2, 1, 2, 4, 16, 100, NULL, NULL, NULL, true, '2026-09-21 10:46:43.477104');
INSERT INTO public.servers VALUES (17, 'TEST03', '169.19.19.20', '12', NULL, 2, 6, 8, 32, 500, 11, NULL, 2025, false, NULL);
INSERT INTO public.servers VALUES (21, '1', '169.15.15.12', '12', NULL, 2, 2, 8, 32, 500, 7, NULL, 2008, false, NULL);
INSERT INTO public.servers VALUES (18, 'ЛЮТЫЙТЕСТ', '150.15.15.20', '12', 13, NULL, 7, 8, 32, 500, NULL, NULL, 2023, false, NULL);
INSERT INTO public.servers VALUES (19, 'S21', '168.10.10.19', '2', 13, NULL, 7, 8, 32, 500, 3, NULL, 1997, false, NULL);
INSERT INTO public.servers VALUES (24, 'Теперьтак1', '127.0.1.21', '55', 12, 2, 11, 11, 35, 505, 10, NULL, 2008, false, NULL);
INSERT INTO public.servers VALUES (23, 'megazver', '120.10.2.2', '123', 14, 1, 12, 8, 32, 300, 15, NULL, 2014, false, NULL);
INSERT INTO public.servers VALUES (22, 'SERVER1012TEST', '192.18.19.1', '1', NULL, 3, 2, 8, 32, 500, 14, NULL, 2023, false, NULL);


--
-- Data for Name: system_requirements; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.system_requirements VALUES (15, 4);
INSERT INTO public.system_requirements VALUES (1, 4);
INSERT INTO public.system_requirements VALUES (11, 4);


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attachments_id_seq', 4, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 10, true);


--
-- Name: environments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.environments_id_seq', 9, true);


--
-- Name: information_systems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.information_systems_id_seq', 16, true);


--
-- Name: operating_systems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.operating_systems_id_seq', 15, true);


--
-- Name: requirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requirements_id_seq', 6, true);


--
-- Name: server_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.server_documents_id_seq', 1, false);


--
-- Name: server_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.server_history_id_seq', 7, true);


--
-- Name: server_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.server_roles_id_seq', 13, true);


--
-- Name: servers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servers_id_seq', 24, true);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: environments environments_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.environments
    ADD CONSTRAINT environments_name_key UNIQUE (name);


--
-- Name: environments environments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.environments
    ADD CONSTRAINT environments_pkey PRIMARY KEY (id);


--
-- Name: information_systems information_systems_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.information_systems
    ADD CONSTRAINT information_systems_code_key UNIQUE (code);


--
-- Name: information_systems information_systems_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.information_systems
    ADD CONSTRAINT information_systems_name_key UNIQUE (name);


--
-- Name: information_systems information_systems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.information_systems
    ADD CONSTRAINT information_systems_pkey PRIMARY KEY (id);


--
-- Name: operating_systems operating_systems_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operating_systems
    ADD CONSTRAINT operating_systems_name_key UNIQUE (name);


--
-- Name: operating_systems operating_systems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operating_systems
    ADD CONSTRAINT operating_systems_pkey PRIMARY KEY (id);


--
-- Name: requirements requirements_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requirements
    ADD CONSTRAINT requirements_code_key UNIQUE (code);


--
-- Name: requirements requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requirements
    ADD CONSTRAINT requirements_pkey PRIMARY KEY (id);


--
-- Name: server_documents server_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_documents
    ADD CONSTRAINT server_documents_pkey PRIMARY KEY (id);


--
-- Name: server_history server_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_history
    ADD CONSTRAINT server_history_pkey PRIMARY KEY (id);


--
-- Name: server_information_systems server_information_systems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_information_systems
    ADD CONSTRAINT server_information_systems_pkey PRIMARY KEY (server_id, is_id);


--
-- Name: server_requirements server_requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_requirements
    ADD CONSTRAINT server_requirements_pkey PRIMARY KEY (server_id, requirement_id);


--
-- Name: server_roles server_roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_roles
    ADD CONSTRAINT server_roles_name_key UNIQUE (name);


--
-- Name: server_roles server_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_roles
    ADD CONSTRAINT server_roles_pkey PRIMARY KEY (id);


--
-- Name: servers servers_ip_address_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_ip_address_key UNIQUE (ip_address);


--
-- Name: servers servers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_pkey PRIMARY KEY (id);


--
-- Name: system_requirements system_requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_requirements
    ADD CONSTRAINT system_requirements_pkey PRIMARY KEY (is_id, requirement_id);


--
-- Name: idx_attachments_server_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_attachments_server_id ON public.attachments USING btree (server_id);


--
-- Name: idx_comments_server_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_comments_server_id ON public.comments USING btree (server_id);


--
-- Name: idx_server_documents_server_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_server_documents_server_id ON public.server_documents USING btree (server_id);


--
-- Name: idx_server_history_server_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_server_history_server_id ON public.server_history USING btree (server_id);


--
-- Name: attachments attachments_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_server_id_fkey FOREIGN KEY (server_id) REFERENCES public.servers(id) ON DELETE CASCADE;


--
-- Name: comments comments_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_server_id_fkey FOREIGN KEY (server_id) REFERENCES public.servers(id) ON DELETE CASCADE;


--
-- Name: servers fk_servers_information_systems; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT fk_servers_information_systems FOREIGN KEY (is_id) REFERENCES public.information_systems(id);


--
-- Name: server_documents server_documents_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_documents
    ADD CONSTRAINT server_documents_server_id_fkey FOREIGN KEY (server_id) REFERENCES public.servers(id) ON DELETE CASCADE;


--
-- Name: server_history server_history_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_history
    ADD CONSTRAINT server_history_server_id_fkey FOREIGN KEY (server_id) REFERENCES public.servers(id) ON DELETE CASCADE;


--
-- Name: server_information_systems server_information_systems_is_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_information_systems
    ADD CONSTRAINT server_information_systems_is_id_fkey FOREIGN KEY (is_id) REFERENCES public.information_systems(id) ON DELETE CASCADE;


--
-- Name: server_information_systems server_information_systems_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_information_systems
    ADD CONSTRAINT server_information_systems_server_id_fkey FOREIGN KEY (server_id) REFERENCES public.servers(id) ON DELETE CASCADE;


--
-- Name: server_requirements server_requirements_requirement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_requirements
    ADD CONSTRAINT server_requirements_requirement_id_fkey FOREIGN KEY (requirement_id) REFERENCES public.requirements(id) ON DELETE CASCADE;


--
-- Name: server_requirements server_requirements_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_requirements
    ADD CONSTRAINT server_requirements_server_id_fkey FOREIGN KEY (server_id) REFERENCES public.servers(id) ON DELETE CASCADE;


--
-- Name: servers servers_environment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_environment_id_fkey FOREIGN KEY (environment_id) REFERENCES public.environments(id) ON DELETE SET NULL;


--
-- Name: servers servers_os_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_os_id_fkey FOREIGN KEY (os_id) REFERENCES public.operating_systems(id) ON DELETE SET NULL;


--
-- Name: servers servers_server_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_server_role_id_fkey FOREIGN KEY (server_role_id) REFERENCES public.server_roles(id) ON DELETE SET NULL;


--
-- Name: system_requirements system_requirements_is_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_requirements
    ADD CONSTRAINT system_requirements_is_id_fkey FOREIGN KEY (is_id) REFERENCES public.information_systems(id) ON DELETE CASCADE;


--
-- Name: system_requirements system_requirements_requirement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_requirements
    ADD CONSTRAINT system_requirements_requirement_id_fkey FOREIGN KEY (requirement_id) REFERENCES public.requirements(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

