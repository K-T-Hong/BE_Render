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
-- Name: Article; Type: TABLE; Schema: public; Owner: hong
--

CREATE TABLE public."Article" (
    id text NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Article" OWNER TO hong;

--
-- Name: Comment; Type: TABLE; Schema: public; Owner: hong
--

CREATE TABLE public."Comment" (
    id text NOT NULL,
    content text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "productId" text,
    "articleId" text
);


ALTER TABLE public."Comment" OWNER TO hong;

--
-- Name: Product; Type: TABLE; Schema: public; Owner: hong
--

CREATE TABLE public."Product" (
    id text NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    price double precision NOT NULL,
    tags text[],
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Product" OWNER TO hong;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: hong
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO hong;

--
-- Data for Name: Article; Type: TABLE DATA; Schema: public; Owner: hong
--

COPY public."Article" (id, title, content, "createdAt", "updatedAt") FROM stdin;
87aba9a8-c1f1-4da9-b86e-8144237a4cfe	고양이 품종	순하고 털 덜빠지는 고양이 품종은 어떤게 있나요?	2025-06-09 06:33:00.076	2025-06-09 06:33:00.076
3a26c511-4657-4d1f-9ef9-1b5c4db03c5d	오늘부터	오늘부터 2층 밑에 집 화장실 리모델링 한다고 겁나게 시끄럽구만	2025-06-09 06:34:11.294	2025-06-09 06:34:11.294
d6be41f9-4571-4693-94c1-c214f10ef023	postman	계속 입력하다 보니까 너무 느려지는거 같아요 이유가 멀까요?	2025-06-09 06:37:11.596	2025-06-09 06:37:11.596
\.


--
-- Data for Name: Comment; Type: TABLE DATA; Schema: public; Owner: hong
--

COPY public."Comment" (id, content, "createdAt", "updatedAt", "productId", "articleId") FROM stdin;
f1c3e121-b426-47d8-8a38-0a3f08a2afb1	그거슨 캐시파일이 쌓여서 그런걸지도?	2025-06-10 02:52:00.544	2025-06-10 02:52:00.544	\N	d6be41f9-4571-4693-94c1-c214f10ef023
0b09b717-bece-40a6-bdff-3ecdb478a2be	난 그런거 몰라요	2025-06-10 02:52:42.967	2025-06-10 02:52:42.967	\N	d6be41f9-4571-4693-94c1-c214f10ef023
dd261176-3f9b-4cca-a9f7-c032c30b0bd5	토끼에 한표!!!	2025-06-10 03:50:31.161	2025-06-10 03:50:31.161	c3b7e0e5-225c-4da2-bef7-ff611db3b775	\N
7a253332-3219-4dca-9b22-d654b251ca04	토끼가 진리다	2025-06-10 03:50:46.31	2025-06-10 03:50:46.31	c3b7e0e5-225c-4da2-bef7-ff611db3b775	\N
696e1f65-099e-436d-a0b8-a8587d7bd544	고양이 미만 잡	2025-06-10 03:51:47.111	2025-06-10 03:51:47.111	2b4ef6cb-0231-4056-a128-a9fadfba2700	\N
e1f7bfd8-3dd5-4521-8709-41be0f28a786	혹시 그 강아지 블랙탄 진돗개인가요?	2025-06-10 03:53:53.75	2025-06-10 03:53:53.75	ee74b3c5-52d3-4d33-aa6d-f80b429e7ea2	\N
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: hong
--

COPY public."Product" (id, name, description, price, tags, "createdAt", "updatedAt") FROM stdin;
c66552e3-dc1c-4ea3-82d6-b9edc43cefdc	플스5 프로	안써서 다시 팔아봅니다	1200000	{전자제품,게임기}	2025-06-09 04:14:04.289	2025-06-09 04:14:04.289
390f4eb2-7c7a-4703-811e-e18f32ea8aae	강아지 대형 캔넬	강아지가 들어가지 않아요...	12000	{애견용품,켄넬}	2025-06-09 04:14:40.926	2025-06-09 04:14:40.926
ee74b3c5-52d3-4d33-aa6d-f80b429e7ea2	말안듣는 강아지 재분양해요	이놈 시키가 너무 말을 안들어요	10000000000	{강아지,분양}	2025-06-09 04:15:18.918	2025-06-09 04:15:18.918
727903e5-c6df-42d8-ab13-3fc44eaec5e0	먹다 남은 도나쓰	깨끗하게 반만 잘라서 먹었어요	1000	{간식,도나쓰}	2025-06-09 04:17:15.743	2025-06-09 04:17:15.743
af65871b-a108-4f0e-a4be-dfac10adfc3c	30년된 중고 냉장고 팝니다	냉장만 되고 냉동은 고장났어요	300000	{빈티지,전자제품}	2025-06-09 04:18:23.431	2025-06-09 04:18:23.431
e182c190-b2c9-45bc-843d-2f2e9a0a6d73	17년식 투싼	제주도 이사와서 차가 두대라 팔아봅니다	100000000	{현대,중고차}	2025-06-09 04:19:27.17	2025-06-09 04:19:27.17
261dcbbb-7670-474d-ab1e-13f988b1d361	20년된 아디다스 저지 상의	고등학교때 샀지만 아직까지 깨끗해요	30000	{아디다스,95M}	2025-06-09 04:21:34.858	2025-06-09 04:21:34.858
ff7b0672-a4f6-4f9c-8932-b9d57a8151e8	이제 멀 파냐?	생각나는게 없네	10000	{무소유}	2025-06-09 04:22:41.553	2025-06-09 04:22:41.553
4d144256-8e29-4844-9c90-b0096f0f3f57	LAMY 만년필	대만에 직접 사온 타이페이101 버젼 만년필 팔아요 	100000	{만년필}	2025-06-09 04:25:39.992	2025-06-09 04:25:39.992
2b4ef6cb-0231-4056-a128-a9fadfba2700	고양이	애완동물은 고양이가 짱이야 늘 귀여워	100000000	{애완동물,고양이,넘사벽}	2025-06-09 04:28:10.274	2025-06-09 06:25:58.582
c3b7e0e5-225c-4da2-bef7-ff611db3b775	토끼	아니야 생각해보니 토끼가 짱인듯	100000000	{애완동물,토끼,넘사벽}	2025-06-09 06:26:45.419	2025-06-09 06:26:45.419
4f96c6ba-c9da-4cd6-9181-504b9b3eb98b	api등록테스트	상품 설명 10자 이상은 확인했다.	10000	{테스트,코딩어렵다}	2025-06-10 05:40:59.906	2025-06-10 06:37:59.838
a2c51030-fd03-4c7a-b97e-68a9760ce8db	뇸뇸이	팔고 싶지만 안팔아용	1e+15	{강아지,뇸뇸,귀여워}	2025-06-22 07:16:17.757	2025-06-22 07:16:17.757
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: hong
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
0c4bac15-15d8-494d-b8b7-6e7d4d85cac8	7c0a03c11434fc4af8bd0e7260c92a9f8e384ba131d3d3854496d52e8010d669	2025-06-09 11:48:08.13523+09	20250609024807_init	\N	\N	2025-06-09 11:48:08.11933+09	1
2eb95bd7-5707-45fb-acb4-ee7ea9d8b03e	a057b0e540a9776d59f0003f5272dae66f335d3f9d48c7b5eba84f2934205662	2025-06-09 14:15:20.997003+09	20250609051520_add_article	\N	\N	2025-06-09 14:15:20.975268+09	1
24c09d9c-fb3a-4488-9323-373e6f1200b6	f9001de6f5b2f8a33edd5f9bbbb4bf345d9695b109bde3fea04ce7f19c7cb235	2025-06-09 16:37:07.935454+09	20250609073707_add_comment	\N	\N	2025-06-09 16:37:07.893057+09	1
1cd4fad0-76ec-48c8-8368-38cf279ace2e	81cb569aaa997c15357351ba1f5073b8eb4a79ea61ec3da460cb94481aadd51d	2025-06-09 17:12:52.83548+09	20250609081251_comment_change	\N	\N	2025-06-09 17:12:52.781558+09	1
\.


--
-- Name: Article Article_pkey; Type: CONSTRAINT; Schema: public; Owner: hong
--

ALTER TABLE ONLY public."Article"
    ADD CONSTRAINT "Article_pkey" PRIMARY KEY (id);


--
-- Name: Comment Comment_pkey; Type: CONSTRAINT; Schema: public; Owner: hong
--

ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT "Comment_pkey" PRIMARY KEY (id);


--
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: hong
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: hong
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Comment Comment_articleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hong
--

ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT "Comment_articleId_fkey" FOREIGN KEY ("articleId") REFERENCES public."Article"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Comment Comment_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hong
--

ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT "Comment_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

