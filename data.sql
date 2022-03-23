--
-- PostgreSQL database dump
--

-- Dumped from database version 11.14 (Debian 11.14-1.pgdg90+1)
-- Dumped by pg_dump version 11.14 (Debian 11.14-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: migrations; Type: SCHEMA; Schema: -; Owner: tcc_match
--

CREATE SCHEMA migrations;


ALTER SCHEMA migrations OWNER TO tcc_match;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin; Type: TABLE; Schema: migrations; Owner: tcc_match
--

CREATE TABLE migrations.admin (
    id bigint NOT NULL
);


ALTER TABLE migrations.admin OWNER TO tcc_match;

--
-- Name: admin_id_seq; Type: SEQUENCE; Schema: migrations; Owner: tcc_match
--

ALTER TABLE migrations.admin ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME migrations.admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: flyway_schema_history; Type: TABLE; Schema: migrations; Owner: tcc_match
--

CREATE TABLE migrations.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE migrations.flyway_schema_history OWNER TO tcc_match;

--
-- Name: orientation_issue; Type: TABLE; Schema: migrations; Owner: tcc_match
--

CREATE TABLE migrations.orientation_issue (
    id bigint NOT NULL,
    related_issue character varying(255),
    tcc_id bigint,
    tccmatch_user_id bigint
);


ALTER TABLE migrations.orientation_issue OWNER TO tcc_match;

--
-- Name: orientation_issue_id_seq; Type: SEQUENCE; Schema: migrations; Owner: tcc_match
--

ALTER TABLE migrations.orientation_issue ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME migrations.orientation_issue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: professor; Type: TABLE; Schema: migrations; Owner: tcc_match
--

CREATE TABLE migrations.professor (
    quota integer,
    id bigint NOT NULL
);


ALTER TABLE migrations.professor OWNER TO tcc_match;

--
-- Name: professor_id_seq; Type: SEQUENCE; Schema: migrations; Owner: tcc_match
--

ALTER TABLE migrations.professor ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME migrations.professor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: professor_interested_study_areas; Type: TABLE; Schema: migrations; Owner: tcc_match
--

CREATE TABLE migrations.professor_interested_study_areas (
    professor_id bigint NOT NULL,
    study_area_id bigint NOT NULL
);


ALTER TABLE migrations.professor_interested_study_areas OWNER TO tcc_match;

--
-- Name: professor_interestedtccs; Type: TABLE; Schema: migrations; Owner: tcc_match
--

CREATE TABLE migrations.professor_interestedtccs (
    professor_id bigint NOT NULL,
    tcc_id bigint NOT NULL
);


ALTER TABLE migrations.professor_interestedtccs OWNER TO tcc_match;

--
-- Name: professor_labs; Type: TABLE; Schema: migrations; Owner: tcc_match
--

CREATE TABLE migrations.professor_labs (
    professor_id bigint NOT NULL,
    labs character varying(255)
);


ALTER TABLE migrations.professor_labs OWNER TO tcc_match;

--
-- Name: student; Type: TABLE; Schema: migrations; Owner: tcc_match
--

CREATE TABLE migrations.student (
    expected_conclusion_term character varying(255),
    registration character varying(255),
    id bigint NOT NULL,
    tcc_id bigint
);


ALTER TABLE migrations.student OWNER TO tcc_match;

--
-- Name: student_id_seq; Type: SEQUENCE; Schema: migrations; Owner: tcc_match
--

ALTER TABLE migrations.student ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME migrations.student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: student_interested_study_areas; Type: TABLE; Schema: migrations; Owner: tcc_match
--

CREATE TABLE migrations.student_interested_study_areas (
    student_id bigint NOT NULL,
    study_area_id bigint NOT NULL
);


ALTER TABLE migrations.student_interested_study_areas OWNER TO tcc_match;

--
-- Name: student_orientation_interests; Type: TABLE; Schema: migrations; Owner: tcc_match
--

CREATE TABLE migrations.student_orientation_interests (
    student_id bigint NOT NULL,
    tcc_id bigint NOT NULL
);


ALTER TABLE migrations.student_orientation_interests OWNER TO tcc_match;

--
-- Name: study_area; Type: TABLE; Schema: migrations; Owner: tcc_match
--

CREATE TABLE migrations.study_area (
    id bigint NOT NULL,
    description character varying(255)
);


ALTER TABLE migrations.study_area OWNER TO tcc_match;

--
-- Name: study_area_id_seq; Type: SEQUENCE; Schema: migrations; Owner: tcc_match
--

ALTER TABLE migrations.study_area ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME migrations.study_area_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tcc; Type: TABLE; Schema: migrations; Owner: tcc_match
--

CREATE TABLE migrations.tcc (
    id bigint NOT NULL,
    description character varying(255),
    tcc_status integer,
    term character varying(255),
    title character varying(255),
    advised_student_id bigint,
    advisor_id bigint
);


ALTER TABLE migrations.tcc OWNER TO tcc_match;

--
-- Name: tcc_id_seq; Type: SEQUENCE; Schema: migrations; Owner: tcc_match
--

ALTER TABLE migrations.tcc ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME migrations.tcc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tcc_study_areas; Type: TABLE; Schema: migrations; Owner: tcc_match
--

CREATE TABLE migrations.tcc_study_areas (
    tcc_id bigint NOT NULL,
    study_area_id bigint NOT NULL
);


ALTER TABLE migrations.tcc_study_areas OWNER TO tcc_match;

--
-- Name: tccmatch_user; Type: TABLE; Schema: migrations; Owner: tcc_match
--

CREATE TABLE migrations.tccmatch_user (
    id bigint NOT NULL,
    email character varying(255),
    full_name character varying(255),
    password character varying(255),
    role integer,
    username character varying(255)
);


ALTER TABLE migrations.tccmatch_user OWNER TO tcc_match;

--
-- Name: tccmatch_user_emails; Type: TABLE; Schema: migrations; Owner: tcc_match
--

CREATE TABLE migrations.tccmatch_user_emails (
    tccmatch_user_id bigint NOT NULL,
    emails character varying(255)
);


ALTER TABLE migrations.tccmatch_user_emails OWNER TO tcc_match;

--
-- Name: tccmatch_user_id_seq; Type: SEQUENCE; Schema: migrations; Owner: tcc_match
--

ALTER TABLE migrations.tccmatch_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME migrations.tccmatch_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tccmatch_user_orientation_issues; Type: TABLE; Schema: migrations; Owner: tcc_match
--

CREATE TABLE migrations.tccmatch_user_orientation_issues (
    tccmatch_user_id bigint NOT NULL,
    orientation_issues_id bigint NOT NULL
);


ALTER TABLE migrations.tccmatch_user_orientation_issues OWNER TO tcc_match;

--
-- Data for Name: admin; Type: TABLE DATA; Schema: migrations; Owner: tcc_match
--

COPY migrations.admin (id) FROM stdin;
1
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: migrations; Owner: tcc_match
--

COPY migrations.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
0	\N	<< Flyway Schema Creation >>	SCHEMA	"migrations"	\N	tcc_match	2022-03-23 11:23:01.083687	0	t
1	1.1	create tables	SQL	V1_1__create_tables.sql	1853059054	tcc_match	2022-03-23 11:23:22.573062	24	t
2	1.2	alter tables	SQL	V1_2__alter_tables.sql	471952435	tcc_match	2022-03-23 11:23:22.610808	26	t
3	2	add first admin	SQL	V2__add_first_admin.sql	-689210172	tcc_match	2022-03-23 11:23:22.642791	1	t
\.


--
-- Data for Name: orientation_issue; Type: TABLE DATA; Schema: migrations; Owner: tcc_match
--

COPY migrations.orientation_issue (id, related_issue, tcc_id, tccmatch_user_id) FROM stdin;
\.


--
-- Data for Name: professor; Type: TABLE DATA; Schema: migrations; Owner: tcc_match
--

COPY migrations.professor (quota, id) FROM stdin;
\.


--
-- Data for Name: professor_interested_study_areas; Type: TABLE DATA; Schema: migrations; Owner: tcc_match
--

COPY migrations.professor_interested_study_areas (professor_id, study_area_id) FROM stdin;
\.


--
-- Data for Name: professor_interestedtccs; Type: TABLE DATA; Schema: migrations; Owner: tcc_match
--

COPY migrations.professor_interestedtccs (professor_id, tcc_id) FROM stdin;
\.


--
-- Data for Name: professor_labs; Type: TABLE DATA; Schema: migrations; Owner: tcc_match
--

COPY migrations.professor_labs (professor_id, labs) FROM stdin;
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: migrations; Owner: tcc_match
--

COPY migrations.student (expected_conclusion_term, registration, id, tcc_id) FROM stdin;
\.


--
-- Data for Name: student_interested_study_areas; Type: TABLE DATA; Schema: migrations; Owner: tcc_match
--

COPY migrations.student_interested_study_areas (student_id, study_area_id) FROM stdin;
\.


--
-- Data for Name: student_orientation_interests; Type: TABLE DATA; Schema: migrations; Owner: tcc_match
--

COPY migrations.student_orientation_interests (student_id, tcc_id) FROM stdin;
\.


--
-- Data for Name: study_area; Type: TABLE DATA; Schema: migrations; Owner: tcc_match
--

COPY migrations.study_area (id, description) FROM stdin;
\.


--
-- Data for Name: tcc; Type: TABLE DATA; Schema: migrations; Owner: tcc_match
--

COPY migrations.tcc (id, description, tcc_status, term, title, advised_student_id, advisor_id) FROM stdin;
\.


--
-- Data for Name: tcc_study_areas; Type: TABLE DATA; Schema: migrations; Owner: tcc_match
--

COPY migrations.tcc_study_areas (tcc_id, study_area_id) FROM stdin;
\.


--
-- Data for Name: tccmatch_user; Type: TABLE DATA; Schema: migrations; Owner: tcc_match
--

COPY migrations.tccmatch_user (id, email, full_name, password, role, username) FROM stdin;
1	admin@gmail.com	admin	$2a$10$MddVba/60EZr1LU/Dg6z9OtmzWYFYG/8aixXOLi73yy1Zc7Thg2Dy	1	admin
\.


--
-- Data for Name: tccmatch_user_emails; Type: TABLE DATA; Schema: migrations; Owner: tcc_match
--

COPY migrations.tccmatch_user_emails (tccmatch_user_id, emails) FROM stdin;
\.


--
-- Data for Name: tccmatch_user_orientation_issues; Type: TABLE DATA; Schema: migrations; Owner: tcc_match
--

COPY migrations.tccmatch_user_orientation_issues (tccmatch_user_id, orientation_issues_id) FROM stdin;
\.


--
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: migrations; Owner: tcc_match
--

SELECT pg_catalog.setval('migrations.admin_id_seq', 1, false);


--
-- Name: orientation_issue_id_seq; Type: SEQUENCE SET; Schema: migrations; Owner: tcc_match
--

SELECT pg_catalog.setval('migrations.orientation_issue_id_seq', 1, false);


--
-- Name: professor_id_seq; Type: SEQUENCE SET; Schema: migrations; Owner: tcc_match
--

SELECT pg_catalog.setval('migrations.professor_id_seq', 1, false);


--
-- Name: student_id_seq; Type: SEQUENCE SET; Schema: migrations; Owner: tcc_match
--

SELECT pg_catalog.setval('migrations.student_id_seq', 1, false);


--
-- Name: study_area_id_seq; Type: SEQUENCE SET; Schema: migrations; Owner: tcc_match
--

SELECT pg_catalog.setval('migrations.study_area_id_seq', 1, false);


--
-- Name: tcc_id_seq; Type: SEQUENCE SET; Schema: migrations; Owner: tcc_match
--

SELECT pg_catalog.setval('migrations.tcc_id_seq', 1, false);


--
-- Name: tccmatch_user_id_seq; Type: SEQUENCE SET; Schema: migrations; Owner: tcc_match
--

SELECT pg_catalog.setval('migrations.tccmatch_user_id_seq', 1, true);


--
-- Name: tcc constraint_1; Type: CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.tcc
    ADD CONSTRAINT constraint_1 PRIMARY KEY (id);


--
-- Name: study_area constraint_2; Type: CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.study_area
    ADD CONSTRAINT constraint_2 PRIMARY KEY (id);


--
-- Name: tccmatch_user_orientation_issues constraint_2f; Type: CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.tccmatch_user_orientation_issues
    ADD CONSTRAINT constraint_2f PRIMARY KEY (tccmatch_user_id, orientation_issues_id);


--
-- Name: admin constraint_3; Type: CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.admin
    ADD CONSTRAINT constraint_3 PRIMARY KEY (id);


--
-- Name: student_orientation_interests constraint_3b; Type: CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.student_orientation_interests
    ADD CONSTRAINT constraint_3b PRIMARY KEY (student_id, tcc_id);


--
-- Name: professor_interestedtccs constraint_4; Type: CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.professor_interestedtccs
    ADD CONSTRAINT constraint_4 PRIMARY KEY (professor_id, tcc_id);


--
-- Name: student_interested_study_areas constraint_4b; Type: CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.student_interested_study_areas
    ADD CONSTRAINT constraint_4b PRIMARY KEY (student_id, study_area_id);


--
-- Name: professor constraint_6; Type: CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.professor
    ADD CONSTRAINT constraint_6 PRIMARY KEY (id);


--
-- Name: student constraint_b; Type: CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.student
    ADD CONSTRAINT constraint_b PRIMARY KEY (id);


--
-- Name: tccmatch_user constraint_c; Type: CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.tccmatch_user
    ADD CONSTRAINT constraint_c PRIMARY KEY (id);


--
-- Name: orientation_issue constraint_e; Type: CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.orientation_issue
    ADD CONSTRAINT constraint_e PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: tccmatch_user_orientation_issues uk_m2dwgqfapuds46fj84tfbgg20; Type: CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.tccmatch_user_orientation_issues
    ADD CONSTRAINT uk_m2dwgqfapuds46fj84tfbgg20 UNIQUE (orientation_issues_id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: migrations; Owner: tcc_match
--

CREATE INDEX flyway_schema_history_s_idx ON migrations.flyway_schema_history USING btree (success);


--
-- Name: student_interested_study_areas fk2m9qwob07jnnpyrhag6s22u2v; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.student_interested_study_areas
    ADD CONSTRAINT fk2m9qwob07jnnpyrhag6s22u2v FOREIGN KEY (study_area_id) REFERENCES migrations.study_area(id);


--
-- Name: student_orientation_interests fk3y50c4rk638jowfq5dokqm41j; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.student_orientation_interests
    ADD CONSTRAINT fk3y50c4rk638jowfq5dokqm41j FOREIGN KEY (tcc_id) REFERENCES migrations.tcc(id);


--
-- Name: admin fk5j7h7v5khd6dppkefet7tic6p; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.admin
    ADD CONSTRAINT fk5j7h7v5khd6dppkefet7tic6p FOREIGN KEY (id) REFERENCES migrations.tccmatch_user(id);


--
-- Name: student_interested_study_areas fk7tdyg97amree2b40a1sw9u99j; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.student_interested_study_areas
    ADD CONSTRAINT fk7tdyg97amree2b40a1sw9u99j FOREIGN KEY (student_id) REFERENCES migrations.student(id);


--
-- Name: tcc_study_areas fk8hswxq4bimthrdeyw98fo3xym; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.tcc_study_areas
    ADD CONSTRAINT fk8hswxq4bimthrdeyw98fo3xym FOREIGN KEY (tcc_id) REFERENCES migrations.tcc(id);


--
-- Name: tcc_study_areas fk8m8vu79k3jijvy77sc3vlrihw; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.tcc_study_areas
    ADD CONSTRAINT fk8m8vu79k3jijvy77sc3vlrihw FOREIGN KEY (study_area_id) REFERENCES migrations.study_area(id);


--
-- Name: tccmatch_user_orientation_issues fkaa2exgr3cqjkgxjiiemgqm89c; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.tccmatch_user_orientation_issues
    ADD CONSTRAINT fkaa2exgr3cqjkgxjiiemgqm89c FOREIGN KEY (tccmatch_user_id) REFERENCES migrations.tccmatch_user(id);


--
-- Name: tccmatch_user_orientation_issues fkagcjo2eqf4vmgpyrf5stm0hgj; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.tccmatch_user_orientation_issues
    ADD CONSTRAINT fkagcjo2eqf4vmgpyrf5stm0hgj FOREIGN KEY (orientation_issues_id) REFERENCES migrations.orientation_issue(id);


--
-- Name: professor_interestedtccs fkal6527jr7jxukhkjp8nv5t0p0; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.professor_interestedtccs
    ADD CONSTRAINT fkal6527jr7jxukhkjp8nv5t0p0 FOREIGN KEY (professor_id) REFERENCES migrations.professor(id);


--
-- Name: tcc fkb7ri1niofh3ry28byo0xr954r; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.tcc
    ADD CONSTRAINT fkb7ri1niofh3ry28byo0xr954r FOREIGN KEY (advised_student_id) REFERENCES migrations.student(id);


--
-- Name: tcc fkd3ptq6pyvoba45eks3jeljhi3; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.tcc
    ADD CONSTRAINT fkd3ptq6pyvoba45eks3jeljhi3 FOREIGN KEY (advisor_id) REFERENCES migrations.professor(id);


--
-- Name: student_orientation_interests fkdmvkj2k84k56jaux54j81y2ga; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.student_orientation_interests
    ADD CONSTRAINT fkdmvkj2k84k56jaux54j81y2ga FOREIGN KEY (student_id) REFERENCES migrations.student(id);


--
-- Name: student fke7vnojblq466e89p0binkuc5i; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.student
    ADD CONSTRAINT fke7vnojblq466e89p0binkuc5i FOREIGN KEY (tcc_id) REFERENCES migrations.tcc(id);


--
-- Name: student fkeiq7a06f3jqu2fb5laguogpxc; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.student
    ADD CONSTRAINT fkeiq7a06f3jqu2fb5laguogpxc FOREIGN KEY (id) REFERENCES migrations.tccmatch_user(id);


--
-- Name: orientation_issue fkgl1irlnue2r6u2yhnvdyjl2r4; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.orientation_issue
    ADD CONSTRAINT fkgl1irlnue2r6u2yhnvdyjl2r4 FOREIGN KEY (tccmatch_user_id) REFERENCES migrations.tccmatch_user(id);


--
-- Name: professor_interested_study_areas fkjm88tnppo0gfbivxd3a6mijac; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.professor_interested_study_areas
    ADD CONSTRAINT fkjm88tnppo0gfbivxd3a6mijac FOREIGN KEY (study_area_id) REFERENCES migrations.study_area(id);


--
-- Name: professor_interested_study_areas fkniwruw77xjtwjyoqcw7ih2gsk; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.professor_interested_study_areas
    ADD CONSTRAINT fkniwruw77xjtwjyoqcw7ih2gsk FOREIGN KEY (professor_id) REFERENCES migrations.professor(id);


--
-- Name: tccmatch_user_emails fknrwiuvcqkshdl168k0w4bsugq; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.tccmatch_user_emails
    ADD CONSTRAINT fknrwiuvcqkshdl168k0w4bsugq FOREIGN KEY (tccmatch_user_id) REFERENCES migrations.tccmatch_user(id);


--
-- Name: orientation_issue fkpupu6pn14waos05yni6oovg7n; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.orientation_issue
    ADD CONSTRAINT fkpupu6pn14waos05yni6oovg7n FOREIGN KEY (tcc_id) REFERENCES migrations.tcc(id);


--
-- Name: professor fkrkdb5wlwhqx4htqjd81g52pdl; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.professor
    ADD CONSTRAINT fkrkdb5wlwhqx4htqjd81g52pdl FOREIGN KEY (id) REFERENCES migrations.tccmatch_user(id);


--
-- Name: professor_interestedtccs fkrxhls49emfsujx1iitwwppa7r; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.professor_interestedtccs
    ADD CONSTRAINT fkrxhls49emfsujx1iitwwppa7r FOREIGN KEY (tcc_id) REFERENCES migrations.tcc(id);


--
-- Name: professor_labs fktac37u55jigwt4p2jpewk6882; Type: FK CONSTRAINT; Schema: migrations; Owner: tcc_match
--

ALTER TABLE ONLY migrations.professor_labs
    ADD CONSTRAINT fktac37u55jigwt4p2jpewk6882 FOREIGN KEY (professor_id) REFERENCES migrations.professor(id);


--
-- PostgreSQL database dump complete
--
