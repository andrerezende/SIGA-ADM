--
-- PostgreSQL database dump
--


SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- Name: seq_bt_colecao; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_colecao', 403, false);


--
-- Name: seq_bt_emprestimo; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_emprestimo', 1, true);


--
-- Name: seq_bt_estado; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_estado', 21, false);


--
-- Name: seq_bt_etiqueta; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_etiqueta', 211, false);


--
-- Name: seq_bt_exemplar; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_exemplar', 201134, true);


--
-- Name: seq_bt_ficha; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_ficha', 21, false);


--
-- Name: seq_bt_genero; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_genero', 22, false);


--
-- Name: seq_bt_grupo; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_grupo', 22, true);


--
-- Name: seq_bt_indicadores; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_indicadores', 1248084, false);


--
-- Name: seq_bt_infracao; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_infracao', 22, false);


--
-- Name: seq_bt_logoperacao; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_logoperacao', 1966657, true);


--
-- Name: seq_bt_material; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_material', 1242514, true);


--
-- Name: seq_bt_multa; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_multa', 105474, false);


--
-- Name: seq_bt_notainfracao; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_notainfracao', 28465, true);


--
-- Name: seq_bt_obra; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_obra', 73157, true);


--
-- Name: seq_bt_obra_numerodaobra; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_obra_numerodaobra', 97580, true);


--
-- Name: seq_bt_observacao; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_observacao', 4283, true);


--
-- Name: seq_bt_opcao; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_opcao', 81, false);


--
-- Name: seq_bt_opcaolista; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_opcaolista', 1818, false);


--
-- Name: seq_bt_operacao; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_operacao', 121, false);


--
-- Name: seq_bt_politica; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_politica', 81, false);


--
-- Name: seq_bt_regracirculacao; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_regracirculacao', 70, false);


--
-- Name: seq_bt_reserva; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_reserva', 53271, false);


--
-- Name: seq_bt_situacao; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_situacao', 21, false);


--
-- Name: seq_bt_unidade; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_unidade', 38, true);


--
-- Name: seq_bt_validacao; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_bt_validacao', 25410, true);


--
-- Data for Name: bt_camposfixos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_camposfixos (idetiqueta, idobra, conteudo, obra_temp, etiqueta_temp) FROM stdin;
\.

--
-- Data for Name: bt_etiqueta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_etiqueta (idetiqueta, tag, indicador1, indicador2, mnemonico, descricao, observacao, temrepeticoes, temsubcampos, estaativo, emlistas, emdemonstracao, obsoleto) FROM stdin;
1	000	0	0	0	Líder	0	0	0	0	0	0	0
2	001	0	0	0	Número de Controle	0	0	1	0	0	0	0
3	003	0	0	0	Identificador do Número de Controle	0	0	0	0	0	0	0
4	005	0	0	0	Data e Hora da Última intervenção	0	0	0	0	0	0	0
5	006	0	0	0	Material Adicional	0	0	0	0	0	0	0
6	007	0	0	0	Campos de descrição física	0	0	0	0	0	0	0
7	008	0	0	0	Campo fixo de dados	0	0	0	0	0	0	0
8	010	0	0	0	Numero de Controle da LC	0	0	1	0	0	0	0
9	013	0	0	0	Controle de Informação de Patente	0	1	1	0	0	0	0
10	015	0	0	0	Número Bibliográfico Nacional	0	0	1	0	0	0	0
11	016	0	0	0	Instituição que Atribuiu o Número Bibliográfico Nacional	0	1	1	0	0	0	0
12	017	0	0	0	Número de CopyRight	0	1	1	0	0	0	0
13	018	0	0	0	Taxa de Cobrança de CopyRight	0	0	1	0	0	0	0
14	020	0	0	0	ISBN - International Standard Book Number	0	1	1	0	0	0	0
15	022	0	0	0	ISSN - International Standard Serial Number	0	1	1	0	0	0	0
16	024	0	0	0	Outros números ou códigos padrão	0	1	1	0	0	0	0
17	025	0	0	0	Número de Aquisição no Exterior	0	1	1	0	0	0	0
18	027	0	0	0	Número Padrão de Relatório Técnico (STRN)	0	1	1	0	0	0	0
19	028	0	0	0	Número do Editor Para Música	0	1	1	0	0	0	0
20	030	0	0	0	Número CODEN	0	1	1	0	0	0	0
21	032	0	0	0	Número de Registro Postal	0	1	1	0	0	0	0
22	033	0	0	0	Data/Hora e Lugar de um Evento	0	1	1	0	0	0	0
23	034	0	0	0	Dado Cartográfico Matemático Codificado	0	1	1	0	0	0	0
24	035	0	0	0	Número de Controle do Sistema	0	1	1	0	0	0	0
25	036	0	0	0	Número de Estudo Original para Arquivos de Computador	0	0	1	0	0	0	0
26	037	0	0	0	Fonte de Aquisição	0	1	1	0	0	0	0
27	040	0	0	0	Fonte de Catalogação	0	0	1	0	0	0	0
28	041	1	0	0	Código de Idioma	0	1	1	0	0	0	0
29	042	0	0	0	Código de Autenticação	0	0	1	0	0	0	0
30	043	0	0	0	Código de Área Geográfica	0	0	1	0	0	0	0
31	044	0	0	0	Código do País da Empresa de Publicação/Produção	0	0	1	0	0	0	0
32	045	1	0	0	Código de Período Cronológico	0	0	1	0	0	0	0
33	046	0	0	0	Código do Tipo de Data, Data 1, Data 2 (Datas A.C.)	0	0	1	0	0	0	0
34	047	0	0	0	Código da forma de composição musical	0	0	1	0	0	0	0
35	048	0	0	0	Código do número de instrumentos e vozes	0	1	1	0	0	0	0
36	050	0	0	0	Número de chamada da Library of Congress	0	1	1	0	0	0	0
37	051	0	0	0	Informação LC de cópia, edição e separata	0	1	1	0	0	0	0
38	052	0	0	0	Código de Classificação geográfica	0	1	1	0	0	0	0
39	055	0	0	0	Número de chamada/Número de classificação atribuídos no Canadá	0	1	1	0	0	0	0
40	060	0	0	0	Número de chamada da National Library of Medicine	0	1	1	0	0	0	0
41	061	0	0	0	Informação de cópia da National Library of Medicine	0	1	1	0	0	0	0
42	066	0	0	0	Conjunto de caracteres presente	0	0	1	0	0	0	0
43	070	0	0	0	Número de chamada da National Agricultural Library	0	1	1	0	0	0	0
44	071	0	0	0	Informação de Cópia da National Agricultural Library	0	1	1	0	0	0	0
45	072	0	0	0	Código de categoria de assunto	0	1	1	0	0	0	0
46	074	0	0	0	Número do item GPO	0	1	1	0	0	0	0
47	080	0	0	0	CDU - Classificação Decimal Universal	0	1	1	0	0	0	0
48	082	0	0	0	CDD - Classificação Decimal de Dewey	0	1	1	0	0	0	0
49	084	0	0	0	Outro número de classificação	0	1	1	0	0	0	0
50	086	0	0	0	Número de Classificação de Documento Governamental	0	1	1	0	0	0	0
51	088	0	0	0	Número de relatório	0	1	1	0	0	0	0
52	090	0	0	0	Números de Chamada Local	0	0	0	0	0	0	0
53	100	1	1	0	Entrada Principal - Nome Pessoal	0	0	1	0	0	0	0
54	110	1	0	0	Entrada Principal - Nome Corporativo	0	0	1	0	0	0	0
55	111	1	0	0	Entrada Principal - Nome de Evento	0	0	1	0	0	0	0
56	130	1	0	0	Entrada Principal - Título Uniforme	0	0	1	0	0	0	0
57	210	0	0	0	Título Chave Abreviado	0	0	1	0	0	0	0
58	222	0	0	0	Título Chave	0	1	1	0	0	0	0
59	240	1	1	0	Título Uniforme	0	0	1	0	0	0	0
60	242	0	0	0	Título Traduzido por Instituição Catalogadora	0	1	1	0	0	0	0
61	243	0	0	0	Título Uniforme Coletico (Título de Coletânea)	0	0	1	0	0	0	0
62	245	1	1	0	Título	0	0	1	0	0	0	0
63	246	1	1	0	Forma Variante do Título	0	1	1	0	0	0	0
64	247	0	0	0	Título Anterior ou Variações do Título	0	1	1	0	0	0	0
65	250	0	0	0	Edição	0	0	1	0	0	0	0
66	254	0	0	0	Informação de Apresentação Musical	0	0	1	0	0	0	0
67	255	0	0	0	Dado Cartográfico Matemático	0	1	1	0	0	0	0
68	256	0	0	0	Características de Arquivo de Computador	0	0	1	0	0	0	0
69	257	0	0	0	País da Instituição Produtora do Filme de Arquivo	0	0	1	0	0	0	0
70	260	0	0	0	Imprenta	0	1	1	0	0	0	0
71	261	0	0	0	Informação de Imprenta para Filmes (Pre-AACR1 Revised)	0	0	1	0	0	0	0
72	262	0	0	0	Informação de Imprenta para Gravação Sonora (Pré-AACR2)	0	0	1	0	0	0	0
73	263	0	0	0	Data Estimada de Publicação	0	0	1	0	0	0	0
74	270	0	0	0	Endereço	0	1	1	0	0	0	0
75	300	0	0	0	Descrição Física	0	1	1	0	0	0	0
76	306	0	0	0	Tempo de Duração	0	0	1	0	0	0	0
77	307	0	0	0	Horário, etc.	0	0	1	0	0	0	0
78	310	0	0	0	Periodicidade Corrente	0	0	1	0	0	0	0
79	328	0	0	0	Periodicidade Anterior	0	1	1	0	0	0	0
80	340	0	0	0	Meio Físico	0	1	1	0	0	0	0
81	342	0	0	0	Dados de Referência Geoespacial	0	1	1	0	0	0	0
82	343	0	0	0	Planar Coordinate Data	0	1	1	0	0	0	0
83	351	0	0	0	Organização e arranjo dos materiais	0	1	1	0	0	0	0
84	352	0	0	0	Representação gráfica digital	0	1	1	0	0	0	0
85	355	0	0	0	Controle de Classificação de Segurança	0	1	1	0	0	0	0
86	357	0	0	0	Controle do Autor sobre a disseminação	0	0	1	0	0	0	0
87	362	0	0	0	Informação de Datas de Publicação e/ou volume	0	1	1	0	0	0	0
88	400	0	0	0	Informação de Série/Entrada Secundária - Nome Pessoal	0	1	1	0	0	0	0
89	410	0	0	0	Informação de Série/Entrada Secundária - Nome Corporativo	0	1	1	0	0	0	0
90	411	0	0	0	Informação de Série/Entrada Secundária - Nome de Evento	0	1	1	0	0	0	0
91	440	0	0	0	Informação de Série/Entrada Secundária - Título	0	1	1	0	0	0	0
92	490	1	0	0	Informação de Série	0	1	1	0	0	0	0
93	500	0	0	0	Nota Geral	0	1	1	0	0	0	0
94	501	0	0	0	Nota iniciada por "COM"	0	1	1	0	0	0	0
95	502	0	0	0	Nota de Dissertação ou Tese	0	1	1	0	0	0	0
96	504	0	0	0	Nota de Bibliografia	0	1	1	0	0	0	0
97	505	1	0	0	Nota de conteúdo	0	1	1	0	0	0	0
98	506	0	0	0	Nota de Acesso Restrito	0	1	1	0	0	0	0
99	507	0	0	0	Nota de escala para material gráfico	0	0	1	0	0	0	0
100	508	0	0	0	Nota de Crédito de Produção/Criação	0	0	1	0	0	0	0
101	510	0	0	0	Nota de Citação/Referência	0	1	1	0	0	0	0
102	511	0	0	0	Nota de Participante ou Executor	0	1	1	0	0	0	0
103	513	0	0	0	Nota tipo de relatório e período coberto	0	1	1	0	0	0	0
104	514	0	0	0	Nota de qualidade dos dados	0	0	1	0	0	0	0
105	515	0	0	0	Nota de peculiaridade na numeração	0	1	1	0	0	0	0
106	516	0	0	0	Nota de tipo de arquivo ou dado de computador	0	1	1	0	0	0	0
107	518	0	0	0	Nota Data/Hora e lugar de um evento	0	1	1	0	0	0	0
108	520	0	0	0	Nota de Resumo	0	1	1	0	0	0	0
109	521	0	0	0	Nota de público alvo	0	1	1	0	0	0	0
110	522	0	0	0	Nota de cobertura geográfica	0	0	1	0	0	0	0
111	524	0	0	0	Nota de forma preferida para descrição do material	0	1	1	0	0	0	0
112	525	0	0	0	Nota de suplemento	0	1	1	0	0	0	0
113	530	0	0	0	Nota de disponibilidade de forma física adicional	0	1	1	0	0	0	0
114	533	0	0	0	Nota de reprodução	0	1	1	0	0	0	0
115	534	0	0	0	Nota de versão original	0	1	1	0	0	0	0
116	535	0	0	0	Nota de Localização dos originais / duplicatas	0	1	1	0	0	0	0
117	536	0	0	0	Nota de informação sobre financiamento	0	1	1	0	0	0	0
118	538	0	0	0	Nota detalhes do sistema	0	1	1	0	0	0	0
119	540	0	0	0	Nota de termos governando uso e reprodução	0	1	1	0	0	0	0
120	541	0	0	0	Nota de Fonte imediata de aquisição	0	1	1	0	0	0	0
121	544	0	0	0	Nota de localização de materiais de arquivo	0	1	1	0	0	0	0
122	545	0	0	0	Nota Biográfica ou histórica	0	1	1	0	0	0	0
123	546	0	0	0	Nota de idioma	0	1	1	0	0	0	0
124	547	0	0	0	Nota complexa de título anterior	0	1	1	0	0	0	0
125	550	0	0	0	Nota de informação sobre a edição	0	1	1	0	0	0	0
126	552	0	0	0	Nota de informação de atributo e unidade	0	1	1	0	0	0	0
127	555	0	0	0	Nota de índice cumulativo e remissivo	0	1	1	0	0	0	0
128	556	0	0	0	Nota de informação sobre documentação	0	1	1	0	0	0	0
129	561	0	0	0	Nota de histórico de procedência	0	1	1	0	0	0	0
130	562	0	0	0	Nota de identificação de cópia e versão	0	1	1	0	0	0	0
131	565	0	0	0	Nota de características de arquivo	0	1	1	0	0	0	0
132	567	0	0	0	Nota de metodologia	0	1	1	0	0	0	0
133	580	0	0	0	Nota de ligação complexa de entrada	0	1	1	0	0	0	0
134	581	0	0	0	Nota de publicações sobre materiais descritos	0	1	1	0	0	0	0
135	583	0	0	0	Nota de ação	0	1	1	0	0	0	0
136	584	0	0	0	Nota de acumulação e freqüência de uso	0	1	1	0	0	0	0
137	585	0	0	0	Nota de exposição	0	1	1	0	0	0	0
138	586	0	0	0	Nota de Premiação	0	1	1	0	0	0	0
139	590	0	0	0	Notas Locais	0	1	1	0	0	0	0
140	600	1	1	0	Assunto - Nome Pessoal	0	1	1	0	0	0	0
141	610	1	1	0	Assunto - Nome Corporativo	0	1	1	0	0	0	0
142	611	1	1	0	Assunto - Nome do Evento	0	1	1	0	0	0	0
143	630	1	1	0	Assunto - Título Uniforme	0	1	1	0	0	0	0
144	650	1	1	0	Assunto - Termo Tópico	0	1	1	0	0	0	0
145	651	0	1	0	Assunto - Nome geográfico	0	1	1	0	0	0	0
147	653	0	0	0	Assunto - Termo livre	0	1	1	0	0	0	0
148	654	0	0	0	Assunto - Termos tópicos facetados	0	1	1	0	0	0	0
149	655	0	0	0	Termo de índice - Gênero / forma / características físicas	0	1	1	0	0	0	0
150	656	0	0	0	Termo de índice-ocupação	0	1	1	0	0	0	0
151	657	0	0	0	Termo de índice-função	0	1	1	0	0	0	0
152	658	0	0	0	Termo de índice-currículum	0	1	1	0	0	0	0
153	690	0	0	0	Assunto Local	0	1	1	0	0	0	0
154	700	1	1	0	Entrada secundária - Nome pessoal	0	1	1	0	0	0	0
155	710	1	1	0	Entrada secundária - Nome corporativo	0	1	1	0	0	0	0
156	711	1	1	0	Entrada secundária - Nome de evento	0	1	1	0	0	0	0
157	720	0	0	0	Entrada secundária - Nome não controlado	0	1	1	0	0	0	0
158	730	1	1	0	Entrada secundária - Título uniforme	0	1	1	0	0	0	0
159	740	1	1	0	Entrada secundária - Título relacionado / Analítico não controlado	0	1	1	0	0	0	0
160	752	0	0	0	Entrada secundária - Nome hierárquico de lugar	0	1	1	0	0	0	0
161	753	0	0	0	Detalhes de sistema para acesso a arquivos de computador	0	1	1	0	0	0	0
162	754	0	0	0	Entrada secundária - Identificação taxonômica	0	1	1	0	0	0	0
163	755	0	0	0	Entrada secundária - Características físicas	0	1	0	0	0	0	1
164	760	0	0	0	Entrada de série principal	0	1	1	0	0	0	0
165	762	0	0	0	Entrada de sub-série	0	1	1	0	0	0	0
166	765	0	0	0	Entrada de idioma original	0	1	1	0	0	0	0
167	767	0	0	0	Entrada de tradução	0	1	1	0	0	0	0
168	770	0	0	0	Entrada de suplemento / edição especial	0	1	1	0	0	0	0
169	772	0	0	0	Entrada de registro fonte	0	1	1	0	0	0	0
170	773	1	1	0	Entrada analítica	0	1	1	0	0	0	0
171	774	0	0	0	Entrada de unidade constituinte	0	1	1	0	0	0	0
172	775	0	0	0	Entrada de outra edição	0	1	1	0	0	0	0
173	776	0	0	0	Entrada de forma física adicional	0	1	1	0	0	0	0
174	777	0	0	0	Entrada de "Publicado com"	0	1	1	0	0	0	0
175	780	0	0	0	Entrada anterior	0	1	1	0	0	0	0
176	785	0	0	0	Entrada posterior	0	1	1	0	0	0	0
177	786	0	0	0	Entrada da fonte dos dados	0	1	1	0	0	0	0
178	787	0	0	0	Entrada de relação não específica	0	1	1	0	0	0	0
179	800	0	0	0	Entrada secundária de série - Nome pessoal	0	1	1	0	0	0	0
180	810	0	0	0	Entrada secundária de série - Nome corporativo	0	1	1	0	0	0	0
181	811	0	0	0	Entrada secundária de série - Nome do evento	0	1	1	0	0	0	0
182	830	0	0	0	Entrada secundária de série - Título uniforme	0	1	1	0	0	0	0
183	841	0	0	0	Valores de dados codificados de holdings	0	0	1	0	0	0	0
184	842	0	0	0	Designação textual de forma física	0	0	1	0	0	0	0
185	843	0	0	0	Nota de reprodução	0	1	1	0	0	0	0
186	844	0	0	0	Nome da unidade	0	0	1	0	0	0	0
187	845	0	0	0	Nota termos reguladores de uso e reprodução	0	1	1	0	0	0	0
188	850	0	0	0	Instituição depositária	0	1	1	0	0	0	0
189	852	0	0	0	Localização / Número de chamada	0	1	1	0	0	0	0
190	853	0	0	0	Legenda e padrão - Unidade bibliográfica básica	0	1	1	0	0	0	0
191	854	0	0	0	Legenda e padrão - Material suplementar	0	1	1	0	0	0	0
192	855	0	0	0	Legenda e padrão - Índices	0	1	1	0	0	0	0
193	856	1	1	0	Localização e acesso eletrônico	0	1	1	0	0	0	0
194	863	0	0	0	Enumeração e cronologia - Unidade bibliográfica básica	0	1	1	0	0	0	0
195	864	0	0	0	Enumeração e cronologia - Material suplementar	0	1	1	0	0	0	0
196	865	0	0	0	Enumeração e cronologia - Índices	0	1	1	0	0	0	0
197	866	0	0	0	Holdings textual - Unidade bibliográfica básica	0	1	1	0	0	0	0
198	867	0	0	0	Holdings textual - Material suplementar	0	1	1	0	0	0	0
199	868	0	0	0	Holdings textual - Índices	0	1	1	0	0	0	0
200	876	0	0	0	Informação de item - Unidade bibliográfica básica	0	0	1	0	0	0	0
201	877	0	0	0	Informação de item - Material suplementar	0	0	1	0	0	0	0
202	878	0	0	0	Informação de item - Índices	0	0	1	0	0	0	0
203	880	0	0	0	Representação gráfica alternada	0	1	1	0	0	0	0
204	886	0	0	0	Campo de informação para MARC estrangeiro	0	1	1	0	0	0	0
205	900	0	0	0	Dados do Exemplar	0	1	1	0	1	0	0
206	901	0	0	0	Tipo de Material	0	0	1	0	0	0	0
207	902	0	0	0	Gênero do Material	0	0	1	0	0	0	0
208	903	0	0	0	Base de Dados	0	0	1	0	0	0	0
209	904	0	0	0	Local	0	0	1	0	0	0	0
210	910	0	0	0	Informações sobre Catalogação	0	1	1	0	0	0	0
\.

--
-- Data for Name: bt_opcao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_opcao (idopcao, descricao) FROM stdin;
1	Status do Registro
2	Tipo de Registro
3	Nível Bibliográfico
4	Tipo de Controle
5	Nível de Catalogação
6	Forma de Catalogação
7	Ligação do Registro
8	Tipo de Data/Status de Publicação
9	Lugar de publicação, produção ou execução
10	Ilustrações
11	Público alvo
12	Forma do item
13	Natureza do conteúdo
14	Publicação governamental
15	Publicação de evento
16	Coletânea de homenagem
17	Índice
18	Indefinido
19	Forma literária
20	Biografia
21	Idioma
22	Registro modificado
23	Fonte da catalogação
24	Data de entrada no arquivo
25	Data 1
26	Data 2
27	Indicador 1 - Tags 100, 600, 700
28	Indicador 1 - Tags 110, 111, 610, 710, 711
29	Indicador 1 - Tags 130, 630, 730, 740
30	Indicador 1 - Tags 240, 245
31	Indicador 1 - Tag 490
32	Indicador 1 - Tag 505
33	Indicador 1 - Tag 650
34	Indicador 1 - Tag 773
35	Indicador 1 - Tag 041
36	Indicador 1 - Tag 045
37	Indicador 2 - Tags 240, 245
38	Indicador 2 - Tags 600, 610, 630, 650, 651
39	Indicador 2 - Tags 700, 710, 711, 730, 740, 773
40	Forma do material
41	Indicador 2 - Tag 100
61	Indicador 1 - Tag 856
62	Indicador 2 - Tag 856
81	Indicador 1 - Tag 246
82	Indicador 2 - Tag 246
\.

--
-- Data for Name: bt_ficha; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_ficha (idficha, categoria, nivel) FROM stdin;
1	BK	5
2	SE	5
3	VM	5
4	MP	5
5	MX	5
\.

--
-- Data for Name: bt_subficha; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_subficha (idficha, idsubficha, titulo) FROM stdin;
1	1	Líder
1	2	006
1	4	008
1	5	Campos Variáveis
3	7	007
3	6	Líder
3	8	008
3	9	Campos Variáveis
\.


--
-- Data for Name: bt_colecao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_colecao (idcolecao, mnemonico, descricao) FROM stdin;
1	N-E	Não especificada
2	D-A	Administracao
3	D-B	BioQuímica
4	D-C	Contabilidade
5	D-CB	Ciências Biológicas
6	D-CI	Ciências
7	D-CR	Ciência da Religião
8	D-CS	Comunicação Social
9	D-D	Direito
10	D-E	Educação
11	D-EC	Economia
12	D-EE	Engenharia Elétrica
13	D-EF	Educação Física
14	D-EG	Engenharia
15	D-EN	Enfermagem
16	D-EP	Engenharia da Produção
17	D-ER	Economia Rural
18	D-F	Filosofia
19	D-FAR	Farmácia
20	D-FIS	Física
21	D-GEO	Geografia
22	D-H	História
23	D-L	Letras
24	D-LL	Linguística
25	D-LT	Literatura
26	D-M	Medicina
27	D-O	Odontologia
28	D-P	Psicologia
29	D-Q	Química
30	D-S	Sociologia
31	D-SP	Saúde Pública
32	D-SS	Serviço Social
33	D-T	Teologia
34	E-AEI	Arte-Educação Infantil
35	E-AH	Administração Hoteleira
36	E-AIJ	Área Infância Juventude
37	E-AMP	Ativ. Motoras Promoção SQV
38	E-APP	Aval. Política Pub. Educ.
39	E-CR	Ciência da Religião
40	E-DE	Dermatologia
41	E-DR	Dentística Restauradora
564	MU-ENG	Museu Engenharia
43	E-EC	Educação para Ciência
44	E-ED	Endodontia
45	E-EN	Enfermagem
46	E-FMC	Filosofia Moderna Contemp.
47	E-FTM	Fundam. T. Metod. Ensino
48	E-GE	Geografia
49	E-GAM	Gestão Ambiental em Municípios
50	E-GEP	Gestão Estrat. Prod. Industrial
51	E-GGT	Geografia Gestão Território
52	E-GH	Gestão Hospitalar
53	E-GNC	Gestão Negócios Empreend. (conv)
54	E-GNE	Gestão Negócios Empreendimentos
55	E-HB	História do Brasil
56	E-MEC	Métodos Estat. Computacionais
57	E-OOF	Ortodontia Ortopedia Facial
58	E-PGS	Planejamento de Gestão Social
59	E-RM	Residência Médica
60	E-SF	Saúde da Família
61	E-TTP	Teorias Técnicas Pesq. Social
62	LD-E	Educação
63	LD-EF	Educação Física
64	LD-F	Farmácia
65	LD-H	História
66	LD-M	Medicina
67	LD-O	Odontologia
68	LD-SS	Serviço Social
69	LD-Z	Zoologia
70	LMM	Legado Murilo
71	M-A	Administração
72	M-AG	Agronomia
73	M-AR	Artes
74	M-AS	Antropologia Social
75	M-B	Biblioteconomia
76	M-BQ	BioQuímica
77	M-C	Contabilidade
78	M-CB	Ciências Biológicas
79	M-CI	Ciências
80	M-CM	Ciências Médicas
81	M-CP	Ciência Política
82	M-CR	Ciência da Religião
83	M-CS	Comunicação Social
84	M-CSO	Ciências Sociais
85	M-D	Direito
86	M-E	Educação
87	M-EC	Economia
88	M-ECO	Ecologia
89	M-EE	Engenharia Elétrica
90	M-EF	Educação Física
91	M-EG	Engenharia
92	M-EM	Engenharia Mecânica
93	M-EN	Enfermagem
94	M-ENC	Engenharia Civil
95	M-EP	Engenharia da Produção
96	M-ER	Economia Rural
97	M-ES	Estatística
98	M-F	Farmácia
99	M-FIL	Filosofia
100	M-FIS	Física
101	M-GEO	Geografia
102	M-GG	Geologia
103	M-H	História
104	M-I	Informática
105	M-L	Letras
106	M-LL	Letras - Linguística
107	M-LT	Letras - Teoria
108	M-M	Medicina
109	M-MA	Matemática
110	M-MB	Microbiologia
111	M-O	Odontologia
112	M-P	Psicologia
113	M-Q	Química
114	M-S	Sociologia
115	M-SS	Serviço Social
116	M-T	Teologia
117	PD-M	Medicina
118	PD-Q	Química
119	PG-C	Comunicação
120	PG-CT	Contabilidade
121	PG-D	Direito
122	PG-ERN	Ecologia e Recursos Naturais
123	PG-EA	Economia Agraria
124	PG-EC	Engenharia Civil
125	PG-ED	Educação
126	PG-EN	Enfermagem
127	PG-ER	Extensão Rural
128	PG-F	Física
129	PG-L	Letras
130	PG-M	Medicina
131	PG-O	Odontologia
132	PG-R	Religião
133	PG-SR	Sociologia Rural
134	M-G	Genética
135	C-O	Odontologia
141	UFJF	UFJF
161	E-PE	Periodontia
181	E-N	Nefrologia
182	E-ST	Segurança do Trabalho
201	E-AL	Alfabetização e Linguagem
221	E-CQB	Controle de Qualidade Biologico
241	E-AA	Análise Ambiental
261	E-EI	Educacao Infantil
283	E-ENE	Enfermagem e Estomaterapia
301	E-ROI	Radiologia Odontologica e Imaginologia
321	E-EF	Educacao Fisica
322	E-MD	Média e Deficiência
341	D-I	Informatica
342	D-IE	Informatica na Educacao
343	M-SC	Saude Coletiva
361	M-SB	Saude Brasileira
381	E-EL	Estudos literarios
382	E-TL	Teoria da Literatura
384	E-DT	Disfuncao ATM e dor orofacial
403	AD	Arlindo Daibert
424	E-DI	Design instrucional educacao on-line
443	E-LP	Lingua portuguesa
444	AR	Afonso Rodrigues
464	M-MC	Modulagem Computacional
484	E-VS	Vigilancia Sanitaria
505	E-PMI	Parasitologia, Microbiologia e Imunologia
506	E-CHBES	Ciencias humanas: Brasil, Estado e Sociedade
507	E-PGS	Planejamento e Gestao Social
508	E-CQM	Controle de Qualidade de Medicamentos
524	E-O	Ortodontia
544	E-ACVC	Artes, Cultura Visual e Comunicacao
\.

--
-- Data for Name: bt_consulta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_consulta (idconsulta, mnemonico) FROM stdin;
\.


--
-- Data for Name: bt_consultacampo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_consultacampo (idconsulta, idetiqueta, subcampo) FROM stdin;
\.


--
-- Data for Name: bt_grupo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_grupo (idgrupo, descricao, nivel) FROM stdin;
1	ALUNOS	\N
2	PROFESSORES	\N
3	FUNCIONARIO	\N
4	RECÉM-DOUTOR	\N
5	SETOR	\N
\.


--
-- Data for Name: bt_operacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_operacao (idoperacao, descricao, mnemonico) FROM stdin;
1	Operação de Empréstimo	EMPRESTIMO
2	Operação de Reserva	RESERVA
3	Operacao de Devolução	DEVOLUCAO
4	Reserva WEB	RESERVAWEB
5	Reserva WEB de Materiais Disponíveis	RESWEBDISP
6	Retirar com Multa	RETCMULTA
7	Incluir Multa	INCMULTA
8	Editar Multa	EDTMULTA
9	Exluir Multa	EXCMULTA
10	Recebimento de Multa	RECMULTA
11	Incluir Empréstimo	INCEMPR
12	Editar Empréstimo	EDTEMPR
13	Excluir Empréstimo	EXCEMPR
14	Incluir Obra	INCOBRA
15	Editar Obra	EDTOBRA
16	Excluir Obra	EXCOBRA
17	Incluir Exemplar	INCEXEMP
18	Editar Exemplar	EDTEXEMP
19	Excluir Exemplar	EXCEXEMP
20	Validacao de Cartao	VALIDACARTAO
21	Alteração do grupo do usuário	ALTGRUPO
22	Alteração de grupo e de cartão	ALTGRUPOCARTAO
23	Empréstimo por horas	EMPRHORAS
61	Alteração da previsão de devolução	ALTPREVDEVOL
41	Exclusão de Cartão	EXCCARTAO
81	Perdoar Multa	PERDOAMULTA
101	Inclusão de Vínculo	INCVINCULO
\.



--
-- Data for Name: bt_regracirculacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_regracirculacao (idregracirculacao, descricao) FROM stdin;
1	LIVRO
4	PA
5	SERIADO
8	VIDEO
9	FITA CASSETE
10	CD-ROM
12	SLIDE
11	DISQUETE
13	MAPA
2	TESE
3	MONOGRAFIA
6	FOLHETO
7	APOSTILA
14	LIVRO - 1 SEMANA
15	LIVRO - 2 SEMANAS
16	LIVRO - MESMO DIA
17	LIVRO - CONSULTA - 1 DIA
18	LIVRO - CONSULTA - 2 DIAS
19	TESE - 2 DIAS
20	TESE - 2 SEMANAS
21	FOLHETO - 1 SEMANA
23	FOLHETO - CONSULTA - 1 DIA
24	FOLHETO - CONSULTA - 2 DIAS
25	APOSTILA - 2 SEMANAS
26	APOSTILA - CONSULTA - 1 DIA
27	APOSTILA - CONSULTA - 2 DIAS
28	LIVRO - 1 SEMESTRE
29	REFERENCIA
30	PA - CONSULTA - 1 DIA
50	MONOGRAFIA - CONSULTA - 1 DIA
\.


--
-- Data for Name: bt_direito; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_direito (idregracirculacao, idoperacao, idgrupo) FROM stdin;
3	1	1
4	1	1
14	1	1
15	1	1
16	1	1
17	1	1
18	1	1
19	1	1
20	1	1
21	1	1
23	1	1
24	1	1
25	1	1
26	1	1
27	1	1
3	2	1
4	2	1
14	2	1
15	2	1
16	2	1
17	2	1
18	2	1
19	2	1
20	2	1
21	2	1
23	2	1
24	2	1
25	2	1
26	2	1
27	2	1
3	3	1
4	3	1
14	3	1
15	3	1
16	3	1
17	3	1
18	3	1
19	3	1
20	3	1
21	3	1
23	3	1
24	3	1
25	3	1
26	3	1
27	3	1
3	4	1
4	4	1
14	4	1
15	4	1
16	4	1
28	1	2
28	3	2
19	4	1
20	4	1
21	4	1
25	4	1
3	1	2
4	1	2
14	1	2
15	1	2
16	1	2
17	1	2
18	1	2
19	1	2
20	1	2
21	1	2
23	1	2
24	1	2
25	1	2
26	1	2
27	1	2
3	2	2
4	2	2
14	2	2
15	2	2
16	2	2
17	2	2
18	2	2
19	2	2
20	2	2
21	2	2
23	2	2
24	2	2
25	2	2
26	2	2
27	2	2
3	3	2
4	3	2
14	3	2
15	3	2
16	3	2
17	3	2
18	3	2
19	3	2
20	3	2
21	3	2
23	3	2
24	3	2
25	3	2
26	3	2
27	3	2
3	4	2
4	4	2
14	4	2
15	4	2
16	4	2
19	4	2
20	4	2
21	4	2
25	4	2
3	1	3
4	1	3
14	1	3
15	1	3
16	1	3
17	1	3
18	1	3
19	1	3
20	1	3
21	1	3
23	1	3
24	1	3
25	1	3
26	1	3
27	1	3
3	2	3
4	2	3
14	2	3
15	2	3
16	2	3
17	2	3
18	2	3
19	2	3
20	2	3
21	2	3
23	2	3
24	2	3
25	2	3
26	2	3
27	2	3
3	3	3
4	3	3
14	3	3
15	3	3
16	3	3
17	3	3
18	3	3
19	3	3
20	3	3
21	3	3
23	3	3
24	3	3
25	3	3
26	3	3
27	3	3
3	4	3
4	4	3
14	4	3
15	4	3
16	4	3
19	4	3
20	4	3
21	4	3
25	4	3
28	1	5
28	3	5
28	1	4
28	3	4
\.

--
-- Data for Name: bt_emprestimo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_emprestimo (idemprestimo, datahoradoemprestimo, datahoraprevisaodevolucao, datahoradadevolucao, quantidadederenovacoes, emprhoras, idusuario, idexemplar, usuario_temp, exemplar_temp) FROM stdin;
1	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: bt_estado; Type: TABLE DATA; Schema: public; Owner: postgres
--


COPY bt_estado (idestado, descricao, mnemonico) FROM stdin;
1	Disponível	DISPONIVEL
2	Congelado	CONGELADO
3	Extraviado	EXTRAVIADO
4	Descartado	DESCARTADO
5	Emprestado	EMPRESTADO
6	Reservado	RESERVADO
7	Restaurando	RESTAURANDO
8	Baixa Perdido	PERDIDO
9	Baixa Destruído	DESTRUIDO
10	Baixa Desatualizado	DESATUALIZADO
11	Baixa Doação	DOACAO
12	Baixa Troca de Setor	TROCASETOR
13	Baixa Desaparecido	DESAPARECIDO
14	Emprestado - Setor	SETOR
15	Depósito	DEPOSITO
16	Em Processamento	PROCESSAMENTO
\.




--
-- Data for Name: bt_exemplar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_exemplar (idexemplar, numerodotombo, codigodoexemplar, notainterna, volume, preco, notaopac, notacirculacao, numinventario, idestado, idregracirculacao, idunidade, idcolecao, idobra, obra_temp, colecao_temp) FROM stdin;
\.


--
-- Data for Name: bt_genero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_genero (idgenero, descricao, idficha) FROM stdin;
1	LIVRO	1
2	TESE	1
3	MONOGRAFIA	1
4	PA	1
6	FOLHETO	1
7	APOSTILA	1
21	REFERENCIA	1
\.


--
-- Data for Name: bt_indicadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_indicadores (idindicador, idetiqueta, idobra, indicador, conteudo, ocorrencia, obra_temp, etiqueta_temp) FROM stdin;
\.


--
-- Data for Name: bt_infracao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_infracao (idinfracao, descricao) FROM stdin;
1	Multas Pendentes
2	Empréstimos Pendentes
3	Mudança de Curso
4	Matrícula Trancada
5	Nada Consta
6	Empréstimos Bloqueados
7	Validade Vencida
8	Perdeu Cartão
9	Extravio de Livro
21	Chave do Guarda-Volume nao devolvida
\.


--
-- Data for Name: bt_logoperacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_logoperacao (idlogoperacao, data, identificador, idusuario, idoperacao, usuario_temp, obra_temp, exemplar_temp) FROM stdin;
\.


--
-- Data for Name: bt_logoperacaodetalhe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_logoperacaodetalhe (idlogoperacao, campo, valoranterior, valornovo) FROM stdin;
\.


--
-- Data for Name: bt_material; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_material (idobra, idetiqueta, subcampo, conteudo, linha, idmaterial, ocorrencia, obra_temp, etiqueta_temp) FROM stdin;
\.


--
-- Data for Name: bt_multa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_multa (idmulta, datahora, valor, observacao, foipaga, datahorapagamento, idemprestimo) FROM stdin;
\.


--
-- Data for Name: bt_notainfracao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_notainfracao (idinfracao, idusuario, notainfracao, idnotainfracao, usuario_temp) FROM stdin;
\.


--
-- Data for Name: bt_obra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_obra (idobra, numerodaobra, titulo, autor, edicao, localpublicacao, editora, datapublicacao, idgenero, subtitulo, descfisica) FROM stdin;
\.


--
-- Data for Name: bt_observacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_observacao (idusuario, idobservacao, descricao, usuario_temp) FROM stdin;
\.



--
-- Data for Name: bt_opcaolista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_opcaolista (idopcao, idopcaolista, indice, texto, ordem) FROM stdin;
1	1	a	Aumento no nível de catalogação	1
1	2	c	Alterado ou revisado	2
1	3	d	Deletado	3
1	4	n	Novo	4
1	5	p	Aumento do Nível de catalogação da pré-publicação	5
2	6	a	Material Textual (impresso)	1
2	7	c	Música (impressa)	2
2	8	d	Música manuscrita	3
2	9	e	Material cartográfico (impresso)	4
2	10	f	Material cartográfico (manuscrito)	5
2	11	g	Material projetável	6
2	12	i	Gravação sonora (não musical)	7
2	13	j	Gravação sonora (musical)	8
2	14	k	Gráfico não projetável bidimensional	9
2	15	m	Arquivo de computador	10
2	16	o	Kit (contém duas ou mais categorias de material)	11
2	17	p	Material misto	12
2	18	r	Artefatos tridimensionais e objetos	13
2	19	t	Material textual (manuscrito)	14
3	20	a	Analítica de monografia	1
3	21	b	Analítica de periódico	2
3	22	c	Coleção	3
3	23	d	Sub-unidade	4
3	24	m	Monografia	5
3	25	s	Periódico	6
4	26	#	Nenhum tipo específico	1
4	27	a	Arquivamento	2
5	28	#	Completo	1
5	29	1	Completo (material não examinado)	2
5	30	2	Incompleto, material não examinado	3
5	31	3	Abreviado	4
5	32	4	Nível padrão	5
5	33	5	Parcial (preliminar)	6
5	34	7	Mínimo	7
5	35	8	Pré-publicação	8
5	36	u	Desconhecido	9
5	37	z	Não aplicável	10
6	38	#	Não está de acordo com ISBD	1
6	39	a	AACR2	2
6	40	i	ISBD	3
7	41	#	Não analítica	1
7	42	r	Analítica	2
18	53	#	Contém branco	1
18	54	|	Caracter cheio	2
8	55	c	Item de periódico de publicação corrente	1
8	56	d	Item de periódico encerrado	2
8	57	m	Múltiplas datas	3
8	58	r	Data de reimpressão	4
8	59	s	Data conhecida/provável	5
8	60	t	Data de publicação e data de copyright	6
8	61	|	Sem tentativa de codificar	7
10	62	#	Sem ilustração	1
10	63	a	Ilustrações	2
10	64	b	Mapas	3
10	65	c	 Retratos	4
10	66	d	Gráficos	5
10	67	e	Plantas	6
10	68	f	Estampas	7
10	69	g	Música (partitura)	8
10	70	h	Fac-similes	9
10	71	i	Escudos ou brasões	10
10	72	j	Árvore genealógica	11
10	73	k	Formulários	12
10	74	l	Amostras, tabelas estatísticas	13
10	75	m	Gravações	14
10	76	o	Fotografias	15
10	77	p	Transparências	16
10	78	|	Sem tentativa de codificar	17
11	79	#	Desconhecido ou não especificado	1
11	80	a	Pré-escolar	2
11	81	b	Primário	3
11	82	c	1º Grau	4
11	83	d	2º Grau	5
11	84	e	Adulto	6
11	85	f	Especializado	7
11	86	g	Geral	8
11	87	j	Juvenil	9
11	88	|	Sem tentativa de codificar	10
12	89	#	None of the following	1
12	90	a	Microfilme	2
12	91	b	Microficha	3
12	92	c	Microficha opaca	4
12	93	d	Impressão ampliada	5
12	94	f	Braile	6
12	95	r	Reprodução da impressão normal	7
12	96	s	Electrônico	8
12	97	|	Sem tentativa de codificar	9
13	98	#	Natureza do conteúdo não especificada	1
13	99	a	Abstracts/resumos	2
13	100	b	Bibliografias	3
13	101	c	Catálogos	4
13	102	d	Dicionários	5
13	103	e	Enciclopédias	6
13	104	f	Manuais	7
13	105	g	Artigos legais	8
13	106	i	Índices	9
13	107	j	Patentes	10
13	108	k	Discografias	11
13	109	l	Legislação	12
13	110	m	Teses	13
13	111	n	Levantamento da literatura de uma área	14
13	112	o	Recensões	15
13	113	p	Textos programados	16
13	114	q	Filmografias	17
13	115	r	Guias/indicadores	18
13	116	s	Estatísticas	19
13	117	t	Relatórios técnicos	20
13	118	u	Standards/specifications	21
13	119	v	Notas sobre caos legais	22
13	120	w	Relatórios de legislação e jurisprudência	23
13	121	z	Tratados	24
13	122	|	Sem tentativa de codificar	25
14	123	#	Nao é uma publicação governamental	1
14	124	a	Membros autônomos ou semi-autônomos de uma federação	2
14	125	c	Multilocal	3
14	126	f	Federal/nacional	4
14	127	i	Internacionais intergovernamentais	5
14	128	l	Local	6
14	129	m	Multiestadual	7
14	130	s	Estado, província, território, jurisdição, etc	9
14	131	u	Desconhecido se o item é publicação governamental	10
14	132	z	Outros	11
14	133	|	Sem tentativa de codificar	12
15	134	0	Não é publicacao de evento	1
15	135	1	Publicação de evento	2
15	136	|	Sem tentativa de codificar	3
16	137	0	Não é coletânea de homenagem	1
16	138	1	Coletânea de homenagem	2
16	139	|	Sem tentativa de codificar	3
17	140	0	Não possui índice	1
17	141	1	Possui índice	2
17	142	|	Sem tentativa de codificar	3
19	143	0	Nao é ficção	1
19	144	1	Ficção	2
19	145	c	História em quadrinhos	3
19	146	d	Drama	4
19	147	e	Ensaios	5
19	148	f	Romance	6
19	149	h	Humor, sátira, etc	7
19	150	i	Cartas	8
19	151	j	Contos	9
19	152	m	Formas mistas	10
19	153	p	Poesia	11
19	154	s	Discursos	12
19	155	u	Desconhecido	13
19	156	|	Sem tentativa de codificar	14
20	157	#	Nao contém dados biográficos	1
20	158	a	Autobiografia	2
20	159	b	Biografia individual	3
20	160	c	Biografia coletiva	4
20	161	d	Contém informação biográfica	5
20	162	|	Sem tentativa de codificar	6
22	163	#	Não modificado	1
22	164	s	Abreviado	2
22	165	d	Omissões substituídas por traços	3
22	166	x	Faltam caracteres	4
22	167	r	Completamente romanizado/Imprimir ficha na escrita	5
22	168	o	Completamente romanizado/Imprimir ficha romanizada	6
22	169	|	Sem tentativa de codificar	7
23	170	#	Instituição bibliográfica Nacional	1
23	171	c	Programa de catalogação cooperativa	2
23	172	d	Outras fontes	3
23	173	u	Desconhecido	4
23	174	|	Sem tentativa de codificar	5
14	175	o	Publicação governamental - nível indeterminado	8
21	538	aar	Afar	1
21	539	aka	Akan	10
21	540	dgr	Dogrib	100
21	541	din	Dinka	101
21	542	div	Divehi	102
21	543	doi	Dogri	103
21	544	dra	Dravidian (Other)	104
21	545	dua	Duala	105
21	546	dum	Dutch, Middle (ca. 1050-1350)	106
21	547	dut	Dutch	107
21	548	dyu	Dyula	108
21	549	dzo	Dzongkha	109
21	550	akk	Akkadian	11
21	551	efi	Efik	110
21	552	egy	Egyptian	111
21	553	eka	Ekajuk	112
21	554	elx	Elamite	113
21	555	eng	English	114
21	556	enm	English, Middle (1100-1500)	115
21	557	epo	Esperanto	116
21	558	esk	Eskimo languages	117
21	559	esp	Esperanto	118
21	560	est	Estonian	119
21	561	alb	Albanian	12
21	562	eth	Ethiopic	120
21	563	ewe	Ewe	121
21	564	ewo	Ewondo	122
21	565	fan	Fang	123
21	566	fao	Faroese	124
21	567	far	Faroese	125
21	568	fat	Fanti	126
21	569	fij	Fijian	127
21	570	fin	Finnish	128
21	571	fiu	Finno-Ugrian (Other)	129
21	572	ale	Aleut	13
21	573	fon	Fon	130
21	574	fre	French	131
21	575	fri	Frisian	132
21	576	frm	French, Middle (ca. 1400-1600)	133
21	577	fro	French, Old (ca. 842-1400)	134
21	578	fry	Frisian	135
21	579	ful	Fula	136
21	580	fur	Friulian	137
21	581	gaa	Gã	138
21	582	gae	Scottish Gaelic	139
21	583	alg	Algonquian (Other)	14
21	584	gag	Galician	140
21	585	gal	Oromo	141
21	586	gay	Gayo	142
21	587	gba	Gbaya	143
21	588	gem	Germanic (Other)	144
21	589	geo	Georgian	145
21	590	ger	German	146
21	591	gez	Ethiopic	147
21	592	gil	Gilbertese	148
21	593	gla	Scottish Gaelic	149
21	594	amh	Amharic	15
21	595	gle	Irish	150
21	596	glg	Galician	151
21	597	glv	Manx	152
21	598	gmh	German, Middle High (ca. 1050-1500)	153
21	599	goh	German, Old High (ca. 750-1050)	154
21	600	gon	Gondi	155
21	601	gor	Gorontalo	156
21	602	got	Gothic	157
21	603	grb	Grebo	158
21	604	grc	Greek, Ancient (to 1453)	159
21	605	ang	English, Old (ca. 450-1100)	16
21	606	gre	Greek, Modern (1453- )	160
21	607	grn	Guarani	161
21	608	gua	Guarani	162
21	609	guj	Gujarati	163
21	610	gwi	Gwichin	164
21	611	hai	Haida	165
21	612	hau	Hausa	166
21	613	haw	Hawaiian	167
21	614	heb	Hebrew	168
21	615	her	Herero	169
21	616	apa	Apache languages	17
21	617	hil	Hiligaynon	170
21	618	him	Himachali	171
21	619	hin	Hindi	172
21	620	hit	Hittite	173
21	621	hmn	Hmong	174
21	622	hmo	Hiri Motu	175
21	623	hun	Hungarian	176
21	624	hup	Hupa	177
21	625	iba	Iban	178
21	626	ibo	Igbo	179
21	627	ara	Arabic	18
21	628	ice	Icelandic	180
21	629	ijo	Ijo	181
21	630	iku	Inuktitut	182
21	631	ile	Interlingue	183
21	632	ilo	Iloko	184
21	633	ina	Interlingua (International Auxiliary Language Association)	185
21	634	inc	Indic (Other)	186
21	635	ind	Indonesian	187
21	636	ine	Indo-European (Other)	188
21	637	int	Interlingua (International Auxiliary Language Association)	189
21	638	arc	Aramaic	19
21	639	ipk	Inupiaq	190
21	640	ira	Iranian (Other)	191
21	641	iri	Irish	192
21	642	iro	Iroquoian (Other)	193
21	643	ita	Italian	194
21	644	jav	Javanese	195
21	645	jpn	Japanese	196
21	646	jpr	Judeo-Persian	197
21	647	jrb	Judeo-Arabic	198
21	648	kaa	Kara-Kalpak	199
21	649	abk	Abkhaz	2
21	650	arm	Armenian	20
21	651	kab	Kabyle	200
21	652	kac	Kachin	201
21	653	kal	Kalâtdlisut	202
21	654	kam	Kamba	203
21	655	kan	Kannada	204
21	656	kar	Karen	205
21	657	kas	Kashmiri	206
21	658	kau	Kanuri	207
21	659	kaw	Kawi	208
21	660	kaz	Kazakh	209
21	661	arn	Mapuche	21
21	662	kha	Khasi	210
21	663	khi	Khoisan (Other)	211
21	664	khm	Khmer	212
21	665	kho	Khotanese	213
21	666	kik	Kikuyu	214
21	667	kin	Kinyarwanda	215
21	668	kir	Kyrgyz	216
21	669	kmb	Kimbundu	217
21	670	kok	Konkani	218
21	671	kom	Komi	219
21	672	arp	Arapaho	22
21	673	kon	Kongo	220
21	674	kor	Korean	221
21	675	kos	Kusaie	222
21	676	kpe	Kpelle	223
21	677	kro	Kru	224
21	678	kru	Kurukh	225
21	679	kua	Kuanyama	226
21	680	kum	Kumyk	227
21	681	kur	Kurdish	228
21	682	kus	Kusaie	229
21	683	art	Artificial (Other)	23
21	684	kut	Kutenai	230
21	685	lad	Ladino	231
21	686	lah	Lahnda	232
21	687	lam	Lamba	233
21	688	lan	Occitan (post-1500)	234
21	689	lao	Lao	235
21	690	lap	Sami	236
21	691	lat	Latin	237
21	692	lav	Latvian	238
21	693	lez	Lezgian	239
21	694	arw	Arawak	24
21	695	lin	Lingala	240
21	696	lit	Lithuanian	241
21	697	lol	Mongo-Nkundu	242
21	698	loz	Lozi	243
21	699	ltz	Letzeburgesch	244
21	700	lua	Luba-Lulua	245
21	701	lub	Luba-Katanga	246
21	702	lug	Ganda	247
21	703	lui	Luiseño	248
21	704	lun	Lunda	249
21	705	asm	Assamese	25
21	706	luo	Luo (Kenya and Tanzania)	250
21	707	lus	Lushai	251
21	708	mac	Macedonian	252
21	709	mad	Madurese	253
21	710	mag	Magahi	254
21	711	mah	Marshall	255
21	712	mai	Maithili	256
21	713	mak	Makasar	257
21	714	mal	Malayalam	258
21	715	man	Mandingo	259
21	716	ath	Athapascan (Other)	26
21	717	mao	Maori	260
21	718	map	Austronesian (Other)	261
21	719	mar	Marathi	262
21	720	mas	Masai	263
21	721	max	Manx	264
21	722	may	Malay	265
21	723	mdr	Mandar	266
21	724	men	Mende	267
21	725	mga	Irish, Middle (ca. 1100-1550)	268
21	726	mic	Micmac	269
21	727	aus	Australian languages	27
21	728	min	Minangkabau	270
21	729	mis	Miscellaneous languages	271
21	730	mkh	Mon-Khmer (Other)	272
21	731	mla	Malagasy	273
21	732	mlg	Malagasy	274
21	733	mlt	Maltese	275
21	734	mnc	Manchu	276
21	735	mni	Manipuri	277
21	736	mno	Manobo languages	278
21	737	moh	Mohawk	279
21	738	ava	Avaric	28
21	739	mol	Moldavian	280
21	740	mon	Mongolian	281
21	741	mos	Mooré	282
21	742	mul	Multiple languages	283
21	743	mun	Munda (Other)	284
21	744	mus	Creek	285
21	745	mwr	Marwari	286
21	746	myn	Mayan languages	287
21	747	nah	Nahuatl	288
21	748	nai	North American Indian (Other)	289
21	749	ave	Avestan	29
21	750	nau	Nauru	290
21	751	nav	Navajo	291
21	752	nbl	Ndebele (South Africa)	292
21	753	nde	Ndebele (Zimbabwe)	293
21	754	ndo	Ndonga	294
21	755	nep	Nepali	295
21	756	new	Newari	296
21	757	nia	Nias	297
21	758	nic	Niger-Kordofanian (Other)	298
21	759	niu	Niuean	299
21	760	ace	Achinese	3
21	761	awa	Awadhi	30
21	762	non	Old Norse	300
21	763	nor	Norwegian	301
21	764	nso	Northern Sotho	302
21	765	nub	Nubian languages	303
21	766	nya	Nyanja	304
21	767	nym	Nyamwezi	305
21	768	nyn	Nyankole	306
21	769	nyo	Nyoro	307
21	770	nzi	Nzima	308
21	771	oci	Occitan (post-1500)	309
21	772	aym	Aymara	31
21	773	oji	Ojibwa	310
21	774	ori	Oriya	311
21	775	orm	Oromo	312
21	776	osa	Osage	313
21	777	oss	Ossetic	314
21	778	ota	Turkish, Ottoman	315
21	779	oto	Otomian languages	316
21	780	paa	Papuan (Other)	317
21	781	pag	Pangasinan	318
21	782	pal	Pahlavi	319
21	783	aze	Azerbaijani	32
21	784	pam	Pampanga	320
21	785	pan	Panjabi	321
21	786	pap	Papiamento	322
21	787	pau	Palauan	323
21	788	peo	Old Persian (ca. 600-400 B.C.)	324
21	789	per	Persian	325
21	790	phi	Philippine (Other)	326
21	791	phn	Phoenician	327
21	792	pli	Pali	328
21	793	pol	Polish	329
21	794	bad	Banda	33
21	795	pon	Ponape	330
21	796	por	Portuguese	331
21	797	pra	Prakrit languages	332
21	798	pro	Provençal (to 1500)	333
21	799	pus	Pushto	334
21	800	que	Quechua	335
21	801	raj	Rajasthani	336
21	802	rap	Rapanui	337
21	803	rar	Rarotongan	338
21	804	roa	Romance (Other)	339
21	805	bai	Bamileke languages	34
21	806	roh	Raeto-Romance	340
21	807	rom	Romany	341
21	808	rum	Romanian	342
21	809	run	Rundi	343
21	810	rus	Russian	344
21	811	sad	Sandawe	345
21	812	sag	Sango	346
21	813	sah	Yakut	347
21	814	sai	South American Indian (Other)	348
21	815	sal	Salishan languages	349
21	816	bak	Bashkir	35
21	817	sam	Samaritan Aramaic	350
21	818	san	Sanskrit	351
21	819	sao	Samoan	352
21	820	sas	Sasak	353
21	821	sat	Santali	354
21	822	scc	Serbian	355
21	823	sco	Scots	356
21	824	scr	Croatian	357
21	825	sel	Selkup	358
21	826	sem	Semitic (Other)	359
21	827	bal	Baluchi	36
21	828	sga	Irish, Old (to 1100)	360
21	829	sgn	Sign languages	361
21	830	shn	Shan	362
21	831	sho	Shona	363
21	832	sid	Sidamo	364
21	833	sin	Sinhalese	365
21	834	sio	Siouan (Other)	366
21	835	sit	Sino-Tibetan (Other)	367
21	836	sla	Slavic (Other)	368
21	837	slo	Slovak	369
21	838	bam	Bambara	37
21	839	slv	Slovenian	370
21	840	sme	Northern Sami	371
21	841	smi	Sami	372
21	842	smo	Samoan	373
21	843	sna	Shona	374
21	844	snd	Sindhi	375
21	845	snh	Sinhalese	376
21	846	snk	Soninke	377
21	847	sog	Sogdian	378
21	848	som	Somali	379
21	849	ban	Balinese	38
21	850	son	Songhai	380
21	851	sot	Sotho	381
21	852	spa	Spanish	382
21	853	srd	Sardinian	383
21	854	srr	Serer	384
21	855	ssa	Nilo-Saharan (Other)	385
21	856	sso	Sotho	386
21	857	ssw	Swazi	387
21	858	suk	Sukuma	388
21	859	sun	Sundanese	389
21	860	baq	Basque	39
21	861	sus	Susu	390
21	862	sux	Sumerian	391
21	863	swa	Swahili	392
21	864	swe	Swedish	393
21	865	swz	Swazi	394
21	866	syr	Syriac	395
21	867	tag	Tagalog	396
21	868	tah	Tahitian	397
21	869	tai	Tai (Other)	398
21	870	taj	Tajik	399
21	871	ach	Acoli	4
21	872	bas	Basa	40
21	873	tam	Tamil	400
21	874	-tar	Tatar	401
21	875	tat	Tatar	402
21	876	tel	Telugu	403
21	877	tem	Temne	404
21	878	ter	Terena	405
21	879	tet	Tetum	406
21	880	tgk	Tajik	407
21	881	tgl	Tagalog	408
21	882	tha	Thai	409
21	883	bat	Baltic (Other)	41
21	884	tib	Tibetan	410
21	885	tig	Tigré	411
21	886	tir	Tigrinya	412
21	887	tiv	Tiv	413
21	888	tkl	Tokelauan	414
21	889	tli	Tlingit	415
21	890	tmh	Tamashek	416
21	891	tog	Tonga (Nyasa)	417
21	892	ton	Tongan	418
21	893	tpi	Tok Pisin	419
21	894	bej	Beja	42
21	895	-tru	Truk	420
21	896	tsi	Tsimshian	421
21	897	tsn	Tswana	422
21	898	tso	Tsonga	423
21	899	-tsw	Tswana	424
21	900	tuk	Turkmen	425
21	901	tum	Tumbuka	426
21	902	tur	Turkish	427
21	903	tut	Altaic (Other)	428
21	904	tvl	Tuvaluan	429
21	905	bel	Belarusian	43
21	906	twi	Twi	430
21	907	tyv	Tuvinian	431
21	908	uga	Ugaritic	432
21	909	uig	Uighur	433
21	910	ukr	Ukrainian	434
21	911	umb	Umbundu	435
21	912	und	Undetermined	436
21	913	urd	Urdu	437
21	914	uzb	Uzbek	438
21	915	vai	Vai	439
21	916	bem	Bemba	44
21	917	ven	Venda	440
21	918	vie	Vietnamese	441
21	919	vol	Volapük	442
21	920	vot	Votic	443
21	921	wak	Wakashan languages	444
21	922	wal	Walamo	445
21	923	war	Waray	446
21	924	was	Washo	447
21	925	wel	Welsh	448
21	926	wen	Sorbian languages	449
21	927	ben	Bengali	45
21	928	wol	Wolof	450
21	929	xho	Xhosa	451
21	930	yao	Yao	452
21	931	yap	Yapese	453
21	932	yid	Yiddish	454
21	933	yor	Yoruba	455
21	934	ypk	Yupik languages	456
21	935	zap	Zapotec	457
21	936	zen	Zenaga	458
21	937	zha	Zhuang	459
21	938	ber	Berber (Other)	46
21	939	znd	Zande	460
21	940	zul	Zulu	461
21	941	zun	Zuni	462
21	942	bho	Bhojpuri	47
21	943	bih	Bihari	48
21	944	bik	Bikol	49
21	945	ada	Adangme	5
21	946	bin	Bini	50
21	947	bis	Bislama	51
21	948	bla	Siksika	52
21	949	bnt	Bantu (Other)	53
21	950	bos	Bosnian	54
21	951	bra	Braj	55
21	952	bre	Breton	56
21	953	btk	Batak	57
21	954	bua	Buriat	58
21	955	bug	Bugis	59
21	956	afa	Afroasiatic (Other)	6
21	957	bul	Bulgarian	60
21	958	bur	Burmese	61
21	959	cad	Caddo	62
21	960	cai	Central American Indian (Other)	63
21	961	-cam	Khmer	64
21	962	car	Carib	65
21	963	cat	Catalan	66
21	964	cau	Caucasian (Other)	67
21	965	ceb	Cebuano	68
21	966	cel	Celtic (Other)	69
21	967	afh	Afrihili (Artificial language)	7
21	968	cha	Chamorro	70
21	969	chb	Chibcha	71
21	970	che	Chechen	72
21	971	chg	Chagatai	73
21	972	chi	Chinese	74
21	973	chk	Truk	75
21	974	chm	Mari	76
21	975	chn	Chinook jargon	77
21	976	cho	Choctaw	78
21	977	chp	Chipewyan	79
21	978	afr	Afrikaans	8
21	979	chr	Cherokee	80
21	980	chu	Church Slavic	81
21	981	chv	Chuvash	82
21	982	chy	Cheyenne	83
21	983	cmc	Chamic languages	84
21	984	cop	Coptic	85
21	985	cor	Cornish	86
21	986	cos	Corsican	87
21	987	cpe	Creoles and Pidgins, English-based (Other)	88
21	988	cpf	Creoles and Pidgins, French-based (Other)	89
21	989	-ajm	Aljamía	9
21	990	cpp	Creoles and Pidgins, Portuguese-based (Other)	90
21	991	cre	Cree	91
21	992	crp	Creoles and Pidgins (Other)	92
21	993	cus	Cushitic (Other)	93
21	994	cze	Czech	94
21	995	dak	Dakota	95
21	996	dan	Danish	96
21	997	day	Dayak	97
21	998	del	Delaware	98
21	999	den	Slave	99
9	1362	aa	Albania	1
9	1363	aj	Azerbaijan	10
9	1364	gb	Kiribati	100
9	1365	gd	Grenada	101
9	1366	-ge	Germany (East)	102
9	1367	gh	Ghana	103
9	1368	gi	Gibraltar	104
9	1369	gl	Greenland	105
9	1370	gm	Gambia	106
9	1371	-gn	Gilbert and Ellice Islands	107
9	1372	go	Gabon	108
9	1373	gp	Guadeloupe	109
9	1374	ajr	Azerbaijan S.S.R.	11
9	1375	gr	Greece	110
9	1376	gs	Georgia (Republic)	111
9	1377	gsr	Georgian S.S.R.	112
9	1378	gt	Guatemala	113
9	1379	gu	Guam	114
9	1380	gv	Guinea	115
9	1381	gw	Germany	116
9	1382	gy	Guyana	117
9	1383	gz	Gaza Strip	118
9	1384	hiu	Hawaii	119
9	1385	aku	Alaska	12
9	1386	-hk	Hong Kong	120
9	1387	hm	Heard and McDonald Islands	121
9	1388	ho	Honduras	122
9	1389	ht	Haiti	123
9	1390	hu	Hungary	124
9	1391	iau	Iowa	125
9	1392	ic	Iceland	126
9	1393	idu	Idaho	127
9	1394	ie	Ireland	128
9	1395	ii	India	129
9	1396	alu	Alabama	13
9	1397	ilu	Illinois	130
9	1398	inu	Indiana	131
9	1399	io	Indonesia	132
9	1400	iq	Iraq	133
9	1401	ir	Iran	134
9	1402	is	Israel	135
9	1403	it	Italy	136
9	1404	-iu	Israel-Syria Demilitarized Zones	137
9	1405	iv	Côte dIvoire	138
9	1406	-iw	Israel-Jordan Demilitarized Zones	139
9	1407	am	Anguilla	14
9	1408	iy	Iraq-Saudi Arabia Neutral Zone	140
9	1409	ja	Japan	141
9	1410	ji	Johnston Atoll	142
9	1411	jm	Jamaica	143
9	1412	-jn	Jan Mayen	144
9	1413	jo	Jordan	145
9	1414	ke	Kenya	146
9	1415	kg	Kyrgyzstan	147
9	1416	kgr	Kirghiz S.S.R.	148
9	1417	kn	Korea (North)	149
9	1418	an	Andorra	15
9	1419	ko	Korea (South)	150
9	1420	ksu	Kansas	151
9	1421	ku	Kuwait	152
9	1422	kyu	Kentucky	153
9	1423	kz	Kazakhstan	154
9	1424	kzr	Kazakh S.S.R.	155
9	1425	lau	Louisiana	156
9	1426	lb	Liberia	157
9	1427	le	Lebanon	158
9	1428	lh	Liechtenstein	159
9	1429	ao	Angola	16
9	1430	li	Lithuania	160
9	1431	lir	Lithuania	161
9	1432	-ln	Central and Southern Line Islands	162
9	1433	lo	Lesotho	163
9	1434	ls	Laos	164
9	1435	lu	Luxembourg	165
9	1436	lv	Latvia	166
9	1437	lvr	Latvia	167
9	1438	ly	Libya	168
9	1439	mau	Massachusetts	169
9	1440	aq	Antigua and Barbuda	17
9	1441	mbc	Manitoba	170
9	1442	mc	Monaco	171
9	1443	mdu	Maryland	172
9	1444	meu	Maine	173
9	1445	mf	Mauritius	174
9	1446	mg	Madagascar	175
9	1447	-mh	Macao	176
9	1448	miu	Michigan	177
9	1449	mj	Montserrat	178
9	1450	mk	Oman	179
9	1451	aru	Arkansas	18
9	1452	ml	Mali	180
9	1453	mm	Malta	181
9	1454	mnu	Minnesota	182
9	1455	mou	Missouri	183
9	1456	mp	Mongolia	184
9	1457	mq	Martinique	185
9	1458	mr	Morocco	186
9	1459	msu	Mississippi	187
9	1460	mtu	Montana	188
9	1461	mu	Mauritania	189
9	1462	as	American Samoa	19
9	1463	mv	Moldova	190
9	1464	mvr	Moldavian S.S.R.	191
9	1465	mw	Malawi	192
9	1466	mx	Mexico	193
9	1467	my	Malaysia	194
9	1468	mz	Mozambique	195
9	1469	na	Netherlands Antilles	196
9	1470	nbu	Nebraska	197
9	1471	ncu	North Carolina	198
9	1472	ndu	North Dakota	199
9	1473	abc	Alberta	2
9	1474	at	Australia	20
9	1475	ne	Netherlands	200
9	1476	nfc	Newfoundland	201
9	1477	ng	Niger	202
9	1478	nhu	New Hampshire	203
9	1479	nik	Northern Ireland	204
9	1480	nju	New Jersey	205
9	1481	nkc	New Brunswick	206
9	1482	nl	New Caledonia	207
9	1483	-nm	Northern Mariana Islands	208
9	1484	nmu	New Mexico	209
9	1485	au	Austria	21
9	1486	nn	Vanuatu	210
9	1487	no	Norway	211
9	1488	np	Nepal	212
9	1489	nq	Nicaragua	213
9	1490	nr	Nigeria	214
9	1491	nsc	Nova Scotia	215
9	1492	ntc	Northwest Territories	216
9	1493	nu	Nauru	217
9	1494	nuc	Nunavut	218
9	1495	nvu	Nevada	219
9	1496	aw	Aruba	22
9	1497	nw	Northern Mariana Islands	220
9	1498	nx	Norfolk Island	221
9	1499	nyu	New York (State)	222
9	1500	nz	New Zealand	223
9	1501	ohu	Ohio	224
9	1502	oku	Oklahoma	225
9	1503	onc	Ontario	226
9	1504	oru	Oregon	227
9	1505	ot	Mayotte	228
9	1506	pau	Pennsylvania	229
9	1507	ay	Antarctica	23
9	1508	pc	Pitcairn Island	230
9	1509	pe	Peru	231
9	1510	pf	Paracel Islands	232
9	1511	pg	Guinea-Bissau	233
9	1512	ph	Philippines	234
9	1513	pic	Prince Edward Island	235
9	1514	pk	Pakistan	236
9	1515	pl	Poland	237
9	1516	pn	Panama	238
9	1517	po	Portugal	239
9	1518	azu	Arizona	24
9	1519	pp	Papua New Guinea	240
9	1520	pr	Puerto Rico	241
9	1521	-pt	Portuguese Timor	242
9	1522	pw	Palau	243
9	1523	py	Paraguay	244
9	1524	qa	Qatar	245
9	1525	quc	Qubec (Province)	246
9	1526	re	Runion	247
9	1527	rh	Zimbabwe	248
9	1528	riu	Rhode Island	249
9	1529	ba	Bahrain	25
9	1530	rm	Romania	250
9	1531	ru	Russia (Federation)	251
9	1532	rur	Russian S.F.S.R.	252
9	1533	rw	Rwanda	253
9	1534	-ry	Ryukyu Islands, Southern	254
9	1535	sa	South Africa	255
9	1536	-sb	Svalbard	256
9	1537	scu	South Carolina	257
9	1538	sdu	South Dakota	258
9	1539	se	Seychelles	259
9	1540	bb	Barbados	26
9	1541	sf	Sao Tome and Principe	260
9	1542	sg	Senegal	261
9	1543	sh	Spanish North Africa	262
9	1544	si	Singapore	263
9	1545	sj	Sudan	264
9	1546	-sk	Sikkim	265
9	1547	sl	Sierra Leone	266
9	1548	sm	San Marino	267
9	1549	snc	Saskatchewan	268
9	1550	so	Somalia	269
9	1551	bcc	British Columbia	27
9	1552	sp	Spain	270
9	1553	sq	Swaziland	271
9	1554	sr	Surinam	272
9	1555	ss	Western Sahara	273
9	1556	stk	Scotland	274
9	1557	su	Saudi Arabia	275
9	1558	-sv	Swan Islands	276
9	1559	sw	Sweden	277
9	1560	sx	Namibia	278
9	1561	sy	Syria	279
9	1562	bd	Burundi	28
9	1563	sz	Switzerland	280
9	1564	ta	Tajikistan	281
9	1565	tar	Tajik S.S.R.	282
9	1566	tc	Turks and Caicos Islands	283
9	1567	tg	Togo	284
9	1568	th	Thailand	285
9	1569	ti	Tunisia	286
9	1570	tk	Turkmenistan	287
9	1571	tkr	Turkmen S.S.R.	288
9	1572	tl	Tokelau	289
9	1573	be	Belgium	29
9	1574	tnu	Tennessee	290
9	1575	to	Tonga	291
9	1576	tr	Trinidad and Tobago	292
9	1577	ts	United Arab Emirates	293
9	1578	-tt	Trust Territory of the Pacific Islands	294
9	1579	tu	Turkey	295
9	1580	tv	Tuvalu	296
9	1581	txu	Texas	297
9	1582	tz	Tanzania	298
9	1583	ua	Egypt	299
9	1584	-ac	Ashmore and Cartier Islands	3
9	1585	bf	Bahamas	30
9	1586	uc	United States Misc. Caribbean Islands	300
9	1587	ug	Uganda	301
9	1588	-ui	United Kingdom Misc. Islands	302
9	1589	uik	United Kingdom Misc. Islands	303
9	1590	-uk	United Kingdom	304
9	1591	un	Ukraine	305
9	1592	unr	Ukraine	306
9	1593	up	United States Misc. Pacific Islands	307
9	1594	-ur	Soviet Union	308
9	1595	-us	United States	309
9	1596	bg	Bangladesh	31
9	1597	utu	Utah	310
9	1598	uv	Burkina Faso	311
9	1599	uy	Uruguay	312
9	1600	uz	Uzbekistan	313
9	1601	uzr	Uzbek S.S.R.	314
9	1602	vau	Virginia	315
9	1603	vb	British Virgin Islands	316
9	1604	vc	Vatican City	317
9	1605	ve	Venezuela	318
9	1606	vi	Virgin Islands of the United States	319
9	1607	bh	Belize	32
9	1608	vm	Vietnam	320
9	1609	-vn	Vietnam, North	321
9	1610	vp	Various places	322
9	1611	-vs	Vietnam, South	323
9	1612	vtu	Vermont	324
9	1613	wau	Washington (State)	325
9	1614	-wb	West Berlin	326
9	1615	wf	Wallis and Futuna	327
9	1616	wiu	Wisconsin	328
9	1617	wj	West Bank of the Jordan River	329
9	1618	bi	British Indian Ocean Territory	33
9	1619	wk	Wake Island	330
9	1620	wlk	Wales	331
9	1621	ws	Samoa	332
9	1622	wvu	West Virginia	333
9	1623	wyu	Wyoming	334
9	1624	xa	Christmas Islan	335
9	1625	xb	Cocos (Keeling) Islands	336
9	1626	xc	Maldives	337
9	1627	xd	Saint Kitts-Nevis	338
9	1628	xe	Marshall Islands	339
9	1629	bl	Brazil	34
9	1630	xf	Midway Islands	340
9	1631	xh	Niue	341
9	1632	-xi	Saint Kitts-Nevis-Anguilla	342
9	1633	xj	Saint Helena	343
9	1634	xk	Saint Lucia	344
9	1635	xl	Saint Pierre and Miquelon	345
9	1636	xm	Saint Vincent and the Grenadines	346
9	1637	xn	Macedonia	347
9	1638	xo	Slovakia	348
9	1639	xp	Spratly Island	349
9	1640	bm	Bermuda Islands	35
9	1641	xr	Czech Republic	350
9	1642	xs	South Georgia and the South Sandwich Islands	351
9	1643	xv	Slovenia	352
9	1644	xx	No place, unknown, or undetermined	353
9	1645	xxc	Canada	354
9	1646	xxk	United Kingdom	355
9	1647	xxr	Soviet Union	356
9	1648	xxu	United States	357
9	1649	ye	Yemen	358
9	1650	ykc	Yukon Territory	359
9	1651	bn	Bosnia and Hercegovina	36
9	1652	-ys	Yemen (Peoples Democratic Republic)	360
9	1653	yu	Yugoslavia	361
9	1654	za	Zambia	362
9	1655	bo	Bolivia	37
9	1656	bp	Solomon Islands	38
9	1657	br	Burma	39
9	1658	ae	Algeria	4
9	1659	bs	Botswana	40
9	1660	bt	Bhutan	41
9	1661	bu	Bulgaria	42
9	1662	bv	Bouvet Island	43
9	1663	bw	Belarus	44
9	1664	bwr	Byelorussian S.S.R.	45
9	1665	bx	Brunei	46
9	1666	cau	California	47
9	1667	cb	Cambodia	48
9	1668	cc	China	49
9	1669	af	Afghanistan	5
9	1670	cd	Chad	50
9	1671	ce	Sri Lanka	51
9	1672	cf	Congo (Brazzaville)	52
9	1673	cg	Congo (Democratic Republic)	53
9	1674	ch	China (Republic : 1949- )	54
9	1675	ci	Croatia	55
9	1676	cj	Cayman Islands	56
9	1677	ck	Colombia	57
9	1678	cl	Chile	58
9	1679	cm	Cameroon	59
9	1680	ag	Argentina	6
9	1681	-cn	Canada	60
9	1682	cou	Colorado	61
9	1683	-cp	Canton and Enderbury Islands	62
9	1684	cq	Comoros	63
9	1685	cr	Costa Rica	64
9	1686	-cs	Czechoslovakia	65
9	1687	ctu	Connecticut	66
9	1688	cu	Cuba	67
9	1689	cv	Cape Verde	68
9	1690	cw	Cook Islands	69
9	1691	ai	Armenia (Republic)	7
9	1692	cx	Central African Republic	70
9	1693	cy	Cyprus	71
9	1694	-cz	Canal Zone	72
9	1695	d	(Indian Ocean)	73
9	1696	dcu	District of Columbia	74
9	1697	deu	Delaware	75
9	1698	dk	Denmark	76
9	1699	dm	Benin	77
9	1700	dq	Dominica	78
9	1701	dr	Dominican Republic	79
9	1702	-ai	Anguilla	8
9	1703	ea	Eritrea	80
9	1704	ec	Ecuador	81
9	1705	eg	Equatorial Guinea	82
9	1706	enk	England	83
9	1707	er	Estonia	84
9	1708	err	Estonia	85
9	1709	es	El Salvador	86
9	1710	et	Ethiopia	87
9	1711	fa	Faroe Islands	88
9	1712	fg	French Guiana	89
9	1713	air	Armenian S.S.R.	9
9	1714	fi	Finland	90
9	1715	fj	Fiji	91
9	1716	fk	Falkland Islands	92
9	1717	flu	Florida	93
9	1718	fm	Micronesia (Federated States)	94
9	1719	fp	French Polynesia	95
9	1720	fr	France	96
9	1721	fs	Terres australes et antarctiques franaise	97
9	1722	ft	Djibouti	98
9	1723	gau	Georgia	99
35	1724	0	item não é ou não inclui tradução	1
35	1725	1	item é ou inclui tradução	2
36	1726	#	subcampo $b ou $c não estão presentes	1
36	1727	0	única data/período de tempo	2
36	1728	1	múltiplas datas/períodos de tempo	3
36	1729	2	abrangência de datas/períodos de tempo	4
27	1730	0	prenome simples e/ou composto	1
27	1731	1	sobrenome simples e/ou composto	2
28	1732	0	Nome invertido	1
28	1733	1	Nome da jurisdição	2
28	1734	2	Nome na ordem direta	3
29	1735	0	Nenhum caracter a desprezar	1
29	1736	1	\N	2
29	1737	2	\N	3
29	1738	3	\N	4
29	1739	4	\N	5
29	1740	5	\N	6
29	1741	6	\N	7
29	1742	7	\N	8
29	1743	8	\N	9
29	1744	9	\N	10
30	1745	0	Nao gerar entrada secundaria de titulo	1
30	1746	1	Gerar entrada secundaria de titulo	2
31	1747	0	Não gera entrada secundária	1
32	1748	0	Conteúdo completo	1
32	1749	1	Conteúdo incompleto	2
32	1750	2	Conteúdo parcial	3
33	1751	0	Nivel nao especificado	2
34	1752	1	Sobrenome simples ou composto	1
37	1753	0	Nenhum caracter a desprezar	1
37	1754	1	\N	2
37	1755	2	\N	3
37	1756	3	\N	4
37	1757	4	\N	5
37	1758	5	\N	6
37	1759	6	\N	7
37	1760	7	\N	8
37	1761	8	\N	9
37	1762	9	\N	10
38	1763	0	Cabecalho de assunto da Library of Congress/lista de autoridades da LC	1
38	1764	2	Cabecalhos de assuntos de Medicina/lista de autoridades da NLM	3
38	1765	3	Lista de autoridade-assunto da National Agricultural Library	4
38	1766	4	Fonte nao especificada	5
38	1767	5	Cabecalhos de assunto Canadenses/lista de autoridade na NLC	6
38	1768	6	Repertoire des vedettes-matiere/lista de autoridade da NLC	7
38	1769	7	Fonte especificada no subcampo $2	8
39	1770	#	Nenhuma informação fornecida	1
39	1771	2	Entrada analítica	2
38	1772	1	Cabecalhos de assuntos LC para literatura infantil	2
40	1773	a	Material textual	1
40	1774	t	Material manuscrito	2
27	1775	3	nome de familia	3
41	1776	\N	indefinido; contem branco (#)	1
33	1795	#	Informacao nao disponivel	1
33	1796	1	Primario	3
33	1797	2	Secundario	4
61	1798	#	Informação não fornecida	1
61	1799	#	Informação não fornecida	1
61	1800	0	E-mail	2
61	1801	1	FTP	3
61	1802	2	Login Remoto (Telnet)	4
61	1803	3	Dial-up	5
61	1804	4	HTTP	6
61	1805	7	Metodo especificado no subcampo $2	7
62	1806	#	Não há informação	1
62	1807	0	Recurso	2
62	1808	1	Versao do recurso	3
62	1809	2	Recurso relacionado	4
62	1810	8	Não gerar exibição constante	5
81	1818	0	Gerar nota, nao gerar entrada secundaria de titulo	1
81	1819	1	Gerar nota e entrada secundaria de titulo	2
81	1820	2	Nao gerar nota nem entrada secundaria de titulo	3
81	1821	3	Nao gerar nota, gerar entrada secundaria de titulo	4
82	1822	#	Nao ha informacao	1
82	1823	0	Parte do titulo	2
82	1824	1	Titulo paralelo	3
82	1825	2	Titulo especial	4
82	1826	3	Outro titulo	5
82	1827	4	Titulo de capa	6
82	1828	5	Titulo secundario na pagina de rosto	7
82	1829	6	Cabecalho	8
82	1830	7	Titulo continuo	9
82	1831	8	Titulo de lombada	10
\.


--
-- Data for Name: bt_politica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_politica (idgrupo, idregracirculacao, diasdeemprestimo, limitedeemprestimo, limitederenovacao, limitedereserva, valordamulta, diasdereserva, idpolitica, horadevolucao) FROM stdin;
1	16	0	3	99999	99999	5.00	1	2	22:30:00
1	3	14	3	99999	99999	5.00	1	3	22:30:00
1	19	2	1	99999	99999	5.00	1	4	22:30:00
1	20	14	1	99999	99999	5.00	1	5	22:30:00
1	21	7	3	99999	99999	5.00	1	6	22:30:00
1	4	14	3	99999	99999	5.00	1	7	22:30:00
1	25	14	1	99999	99999	5.00	1	8	22:30:00
1	8	2	1	99999	99999	5.00	1	9	22:30:00
1	9	2	1	99999	99999	5.00	1	10	22:30:00
1	10	2	1	99999	99999	5.00	1	11	22:30:00
1	11	2	1	99999	99999	5.00	1	12	22:30:00
1	12	2	1	99999	99999	5.00	1	13	22:30:00
1	13	2	1	99999	99999	5.00	1	14	22:30:00
1	23	1	3	0	0	1.00	1	16	10:00:00
1	24	2	3	0	0	1.00	1	17	10:00:00
1	26	1	1	0	0	1.00	1	18	10:00:00
1	27	2	1	0	0	1.00	1	19	10:00:00
1	17	1	3	0	0	1.00	1	20	10:00:00
1	18	2	3	0	0	1.00	1	21	10:00:00
3	14	7	3	99999	99999	5.00	1	22	22:30:00
1	14	7	3	99999	99999	5.00	1	1	22:30:00
3	16	0	3	99999	99999	5.00	1	23	22:30:00
3	3	14	3	99999	99999	5.00	1	24	22:30:00
3	19	2	1	99999	99999	5.00	1	25	22:30:00
3	20	14	1	99999	99999	5.00	1	26	22:30:00
3	21	7	3	99999	99999	5.00	1	27	22:30:00
3	4	14	3	99999	99999	5.00	1	28	22:30:00
3	25	14	1	99999	99999	5.00	1	29	22:30:00
3	8	2	1	99999	99999	5.00	1	30	22:30:00
3	9	2	1	99999	99999	5.00	1	31	22:30:00
3	10	2	1	99999	99999	5.00	1	32	22:30:00
3	11	2	1	99999	99999	5.00	1	33	22:30:00
3	12	2	1	99999	99999	5.00	1	34	22:30:00
3	13	2	1	99999	99999	5.00	1	35	22:30:00
3	15	14	6	99999	99999	5.00	1	36	22:30:00
3	23	1	3	0	0	1.00	1	37	10:00:00
3	24	2	3	0	0	1.00	1	38	10:00:00
3	26	1	1	0	0	1.00	1	39	10:00:00
3	27	2	1	0	0	1.00	1	40	10:00:00
3	17	1	3	0	0	1.00	1	41	10:00:00
3	18	2	3	0	0	1.00	1	42	10:00:00
2	14	15	3	99999	99999	5.00	1	43	22:30:00
2	16	0	3	99999	99999	5.00	1	44	22:30:00
2	3	30	3	99999	99999	5.00	1	45	22:30:00
2	19	14	3	99999	99999	5.00	1	46	22:30:00
2	20	30	3	99999	99999	5.00	1	47	22:30:00
2	21	14	3	99999	99999	5.00	1	48	22:30:00
2	4	30	3	99999	99999	5.00	1	49	22:30:00
2	25	30	1	99999	99999	5.00	1	50	22:30:00
2	8	2	1	99999	99999	5.00	1	51	22:30:00
2	9	2	1	99999	99999	5.00	1	52	22:30:00
2	10	2	1	99999	99999	5.00	1	53	22:30:00
2	11	2	1	99999	99999	5.00	1	54	22:30:00
2	12	2	1	99999	99999	5.00	1	55	22:30:00
2	13	2	1	99999	99999	5.00	1	56	22:30:00
2	15	30	6	99999	99999	5.00	1	57	22:30:00
2	23	1	3	0	0	1.00	1	58	10:00:00
2	24	2	3	0	0	1.00	1	59	10:00:00
2	26	1	1	0	0	1.00	1	60	10:00:00
2	27	2	1	0	0	1.00	1	61	10:00:00
2	17	1	3	0	0	1.00	1	62	10:00:00
2	18	2	3	0	0	1.00	1	63	10:00:00
4	28	180	20	2	0	5.00	0	64	22:30:00
5	14	99999	999999	9999	9999	0.00	1	65	22:30:00
5	16	99999	999999	9999	9999	0.00	1	66	22:30:00
5	15	99999	999999	9999	9999	0.00	1	67	22:30:00
5	17	999999	999999	0	0	0.00	1	68	10:00:00
5	18	999999	999999	0	0	0.00	1	69	10:00:00
2	28	180	20	2	0	5.00	1	81	22:30:00
1	15	14	6	1	3	5.00	1	15	22:30:00
\.


--
-- Data for Name: bt_posicao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_posicao (idetiqueta, posicao, descricao, idopcao) FROM stdin;
1	005	Status do Registro	1
1	006	Tipo de Registro	2
1	007	Nível Bibliográfico	3
1	008	Tipo de Controle	4
1	017	Nível de Catalogação	5
1	018	Forma de Catalogação	6
1	019	Ligação do Registro	7
5	001	Ilustrações	10
5	002	Ilustrações	10
5	003	Ilustrações	10
5	004	Ilustrações	10
5	005	Público alvo	11
5	006	Forma do item	12
5	007	Natureza do conteúdo	13
5	008	Natureza do conteúdo	13
5	009	Natureza do conteúdo	13
5	010	Natureza do conteúdo	13
5	011	Publicação governamental	14
5	012	Publicação de evento	15
5	013	Coletânea de homenagens	16
5	014	Índice	17
5	000	Forma do material	40
5	015	Indefinido	18
5	016	Forma literária	19
5	017	Biografia	20
7	006	Tipo de Data/Status de Publicação	8
7	015	Lugar de publicação, produção ou execução	9
7	018	Ilustrações	10
7	019	Ilustrações	10
7	020	Ilustrações	10
7	021	Ilustrações	10
7	022	Público alvo	11
7	023	Forma do item	12
7	024	Natureza do conteúdo	13
7	025	Natureza do conteúdo	13
7	026	Natureza do conteúdo	13
7	027	Natureza do conteúdo	13
7	028	Publicação governamental	14
7	029	Publicação de evento	15
7	030	Coletânea de homenagem	16
7	031	Índice	17
7	032	Indefinido	18
7	033	Forma literária	19
7	034	Biografia	20
7	035	Idioma	21
7	038	Registro modificado	22
7	039	Fonte da catalogação	23
7	000	Data de entrada no arquivo	24
7	007	Data 1	25
7	011	Data 2	26
28	IN1	Indicador 1	35
32	IN1	Indicador 1	36
53	IN1	Indicador 1	27
54	IN1	Indicador 1	28
55	IN1	Indicador 1	28
56	IN1	Indicador 1	29
59	IN1	Indicador 1	30
59	IN2	Indicador 2	37
62	IN1	Indicador 1	30
62	IN2	Indicador 2	37
92	IN1	Indicador 1	31
97	IN1	Indicador 1	32
140	IN1	Indicador 1	27
140	IN2	Indicador 2	38
141	IN1	Indicador 1	28
141	IN2	Indicador 2	38
143	IN1	Indicador 1	29
143	IN2	Indicador 2	38
144	IN1	Indicador 1	33
144	IN2	Indicador 2	38
145	IN2	Indicador 2	38
154	IN1	Indicador 1	27
154	IN2	Indicador 2	39
155	IN1	Indicador 1	28
155	IN2	Indicador 2	39
156	IN1	Indicador 1	28
156	IN2	Indicador 2	39
158	IN1	Indicador 1	29
158	IN2	Indicador 2	39
159	IN1	Indicador 1	29
159	IN2	Indicador 2	39
170	IN1	Indicador 1	34
170	IN2	Indicador 2	39
53	IN2	Indicador 2	41
142	IN1	Indicador 1	28
142	IN2	Indicador 1	38
193	IN1	Indicador 1	61
193	IN2	Indicador 2	62
63	IN1	Indicador 1	81
63	IN2	Indicador 2	82
\.


--
-- Data for Name: bt_reserva; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_reserva (idreserva, datahoradareserva, datahoradasituacao, datahoraentrada, datahoralimite, foiavisado, foiconfirmada, idsituacao, idusuario, idexemplar, usuario_temp, exemplar_temp) FROM stdin;
\.


--
-- Data for Name: bt_situacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_situacao (idsituacao, descricao, mnemonico) FROM stdin;
1	Solicitada	SOLICITADA
2	Atendida	ATENDIDA
3	Comunicada	COMUNICADA
4	Confirmada	CONFIRMADA
5	Vencida	VENCIDA
6	Cancelada	CANCELADA
\.


--
-- Data for Name: bt_subcampo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_subcampo (idetiqueta, subcampo, descricao, temrepeticoes, estaativo, emlistas, emdemonstracao, obsoleto, mnemonico, observacao, emconsultas, idopcao) FROM stdin;
1	a	Lider	0	0	0	0	0	\N	\N	0	\N
2	a	Número da Obra	0	0	1	0	0	\N	\N	0	\N
7	a	Campo Fixo de Dados	0	0	0	0	0	\N	\N	0	\N
8	a	Numero de Controle da LC	0	0	0	0	0	\N	\N	0	\N
8	b	Numero de Controle NUCMC	1	0	0	0	0	\N	\N	0	\N
8	c	Numero de Controle Cancelado/Invalido	1	0	0	0	0	\N	\N	0	\N
8	8	Numero de Ligação e Seqüência	1	0	0	0	0	\N	\N	0	\N
9	a	Número	0	0	0	0	0	\N	\N	0	\N
9	b	País	0	0	0	0	0	\N	\N	0	\N
9	c	Tipo de Número	0	0	0	0	0	\N	\N	0	\N
9	d	Data	1	0	0	0	0	\N	\N	0	\N
9	e	Status	1	0	0	0	0	\N	\N	0	\N
9	f	Participa do Documento	1	0	0	0	0	\N	\N	0	\N
9	6	Ligação	0	0	0	0	0	\N	\N	0	\N
10	a	Número Bibliográfico Nacional	1	0	0	0	0	\N	\N	0	\N
10	6	Ligação	0	0	0	0	0	\N	\N	0	\N
10	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
11	a	Número de Controle do Registro	0	0	0	0	0	\N	\N	0	\N
11	z	Número de Controle Cancelado/Inválido	1	0	0	0	0	\N	\N	0	\N
11	2	Fonte	0	0	0	0	0	\N	\N	0	\N
11	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
12	a	Número de CopyRight	1	0	0	0	0	\N	\N	0	\N
12	b	Fonte (Instituição que atribuiu o número)	1	0	0	0	0	\N	\N	0	\N
12	6	Ligação	0	0	0	0	0	\N	\N	0	\N
12	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
13	a	Taxa de Cobrança de CopyRight	0	0	0	0	0	\N	\N	0	\N
14	c	Termos de Avaliação	0	0	0	0	0	\N	\N	0	\N
14	z	ISBN Cancelado/Inválido	1	0	0	0	0	\N	\N	0	\N
14	6	Ligação	0	0	0	0	0	\N	\N	0	\N
14	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
14	a	ISBN - International Standard Book Number	0	0	0	0	0	\N	\N	0	\N
15	y	ISSN Incorreto	1	0	0	0	0	\N	\N	0	\N
15	z	ISSN Cancelado	1	0	0	0	0	\N	\N	0	\N
15	6	Ligação	0	0	0	0	0	\N	\N	0	\N
15	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
15	a	ISSN - International Standard Serial Number	1	0	0	0	0	\N	\N	0	\N
16	a	Standard Recording Code	0	0	0	0	0	\N	\N	0	\N
16	c	Termos de Avaliação	0	0	0	0	0	\N	\N	0	\N
16	d	Código Adicional Seguindo Número/Código padrão	0	0	0	0	0	\N	\N	0	\N
16	z	Código Padrão Cancelado/Inválido	1	0	0	0	0	\N	\N	0	\N
16	2	Fonte do Código ou Número	0	0	0	0	0	\N	\N	0	\N
16	6	Ligação	0	0	0	0	0	\N	\N	0	\N
16	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
17	a	Número de Aquisição no Exterior	1	0	0	0	0	\N	\N	0	\N
17	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
18	a	Número Padrão de Relatório Técnico (STRN)	0	0	0	0	0	\N	\N	0	\N
18	z	STRN Cancelado/Inválido	1	0	0	0	0	\N	\N	0	\N
18	6	Ligação	0	0	0	0	0	\N	\N	0	\N
18	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
19	a	Número do Editor	0	0	0	0	0	\N	\N	0	\N
19	b	Fonte	0	0	0	0	0	\N	\N	0	\N
19	6	Ligação	0	0	0	0	0	\N	\N	0	\N
19	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
20	a	CODEN	0	0	0	0	0	\N	\N	0	\N
20	z	CODEN Cancelado/Inválido	1	0	0	0	0	\N	\N	0	\N
20	6	Ligação	0	0	0	0	0	\N	\N	0	\N
20	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
21	a	Número de Registro Postal	0	0	0	0	0	\N	\N	0	\N
21	b	Fonte (Instituição que Atribuiu o número)	0	0	0	0	0	\N	\N	0	\N
21	6	Ligação	0	0	0	0	0	\N	\N	0	\N
21	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
22	a	Data/Hora Formatada	1	0	0	0	0	\N	\N	0	\N
22	b	Código de Classificação geográfica de área	1	0	0	0	0	\N	\N	0	\N
22	c	Código de Classificação geográfica de Sub-Área	1	0	0	0	0	\N	\N	0	\N
22	3	Materiais Específicos	0	0	0	0	0	\N	\N	0	\N
22	6	Ligação	0	0	0	0	0	\N	\N	0	\N
22	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
23	a	Categoria da Escala	0	0	0	0	0	\N	\N	0	\N
23	b	Constante da Escala Horizontal Linear	1	0	0	0	0	\N	\N	0	\N
23	c	Constante da Escala Vertical Linear	1	0	0	0	0	\N	\N	0	\N
23	d	Coordenadas-longitude oeste	0	0	0	0	0	\N	\N	0	\N
23	e	Coordenadas-longitude leste	0	0	0	0	0	\N	\N	0	\N
23	f	Coordenadas-latitude norte	0	0	0	0	0	\N	\N	0	\N
23	g	Coordenadas-latitude sul	0	0	0	0	0	\N	\N	0	\N
23	h	Escala angular	1	0	0	0	0	\N	\N	0	\N
23	j	Declinação - Limite Norte	0	0	0	0	0	\N	\N	0	\N
23	k	Declinação - Limite Sul	0	0	0	0	0	\N	\N	0	\N
23	m	Right Ascension - limite leste	0	0	0	0	0	\N	\N	0	\N
23	n	Right Ascension - limite oeste	0	0	0	0	0	\N	\N	0	\N
23	p	Equinócio	0	0	0	0	0	\N	\N	0	\N
23	s	G-ring latitude	1	0	0	0	0	\N	\N	0	\N
23	t	G-ring longitude	1	0	0	0	0	\N	\N	0	\N
23	6	Ligação	0	0	0	0	0	\N	\N	0	\N
23	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
24	a	Número de Controle do Sistema	0	0	0	0	0	\N	\N	0	\N
24	z	Número de Controle do Sistema Cancelado/Inválido	1	0	0	0	0	\N	\N	0	\N
24	6	Ligação	0	0	0	0	0	\N	\N	0	\N
24	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
25	a	Número de Estudo Original	0	0	0	0	0	\N	\N	0	\N
25	b	Fonte	0	0	0	0	0	\N	\N	0	\N
25	6	Ligação	0	0	0	0	0	\N	\N	0	\N
25	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
26	a	Código de Estoque do Fornecedor	0	0	0	0	0	\N	\N	0	\N
26	b	Fonte do Código de Estoque/Aquisição	0	0	0	0	0	\N	\N	0	\N
26	c	Termos de Avaliação	1	0	0	0	0	\N	\N	0	\N
26	f	Formas de Edição	1	0	0	0	0	\N	\N	0	\N
26	g	Característica Adicional do Formato	1	0	0	0	0	\N	\N	0	\N
26	n	Nota	1	0	0	0	0	\N	\N	0	\N
26	6	Ligação	0	0	0	0	0	\N	\N	0	\N
26	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
27	a	Instituição da Catalogação Original	0	0	0	0	0	\N	\N	0	\N
27	b	Idioma de Catalogação	0	0	0	0	0	\N	\N	0	\N
27	c	Instituição que transcreveu o Registro	0	0	0	0	0	\N	\N	0	\N
27	d	Instituição que Modificou o Registro	1	0	0	0	0	\N	\N	0	\N
27	e	Convenções da Descrição	0	0	0	0	0	\N	\N	0	\N
27	6	Ligação	0	0	0	0	0	\N	\N	0	\N
27	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
28	c	Idioma do Título Diferente/Idioma da Tradução Disponível	0	0	0	0	1	\N	\N	0	\N
28	b	Código de Idioma do Sumário ou Resumo/Outro Título ou Subtítulo	1	0	0	0	0	\N	\N	0	\N
28	d	Código do Idioma do Texto Falado ou Cantado	1	0	0	0	0	\N	\N	0	\N
28	e	Código do Idioma do Libreto	1	0	0	0	0	\N	\N	0	\N
28	f	Código do Idioma da Tabela de Conteúdo	1	0	0	0	0	\N	\N	0	\N
28	g	Código do Idioma do material complementar que não Libreto	1	0	0	0	0	\N	\N	0	\N
28	h	Código do Idioma do Original e/ou Traduções Intermediárias do Texto	1	0	0	0	0	\N	\N	0	\N
28	6	Ligação	0	0	0	0	0	\N	\N	0	\N
28	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
28	a	Código de Idioma do Texto/trilha Sonora ou Título Diferente	1	0	0	0	0	\N	\N	0	\N
29	a	Código de Autenticação	1	0	0	0	0	\N	\N	0	\N
30	a	Código de Área Geográfica	1	0	0	0	0	\N	\N	0	\N
30	b	Código de Área Geográfica Local	1	0	0	0	0	\N	\N	0	\N
30	2	Fonte do Código	1	0	0	0	0	\N	\N	0	\N
30	6	Ligação	0	0	0	0	0	\N	\N	0	\N
30	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
31	a	Código do País da Empresa de Publicadora/Produtora	1	0	0	0	0	\N	\N	0	\N
31	b	Código do Local da Sub-Entidade	1	0	0	0	0	\N	\N	0	\N
31	c	Código ISO da Sub-Entidade	1	0	0	0	0	\N	\N	0	\N
31	2	Fonte do Código do Local Sub-Entidade	1	0	0	0	0	\N	\N	0	\N
31	6	Ligação	0	0	0	0	0	\N	\N	0	\N
31	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
32	a	Código de Período de Tempo	1	0	0	0	0	\N	\N	0	\N
32	b	Formatada Abrangendo Per. de 9999 D.C. em diante	1	0	0	0	0	\N	\N	0	\N
32	c	Formatada Pré-9999 A.C.	1	0	0	0	0	\N	\N	0	\N
32	6	Ligação	0	0	0	0	0	\N	\N	0	\N
32	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
33	a	Código do Tipo de Data	0	0	0	0	0	\N	\N	0	\N
33	b	Data 1 (A.C.)	0	0	0	0	0	\N	\N	0	\N
33	c	Data 1 (D.C.)	0	0	0	0	0	\N	\N	0	\N
33	d	Data 2 (A.C.)	0	0	0	0	0	\N	\N	0	\N
33	e	Data 2 (D.C.)	0	0	0	0	0	\N	\N	0	\N
33	6	Ligação	0	0	0	0	0	\N	\N	0	\N
33	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
34	a	Código da forma de composição musical	1	0	0	0	0	\N	\N	0	\N
34	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
35	a	Músico ou grupo	1	0	0	0	0	\N	\N	0	\N
35	b	Solista	1	0	0	0	0	\N	\N	0	\N
35	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
36	a	Número de classificação	1	0	0	0	0	\N	\N	0	\N
36	b	Número do item	0	0	0	0	0	\N	\N	0	\N
36	d	Número de classificação suplementar (MU)	0	0	0	0	1	\N	\N	0	\N
36	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
36	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
37	a	Número de classificação	0	0	0	0	0	\N	\N	0	\N
37	b	Número de item	0	0	0	0	0	\N	\N	0	\N
37	c	Informação de cópia	0	0	0	0	0	\N	\N	0	\N
37	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
38	6	Ligação	0	0	0	0	0	\N	\N	0	\N
38	a	Código de Classificação de área geográfica	0	0	0	0	0	\N	\N	0	\N
38	b	Código de Classificação de sub-área geográfica	1	0	0	0	0	\N	\N	0	\N
38	d	Nome do lugar povoado	1	0	0	0	0	\N	\N	0	\N
38	2	Código da Fonte	0	0	0	0	0	\N	\N	0	\N
38	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
39	a	Número de classificação	0	0	0	0	0	\N	\N	0	\N
39	b	Número do item	0	0	0	0	0	\N	\N	0	\N
39	2	Fonte do número de Chamada/Classificação	0	0	0	0	0	\N	\N	0	\N
39	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
40	a	Número de classificação	1	0	0	0	0	\N	\N	0	\N
40	b	Número do item	0	0	0	0	0	\N	\N	0	\N
40	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
41	a	Número de classificação	1	0	0	0	0	\N	\N	0	\N
41	b	Número do item	0	0	0	0	0	\N	\N	0	\N
41	c	Informação de Cópia	0	0	0	0	0	\N	\N	0	\N
41	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
42	a	Conjunto de caracteres default Non-ASCII G0	0	0	0	0	0	\N	\N	0	\N
42	b	Conjunto de caracteres default Non-ANSEL G1	0	0	0	0	0	\N	\N	0	\N
42	c	Identificação do conjunto de caracteres alternativos	1	0	0	0	0	\N	\N	0	\N
43	a	Número de classificação	1	0	0	0	0	\N	\N	0	\N
43	b	Número do item	0	0	0	0	0	\N	\N	0	\N
43	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
44	a	Número de Classificação	1	0	0	0	0	\N	\N	0	\N
44	b	Número do item	0	0	0	0	0	\N	\N	0	\N
44	c	Informação de Cópia	0	0	0	0	0	\N	\N	0	\N
44	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
45	a	Código de categoria de assunto	0	0	0	0	0	\N	\N	0	\N
45	x	Subd. do Código de Categoria de Assunto	1	0	0	0	0	\N	\N	0	\N
45	2	Fonte do Código	0	0	0	0	0	\N	\N	0	\N
45	6	Ligação	0	0	0	0	0	\N	\N	0	\N
45	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
46	a	Número do item GPO	0	0	0	0	0	\N	\N	0	\N
46	z	Número do item GPO Cancelado/Inválido	1	0	0	0	0	\N	\N	0	\N
46	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
47	2	Número da edição	0	0	0	0	0	\N	\N	0	\N
47	x	Subdivisão Auxiliar	1	0	0	0	0	\N	\N	0	\N
47	6	Ligação	0	0	0	0	0	\N	\N	0	\N
47	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
47	b	Número do item	0	0	1	0	0	\N	\N	0	\N
47	a	Número de Classificação Decimal Universal	0	0	1	0	0	\N	\N	0	\N
48	a	Número de Classificação	1	0	0	0	0	\N	\N	0	\N
48	b	Número do item	0	0	0	0	0	\N	\N	0	\N
48	2	Número da edição	0	0	0	0	0	\N	\N	0	\N
48	6	Ligação	0	0	0	0	0	\N	\N	0	\N
48	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
49	a	Número de classificação	1	0	0	0	0	\N	\N	0	\N
49	2	Fonte do Número (Tipo de Classificação)	0	0	0	0	0	\N	\N	0	\N
49	6	Ligação	0	0	0	0	0	\N	\N	0	\N
49	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
49	b	Número do item	0	0	0	0	0	\N	\N	0	\N
50	a	Número de Classificação	0	0	0	0	0	\N	\N	0	\N
50	z	Número de Classificação Cancelado/Inválido	1	0	0	0	0	\N	\N	0	\N
50	2	Fonte do Número	0	0	0	0	0	\N	\N	0	\N
50	6	Ligação	0	0	0	0	0	\N	\N	0	\N
50	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
51	a	Número de relatório	0	0	0	0	0	\N	\N	0	\N
51	z	Número de relatório Cancelado/Inválido	1	0	0	0	0	\N	\N	0	\N
51	6	Ligação	0	0	0	0	0	\N	\N	0	\N
51	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
52	b	Cutter	0	0	1	0	0	\N	\N	0	\N
52	a	Numero de Classificacao	0	0	1	0	0	CDU	\N	1	\N
53	e	Termo relacionador	1	0	0	0	0	\N	\N	0	\N
53	f	Data da Obra	0	0	0	0	0	\N	\N	0	\N
53	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
53	k	SubCabeçalho	1	0	0	0	0	\N	\N	0	\N
53	l	Idioma da Obra	0	0	0	0	0	\N	\N	0	\N
53	n	Número da parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
53	p	Nome da parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
53	t	Título da Obra	0	0	0	0	0	\N	\N	0	\N
53	u	Afiliação	0	0	0	0	0	\N	\N	0	\N
53	4	Código Relacionador	1	0	0	0	0	\N	\N	0	\N
53	6	Ligação	0	0	0	0	0	\N	\N	0	\N
53	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
53	b	Numeração	0	0	0	0	0	\N	\N	0	\N
53	c	Títulos e outras palavras associadas ao nome	1	0	0	0	0	\N	\N	0	\N
53	d	Datas associadas ao nome	0	0	0	0	0	\N	\N	0	\N
53	q	Forma completa do nome	0	0	0	0	0	\N	\N	0	\N
53	a	Autor	0	0	1	0	0	AUTOR	\N	1	\N
54	e	Termo relacionador	1	0	0	0	0	\N	\N	0	\N
54	f	Data da Obra	0	0	0	0	0	\N	\N	0	\N
54	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
54	k	SubCabeçalho	1	0	0	0	0	\N	\N	0	\N
54	l	Idioma da Obra	0	0	0	0	0	\N	\N	0	\N
54	p	Nome de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
54	t	Título da Obra	0	0	0	0	0	\N	\N	0	\N
54	u	Afiliação	0	0	0	0	0	\N	\N	0	\N
54	4	Código Relacionador	1	0	0	0	0	\N	\N	0	\N
54	6	Ligação	0	0	0	0	0	\N	\N	0	\N
54	b	Unidade Subordinada	1	0	0	0	0	\N	\N	0	\N
54	c	Local do Encontro	0	0	0	0	0	\N	\N	0	\N
54	d	Data do encontro ou assinatura do tratado	1	0	0	0	0	\N	\N	0	\N
54	n	Número da Parte/Seção/Encontro	1	0	0	0	0	\N	\N	0	\N
54	a	Nome Corporativo ou Nome da Jurisdição	0	0	0	0	0	NOME JURI	\N	1	\N
54	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
55	b	Número (BK CF MP MU SE VM MX)	0	0	0	0	1	\N	\N	0	\N
55	e	Unidade Subordinada	1	0	0	0	0	\N	\N	0	\N
55	f	Data da Obra	0	0	0	0	0	\N	\N	0	\N
55	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
55	k	SubCabeçalho	1	0	0	0	0	\N	\N	0	\N
55	l	Idioma da Obra	0	0	0	0	0	\N	\N	0	\N
55	p	Nome de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
55	q	Nome do Evento que segue nome da Jurisdição na Entrada	0	0	0	0	0	\N	\N	0	\N
55	t	Título da Obra	0	0	0	0	0	\N	\N	0	\N
55	u	Afiliação	0	0	0	0	0	\N	\N	0	\N
55	4	Código Relacionador	1	0	0	0	0	\N	\N	0	\N
55	6	Ligação	0	0	0	0	0	\N	\N	0	\N
55	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
55	c	Local do Evento	0	0	0	0	0	\N	\N	0	\N
55	d	Data do Evento	0	0	0	0	0	\N	\N	0	\N
55	n	Número de Parte/Seção/Evento	1	0	0	0	0	\N	\N	0	\N
55	a	Nome de Evento ou Jurisdição	0	0	0	0	0	NOME EVEN	\N	1	\N
56	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
56	h	Meio Físico	0	0	0	0	0	\N	\N	0	\N
56	k	SubCabeçalho	1	0	0	0	0	\N	\N	0	\N
56	m	Meio de Apresentação da Música	1	0	0	0	0	\N	\N	0	\N
56	o	Informação de Arranjo para Música	0	0	0	0	0	\N	\N	0	\N
56	r	Chave para Música	0	0	0	0	0	\N	\N	0	\N
56	s	Versão	0	0	0	0	0	\N	\N	0	\N
56	t	Título da Obra	0	0	0	0	0	\N	\N	0	\N
56	6	Ligação	0	0	0	0	0	\N	\N	0	\N
56	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
56	d	Data da assinatura do tratado	1	0	0	0	0	\N	\N	0	\N
56	p	Nome de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
56	l	Idioma da Obra	0	0	0	0	0	\N	\N	0	\N
56	f	Data da Obra	0	0	0	0	0	\N	\N	0	\N
56	n	Número de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
56	a	Título Uniforme	0	0	0	0	0	TIT UNIFOR	\N	1	\N
57	a	Título Abreviado	0	0	0	0	0	\N	\N	0	\N
57	b	Informação Qualificadora	0	0	0	0	0	\N	\N	0	\N
57	2	Fonte	1	0	0	0	0	\N	\N	0	\N
57	6	Ligação	0	0	0	0	0	\N	\N	0	\N
57	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
58	a	Título Chave	0	0	0	0	0	\N	\N	0	\N
58	b	Informação Qualificadora	0	0	0	0	0	\N	\N	0	\N
58	6	Ligação	0	0	0	0	0	\N	\N	0	\N
58	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
59	l	Idioma da Obra	0	0	0	0	0	\N	\N	0	\N
59	f	Data da Obra	0	0	0	0	0	\N	\N	0	\N
59	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
59	h	Meio Físico	0	0	0	0	0	\N	\N	0	\N
59	k	SubCabeçalho	1	0	0	0	0	\N	\N	0	\N
59	m	Meio de Apresentação para Música	1	0	0	0	0	\N	\N	0	\N
59	n	Número de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
59	o	Informação de Arranjo para Música	0	0	0	0	0	\N	\N	0	\N
59	p	Nome de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
59	r	Chave para Música	0	0	0	0	0	\N	\N	0	\N
59	s	Versão	0	0	0	0	0	\N	\N	0	\N
59	6	Ligação	0	0	0	0	0	\N	\N	0	\N
59	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
59	d	Data de Assinatura do Tratado	1	0	0	0	0	\N	\N	0	\N
59	a	Título Uniforme	0	0	0	0	0	TIT UNIFOR	\N	1	\N
60	a	Título	0	0	0	0	0	\N	\N	0	\N
60	b	Complemento do Título	0	0	0	0	0	\N	\N	0	\N
60	c	Complemento do Título Transcrito da Pág. de Rosto/Indicação de Responsabilidade	0	0	0	0	0	\N	\N	0	\N
60	d	Indicação de Sessão (BK AM MP MU VM SE)	0	0	0	0	1	\N	\N	0	\N
60	e	Nome de Parte/Sessão (BK AM MP MU VM SE)	0	0	0	0	1	\N	\N	0	\N
60	h	Meio Físico	0	0	0	0	0	\N	\N	0	\N
60	n	Número da Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
60	p	Nome da Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
60	y	Código do Idioma do Título Traduzido	0	0	0	0	0	\N	\N	0	\N
60	6	Ligação	0	0	0	0	0	\N	\N	0	\N
60	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
61	a	Título Uniforme	0	0	0	0	0	\N	\N	0	\N
61	d	Data de Assinatura do Tratado	1	0	0	0	0	\N	\N	0	\N
61	f	Data da Obra	0	0	0	0	0	\N	\N	0	\N
61	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
61	h	Meio Físico	0	0	0	0	0	\N	\N	0	\N
61	k	SubCabeçalho	1	0	0	0	0	\N	\N	0	\N
61	l	Idioma da Obra	0	0	0	0	0	\N	\N	0	\N
61	m	Meio de Apresentação para Música	1	0	0	0	0	\N	\N	0	\N
61	n	Número de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
61	o	Informação de Arranjo para Música	0	0	0	0	0	\N	\N	0	\N
61	p	Nome de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
61	r	Chave para Música	0	0	0	0	0	\N	\N	0	\N
61	s	Versão	0	0	0	0	0	\N	\N	0	\N
61	6	Ligação	0	0	0	0	0	\N	\N	0	\N
61	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
62	d	Indicação de Seção (SE)	0	0	0	0	1	\N	\N	0	\N
62	e	Nome de Parte/Seção (SE)	0	0	0	0	1	\N	\N	0	\N
62	f	Faixa de Datas	0	0	0	0	0	\N	\N	0	\N
62	g	Conjunto de Datas	0	0	0	0	0	\N	\N	0	\N
62	k	Forma	1	0	0	0	0	\N	\N	0	\N
62	n	Número de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
62	p	Nome de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
62	s	Versão	0	0	0	0	0	\N	\N	0	\N
62	6	Ligação	0	0	0	0	0	\N	\N	0	\N
62	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
62	b	Complemento do Título	0	0	0	0	0	\N	\N	0	\N
62	c	Complemento do Título Transcrito da Pág. de Rosto/Indicação de Responsabilidade	0	0	0	0	0	\N	\N	0	\N
62	h	Meio Físico	0	0	0	0	0	\N	\N	0	\N
62	a	Título	0	0	1	0	0	TÍTULO	\N	1	\N
63	a	Título/título Abreviado	0	0	0	0	0	\N	\N	0	\N
63	b	Complemento do título	0	0	0	0	0	\N	\N	0	\N
63	d	Indicação de Seção (SE)	0	0	0	0	1	\N	\N	0	\N
63	e	Nome de Parte/Seção (SE)	0	0	0	0	1	\N	\N	0	\N
63	f	Informação de Volume/Número de Fascículo e/ou Data da Obra	0	0	0	0	0	\N	\N	0	\N
63	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
63	h	Meio Físico	0	0	0	0	0	\N	\N	0	\N
63	i	Exibir Texto	0	0	0	0	0	\N	\N	0	\N
63	n	Número de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
63	p	Nome de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
63	5	Instituição à qual o Campo se Aplica	0	0	0	0	0	\N	\N	0	\N
63	6	Ligação	0	0	0	0	0	\N	\N	0	\N
63	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
64	a	Título/Título Abreviado	0	0	0	0	0	\N	\N	0	\N
64	b	Complemento do Título	0	0	0	0	0	\N	\N	0	\N
64	d	Indicação de Seção (SE)	0	0	0	0	1	\N	\N	0	\N
64	e	Nome de Parte/Seção (SE)	0	0	0	0	1	\N	\N	0	\N
64	f	Informação de Volume/Número de Fascículo e/ou Data da Obra	0	0	0	0	0	\N	\N	0	\N
64	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
64	h	Meio físico	0	0	0	0	0	\N	\N	0	\N
64	i	Exibir Texto	0	0	0	0	0	\N	\N	0	\N
64	n	Número de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
64	p	Nome de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
64	x	ISSN - International Standart Serial Number	0	0	0	0	0	\N	\N	0	\N
64	6	Ligação	0	0	0	0	0	\N	\N	0	\N
64	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
65	b	Complemento da Informação de Edição	0	0	0	0	0	\N	\N	0	\N
65	6	Ligação	0	0	0	0	0	\N	\N	0	\N
65	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
65	a	Edição	0	0	1	0	0	EDICAO	\N	1	\N
66	a	Informação de Apresentação Musical	0	0	0	0	0	\N	\N	0	\N
66	6	Ligação	0	0	0	0	0	\N	\N	0	\N
66	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
67	a	Informação de Escala	0	0	0	0	0	\N	\N	0	\N
67	b	Informação de Projeção	0	0	0	0	0	\N	\N	0	\N
67	c	Informação de Coordenadas	0	0	0	0	0	\N	\N	0	\N
67	d	Informação de Zona	0	0	0	0	0	\N	\N	0	\N
67	e	Informação de Equinócio	0	0	0	0	0	\N	\N	0	\N
67	f	Other G-ring Coordinate Pairs	0	0	0	0	0	\N	\N	0	\N
67	g	Exclusion G-ring Coordinate Pairs	0	0	0	0	0	\N	\N	0	\N
67	6	Ligação	0	0	0	0	0	\N	\N	0	\N
67	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
68	a	Características de Arquivo de Computador	0	0	0	0	0	\N	\N	0	\N
68	6	Ligação	0	0	0	0	0	\N	\N	0	\N
68	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
69	a	País da Instituição Produtora do Filme de Arquivo	0	0	0	0	0	\N	\N	0	\N
69	6	Ligação	0	0	0	0	0	\N	\N	0	\N
69	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
70	b	Nome do Editor, Distribuidor, etc.	1	0	1	0	0	EDITORA	\N	1	\N
70	c	Data de Publicação, Distribuição, etc.	1	0	1	0	0	DATA	\N	1	\N
70	a	Lugar de Publicação, Distribuição, etc.	1	0	0	0	0	\N	\N	0	\N
70	e	Lugar de Manufatura	1	0	0	0	0	\N	\N	0	\N
70	f	Manufatureiro	1	0	0	0	0	\N	\N	0	\N
70	g	Data de Manufatura	1	0	0	0	0	\N	\N	0	\N
70	6	Ligação	0	0	0	0	0	\N	\N	0	\N
70	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
71	a	Companhia Produtora	1	0	0	0	0	\N	\N	0	\N
71	b	Companhia Distribuidora (Primeiro distribuidor)	1	0	0	0	0	\N	\N	0	\N
71	c	Data de Produção, Distribuição, etc.	1	0	0	0	0	\N	\N	0	\N
71	e	Produtor Contratado	1	0	0	0	0	\N	\N	0	\N
71	f	Lugar de Produção, Distribuição, etc.	1	0	0	0	0	\N	\N	0	\N
71	6	Ligação	0	0	0	0	0	\N	\N	0	\N
72	a	Lugar de Produção, Distribuição, etc.	0	0	0	0	0	\N	\N	0	\N
72	b	Editor ou Nome Comercial	0	0	0	0	0	\N	\N	0	\N
72	c	Data de Produção, Distribuição, etc.	0	0	0	0	0	\N	\N	0	\N
72	k	Identificação de Série	0	0	0	0	0	\N	\N	0	\N
72	l	Matrix e/ou Número do Take	0	0	0	0	0	\N	\N	0	\N
72	6	Ligação	0	0	0	0	0	\N	\N	0	\N
73	a	Data Estimada de Publicação	0	0	0	0	0	\N	\N	0	\N
73	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
74	a	Endereço	1	0	0	0	0	\N	\N	0	\N
74	b	Cidade	0	0	0	0	0	\N	\N	0	\N
74	c	Estado ou Província	0	0	0	0	0	\N	\N	0	\N
74	d	País	0	0	0	0	0	\N	\N	0	\N
74	e	Código Postal (CEP)	0	0	0	0	0	\N	\N	0	\N
74	f	Título que Precede Nome da Pessoa "Aos Cuidados de"	0	0	0	0	0	\N	\N	0	\N
74	g	Nome da Pessoa "Aos Cuidados de"	0	0	0	0	0	\N	\N	0	\N
74	h	Título que Segue o Nome da Pessoa "Aos Cuidados de"	0	0	0	0	0	\N	\N	0	\N
74	i	Tipo de Endereço	0	0	0	0	0	\N	\N	0	\N
74	j	Número de Telefone Especializado	1	0	0	0	0	\N	\N	0	\N
74	k	Número de Telefone	1	0	0	0	0	\N	\N	0	\N
74	l	Número de FAX	1	0	0	0	0	\N	\N	0	\N
74	m	Endereço Eletrônico	1	0	0	0	0	\N	\N	0	\N
74	n	Número TDD ou TTY	1	0	0	0	0	\N	\N	0	\N
74	p	Pessoas de Contato	1	0	0	0	0	\N	\N	0	\N
74	q	Título da Pessoa de Contato	1	0	0	0	0	\N	\N	0	\N
74	r	Horário	1	0	0	0	0	\N	\N	0	\N
74	z	Nota Pública	1	0	0	0	0	\N	\N	0	\N
74	4	Código Relacionador	1	0	0	0	0	\N	\N	0	\N
74	6	Ligação	0	0	0	0	0	\N	\N	0	\N
74	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
75	f	Tipo de Unidade	1	0	0	0	0	\N	\N	0	\N
75	g	Tamanho da Unidade	1	0	0	0	0	\N	\N	0	\N
75	3	Materiais Especificados	0	0	0	0	0	\N	\N	0	\N
75	6	Ligação	0	0	0	0	0	\N	\N	0	\N
75	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
75	a	Extensão	1	0	0	0	0	\N	\N	0	\N
75	b	Outros Detalhes Físicos	0	0	0	0	0	\N	\N	0	\N
75	c	Dimensões	1	0	0	0	0	\N	\N	0	\N
75	e	Material Complementar	0	0	0	0	0	\N	\N	0	\N
76	a	Tempo de Duração	1	0	0	0	0	\N	\N	0	\N
77	a	Horário	0	0	0	0	0	\N	\N	0	\N
77	b	Informação Adicional	0	0	0	0	0	\N	\N	0	\N
77	6	Ligação	0	0	0	0	0	\N	\N	0	\N
77	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
78	a	Periodicidade	0	0	0	0	0	\N	\N	0	\N
78	b	Data da Periodicidade	0	0	0	0	0	\N	\N	0	\N
78	6	Ligação	0	0	0	0	0	\N	\N	0	\N
78	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
79	a	Periodicidade Anterior	0	0	0	0	0	\N	\N	0	\N
79	b	Datas de Periodicidade Anterior	0	0	0	0	0	\N	\N	0	\N
79	6	Ligação	0	0	0	0	0	\N	\N	0	\N
80	a	Material Base e Configuração	1	0	0	0	0	\N	\N	0	\N
80	b	Dimensões	1	0	0	0	0	\N	\N	0	\N
80	c	Materiais Aplicados à Superfície	1	0	0	0	0	\N	\N	0	\N
80	d	Informação da Técnica de Gravação	1	0	0	0	0	\N	\N	0	\N
80	e	Suporte	1	0	0	0	0	\N	\N	0	\N
80	f	Production Rate/Ratio	1	0	0	0	0	\N	\N	0	\N
80	h	Localização Dentro do Veículo	1	0	0	0	0	\N	\N	0	\N
80	i	Especificações Técnicas do Veículo	1	0	0	0	0	\N	\N	0	\N
80	3	Materiais Especificados	0	0	0	0	0	\N	\N	0	\N
81	a	Unidades de Coordenada ou distância	0	0	0	0	0	\N	\N	0	\N
81	c	Resolução na Latitude	0	0	0	0	0	\N	\N	0	\N
81	d	Resolução na Longitude	0	0	0	0	0	\N	\N	0	\N
81	e	Paralelo padrão ou latitude linear oblíqua	1	0	0	0	0	\N	\N	0	\N
81	f	longitude linear oblíqua	1	0	0	0	0	\N	\N	0	\N
81	g	longitude do meridiano central/centro de projeção	0	0	0	0	0	\N	\N	0	\N
81	h	Latitude da origem da projeção/centro de projeção	0	0	0	0	0	\N	\N	0	\N
81	i	Indicação do Leste (False easting)	0	0	0	0	0	\N	\N	0	\N
81	j	Indicação do Norte (False northing)	0	0	0	0	0	\N	\N	0	\N
81	k	Fator de escala	0	0	0	0	0	\N	\N	0	\N
81	l	Altura do ponto de perspectiva acima da superfície	0	0	0	0	0	\N	\N	0	\N
81	m	Ângulo Azimutal	0	0	0	0	0	\N	\N	0	\N
81	n	Medida da Longitude do ponto ou longitude vertical reta do pólo	0	0	0	0	0	\N	\N	0	\N
81	o	LandSat Órbita ponto	0	0	0	0	0	\N	\N	0	\N
81	p	Identificador de Zona	0	0	0	0	0	\N	\N	0	\N
81	q	Nome do Elipsóide	0	0	0	0	0	\N	\N	0	\N
81	r	Semi-Eixo maior	0	0	0	0	0	\N	\N	0	\N
81	s	Denominador da fração de achatamento	0	0	0	0	0	\N	\N	0	\N
81	t	Resolução vertical	0	0	0	0	0	\N	\N	0	\N
81	u	Método de Codificação vertical	0	0	0	0	0	\N	\N	0	\N
81	v	Planar, Local ou descrição de grade ou projeção	0	0	0	0	0	\N	\N	0	\N
81	w	Planar, Local ou outras informações de referência	0	0	0	0	0	\N	\N	0	\N
81	2	Método de referência utilizado	0	0	0	0	0	\N	\N	0	\N
81	6	Ligação	0	0	0	0	0	\N	\N	0	\N
81	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
82	a	Método de codificação da coordenada planar	0	0	0	0	0	\N	\N	0	\N
82	b	Unidade de distância plana	0	0	0	0	0	\N	\N	0	\N
82	c	Resolução da Abcissa	0	0	0	0	0	\N	\N	0	\N
82	d	Resolução Ordenada	0	0	0	0	0	\N	\N	0	\N
82	e	Resolução na distância	0	0	0	0	0	\N	\N	0	\N
82	f	Unidade de medida de Resolução	0	0	0	0	0	\N	\N	0	\N
82	g	Unidade de medida	0	0	0	0	0	\N	\N	0	\N
82	h	Unidade de medida da direção de referência	0	0	0	0	0	\N	\N	0	\N
82	i	Unidade de medida do meridiano de referência	0	0	0	0	0	\N	\N	0	\N
82	6	Ligação	0	0	0	0	0	\N	\N	0	\N
82	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
83	a	Organização	1	0	0	0	0	\N	\N	0	\N
83	b	Arranjo	1	0	0	0	0	\N	\N	0	\N
83	c	Nível hierárquico	0	0	0	0	0	\N	\N	0	\N
83	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
83	6	Ligação	0	0	0	0	0	\N	\N	0	\N
83	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
84	a	Método de referência direta	0	0	0	0	0	\N	\N	0	\N
84	b	Tipo de objeto	1	0	0	0	0	\N	\N	0	\N
84	c	Número de Objetos	1	0	0	0	0	\N	\N	0	\N
84	d	Número de Linhas	0	0	0	0	0	\N	\N	0	\N
84	e	Número de Colunas	0	0	0	0	0	\N	\N	0	\N
84	g	Contagem Vertical	0	0	0	0	0	\N	\N	0	\N
84	i	Descrição Indireta de Referência	0	0	0	0	0	\N	\N	0	\N
84	6	Ligação	0	0	0	0	0	\N	\N	0	\N
84	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
85	a	Classificação de Segurança	0	0	0	0	0	\N	\N	0	\N
85	b	Instruções de Manuseio	1	0	0	0	0	\N	\N	0	\N
85	c	Informação de Disseminação Externa	1	0	0	0	0	\N	\N	0	\N
85	d	Dados da Mudança de Catalogação/Liberação de Acesso	0	0	0	0	0	\N	\N	0	\N
85	e	Sistema de Classificação	0	0	0	0	0	\N	\N	0	\N
85	f	Código do País de Origem	0	0	0	0	0	\N	\N	0	\N
85	g	Data da Mudança de Categoria	0	0	0	0	0	\N	\N	0	\N
85	h	Data da Liberação de Acesso	0	0	0	0	0	\N	\N	0	\N
85	j	Autorização	1	0	0	0	0	\N	\N	0	\N
85	6	Ligação	0	0	0	0	0	\N	\N	0	\N
85	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
86	a	Termos de controle do Autor	0	0	0	0	0	\N	\N	0	\N
86	b	Instituição criadora	1	0	0	0	0	\N	\N	0	\N
86	c	Usuários autorizados do Material	1	0	0	0	0	\N	\N	0	\N
86	g	Outras Restrições	1	0	0	0	0	\N	\N	0	\N
86	6	Ligação	0	0	0	0	0	\N	\N	0	\N
86	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
87	a	Datas de Publicação / Indicação de Seqüência	0	0	0	0	0	\N	\N	0	\N
87	z	Fonte da Informação	0	0	0	0	0	\N	\N	0	\N
87	6	Ligação	0	0	0	0	0	\N	\N	0	\N
87	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
88	a	Nome Pessoal	0	0	0	0	0	\N	\N	0	\N
88	c	Títulos e outras palavras associadas ao nome	1	0	0	0	0	\N	\N	0	\N
88	d	Datas associadas ao nome	0	0	0	0	0	\N	\N	0	\N
88	e	Termo relacionador	1	0	0	0	0	\N	\N	0	\N
88	f	Data da Obra	0	0	0	0	0	\N	\N	0	\N
88	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
88	k	SubCabeçalho	1	0	0	0	0	\N	\N	0	\N
88	l	Idioma da Obra	0	0	0	0	0	\N	\N	0	\N
88	n	Número de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
88	p	Nome de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
88	t	Título da Obra	0	0	0	0	0	\N	\N	0	\N
88	u	Afiliação	0	0	0	0	0	\N	\N	0	\N
88	v	Informação de Número de Volume/Seqüência	0	0	0	0	0	\N	\N	0	\N
88	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
88	4	Código Relacionador	1	0	0	0	0	\N	\N	0	\N
88	6	Ligação	0	0	0	0	0	\N	\N	0	\N
88	b	Numeração	0	0	0	0	0	\N	\N	0	\N
89	a	Nome Corporativo ou nome de Jurisdição	0	0	0	0	0	\N	\N	0	\N
89	b	Unidade Subordinada	1	0	0	0	0	\N	\N	0	\N
89	c	Local do Evento	0	0	0	0	0	\N	\N	0	\N
89	d	Data do Evento ou Assinatura do Tratado	1	0	0	0	0	\N	\N	0	\N
89	e	Termo Relacionador	1	0	0	0	0	\N	\N	0	\N
89	f	Data da Obra	0	0	0	0	0	\N	\N	0	\N
89	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
89	k	SubCabeçalho	1	0	0	0	0	\N	\N	0	\N
89	l	Idioma da Obra	0	0	0	0	0	\N	\N	0	\N
89	n	Número de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
89	p	Nome de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
89	t	Título da Obra	0	0	0	0	0	\N	\N	0	\N
89	u	Afiliação	0	0	0	0	0	\N	\N	0	\N
89	v	Número do Volume/Indicação de Seqüência	0	0	0	0	0	\N	\N	0	\N
89	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
89	4	Código Relacionador	1	0	0	0	0	\N	\N	0	\N
89	6	Ligação	0	0	0	0	0	\N	\N	0	\N
90	a	Nome do Evento ou Nome da Jurisdição	0	0	0	0	0	\N	\N	0	\N
90	b	Número (BK CF MP MU SE VM MX)	0	0	0	0	1	\N	\N	0	\N
90	c	Local do Evento	0	0	0	0	0	\N	\N	0	\N
90	d	Data do Evento	0	0	0	0	0	\N	\N	0	\N
90	e	Unidade Subordinada	1	0	0	0	0	\N	\N	0	\N
90	f	Data da Obra	0	0	0	0	0	\N	\N	0	\N
90	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
90	k	SubCabeçalho	1	0	0	0	0	\N	\N	0	\N
90	l	Idioma da Obra	0	0	0	0	0	\N	\N	0	\N
90	n	Número de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
90	p	Nome de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
90	q	Nome do Evento que segue nome da Jurisdição na Entrada	0	0	0	0	0	\N	\N	0	\N
90	t	Título da Obra	0	0	0	0	0	\N	\N	0	\N
90	u	Filiação	0	0	0	0	0	\N	\N	0	\N
90	v	Número do Volume/Indicação de Seqüência	0	0	0	0	0	\N	\N	0	\N
90	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
90	4	Código Relacionador	1	0	0	0	0	\N	\N	0	\N
90	6	Ligação	0	0	0	0	0	\N	\N	0	\N
91	a	Título	0	0	0	0	0	SÉRIE	\N	1	\N
91	n	Número de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
91	p	Nome de Parte/Seção da Obra	1	0	0	0	0	\N	\N	0	\N
91	v	Número de Volume/Indicação de Seqüência	0	0	0	0	0	\N	\N	0	\N
91	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
91	6	Ligação	0	0	0	0	0	\N	\N	0	\N
91	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
92	l	Número de Chamada da Library of Congress	0	0	0	0	0	\N	\N	0	\N
92	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
92	6	Ligação	0	0	0	0	0	\N	\N	0	\N
92	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
92	a	Informação de Série	1	0	0	0	0	\N	\N	0	\N
92	v	Número de Volume/Indicação de Seqüência	1	0	0	0	0	\N	\N	0	\N
93	6	Ligação	0	0	0	0	0	\N	\N	0	\N
93	l	Número de Chamada da Library of Congress (SE)	0	0	0	0	1	\N	\N	0	\N
93	x	ISSN - International Standard Serial Number (SE)	0	0	0	0	1	\N	\N	0	\N
93	z	Fonte de Informação da Nota (AM SE)	0	0	0	0	1	\N	\N	0	\N
93	3	Materiais Especificados	0	0	0	0	0	\N	\N	0	\N
93	5	Instituição à qual o campo se aplica	0	0	0	0	0	\N	\N	0	\N
93	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
93	a	Nota Geral	0	0	0	0	0	\N	\N	0	\N
94	a	Nota iniciada por "COM"	0	0	0	0	0	\N	\N	0	\N
94	5	Instituição à qual o campo se aplica	0	0	0	0	0	\N	\N	0	\N
94	6	Ligação	0	0	0	0	0	\N	\N	0	\N
94	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
95	6	Ligação	0	0	0	0	0	\N	\N	0	\N
95	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
95	a	Nota de Dissertação ou Tese	0	0	0	0	0	\N	\N	0	\N
96	b	Número de Referências	0	0	0	0	0	\N	\N	0	\N
96	6	Ligação	0	0	0	0	0	\N	\N	0	\N
96	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
96	a	Nota de Bibliografia	0	0	0	0	0	\N	\N	0	\N
97	g	Miscelânea	1	0	0	0	0	\N	\N	0	\N
97	t	Título	1	0	0	0	0	\N	\N	0	\N
97	6	Ligação	0	0	0	0	0	\N	\N	0	\N
97	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
97	a	Nota de conteúdo	0	0	0	0	0	\N	\N	0	\N
97	r	Indicação de Responsabilidade	1	0	0	0	0	\N	\N	0	\N
98	a	Termos Definindo o Acesso	0	0	0	0	0	\N	\N	0	\N
98	b	Jurisdição	1	0	0	0	0	\N	\N	0	\N
98	c	Condições para o Acesso Físico	1	0	0	0	0	\N	\N	0	\N
98	d	Usuários autorizados	1	0	0	0	0	\N	\N	0	\N
98	e	Autorização	1	0	0	0	0	\N	\N	0	\N
98	3	Materiais Especificados	0	0	0	0	0	\N	\N	0	\N
98	5	Instituição à qual o campo se aplica	0	0	0	0	0	\N	\N	0	\N
98	6	Ligação	0	0	0	0	0	\N	\N	0	\N
98	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
99	a	Fração representante da nota de escala	0	0	0	0	0	\N	\N	0	\N
99	b	Complemento da nota de escala	0	0	0	0	0	\N	\N	0	\N
99	6	Ligação	0	0	0	0	0	\N	\N	0	\N
99	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
100	a	Nota de Crédito de Produção/Criação	0	0	0	0	0	\N	\N	0	\N
100	6	Ligação	0	0	0	0	0	\N	\N	0	\N
100	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
101	a	Nome da fonte	0	0	0	0	0	\N	\N	0	\N
101	b	Datas de cobertura da fonte	0	0	0	0	0	\N	\N	0	\N
101	c	Localização da fonte	0	0	0	0	0	\N	\N	0	\N
101	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
101	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
101	6	Ligação	0	0	0	0	0	\N	\N	0	\N
101	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
102	a	Nota de Participante ou Executor	0	0	0	0	0	\N	\N	0	\N
102	6	Ligação	0	0	0	0	0	\N	\N	0	\N
102	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
103	a	Tipo de relatório	0	0	0	0	0	\N	\N	0	\N
103	b	Período coberto	0	0	0	0	0	\N	\N	0	\N
103	6	Ligação	0	0	0	0	0	\N	\N	0	\N
103	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
104	a	Relatório de precisão dos atributos	0	0	0	0	0	\N	\N	0	\N
104	b	Valor de precisão dos atributos	1	0	0	0	0	\N	\N	0	\N
104	c	Explicação sobre a precisão dos atributos	1	0	0	0	0	\N	\N	0	\N
104	d	Relatório de consistência lógica	1	0	0	0	0	\N	\N	0	\N
104	e	Relatório de completude/Inteireza	0	0	0	0	0	\N	\N	0	\N
104	f	Relatório de precisão da posição horizontal	0	0	0	0	0	\N	\N	0	\N
104	g	Valor da precisão da posição horizontal	1	0	0	0	0	\N	\N	0	\N
104	h	Explicação da precisão da posição horizontal	1	0	0	0	0	\N	\N	0	\N
104	i	Relatório da precisão da posição vertical	0	0	0	0	0	\N	\N	0	\N
104	j	Valor da precisão da posição vertical	1	0	0	0	0	\N	\N	0	\N
104	k	Explicação da precisão da posição vertical	1	0	0	0	0	\N	\N	0	\N
104	m	Cobertura da Nuvem	0	0	0	0	0	\N	\N	0	\N
104	6	Ligação	0	0	0	0	0	\N	\N	0	\N
104	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
105	a	Nota de peculiaridade na numeração	0	0	0	0	0	\N	\N	0	\N
105	6	Ligação	0	0	0	0	0	\N	\N	0	\N
105	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
105	z	Fonte de informação da nota (SE)	0	0	0	0	1	\N	\N	0	\N
106	a	Tipo de arquivo ou dado de computador	0	0	0	0	0	\N	\N	0	\N
106	6	Ligação	0	0	0	0	0	\N	\N	0	\N
106	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
107	a	Nota Data/Hora e lugar de um evento	0	0	0	0	0	\N	\N	0	\N
107	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
107	6	Ligação	0	0	0	0	0	\N	\N	0	\N
107	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
108	a	Nota de Resumo	0	0	0	0	0	\N	\N	0	\N
108	b	Expansão da nota de resumo	0	0	0	0	0	\N	\N	0	\N
108	z	Fonte da informação da nota (SE)	0	0	0	0	1	\N	\N	0	\N
108	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
108	6	Ligação	0	0	0	0	0	\N	\N	0	\N
108	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
109	a	Nota de público alvo	1	0	0	0	0	\N	\N	0	\N
109	b	Fonte	0	0	0	0	0	\N	\N	0	\N
109	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
109	6	Ligação	0	0	0	0	0	\N	\N	0	\N
109	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
110	a	Nota de cobertura geográfica	0	0	0	0	0	\N	\N	0	\N
110	6	Ligação	0	0	0	0	0	\N	\N	0	\N
110	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
111	a	Nota de forma preferida para descrição do material	0	0	0	0	0	\N	\N	0	\N
111	2	Fonte ou esquema usado	0	0	0	0	0	\N	\N	0	\N
111	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
111	6	Ligação	0	0	0	0	0	\N	\N	0	\N
111	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
112	a	Nota de suplemento	0	0	0	0	0	\N	\N	0	\N
112	z	Fonte da informação da nota (SE)	0	0	0	0	1	\N	\N	0	\N
112	6	Ligação	0	0	0	0	0	\N	\N	0	\N
112	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
113	a	Nota de disponibilidade de forma física adicional	0	0	0	0	0	\N	\N	0	\N
113	b	Fonte de aquisição	0	0	0	0	0	\N	\N	0	\N
113	c	Condições de aquisição	0	0	0	0	0	\N	\N	0	\N
113	d	Número de ordem	0	0	0	0	0	\N	\N	0	\N
113	z	Fonte da informação da nota (AM CF VM SE)	0	0	0	0	1	\N	\N	0	\N
113	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
113	6	Ligação	0	0	0	0	0	\N	\N	0	\N
113	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
114	a	Tipo de reprodução	0	0	0	0	0	\N	\N	0	\N
114	b	Local de reprodução	1	0	0	0	0	\N	\N	0	\N
114	c	Instituição responsável pela reprodução	1	0	0	0	0	\N	\N	0	\N
114	d	Data da reprodução	0	0	0	0	0	\N	\N	0	\N
114	e	Descrição física da reprodução	0	0	0	0	0	\N	\N	0	\N
114	f	Informação série da reprodução	1	0	0	0	0	\N	\N	0	\N
114	m	Datas de publicação e/ou indicação de seqüência para fascículos reproduzidos	1	0	0	0	0	\N	\N	0	\N
114	n	Nota sobre a reprodução	1	0	0	0	0	\N	\N	0	\N
114	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
114	6	Ligação	0	0	0	0	0	\N	\N	0	\N
114	7	Campos de dados fixos para reprodução	0	0	0	0	0	\N	\N	0	\N
114	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
115	a	Entrada principal do original	0	0	0	0	0	\N	\N	0	\N
115	b	Informação de edição do original	0	0	0	0	0	\N	\N	0	\N
115	c	Publicação, distribuição, etc. do original	0	0	0	0	0	\N	\N	0	\N
115	e	Descrição física do original	0	0	0	0	0	\N	\N	0	\N
115	f	Informação de Série do Original	1	0	0	0	0	\N	\N	0	\N
115	k	Título chave do original	1	0	0	0	0	\N	\N	0	\N
115	l	Localização do original	0	0	0	0	0	\N	\N	0	\N
115	m	Detalhes do material especificado	0	0	0	0	0	\N	\N	0	\N
115	n	Nota sobre o original	1	0	0	0	0	\N	\N	0	\N
115	p	Frase introdutória	0	0	0	0	0	\N	\N	0	\N
115	t	Informação do título do original	0	0	0	0	0	\N	\N	0	\N
115	x	ISSN - International Standard Serial Number	1	0	0	0	0	\N	\N	0	\N
115	z	ISBN - International Standard Book Number	1	0	0	0	0	\N	\N	0	\N
115	6	Ligação	0	0	0	0	0	\N	\N	0	\N
115	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
116	a	Depositário	0	0	0	0	0	\N	\N	0	\N
116	b	Endereço postal	1	0	0	0	0	\N	\N	0	\N
116	c	País	1	0	0	0	0	\N	\N	0	\N
116	d	Endereço de telecomunicações	1	0	0	0	0	\N	\N	0	\N
116	g	Código da localização do depósito	0	0	0	0	0	\N	\N	0	\N
116	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
116	6	Ligação	0	0	0	0	0	\N	\N	0	\N
116	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
117	a	Texto da nota	0	0	0	0	0	\N	\N	0	\N
117	b	Número do contrato	1	0	0	0	0	\N	\N	0	\N
117	c	Número da doação	1	0	0	0	0	\N	\N	0	\N
117	d	Número do projeto, tarefa, trabalho	1	0	0	0	0	\N	\N	0	\N
117	e	Número do elemento de programa	1	0	0	0	0	\N	\N	0	\N
117	f	Número do projeto	1	0	0	0	0	\N	\N	0	\N
117	g	Número da tarefa	1	0	0	0	0	\N	\N	0	\N
117	h	Número da unidade de trabalho	1	0	0	0	0	\N	\N	0	\N
117	6	Ligação	0	0	0	0	0	\N	\N	0	\N
117	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
118	a	Nota detalhes do sistema	0	0	0	0	0	\N	\N	0	\N
118	6	Ligação	0	0	0	0	0	\N	\N	0	\N
118	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
119	a	Termos governando uso e reprodução	0	0	0	0	0	\N	\N	0	\N
119	b	Jurisdição	0	0	0	0	0	\N	\N	0	\N
119	c	Autorização	0	0	0	0	0	\N	\N	0	\N
119	d	Usuários autorizados	0	0	0	0	0	\N	\N	0	\N
119	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
119	5	Instituição à qual o campo se aplica	0	0	0	0	0	\N	\N	0	\N
119	6	Ligação	0	0	0	0	0	\N	\N	0	\N
119	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
120	a	Fonte de aquisição	0	0	0	0	0	\N	\N	0	\N
120	b	Endereço	0	0	0	0	0	\N	\N	0	\N
120	c	Método de aquisição	0	0	0	0	0	\N	\N	0	\N
120	d	Data de Aquisição	0	0	0	0	0	\N	\N	0	\N
120	e	Número de acesso	0	0	0	0	0	\N	\N	0	\N
120	f	Proprietário	0	0	0	0	0	\N	\N	0	\N
120	h	Preço de compra	0	0	0	0	0	\N	\N	0	\N
120	n	Extensão	1	0	0	0	0	\N	\N	0	\N
120	o	Tipo de unidade	1	0	0	0	0	\N	\N	0	\N
120	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
120	5	Instituição à qual o campo se aplica	0	0	0	0	0	\N	\N	0	\N
120	6	Ligação	0	0	0	0	0	\N	\N	0	\N
120	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
121	a	Depositária	0	0	0	0	0	\N	\N	0	\N
121	b	Endereço	1	0	0	0	0	\N	\N	0	\N
121	c	País	1	0	0	0	0	\N	\N	0	\N
121	d	Título dos materiais associados	1	0	0	0	0	\N	\N	0	\N
121	e	Procedência dos materiais associados	1	0	0	0	0	\N	\N	0	\N
121	n	Nota	1	0	0	0	0	\N	\N	0	\N
121	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
121	6	Ligação	0	0	0	0	0	\N	\N	0	\N
121	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
122	a	Nota Biográfica ou histórica	0	0	0	0	0	\N	\N	0	\N
122	b	Expansão da nota biográfica ou histórica	0	0	0	0	0	\N	\N	0	\N
122	6	Ligação	0	0	0	0	0	\N	\N	0	\N
122	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
123	a	Nota de idioma	0	0	0	0	0	\N	\N	0	\N
123	b	Informação de código ou alfabeto	1	0	0	0	0	\N	\N	0	\N
123	z	Fonte da informação da nota (SE)	0	0	0	0	1	\N	\N	0	\N
123	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
123	6	Ligação	0	0	0	0	0	\N	\N	0	\N
123	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
124	a	Nota complexa de título anterior	0	0	0	0	0	\N	\N	0	\N
124	z	Fonte da informação da nota (SE)	0	0	0	0	1	\N	\N	0	\N
124	6	Ligação	0	0	0	0	0	\N	\N	0	\N
124	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
125	a	Nota de informação sobre a edição	0	0	0	0	0	\N	\N	0	\N
125	z	Fonte da informação da nota (SE)	0	0	0	0	1	\N	\N	0	\N
125	6	Ligação	0	0	0	0	0	\N	\N	0	\N
125	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
126	a	Etiqueta do tipo de unidade	0	0	0	0	0	\N	\N	0	\N
126	b	Fonte e definição do tipo de unidade	0	0	0	0	0	\N	\N	0	\N
126	c	Etiqueta de atributo	0	0	0	0	0	\N	\N	0	\N
126	d	Fonte e definição do atributo	0	0	0	0	0	\N	\N	0	\N
126	e	Valor do domínio enumerado	1	0	0	0	0	\N	\N	0	\N
126	f	Fonte e definição do valor do domínio enumerado	1	0	0	0	0	\N	\N	0	\N
126	g	Abrangência máxima e mínima do domínio	0	0	0	0	0	\N	\N	0	\N
126	h	Fonte e nome do conjunto de códigos	0	0	0	0	0	\N	\N	0	\N
126	i	domínio não representável	0	0	0	0	0	\N	\N	0	\N
126	j	Característica das unidades de medida e resolução	0	0	0	0	0	\N	\N	0	\N
126	k	Data inicial e final dos valores de atributo	0	0	0	0	0	\N	\N	0	\N
126	l	Precisão dos valores de atributo	0	0	0	0	0	\N	\N	0	\N
126	m	Explicação da precisão dos valores de atributo	0	0	0	0	0	\N	\N	0	\N
126	n	Freqüência de medida dos atributos	0	0	0	0	0	\N	\N	0	\N
126	o	Visão geral da unidade e atributo	1	0	0	0	0	\N	\N	0	\N
126	p	Citação de detalhe da unidade e atributo	1	0	0	0	0	\N	\N	0	\N
126	6	Ligação	0	0	0	0	0	\N	\N	0	\N
126	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
127	a	Nota de índice cumulativo e remissivo	0	0	0	0	0	\N	\N	0	\N
127	b	Fonte disponível	1	0	0	0	0	\N	\N	0	\N
127	c	Grau de controle	0	0	0	0	0	\N	\N	0	\N
127	d	Referência Bibliográfica	0	0	0	0	0	\N	\N	0	\N
127	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
127	6	Ligação	0	0	0	0	0	\N	\N	0	\N
127	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
128	a	Nota de informação sobre documentação	0	0	0	0	0	\N	\N	0	\N
128	z	ISBN - International Standard Book Number	1	0	0	0	0	\N	\N	0	\N
128	6	Ligação	0	0	0	0	0	\N	\N	0	\N
128	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
129	a	Histórico	0	0	0	0	0	\N	\N	0	\N
129	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
129	5	Instituição à qual o campo se aplica	0	0	0	0	0	\N	\N	0	\N
129	6	Ligação	0	0	0	0	0	\N	\N	0	\N
129	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
130	a	Marca identificadora	1	0	0	0	0	\N	\N	0	\N
130	b	Identificação de cópia	1	0	0	0	0	\N	\N	0	\N
130	c	Identificação de versão	1	0	0	0	0	\N	\N	0	\N
130	d	Formato de apresentação	1	0	0	0	0	\N	\N	0	\N
130	e	Número de cópias	1	0	0	0	0	\N	\N	0	\N
130	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
130	5	Instituição à qual o campo se aplica	0	0	0	0	0	\N	\N	0	\N
130	6	Ligação	0	0	0	0	0	\N	\N	0	\N
130	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
131	a	Número de pastas/Variáveis	0	0	0	0	0	\N	\N	0	\N
131	b	Nome da variável	1	0	0	0	0	\N	\N	0	\N
131	c	Unidade de análise	1	0	0	0	0	\N	\N	0	\N
131	d	Universo de dados	1	0	0	0	0	\N	\N	0	\N
131	e	Código ou esquema de preenchimento	1	0	0	0	0	\N	\N	0	\N
131	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
131	6	Ligação	0	0	0	0	0	\N	\N	0	\N
131	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
132	a	Nota de metodologia	0	0	0	0	0	\N	\N	0	\N
132	6	Ligação	0	0	0	0	0	\N	\N	0	\N
132	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
133	a	Nota de ligação complexa de entrada	0	0	0	0	0	\N	\N	0	\N
133	z	Fonte da informação na nota	0	0	0	0	1	\N	\N	0	\N
133	6	Ligação	0	0	0	0	0	\N	\N	0	\N
133	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
134	a	Nota de publicações sobre materiais descritos	0	0	0	0	0	\N	\N	0	\N
134	z	ISSN - International Standard Serial Number	1	0	0	0	0	\N	\N	0	\N
134	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
134	6	Ligação	0	0	0	0	0	\N	\N	0	\N
134	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
135	a	Ação	0	0	0	0	0	\N	\N	0	\N
135	b	Identificação da Ação	1	0	0	0	0	\N	\N	0	\N
135	c	Tempo da Ação	1	0	0	0	0	\N	\N	0	\N
135	e	Contingência da Ação	1	0	0	0	0	\N	\N	0	\N
135	f	Autorização	1	0	0	0	0	\N	\N	0	\N
135	h	Jurisdição	1	0	0	0	0	\N	\N	0	\N
135	i	Método da Ação	1	0	0	0	0	\N	\N	0	\N
135	j	Lugar da Ação	1	0	0	0	0	\N	\N	0	\N
135	k	Agente da Ação	1	0	0	0	0	\N	\N	0	\N
135	l	Status	1	0	0	0	0	\N	\N	0	\N
135	n	Extensão	1	0	0	0	0	\N	\N	0	\N
135	o	Tipo de unidade	1	0	0	0	0	\N	\N	0	\N
135	x	Nota interna	1	0	0	0	0	\N	\N	0	\N
135	z	Nota Pública	1	0	0	0	0	\N	\N	0	\N
135	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
135	5	Instituição à qual o campo se aplica	0	0	0	0	0	\N	\N	0	\N
135	6	Ligação	0	0	0	0	0	\N	\N	0	\N
135	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
136	a	Acumulação	1	0	0	0	0	\N	\N	0	\N
136	b	Freqüência de uso	1	0	0	0	0	\N	\N	0	\N
136	3	Materiais especificados	1	0	0	0	0	\N	\N	0	\N
136	5	Instituição à qual o campo se aplica	0	0	0	0	0	\N	\N	0	\N
136	6	Ligação	0	0	0	0	0	\N	\N	0	\N
136	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
137	a	Nota de exposição	0	0	0	0	0	\N	\N	0	\N
137	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
137	5	Instituição à qual o campo se aplica	0	0	0	0	0	\N	\N	0	\N
137	6	Ligação	0	0	0	0	0	\N	\N	0	\N
137	8	Ligação de Campo e Seqüência	0	0	0	0	0	\N	\N	0	\N
138	a	Nota de Premiação	0	0	0	0	0	\N	\N	0	\N
138	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
138	6	Ligação	0	0	0	0	0	\N	\N	0	\N
138	8	Ligação de Campo e Seqüência	1	0	0	0	0	\N	\N	0	\N
139	a	Notas Locais	1	0	0	0	0	\N	\N	0	\N
140	a	Nome Pessoal	0	0	0	0	0	NOME PESS.	\N	1	\N
140	e	Termo relacionador	1	0	0	0	0	\N	\N	0	\N
140	f	Data da obra	0	0	0	0	0	\N	\N	0	\N
140	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
140	h	Meio físico	0	0	0	0	0	\N	\N	0	\N
140	k	Subcabeçalhos	1	0	0	0	0	\N	\N	0	\N
140	l	Idioma da obra	0	0	0	0	0	\N	\N	0	\N
140	m	Forma de execução para música	1	0	0	0	0	\N	\N	0	\N
140	n	Número da parte / seção de uma obra	1	0	0	0	0	\N	\N	0	\N
140	o	Informação de arranjo para música	0	0	0	0	0	\N	\N	0	\N
140	p	Nome da parte / seção da obra	1	0	0	0	0	\N	\N	0	\N
140	r	Chave para música	0	0	0	0	0	\N	\N	0	\N
140	u	Afiliação	0	0	0	0	0	\N	\N	0	\N
140	v	Subdivisão de forma	1	0	0	0	0	\N	\N	0	\N
140	2	Fonte do cabeçalho ou termo	0	0	0	0	0	\N	\N	0	\N
140	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
140	4	Código relacionador	1	0	0	0	0	\N	\N	0	\N
140	6	Ligação	0	0	0	0	0	\N	\N	0	\N
140	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
140	b	Numeração (seguida ao nome)	0	0	0	0	0	\N	\N	0	\N
140	c	Títulos e outras palavras associadas ao nome	1	0	0	0	0	\N	\N	0	\N
140	d	Datas associadas ao nome	0	0	0	0	0	\N	\N	0	\N
140	q	Acréscimo a nomes que contêm iniciais	0	0	0	0	0	\N	\N	0	\N
140	t	Título da obra	0	0	0	0	0	\N	\N	0	\N
140	x	Subdivisão geral	1	0	0	0	0	\N	\N	0	\N
140	y	Subdivisão cronológica	1	0	0	0	0	\N	\N	0	\N
140	z	Subdivisão geográfica	1	0	0	0	0	\N	\N	0	\N
140	s	Versão	0	0	0	0	0	\N	\N	0	\N
141	a	Nome Corporativo ou nome da jurisdição	0	0	0	0	0	NOME EVEN	\N	1	\N
141	z	Subdivisão geográfica	1	0	0	0	0	\N	\N	0	\N
141	t	Título da obra junto à entrada, i.e. autor - título	0	0	0	0	0	\N	\N	0	\N
141	e	Termo relacionador	1	0	0	0	0	\N	\N	0	\N
141	f	Data da obra	0	0	0	0	0	\N	\N	0	\N
141	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
141	h	Meio físico	0	0	0	0	0	\N	\N	0	\N
141	k	Subcabeçalho de forma	1	0	0	0	0	\N	\N	0	\N
141	l	Idioma da obra	0	0	0	0	0	\N	\N	0	\N
141	o	Informações de arranjo para música	0	0	0	0	0	\N	\N	0	\N
141	n	Número da parte / seção / evento	1	0	0	0	0	\N	\N	0	\N
141	p	Nome da parte / seção da obra	1	0	0	0	0	\N	\N	0	\N
141	r	Chave para música	0	0	0	0	0	\N	\N	0	\N
141	s	Versão	0	0	0	0	0	\N	\N	0	\N
141	u	Afiliação	0	0	0	0	0	\N	\N	0	\N
141	v	Subdivisão de forma	1	0	0	0	0	\N	\N	0	\N
141	2	Fonte do cabeçalho ou termo	0	0	0	0	0	\N	\N	0	\N
141	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
141	4	Código do relacionador	1	0	0	0	0	\N	\N	0	\N
141	6	Ligação	0	0	0	0	0	\N	\N	0	\N
141	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
141	b	Unidade subordinada	1	0	0	0	0	\N	\N	0	\N
141	c	Local do evento	0	0	0	0	0	\N	\N	0	\N
141	d	Data do evento ou assinatura do acordo	1	0	0	0	0	\N	\N	0	\N
141	m	Forma de execução para música	1	0	0	0	0	\N	\N	0	\N
141	x	Subdivisão geral	1	0	0	0	0	\N	\N	0	\N
141	y	Subdivisão cronológica	1	0	0	0	0	\N	\N	0	\N
142	a	Nome do Evento ou Nome da Jurisdição como Entrada	0	0	0	0	0	NOME EVEN	\N	1	\N
142	b	Número (BK CF MP MU SE VM MX)	0	0	0	0	1	\N	\N	0	\N
142	c	Local do Evento	0	0	0	0	0	\N	\N	0	\N
142	d	Data do Evento	0	0	0	0	0	\N	\N	0	\N
142	e	Unidade Subordinada	1	0	0	0	0	\N	\N	0	\N
142	f	Data da Obra	0	0	0	0	0	\N	\N	0	\N
142	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
142	h	Meio físico	0	0	0	0	0	\N	\N	0	\N
142	k	Subcabeçalho de Forma	1	0	0	0	0	\N	\N	0	\N
142	l	Idioma da Obra	0	0	0	0	0	\N	\N	0	\N
142	n	Número da parte / seção / evento	1	0	0	0	0	\N	\N	0	\N
142	p	Nome da parte / seção da obra	1	0	0	0	0	\N	\N	0	\N
142	q	Nome do evento seguindo o nome da jurisdição	0	0	0	0	0	\N	\N	0	\N
142	s	Versão	0	0	0	0	0	\N	\N	0	\N
142	t	Título da obra	0	0	0	0	0	\N	\N	0	\N
142	u	Afiliação	0	0	0	0	0	\N	\N	0	\N
142	v	Subdivisão de forma	1	0	0	0	0	\N	\N	0	\N
142	x	Subdivisão geral	1	0	0	0	0	\N	\N	0	\N
142	y	Subdivisão cronológica	1	0	0	0	0	\N	\N	0	\N
142	z	Subdivisão geográfica	1	0	0	0	0	\N	\N	0	\N
142	2	Fonte do cabeçalho ou termo	0	0	0	0	0	\N	\N	0	\N
142	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
142	4	Código Relacionador	1	0	0	0	0	\N	\N	0	\N
142	6	Ligação	0	0	0	0	0	\N	\N	0	\N
142	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
143	a	Título Uniforme	0	0	0	0	0	TIT UNIFOR	\N	1	\N
143	f	Data da obra	0	0	0	0	0	\N	\N	0	\N
143	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
143	h	Meio físico	0	0	0	0	0	\N	\N	0	\N
143	l	Idioma da obra	0	0	0	0	0	\N	\N	0	\N
143	m	Forma de execução para música	1	0	0	0	0	\N	\N	0	\N
143	n	Número da parte / seção da obra	1	0	0	0	0	\N	\N	0	\N
143	o	Informação de arranjo para música	0	0	0	0	0	\N	\N	0	\N
143	r	Chave para música	0	0	0	0	0	\N	\N	0	\N
143	s	Versão	0	0	0	0	0	\N	\N	0	\N
143	t	Título da obra	0	0	0	0	0	\N	\N	0	\N
143	v	Subdivisão de forma	1	0	0	0	0	\N	\N	0	\N
143	z	Subdivisão geográfica	1	0	0	0	0	\N	\N	0	\N
143	2	Fonte do cabeçalho ou termo	0	0	0	0	0	\N	\N	0	\N
143	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
143	6	Ligação	0	0	0	0	0	\N	\N	0	\N
143	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
143	d	Data de assinatura do acordo	1	0	0	0	0	\N	\N	0	\N
143	k	Subcabeçalho de forma	1	0	0	0	0	\N	\N	0	\N
143	p	Nome da parte / seção da obra	1	0	0	0	0	\N	\N	0	\N
143	x	Subdivisão geral	1	0	0	0	0	\N	\N	0	\N
143	y	Subdivisão cronológica	1	0	0	0	0	\N	\N	0	\N
144	a	Assunto	0	0	1	0	0	ASSUNTO	\N	1	\N
144	b	Termo tópico seguindo o nome geográfico	0	0	0	0	0	\N	\N	0	\N
144	c	Local do evento	0	0	0	0	0	\N	\N	0	\N
144	d	Datas	0	0	0	0	0	\N	\N	0	\N
144	e	Termo relacionador	0	0	0	0	0	\N	\N	0	\N
144	v	Subdivisão de forma	1	0	0	0	0	\N	\N	0	\N
144	2	Fonte do cabeçalho ou termo	0	0	0	0	0	\N	\N	0	\N
144	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
144	6	Ligação	0	0	0	0	0	\N	\N	0	\N
144	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
144	x	Subdivisão geral	1	0	0	0	0	\N	\N	0	\N
144	y	Subdivisão cronológica	1	0	0	0	0	\N	\N	0	\N
144	z	Subdivisão geográfica	1	0	0	0	0	\N	\N	0	\N
145	a	Nome geográfico	0	0	0	0	0	NOME GEO	\N	1	\N
145	b	Nome geográfico seguindo o nome do local	1	0	0	0	1	\N	\N	0	\N
145	v	Subdivisão de forma	1	0	0	0	0	\N	\N	0	\N
145	2	Fonte do cabeçalho ou termo	0	0	0	0	0	\N	\N	0	\N
145	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
145	6	Ligação	0	0	0	0	0	\N	\N	0	\N
145	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
145	x	Subdivisão geral	1	0	0	0	0	\N	\N	0	\N
145	y	Subdivisão cronológica	1	0	0	0	0	\N	\N	0	\N
145	z	Subdivisão geográfica	1	0	0	0	0	\N	\N	0	\N
147	6	Ligação	0	0	0	0	0	\N	\N	0	\N
147	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
147	a	Termo livre	1	0	0	0	0	\N	\N	0	\N
148	a	Termo foco	0	0	0	0	0	\N	\N	0	\N
148	b	Termo não foco	1	0	0	0	0	\N	\N	0	\N
148	c	Designação da faceta / hierarquia	1	0	0	0	0	\N	\N	0	\N
148	v	Subdivisão de forma	1	0	0	0	0	\N	\N	0	\N
148	y	Subdivisão cronológica	1	0	0	0	0	\N	\N	0	\N
148	z	Subdivisão geográfica	1	0	0	0	0	\N	\N	0	\N
148	2	Fonte do cabeçalho ou termo	0	0	0	0	0	\N	\N	0	\N
148	3	Material especificado	0	0	0	0	0	\N	\N	0	\N
148	6	Ligação	0	0	0	0	0	\N	\N	0	\N
148	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
149	a	Gênero / forma / características físicas	0	0	0	0	0	\N	\N	0	\N
149	b	Termo não foco	1	0	0	0	0	\N	\N	0	\N
149	c	Faceta / designação hierárquica	1	0	0	0	0	\N	\N	0	\N
149	v	Subdivisão de forma	1	0	0	0	0	\N	\N	0	\N
149	x	Subdivisão geral	1	0	0	0	0	\N	\N	0	\N
149	y	Subdivisão cronológica	1	0	0	0	0	\N	\N	0	\N
149	z	Subdivisão geográfica	1	0	0	0	0	\N	\N	0	\N
149	2	Fonte do termo	0	0	0	0	0	\N	\N	0	\N
149	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
149	5	Instituição a qual se refere o campo	0	0	0	0	0	\N	\N	0	\N
149	6	Ligação	0	0	0	0	0	\N	\N	0	\N
149	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
150	6	Ligação	0	0	0	0	0	\N	\N	0	\N
150	a	Ocupação	0	0	0	0	0	\N	\N	0	\N
150	k	Forma	0	0	0	0	0	\N	\N	0	\N
150	v	Subdivisão de forma	0	0	0	0	0	\N	\N	0	\N
150	x	Subdivisão geral	1	0	0	0	0	\N	\N	0	\N
150	y	Subdivisão cronológica	1	0	0	0	0	\N	\N	0	\N
150	z	Subdivisão geográfica	1	0	0	0	0	\N	\N	0	\N
150	2	Fonte do termo	0	0	0	0	0	\N	\N	0	\N
150	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
150	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
151	a	Função	0	0	0	0	0	\N	\N	0	\N
151	v	Subdivisão de forma	0	0	0	0	0	\N	\N	0	\N
151	x	Subdivisão geral	1	0	0	0	0	\N	\N	0	\N
151	y	Subdivisão cronológia	1	0	0	0	0	\N	\N	0	\N
151	z	Subdivisão geográfica	1	0	0	0	0	\N	\N	0	\N
151	2	Fonte do termo	0	0	0	0	0	\N	\N	0	\N
151	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
151	6	Ligação	0	0	0	0	0	\N	\N	0	\N
151	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
152	a	Objetivo do currículo principal	0	0	0	0	0	\N	\N	0	\N
152	b	Objetivo do currículo subordinado	1	0	0	0	0	\N	\N	0	\N
152	d	Fator de correlação	0	0	0	0	0	\N	\N	0	\N
152	2	Fonte do termo	0	0	0	0	0	\N	\N	0	\N
152	6	Ligação	0	0	0	0	0	\N	\N	0	\N
152	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
152	c	Código do currículo	0	0	0	0	0	\N	\N	0	\N
153	y	Subdivisão cronológica	1	0	0	0	0	\N	\N	0	\N
153	z	Subdivisão geográfica	1	0	0	0	0	\N	\N	0	\N
153	a	Assunto Local	0	0	0	0	0	\N	\N	0	\N
153	x	Subdivisão geral	1	0	0	0	0	\N	\N	0	\N
154	a	Nome pessoal	0	0	0	0	0	SECUNDÁRIA	\N	1	\N
154	e	Termo relacionador	1	0	0	0	0	\N	\N	0	\N
154	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
154	h	Meio físico	0	0	0	0	0	\N	\N	0	\N
154	k	Subcabeçalho	1	0	0	0	0	\N	\N	0	\N
154	l	Idioma da obra	0	0	0	0	0	\N	\N	0	\N
154	m	Meio de apresentação para música	1	0	0	0	0	\N	\N	0	\N
154	n	Número de parte / seção da obra	1	0	0	0	0	\N	\N	0	\N
154	o	Informação de arranjo para música	0	0	0	0	0	\N	\N	0	\N
154	p	Nome de parte / seção da obra	1	0	0	0	0	\N	\N	0	\N
154	r	Chave para música	0	0	0	0	0	\N	\N	0	\N
154	s	Versão	0	0	0	0	0	\N	\N	0	\N
154	u	Afiliação	0	0	0	0	0	\N	\N	0	\N
154	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
154	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
154	4	Código relacionador	1	0	0	0	0	\N	\N	0	\N
154	5	Instituição à qual o campo se aplica	0	0	0	0	0	\N	\N	0	\N
154	6	Ligação	0	0	0	0	0	\N	\N	0	\N
154	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
154	b	Numeração	0	0	0	0	0	\N	\N	0	\N
154	c	Títulos e outras palavras associadas ao nome	1	0	0	0	0	\N	\N	0	\N
154	d	Datas associadas ao nome	0	0	0	0	0	\N	\N	0	\N
154	q	Forma completa do nome	0	0	0	0	0	\N	\N	0	\N
155	a	Nome corporativo ou jurisdição	0	0	0	0	0	NOME CORP	\N	1	\N
155	e	Termo relacionador	1	0	0	0	0	\N	\N	0	\N
155	f	Data da obra	0	0	0	0	0	\N	\N	0	\N
155	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
155	h	Meio físico	0	0	0	0	0	\N	\N	0	\N
155	k	Subcabeçalho	1	0	0	0	0	\N	\N	0	\N
155	l	Idioma da obra	0	0	0	0	0	\N	\N	0	\N
155	m	Meio de apresentação para música	1	0	0	0	0	\N	\N	0	\N
155	o	Informação de arranjo para música	0	0	0	0	0	\N	\N	0	\N
155	p	Nome de parte / seção da obra	1	0	0	0	0	\N	\N	0	\N
155	r	Chave para música	0	0	0	0	0	\N	\N	0	\N
155	s	Versão	0	0	0	0	0	\N	\N	0	\N
155	t	Título da obra	0	0	0	0	0	\N	\N	0	\N
155	u	Afiliação	0	0	0	0	0	\N	\N	0	\N
155	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
155	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
155	4	Termo relacionador	1	0	0	0	0	\N	\N	0	\N
155	5	Instituição à qual o campo se aplica	0	0	0	0	0	\N	\N	0	\N
155	6	Ligação	0	0	0	0	0	\N	\N	0	\N
155	8	Ligação de campos e seqüência	1	0	0	0	0	\N	\N	0	\N
155	b	Unidade subordinada	1	0	0	0	0	\N	\N	0	\N
155	c	Local do evento	0	0	0	0	0	\N	\N	0	\N
155	d	Data do evento ou assinatura de tratado	1	0	0	0	0	\N	\N	0	\N
155	n	Número de parte / seção da obra	1	0	0	0	0	\N	\N	0	\N
156	a	Nome do evento ou jurisdição como entrada	0	0	0	0	0	NOME ENTR	\N	1	\N
156	e	Unidade subordinada	1	0	0	0	0	\N	\N	0	\N
156	b	Número (BK CF MP MU SE VM MX)	0	0	0	0	1	\N	\N	0	\N
156	f	Data da obra	0	0	0	0	0	\N	\N	0	\N
156	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
156	h	Meio físico	0	0	0	0	0	\N	\N	0	\N
156	k	Subcabeçalho	1	0	0	0	0	\N	\N	0	\N
156	l	Idioma da obra	0	0	0	0	0	\N	\N	0	\N
156	p	Nome de parte / seção da obra	1	0	0	0	0	\N	\N	0	\N
156	q	Nome do evento seguindo nome da jurisdição como elemento de entrada	0	0	0	0	0	\N	\N	0	\N
156	s	Versão	0	0	0	0	0	\N	\N	0	\N
156	t	Título da obra	0	0	0	0	0	\N	\N	0	\N
156	u	Afiliação	0	0	0	0	0	\N	\N	0	\N
156	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
156	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
156	4	Termo relacionador	1	0	0	0	0	\N	\N	0	\N
156	5	Instituição à qual o campo se aplica	0	0	0	0	0	\N	\N	0	\N
156	6	Ligação	0	0	0	0	0	\N	\N	0	\N
156	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
156	d	Data do evento	0	0	0	0	0	\N	\N	0	\N
156	n	Número de parte / seção da obra	1	0	0	0	0	\N	\N	0	\N
156	c	Local do evento	0	0	0	0	0	\N	\N	0	\N
157	a	Nome	0	0	0	0	0	\N	\N	0	\N
157	e	Termo relacionador	1	0	0	0	0	\N	\N	0	\N
157	4	Código relacionador	1	0	0	0	0	\N	\N	0	\N
157	6	Ligação	0	0	0	0	0	\N	\N	0	\N
157	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
158	a	Título uniforme	0	0	0	0	0	TIT UNIFOR	\N	1	\N
158	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
158	h	Meio físico	0	0	0	0	0	\N	\N	0	\N
158	k	Subcabeçalho	1	0	0	0	0	\N	\N	0	\N
158	m	Meio de apresentação para música	1	0	0	0	0	\N	\N	0	\N
158	o	Informação de arranjo para música	0	0	0	0	0	\N	\N	0	\N
158	r	Chave para música	0	0	0	0	0	\N	\N	0	\N
158	s	Versão	0	0	0	0	0	\N	\N	0	\N
158	t	Título da obra	0	0	0	0	0	\N	\N	0	\N
158	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
158	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
158	5	Instituição à qual o campo se aplica	0	0	0	0	0	\N	\N	0	\N
158	6	Ligação	0	0	0	0	0	\N	\N	0	\N
158	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
158	p	Nome de parte / seção da obra	1	0	0	0	0	\N	\N	0	\N
158	d	Data da assinatura do tratado	1	0	0	0	0	\N	\N	0	\N
158	l	Idioma da obra	0	0	0	0	0	\N	\N	0	\N
158	f	Data do trabalho	0	0	0	0	0	\N	\N	0	\N
158	n	Número de parte / seção da obra	1	0	0	0	0	\N	\N	0	\N
159	a	Título relacionado / Analítico não controlado	0	0	0	0	0	TIT REL	\N	1	\N
159	h	Meio físico	0	0	0	0	0	\N	\N	0	\N
159	n	Número de parte / seção da obra	1	0	0	0	0	\N	\N	0	\N
159	p	Nome de parte / seção da obra	1	0	0	0	0	\N	\N	0	\N
159	5	Instituição à qual o campo se aplica	0	0	0	0	0	\N	\N	0	\N
159	6	Ligação	0	0	0	0	0	\N	\N	0	\N
159	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
160	a	País	0	0	0	0	0	\N	\N	0	\N
160	b	Estado, província, território	0	0	0	0	0	\N	\N	0	\N
160	c	País, região, ilha	0	0	0	0	0	\N	\N	0	\N
160	d	Cidade	0	0	0	0	0	\N	\N	0	\N
160	6	Ligação	0	0	0	0	0	\N	\N	0	\N
160	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
161	a	Tipo e modelo da máquina	0	0	0	0	0	\N	\N	0	\N
161	b	Linguagem de programação	0	0	0	0	0	\N	\N	0	\N
161	c	Sistema operacional	0	0	0	0	0	\N	\N	0	\N
161	6	Ligação	0	0	0	0	0	\N	\N	0	\N
161	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
162	a	Nome taxonômico / categoria taxonômica hierárquica	1	0	0	0	0	\N	\N	0	\N
162	2	Fonte da identificação taxonômica	0	0	0	0	0	\N	\N	0	\N
162	6	Ligação	0	0	0	0	0	\N	\N	0	\N
162	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
164	6	Ligação	0	0	0	0	0	\N	\N	0	\N
164	a	Título da entrada principal	0	0	0	0	0	\N	\N	0	\N
164	b	Edição	0	0	0	0	0	\N	\N	0	\N
164	c	Informação qualificadora	0	0	0	0	0	\N	\N	0	\N
164	d	Lugar, editor, e data de publicação	0	0	0	0	0	\N	\N	0	\N
164	g	Informação de relação	1	0	0	0	0	\N	\N	0	\N
164	i	Exibir texto	0	0	0	0	0	\N	\N	0	\N
164	h	Descrição física	0	0	0	0	0	\N	\N	0	\N
164	m	Detalhes específicos do material	0	0	0	0	0	\N	\N	0	\N
164	n	Nota	1	0	0	0	0	\N	\N	0	\N
164	o	Outro identificador de item	1	0	0	0	0	\N	\N	0	\N
164	q	Título paralelo (BK SE)	0	0	0	0	1	\N	\N	0	\N
164	s	Título uniforme	0	0	0	0	0	\N	\N	0	\N
164	t	Título	0	0	0	0	0	\N	\N	0	\N
164	w	Número de controle do registro	1	0	0	0	0	\N	\N	0	\N
164	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
164	y	Designação CODEN	0	0	0	0	0	\N	\N	0	\N
164	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
165	a	Título da entrada principal	0	0	0	0	0	\N	\N	0	\N
165	b	Edição	0	0	0	0	0	\N	\N	0	\N
165	c	Informação qualificadora	0	0	0	0	0	\N	\N	0	\N
165	d	Lugar, editor, e data de publicação	0	0	0	0	0	\N	\N	0	\N
165	g	Informação de relação	1	0	0	0	0	\N	\N	0	\N
165	i	Exibir texto	0	0	0	0	0	\N	\N	0	\N
165	h	Descrição física	0	0	0	0	0	\N	\N	0	\N
165	m	Detalhes específicos do material	0	0	0	0	0	\N	\N	0	\N
165	n	Nota	1	0	0	0	0	\N	\N	0	\N
165	o	Outro identificador de item	1	0	0	0	0	\N	\N	0	\N
165	q	Título paralelo (BK SE)	0	0	0	0	1	\N	\N	0	\N
165	s	Título uniforme	0	0	0	0	0	\N	\N	0	\N
165	t	Título	0	0	0	0	0	\N	\N	0	\N
165	w	Número de controle do registro	1	0	0	0	0	\N	\N	0	\N
165	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
165	y	Designação CODEN	0	0	0	0	0	\N	\N	0	\N
165	6	Ligação	0	0	0	0	0	\N	\N	0	\N
165	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
166	a	Título de entrada principal	0	0	0	0	0	\N	\N	0	\N
166	b	Edição	0	0	0	0	0	\N	\N	0	\N
166	c	Informação qualificadora	0	0	0	0	0	\N	\N	0	\N
166	d	Lugar, editor, e data de publicação	0	0	0	0	0	\N	\N	0	\N
166	g	Informação de relação	1	0	0	0	0	\N	\N	0	\N
166	i	Exibir texto	0	0	0	0	0	\N	\N	0	\N
166	h	Descrição física	0	0	0	0	0	\N	\N	0	\N
166	k	Dado de série para item relacionado	1	0	0	0	0	\N	\N	0	\N
166	m	Detalhes específicos do material	0	0	0	0	0	\N	\N	0	\N
166	n	Nota	1	0	0	0	0	\N	\N	0	\N
166	o	Outro identificador de item	1	0	0	0	0	\N	\N	0	\N
166	q	Título paralelo (BK SE)	0	0	0	0	1	\N	\N	0	\N
166	r	Número de relatório	1	0	0	0	0	\N	\N	0	\N
166	s	Título uniforme	0	0	0	0	0	\N	\N	0	\N
166	t	Título	0	0	0	0	0	\N	\N	0	\N
166	u	Standard technical report number	0	0	0	0	0	\N	\N	0	\N
166	w	Número de controle do registro	1	0	0	0	0	\N	\N	0	\N
166	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
166	y	Designação CODEN	0	0	0	0	0	\N	\N	0	\N
166	6	Ligação	0	0	0	0	0	\N	\N	0	\N
166	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
166	z	ISBN - International Standard Book Number	1	0	0	0	0	\N	\N	0	\N
167	a	Título de entrada principal	0	0	0	0	0	\N	\N	0	\N
167	b	Edição	0	0	0	0	0	\N	\N	0	\N
167	c	Informação qualificadora	0	0	0	0	0	\N	\N	0	\N
167	d	Lugar, editor, e data de publicação	0	0	0	0	0	\N	\N	0	\N
167	g	Informação de relação	1	0	0	0	0	\N	\N	0	\N
167	i	Exibir texto	0	0	0	0	0	\N	\N	0	\N
167	h	Descrição física	0	0	0	0	0	\N	\N	0	\N
167	k	Dado de série para item relacionado	1	0	0	0	0	\N	\N	0	\N
167	m	Detalhes específicos do material	0	0	0	0	0	\N	\N	0	\N
167	n	Nota	1	0	0	0	0	\N	\N	0	\N
167	o	Outro identificador de item	1	0	0	0	0	\N	\N	0	\N
167	q	Título paralelo (BK SE)	0	0	0	0	1	\N	\N	0	\N
167	r	Número de relatório	1	0	0	0	0	\N	\N	0	\N
167	s	Título uniforme	0	0	0	0	0	\N	\N	0	\N
167	t	Título	0	0	0	0	0	\N	\N	0	\N
167	u	Standard technical report number	0	0	0	0	0	\N	\N	0	\N
167	w	Número de controle do registro	1	0	0	0	0	\N	\N	0	\N
167	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
167	z	ISBN - International Standard Book Number	1	0	0	0	0	\N	\N	0	\N
167	y	Designação CODEN	0	0	0	0	0	\N	\N	0	\N
167	6	Ligação	0	0	0	0	0	\N	\N	0	\N
167	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
168	a	Título da entrada principal	0	0	0	0	0	\N	\N	0	\N
168	b	Edição	0	0	0	0	0	\N	\N	0	\N
168	c	Informação qualificadora	0	0	0	0	0	\N	\N	0	\N
168	d	Lugar, editor, e data de publicação	0	0	0	0	0	\N	\N	0	\N
168	g	Informação de relação	1	0	0	0	0	\N	\N	0	\N
168	i	Exibir texto	0	0	0	0	0	\N	\N	0	\N
168	h	Descrição física	0	0	0	0	0	\N	\N	0	\N
168	k	Dado de série para item relacionado	1	0	0	0	0	\N	\N	0	\N
168	m	Detalhes específicos do material	0	0	0	0	0	\N	\N	0	\N
168	n	Nota	1	0	0	0	0	\N	\N	0	\N
168	o	Outro identificador de item	1	0	0	0	0	\N	\N	0	\N
168	q	Título paralelo (BK SE)	0	0	0	0	1	\N	\N	0	\N
168	r	Número de relatório	1	0	0	0	0	\N	\N	0	\N
168	s	Título uniforme	0	0	0	0	0	\N	\N	0	\N
168	t	Título	0	0	0	0	0	\N	\N	0	\N
168	u	Standard technical report number	0	0	0	0	0	\N	\N	0	\N
168	w	Número de controle do registo	1	0	0	0	0	\N	\N	0	\N
168	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
168	z	ISBN - International Standard Book Number	1	0	0	0	0	\N	\N	0	\N
168	y	Designação CODEN	0	0	0	0	0	\N	\N	0	\N
168	6	Ligação	0	0	0	0	0	\N	\N	0	\N
168	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
169	a	Título da entrada principal	0	0	0	0	0	\N	\N	0	\N
169	b	Edição	0	0	0	0	0	\N	\N	0	\N
169	c	Informação qualificadora	0	0	0	0	0	\N	\N	0	\N
169	d	Lugar, editor, e data de publicação	0	0	0	0	0	\N	\N	0	\N
169	g	Informação de relação	1	0	0	0	0	\N	\N	0	\N
169	i	Exibir texto	0	0	0	0	0	\N	\N	0	\N
169	h	Descrição física da fonte	0	0	0	0	0	\N	\N	0	\N
169	k	Dado de série para item relacionado	1	0	0	0	0	\N	\N	0	\N
169	m	Detalhes específicos do material	0	0	0	0	0	\N	\N	0	\N
169	n	Nota	1	0	0	0	0	\N	\N	0	\N
169	o	Outro identificador de item	1	0	0	0	0	\N	\N	0	\N
169	q	Título paralelo (BK SE)	0	0	0	0	1	\N	\N	0	\N
169	r	Número de relatório	1	0	0	0	0	\N	\N	0	\N
169	s	Título uniforme	0	0	0	0	0	\N	\N	0	\N
169	t	Título	0	0	0	0	0	\N	\N	0	\N
169	u	Standard technical report number	0	0	0	0	0	\N	\N	0	\N
169	w	Número de controle do registro	1	0	0	0	0	\N	\N	0	\N
169	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
169	z	ISBN - International Standard Book Number	1	0	0	0	0	\N	\N	0	\N
169	y	Designação CODEN	0	0	0	0	0	\N	\N	0	\N
169	6	Ligação	0	0	0	0	0	\N	\N	0	\N
169	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
170	a	Título da entrada principal	0	0	0	0	0	TIT ENT	\N	1	\N
170	h	Descrição física da fonte	0	0	0	0	0	\N	\N	0	\N
170	i	Exibir texto	0	0	0	0	0	\N	\N	0	\N
170	k	Dado de série para item relacionado	1	0	0	0	0	\N	\N	0	\N
170	m	Detalhes específicos do material	0	0	0	0	0	\N	\N	0	\N
170	n	Nota	1	0	0	0	0	\N	\N	0	\N
170	o	Outro identificador de item	1	0	0	0	0	\N	\N	0	\N
170	r	Número de relatório	1	0	0	0	0	\N	\N	0	\N
170	p	Título Abreviado	0	0	0	0	0	\N	\N	0	\N
170	u	Standard Technical Report Number	0	0	0	0	0	\N	\N	0	\N
170	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
170	y	Designação CODEN	0	0	0	0	0	\N	\N	0	\N
170	Z	ISBN - International Standard Book Number	1	0	0	0	0	\N	\N	0	\N
170	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
170	6	Ligação	0	0	0	0	0	\N	\N	0	\N
170	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
170	b	Edição	0	0	0	0	0	\N	\N	0	\N
170	d	Lugar, editor, e data de publicação	0	0	0	0	0	\N	\N	0	\N
170	g	Informação de relação	1	0	0	0	0	\N	\N	0	\N
170	s	Título uniforme	0	0	0	0	0	\N	\N	0	\N
170	t	Título	0	0	0	0	0	\N	\N	0	\N
170	w	Número de controle	1	0	0	0	0	\N	\N	0	\N
171	a	Título da entrada principal	0	0	0	0	0	\N	\N	0	\N
171	b	Edição	0	0	0	0	0	\N	\N	0	\N
171	c	Informação qualificadora	0	0	0	0	0	\N	\N	0	\N
171	d	Lugar, editor, e data de publicação	0	0	0	0	0	\N	\N	0	\N
171	g	Informação de relação	1	0	0	0	0	\N	\N	0	\N
171	i	Exibir texto	0	0	0	0	0	\N	\N	0	\N
171	h	Descrição física da fonte	0	0	0	0	0	\N	\N	0	\N
171	k	Dado de série para item relacionado	1	0	0	0	0	\N	\N	0	\N
171	m	Detalhes específicos do material	0	0	0	0	0	\N	\N	0	\N
171	n	Nota	1	0	0	0	0	\N	\N	0	\N
171	o	Outro identificador de item	1	0	0	0	0	\N	\N	0	\N
171	r	Número de relatório	1	0	0	0	0	\N	\N	0	\N
171	s	Título uniforme	0	0	0	0	0	\N	\N	0	\N
171	t	Título	0	0	0	0	0	\N	\N	0	\N
171	u	Standard technical report number	0	0	0	0	0	\N	\N	0	\N
171	w	Número de controle do registro	1	0	0	0	0	\N	\N	0	\N
171	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
171	y	Designação CODEN	0	0	0	0	0	\N	\N	0	\N
171	z	ISBN - International Standard Book Number	1	0	0	0	0	\N	\N	0	\N
171	6	Ligação	0	0	0	0	0	\N	\N	0	\N
171	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
172	a	Título da entrada principal	0	0	0	0	0	\N	\N	0	\N
172	b	Edição	0	0	0	0	0	\N	\N	0	\N
172	c	Informação qualificadora	0	0	0	0	0	\N	\N	0	\N
172	d	Lugar, editor, e data de publicação	0	0	0	0	0	\N	\N	0	\N
172	e	Código de idioma	0	0	0	0	0	\N	\N	0	\N
172	f	Código de país	0	0	0	0	0	\N	\N	0	\N
172	g	Informação de relação	1	0	0	0	0	\N	\N	0	\N
172	i	Exibir texto	0	0	0	0	0	\N	\N	0	\N
172	h	Descrição física	0	0	0	0	0	\N	\N	0	\N
172	k	Dado de série para item relacionado	1	0	0	0	0	\N	\N	0	\N
172	m	Detalhes específicos do material	0	0	0	0	0	\N	\N	0	\N
172	n	Nota	1	0	0	0	0	\N	\N	0	\N
172	o	Outro identificador de item	1	0	0	0	0	\N	\N	0	\N
172	q	Título paralelo (BK SE)	0	0	0	0	1	\N	\N	0	\N
172	r	Número de relatório	1	0	0	0	0	\N	\N	0	\N
172	s	Título uniforme	0	0	0	0	0	\N	\N	0	\N
172	t	Título	0	0	0	0	0	\N	\N	0	\N
172	u	Standard Technical Report Number	0	0	0	0	0	\N	\N	0	\N
172	w	Número de controle do registro	1	0	0	0	0	\N	\N	0	\N
172	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
172	z	ISBN - International Standard Book Number	1	0	0	0	0	\N	\N	0	\N
172	y	Designação CODEN	0	0	0	0	0	\N	\N	0	\N
172	6	Ligação	0	0	0	0	0	\N	\N	0	\N
172	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
173	a	Título da entrada principal	0	0	0	0	0	\N	\N	0	\N
173	b	Edição	0	0	0	0	0	\N	\N	0	\N
173	c	Informação qualificadora	0	0	0	0	0	\N	\N	0	\N
173	d	Lugar, editor, e data de publicação	0	0	0	0	0	\N	\N	0	\N
173	g	Informação de relação	1	0	0	0	0	\N	\N	0	\N
173	i	Exibir texto	0	0	0	0	0	\N	\N	0	\N
173	h	Descrição física	0	0	0	0	0	\N	\N	0	\N
173	k	Dado de série para item relacionado	1	0	0	0	0	\N	\N	0	\N
173	m	Detalhes específicos do material	0	0	0	0	0	\N	\N	0	\N
173	n	Nota	1	0	0	0	0	\N	\N	0	\N
173	o	Outro identificador de item	1	0	0	0	0	\N	\N	0	\N
173	q	Título paralelo (BK SE)	0	0	0	0	1	\N	\N	0	\N
173	r	Número de relatório	1	0	0	0	0	\N	\N	0	\N
173	s	Título uniforme	0	0	0	0	0	\N	\N	0	\N
173	t	Título	0	0	0	0	0	\N	\N	0	\N
173	u	Standard Technical Report Number	0	0	0	0	0	\N	\N	0	\N
173	w	Número de controle do registro	1	0	0	0	0	\N	\N	0	\N
173	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
173	z	ISBN - International Standard Book Number	1	0	0	0	0	\N	\N	0	\N
173	y	Designação CODEN	0	0	0	0	0	\N	\N	0	\N
173	6	Ligação	0	0	0	0	0	\N	\N	0	\N
173	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
174	a	Título da entrada principal	0	0	0	0	0	\N	\N	0	\N
174	b	Edição	0	0	0	0	0	\N	\N	0	\N
174	c	Informação qualificadora	0	0	0	0	0	\N	\N	0	\N
174	d	Lugar, editor, e data de publicação	0	0	0	0	0	\N	\N	0	\N
174	g	Informação de relação	1	0	0	0	0	\N	\N	0	\N
174	i	Exibir texto	0	0	0	0	0	\N	\N	0	\N
174	h	Descrição física	0	0	0	0	0	\N	\N	0	\N
174	k	Dado de série para item relacionado	1	0	0	0	0	\N	\N	0	\N
174	m	Detalhes específicos do material	0	0	0	0	0	\N	\N	0	\N
174	n	Nota	1	0	0	0	0	\N	\N	0	\N
174	o	Outro identificador de item	1	0	0	0	0	\N	\N	0	\N
174	q	Título paralelo (BK SE)	0	0	0	0	1	\N	\N	0	\N
174	s	Título uniforme	0	0	0	0	0	\N	\N	0	\N
174	t	Título	0	0	0	0	0	\N	\N	0	\N
174	w	Número de controle do registro	1	0	0	0	0	\N	\N	0	\N
174	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
174	y	Designação CODEN	0	0	0	0	0	\N	\N	0	\N
174	6	Ligação	0	0	0	0	0	\N	\N	0	\N
174	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
175	a	Título da entrada principal	0	0	0	0	0	\N	\N	0	\N
175	b	Edição	0	0	0	0	0	\N	\N	0	\N
175	c	Informação qualificadora	0	0	0	0	0	\N	\N	0	\N
175	d	Lugar, editor, e data de publicação	0	0	0	0	0	\N	\N	0	\N
175	g	Informação de relação	1	0	0	0	0	\N	\N	0	\N
175	i	Exibir texto	0	0	0	0	0	\N	\N	0	\N
175	h	Descrição física	0	0	0	0	0	\N	\N	0	\N
175	k	Dado de série para item relacionado	1	0	0	0	0	\N	\N	0	\N
175	m	Detalhes específicos do material	0	0	0	0	0	\N	\N	0	\N
175	n	Nota	1	0	0	0	0	\N	\N	0	\N
175	o	Outro identificador de item	1	0	0	0	0	\N	\N	0	\N
175	q	Título paralelo (BK SE)	0	0	0	0	1	\N	\N	0	\N
175	r	Número de relatório	1	0	0	0	0	\N	\N	0	\N
175	s	Título uniforme	0	0	0	0	0	\N	\N	0	\N
175	t	Título	0	0	0	0	0	\N	\N	0	\N
175	u	Standard Technical Report Number	0	0	0	0	0	\N	\N	0	\N
175	w	Número de controle do registro	1	0	0	0	0	\N	\N	0	\N
175	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
175	z	ISBN - International Standard Book Number	1	0	0	0	0	\N	\N	0	\N
175	y	Designação CODEN	0	0	0	0	0	\N	\N	0	\N
175	6	Ligação	0	0	0	0	0	\N	\N	0	\N
175	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
176	a	Título da entrada principal	0	0	0	0	0	\N	\N	0	\N
176	b	Edição	0	0	0	0	0	\N	\N	0	\N
176	c	Informação qualificadora	0	0	0	0	0	\N	\N	0	\N
176	d	Lugar, editor, e data de publicação	0	0	0	0	0	\N	\N	0	\N
176	g	Informação de relação	1	0	0	0	0	\N	\N	0	\N
176	i	Exibir texto	0	0	0	0	0	\N	\N	0	\N
176	h	Descrição física	0	0	0	0	0	\N	\N	0	\N
176	k	Dado de série para item relacionado	1	0	0	0	0	\N	\N	0	\N
176	m	Detalhes específicos do material	0	0	0	0	0	\N	\N	0	\N
176	n	Nota	1	0	0	0	0	\N	\N	0	\N
176	o	Outro identificador de item	1	0	0	0	0	\N	\N	0	\N
176	q	Título paralelo (BK SE)	0	0	0	0	1	\N	\N	0	\N
176	r	Número de relatório	1	0	0	0	0	\N	\N	0	\N
176	s	Título uniforme	0	0	0	0	0	\N	\N	0	\N
176	t	Título	0	0	0	0	0	\N	\N	0	\N
176	u	Standard Technical Report Number	0	0	0	0	0	\N	\N	0	\N
176	w	Número de controle do registro	1	0	0	0	0	\N	\N	0	\N
176	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
176	z	ISBN - International Standard Book Number	1	0	0	0	0	\N	\N	0	\N
176	y	Designação CODEN	0	0	0	0	0	\N	\N	0	\N
176	6	Ligação	0	0	0	0	0	\N	\N	0	\N
176	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
177	a	Título da entrada principal	0	0	0	0	0	\N	\N	0	\N
177	b	Edição	0	0	0	0	0	\N	\N	0	\N
177	c	Informação qualificadora	0	0	0	0	0	\N	\N	0	\N
177	d	Lugar, editor, e data de publicação	0	0	0	0	0	\N	\N	0	\N
177	g	Informação de relação	1	0	0	0	0	\N	\N	0	\N
177	i	Exibir texto	0	0	0	0	0	\N	\N	0	\N
177	h	Descrição física da fonte	0	0	0	0	0	\N	\N	0	\N
177	j	Período do conteúdo	0	0	0	0	0	\N	\N	0	\N
177	k	Dado de série para item relacionado	1	0	0	0	0	\N	\N	0	\N
177	m	Detalhes específicos do material	0	0	0	0	0	\N	\N	0	\N
177	n	Nota	1	0	0	0	0	\N	\N	0	\N
177	o	Outro identificador de item	1	0	0	0	0	\N	\N	0	\N
177	r	Número de relatório	1	0	0	0	0	\N	\N	0	\N
177	s	Título uniforme	0	0	0	0	0	\N	\N	0	\N
177	t	Título	0	0	0	0	0	\N	\N	0	\N
177	u	Standard Technical Report Number	0	0	0	0	0	\N	\N	0	\N
177	v	Contribuição da fonte	0	0	0	0	0	\N	\N	0	\N
177	w	Número de controle do registro	1	0	0	0	0	\N	\N	0	\N
177	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
177	z	ISBN - International Standard Book Number	1	0	0	0	0	\N	\N	0	\N
177	y	Designação CODEN	0	0	0	0	0	\N	\N	0	\N
177	6	Ligação	0	0	0	0	0	\N	\N	0	\N
177	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
178	a	Título da entrada principal	0	0	0	0	0	\N	\N	0	\N
178	b	Edição	0	0	0	0	0	\N	\N	0	\N
178	c	Informação qualificadora	0	0	0	0	0	\N	\N	0	\N
178	d	Lugar, editor, e data de publicação	0	0	0	0	0	\N	\N	0	\N
178	g	Informação de relação	1	0	0	0	0	\N	\N	0	\N
178	i	Exibir texto	0	0	0	0	0	\N	\N	0	\N
178	h	Descrição física da fonte	0	0	0	0	0	\N	\N	0	\N
178	k	Dado de série para item relacionado	1	0	0	0	0	\N	\N	0	\N
178	m	Detalhes específicos do material	0	0	0	0	0	\N	\N	0	\N
178	n	Nota	1	0	0	0	0	\N	\N	0	\N
178	o	Outro identificador de item	1	0	0	0	0	\N	\N	0	\N
178	q	Título paralelo (BK SE)	0	0	0	0	1	\N	\N	0	\N
178	r	Número de relatório	1	0	0	0	0	\N	\N	0	\N
178	s	Título uniforme	0	0	0	0	0	\N	\N	0	\N
178	t	Título	0	0	0	0	0	\N	\N	0	\N
178	u	Standard Technical Report Number	0	0	0	0	0	\N	\N	0	\N
178	w	Número de controle do registro	1	0	0	0	0	\N	\N	0	\N
178	x	ISSN - International Standard Serial Number	0	0	0	0	0	\N	\N	0	\N
178	z	ISBN - International Standard Book Number	1	0	0	0	0	\N	\N	0	\N
178	y	Designação CODEN	0	0	0	0	0	\N	\N	0	\N
178	6	Ligação	0	0	0	0	0	\N	\N	0	\N
178	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
179	a	Nome pessoal	0	0	0	0	0	\N	\N	0	\N
179	b	Numeração	0	0	0	0	0	\N	\N	0	\N
179	c	Títulos e outras palavras associadas ao nome	1	0	0	0	0	\N	\N	0	\N
179	d	Datas associadas ao nome	0	0	0	0	0	\N	\N	0	\N
179	e	Termo relacionador	1	0	0	0	0	\N	\N	0	\N
179	f	Data da obra	0	0	0	0	0	\N	\N	0	\N
179	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
179	h	Meio físico	0	0	0	0	0	\N	\N	0	\N
179	k	Subcabeçalho	1	0	0	0	0	\N	\N	0	\N
179	l	Idioma da obra	0	0	0	0	0	\N	\N	0	\N
179	m	Meio de apresentação para música	1	0	0	0	0	\N	\N	0	\N
179	n	Número de parte / seção da obra	1	0	0	0	0	\N	\N	0	\N
179	o	Informação de arranjo para música	0	0	0	0	0	\N	\N	0	\N
179	p	Nome de parte / seção da obra	1	0	0	0	0	\N	\N	0	\N
179	q	Forma completa do nome	0	0	0	0	0	\N	\N	0	\N
179	r	Chave para música	0	0	0	0	0	\N	\N	0	\N
179	s	Versão	0	0	0	0	0	\N	\N	0	\N
179	t	Título da obra	0	0	0	0	0	\N	\N	0	\N
179	u	Afiliação	0	0	0	0	0	\N	\N	0	\N
179	v	Designação de volume / seqüência	0	0	0	0	0	\N	\N	0	\N
179	4	Código relacionador	1	0	0	0	0	\N	\N	0	\N
179	6	Ligação	0	0	0	0	0	\N	\N	0	\N
179	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
180	a	Nome corporativo ou jurisdição como entrada	0	0	0	0	0	\N	\N	0	\N
180	b	Unidade subordinada	1	0	0	0	0	\N	\N	0	\N
180	c	Local do evento	0	0	0	0	0	\N	\N	0	\N
180	d	Data do evento ou assinatura do tratado	1	0	0	0	0	\N	\N	0	\N
180	e	Termo relacionador	1	0	0	0	0	\N	\N	0	\N
180	f	Data da obra	0	0	0	0	0	\N	\N	0	\N
180	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
180	h	Meio físico	0	0	0	0	0	\N	\N	0	\N
180	k	Subcabeçalho	1	0	0	0	0	\N	\N	0	\N
180	l	Idioma da obra	0	0	0	0	0	\N	\N	0	\N
180	m	Meio de apresentação para música	1	0	0	0	0	\N	\N	0	\N
180	n	Número de parte / seção / evento	1	0	0	0	0	\N	\N	0	\N
180	o	Informações de arranjo para música	0	0	0	0	0	\N	\N	0	\N
180	p	Nome de parte / seção / evento	1	0	0	0	0	\N	\N	0	\N
180	r	Chave para música	0	0	0	0	0	\N	\N	0	\N
180	s	Versão	0	0	0	0	0	\N	\N	0	\N
180	t	Título da obra	0	0	0	0	0	\N	\N	0	\N
180	u	Afiliação	0	0	0	0	0	\N	\N	0	\N
180	v	Designação de volume / seqüência	0	0	0	0	0	\N	\N	0	\N
180	4	Código relacionador	1	0	0	0	0	\N	\N	0	\N
180	6	Ligação	0	0	0	0	0	\N	\N	0	\N
180	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
181	a	Nome do evento ou jurisdição como entrada	0	0	0	0	0	\N	\N	0	\N
181	b	Número (BK CF MP MU SE VM MX)	0	0	0	0	1	\N	\N	0	\N
181	c	Local do evento	0	0	0	0	0	\N	\N	0	\N
181	d	Data do evento	0	0	0	0	0	\N	\N	0	\N
181	e	Unidade subordinada	1	0	0	0	0	\N	\N	0	\N
181	f	Data da obra	0	0	0	0	0	\N	\N	0	\N
181	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
181	h	Meio físico	0	0	0	0	0	\N	\N	0	\N
181	k	Subcabeçalho	1	0	0	0	0	\N	\N	0	\N
181	l	Idioma da obra	0	0	0	0	0	\N	\N	0	\N
181	n	Número de parte / seção / evento	1	0	0	0	0	\N	\N	0	\N
181	p	Nome de parte / seção / evento	1	0	0	0	0	\N	\N	0	\N
181	q	Nome do evento que segue nome da jurisdição na entrada	0	0	0	0	0	\N	\N	0	\N
181	s	Versão	0	0	0	0	0	\N	\N	0	\N
181	t	Título da obra	0	0	0	0	0	\N	\N	0	\N
181	u	Afiliação	0	0	0	0	0	\N	\N	0	\N
181	v	Designação de volume / seqüência	0	0	0	0	0	\N	\N	0	\N
181	4	Código relacionador	1	0	0	0	0	\N	\N	0	\N
181	6	Ligação	0	0	0	0	0	\N	\N	0	\N
181	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
182	a	Título uniforme	0	0	0	0	0	\N	\N	0	\N
182	d	Data da assinatura do tratado	1	0	0	0	0	\N	\N	0	\N
182	f	Data da obra	1	0	0	0	0	\N	\N	0	\N
182	g	Miscelânea	0	0	0	0	0	\N	\N	0	\N
182	h	Meio físico	0	0	0	0	0	\N	\N	0	\N
182	k	Subcabeçalho	1	0	0	0	0	\N	\N	0	\N
182	l	Idioma da obra	0	0	0	0	0	\N	\N	0	\N
182	m	Meio da apresentação para música	1	0	0	0	0	\N	\N	0	\N
182	n	Número de parte / seção da obra	1	0	0	0	0	\N	\N	0	\N
182	o	Informação de arranjo para música	0	0	0	0	0	\N	\N	0	\N
182	p	Nome de parte / seção da obra	1	0	0	0	0	\N	\N	0	\N
182	r	Chave para música	0	0	0	0	0	\N	\N	0	\N
182	s	Versão	0	0	0	0	0	\N	\N	0	\N
182	t	Título da obra	0	0	0	0	0	\N	\N	0	\N
182	v	Designação de volume / seqüência	0	0	0	0	0	\N	\N	0	\N
182	6	Ligação	0	0	0	0	0	\N	\N	0	\N
182	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
183	a	Tipo de registro	0	0	0	0	0	\N	\N	0	\N
183	b	Elementos de dados de tamanho fixo	0	0	0	0	0	\N	\N	0	\N
183	e	Nível de catalogação	0	0	0	0	0	\N	\N	0	\N
184	a	Designação textual de forma física	0	0	0	0	0	\N	\N	0	\N
185	a	Tipo de reprodução	0	0	0	0	0	\N	\N	0	\N
185	b	Lugar de reprodução	1	0	0	0	0	\N	\N	0	\N
185	c	Instituição responsável pela reprodução	1	0	0	0	0	\N	\N	0	\N
185	d	Data da reprodução	0	0	0	0	0	\N	\N	0	\N
185	e	Descrição física da reprodução	0	0	0	0	0	\N	\N	0	\N
185	f	Informação de séries de reprodução	1	0	0	0	0	\N	\N	0	\N
185	m	Datas de publicação e / ou indicação de seqüência de edições reproduzidas	1	0	0	0	0	\N	\N	0	\N
185	n	Notas sobre reprodução	1	0	0	0	0	\N	\N	0	\N
185	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
186	a	Nome da unidade	0	0	0	0	0	\N	\N	0	\N
187	a	Termos reguladores de uso e reprodução	0	0	0	0	0	\N	\N	0	\N
187	b	Jurisdição	0	0	0	0	0	\N	\N	0	\N
187	c	Autorização	0	0	0	0	0	\N	\N	0	\N
187	d	Usuários autorizados	0	0	0	0	0	\N	\N	0	\N
187	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
188	a	Instituição depositária	1	0	0	0	0	\N	\N	0	\N
188	b	Holdings (Coleção) (MU VM SE)	0	0	0	0	1	\N	\N	0	\N
188	d	Datas abrangentes (MU VM SE)	0	0	0	0	1	\N	\N	0	\N
188	e	Informação de memória (CF MU VM SE)	0	0	0	0	1	\N	\N	0	\N
188	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
189	b	sub-localização ou coleção	1	0	0	0	0	\N	\N	0	\N
189	c	Localização na prateleira	1	0	0	0	0	\N	\N	0	\N
189	e	Endereço	1	0	0	0	0	\N	\N	0	\N
189	g	Atributo de localização não codificado	1	0	0	0	0	\N	\N	0	\N
189	h	Parte referente à classificação	0	0	0	0	0	\N	\N	0	\N
189	i	Parte referente ao item	1	0	0	0	0	\N	\N	0	\N
189	j	Número de controle na estante	0	0	0	0	0	\N	\N	0	\N
189	k	Prefixo do número de chamada	1	0	0	0	0	\N	\N	0	\N
189	l	Forma do título na estante	0	0	0	0	0	\N	\N	0	\N
189	m	Sufixo do número de chamada	1	0	0	0	0	\N	\N	0	\N
189	n	Código de país	0	0	0	0	0	\N	\N	0	\N
189	p	Designação do item	0	0	0	0	0	\N	\N	0	\N
189	q	Condição física do item	0	0	0	0	0	\N	\N	0	\N
189	s	Código de taxa de copyright	1	0	0	0	0	\N	\N	0	\N
189	t	Número de cópia	0	0	0	0	0	\N	\N	0	\N
189	x	Nota interna	1	0	0	0	0	\N	\N	0	\N
189	z	Nota pública	1	0	0	0	0	\N	\N	0	\N
189	2	Fonte da classificação ou esquema na prateleira	0	0	0	0	0	\N	\N	0	\N
189	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
189	6	Ligação	0	0	0	0	0	\N	\N	0	\N
189	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
189	a	Localização	0	0	0	0	0	\N	\N	0	\N
190	a	Primeiro nível de enumeração	0	0	0	0	0	\N	\N	0	\N
190	b	Segundo nível de enumeração	0	0	0	0	0	\N	\N	0	\N
190	c	Terceiro nível de enumeração	0	0	0	0	0	\N	\N	0	\N
190	d	Quarto nível de enumeração	0	0	0	0	0	\N	\N	0	\N
190	e	Quinto nível de enumeração	0	0	0	0	0	\N	\N	0	\N
190	f	Sexto nível de enumeração	0	0	0	0	0	\N	\N	0	\N
190	g	Esquema de numeração altenativo, Primeiro nível de enumeração	0	0	0	0	0	\N	\N	0	\N
190	h	Esquema de numeração altenativo, Segundo nível de enumeração	0	0	0	0	0	\N	\N	0	\N
190	i	Primeiro nível de cronologia	0	0	0	0	0	\N	\N	0	\N
190	j	Segundo nível de cronologia	0	0	0	0	0	\N	\N	0	\N
190	k	Terceiro nível de cronologia	0	0	0	0	0	\N	\N	0	\N
190	l	Quarto nível de cronologia	0	0	0	0	0	\N	\N	0	\N
190	m	Esquema de numeração alternativo, cronologia	0	0	0	0	0	\N	\N	0	\N
190	t	Cópia	0	0	0	0	0	\N	\N	0	\N
190	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
190	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
191	a	Primeiro nível de enumeração	0	0	0	0	0	\N	\N	0	\N
191	b	Segundo nível de enumeração	0	0	0	0	0	\N	\N	0	\N
191	c	Terceiro nível de enumeração	0	0	0	0	0	\N	\N	0	\N
191	d	Quarto nível de enumeração	0	0	0	0	0	\N	\N	0	\N
191	e	Quinto nível de enumeração	0	0	0	0	0	\N	\N	0	\N
191	f	Sexto nível de enumeração	0	0	0	0	0	\N	\N	0	\N
191	g	Esquema de numeração alternativa, Primeiro nível de enumeração	0	0	0	0	0	\N	\N	0	\N
191	h	Esquema de numeração alternativa, Segundo nível de enumeração	0	0	0	0	0	\N	\N	0	\N
191	i	Primeiro nível de cronologia	0	0	0	0	0	\N	\N	0	\N
191	j	Sgundo nível de cronologia	0	0	0	0	0	\N	\N	0	\N
191	k	Terceiro nível de cronologia	0	0	0	0	0	\N	\N	0	\N
191	l	Quarto nível de cronologia	0	0	0	0	0	\N	\N	0	\N
191	m	Esquema de numeração alternativa, cronologia	0	0	0	0	0	\N	\N	0	\N
191	o	Tipo de material suplementar	0	0	0	0	0	\N	\N	0	\N
191	t	Reprodução	0	0	0	0	0	\N	\N	0	\N
191	u	Unidade bibliográfica para o próximo nível	1	0	0	0	0	\N	\N	0	\N
191	v	Continuidade da numeração	1	0	0	0	0	\N	\N	0	\N
191	w	Freqüência	0	0	0	0	0	\N	\N	0	\N
191	x	Mudança no calendário	0	0	0	0	0	\N	\N	0	\N
191	y	Padrão de regularidade	0	0	0	0	0	\N	\N	0	\N
191	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
191	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
192	a	Primeiro nível de enumeração	0	0	0	0	0	\N	\N	0	\N
192	b	Segundo nível de enumeração	0	0	0	0	0	\N	\N	0	\N
192	c	Terceiro nível de enumeração	0	0	0	0	0	\N	\N	0	\N
192	d	Quarto nível de enumeração	0	0	0	0	0	\N	\N	0	\N
192	e	Quinto nível de enumeração	0	0	0	0	0	\N	\N	0	\N
192	f	Sexto nível de enumeração	0	0	0	0	0	\N	\N	0	\N
192	g	Esquema de numeração alternativa, Primeiro nível de enumeração	0	0	0	0	0	\N	\N	0	\N
192	h	Esquema de numeração alternativa, Segundo nível de enumeração	0	0	0	0	0	\N	\N	0	\N
192	i	Primeiro nível de cronologia	0	0	0	0	0	\N	\N	0	\N
192	j	Segundo nível de cronologia	0	0	0	0	0	\N	\N	0	\N
192	k	Terceiro nível de cronologia	0	0	0	0	0	\N	\N	0	\N
192	l	Quarto nível de cronologia	0	0	0	0	0	\N	\N	0	\N
192	m	Esquema de numeração alternativa, cronologia	0	0	0	0	0	\N	\N	0	\N
192	o	Tipo de índice	0	0	0	0	0	\N	\N	0	\N
192	t	Reprodução	0	0	0	0	0	\N	\N	0	\N
192	u	Unidade bibliográfica para o próximo nível	1	0	0	0	0	\N	\N	0	\N
192	v	Continuidade da numeração	1	0	0	0	0	\N	\N	0	\N
192	x	Mudança no calendário	0	0	0	0	0	\N	\N	0	\N
192	y	Padrão de regularidade	0	0	0	0	0	\N	\N	0	\N
192	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
192	6	Ligação	0	0	0	0	0	\N	\N	0	\N
192	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
192	w	Freqüência	0	0	0	0	0	\N	\N	0	\N
193	a	Nome do servidor	1	0	0	0	0	\N	\N	0	\N
193	b	Número de acesso	0	0	0	0	0	\N	\N	0	\N
193	c	Informação de compressão	1	0	0	0	0	\N	\N	0	\N
193	d	Caminho	1	0	0	0	0	\N	\N	0	\N
193	f	Nome eletrônico	1	0	0	0	0	\N	\N	0	\N
193	g	Nome uniforme da fonte	1	0	0	0	0	\N	\N	0	\N
193	h	Processador de pesquisa	0	0	0	0	0	\N	\N	0	\N
193	i	Instrução	1	0	0	0	0	\N	\N	0	\N
193	j	Bits por segundo	0	0	0	0	0	\N	\N	0	\N
193	k	Password (Senha)	0	0	0	0	0	\N	\N	0	\N
193	L	Logon / login	0	0	0	0	0	\N	\N	0	\N
193	m	Contato para acessar a ajuda	1	0	0	0	0	\N	\N	0	\N
193	n	Nome do local do servidor no subcampoaux $a	0	0	0	0	0	\N	\N	0	\N
193	p	Porta	0	0	0	0	0	\N	\N	0	\N
193	q	Tipo de formato eletrônico	0	0	0	0	0	\N	\N	0	\N
193	r	Ambiente	0	0	0	0	0	\N	\N	0	\N
193	s	Tamanho do arquivo	1	0	0	0	0	\N	\N	0	\N
193	t	Simulação de terminal	1	0	0	0	0	\N	\N	0	\N
193	u	Iidentificador uniforme de recursos	1	0	0	0	0	\N	\N	0	\N
193	v	Método de avaliação das horas de acesso	1	0	0	0	0	\N	\N	0	\N
193	w	Número de controle do registro	1	0	0	0	0	\N	\N	0	\N
193	x	Nota interna	1	0	0	0	0	\N	\N	0	\N
193	z	Nota pública	1	0	0	0	0	\N	\N	0	\N
193	2	Método de acesso	0	0	0	0	0	\N	\N	0	\N
193	3	Materiais especificados	0	0	0	0	0	\N	\N	0	\N
193	6	Ligação	0	0	0	0	0	\N	\N	0	\N
193	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
193	o	Sistema operacional	0	0	0	0	0	\N	\N	0	\N
194	a	Primeiro nível de enumeração	0	0	0	0	0	\N	\N	0	\N
194	b	Segundo nível de enumeração	0	0	0	0	0	\N	\N	0	\N
194	c	Terceiro nível de enumeração	0	0	0	0	0	\N	\N	0	\N
194	d	Quarto nível de enumeração	0	0	0	0	0	\N	\N	0	\N
194	e	Quinto nível de enumeração	0	0	0	0	0	\N	\N	0	\N
194	f	Sexto nível de enumeração	0	0	0	0	0	\N	\N	0	\N
194	g	Esquema alternativo de numeração, primeiro nível de enumeração	0	0	0	0	0	\N	\N	0	\N
194	h	Esquema alternativo de numeração, segundo nível de enumeração	0	0	0	0	0	\N	\N	0	\N
194	i	Primeiro nível de cronologia	0	0	0	0	0	\N	\N	0	\N
194	j	Segundo nível de cronologia	0	0	0	0	0	\N	\N	0	\N
194	k	Terceiro nível de cronologia	0	0	0	0	0	\N	\N	0	\N
194	l	Quarto nível de cronologia	0	0	0	0	0	\N	\N	0	\N
194	m	Esquema de numeração alternativa, cronologia	0	0	0	0	0	\N	\N	0	\N
194	n	Ano Gregoriano convertido	0	0	0	0	0	\N	\N	0	\N
194	p	Designação da parte	0	0	0	0	0	\N	\N	0	\N
194	q	Condição física da parte	0	0	0	0	0	\N	\N	0	\N
194	s	Código de taxa de copyright	1	0	0	0	0	\N	\N	0	\N
194	t	Número do exemplar	0	0	0	0	0	\N	\N	0	\N
194	w	Indicador de interrupção	0	0	0	0	0	\N	\N	0	\N
194	x	Nota interna	1	0	0	0	0	\N	\N	0	\N
194	z	Nota pública	1	0	0	0	0	\N	\N	0	\N
194	3	Data do primeiro fascículo em seqüência	1	0	0	0	0	\N	\N	0	\N
194	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
195	a	Primeiro nível de enumeração	0	0	0	0	0	\N	\N	0	\N
195	b	Segundo nível de enumeração	0	0	0	0	0	\N	\N	0	\N
195	c	Terceiro nível de enumeração	0	0	0	0	0	\N	\N	0	\N
195	d	Quarto nível de enumeração	0	0	0	0	0	\N	\N	0	\N
195	e	Quinto nível de enumeração	0	0	0	0	0	\N	\N	0	\N
195	f	Sexto nível de enumeração	0	0	0	0	0	\N	\N	0	\N
195	g	Esquema de numeração alternativa, primeiro nível de enumeração	0	0	0	0	0	\N	\N	0	\N
195	h	Esquema de numeração alternativa, segundo nível de enumeração	0	0	0	0	0	\N	\N	0	\N
195	i	Primeiro nível de cronologia	0	0	0	0	0	\N	\N	0	\N
195	j	Segundo nível de cronologia	0	0	0	0	0	\N	\N	0	\N
195	k	Terceiro nível de cronologia	0	0	0	0	0	\N	\N	0	\N
195	l	Quarto nível de cronologia	0	0	0	0	0	\N	\N	0	\N
195	m	Esquema de numeração alternativa, cronologia	0	0	0	0	0	\N	\N	0	\N
195	n	Ano Gregoriano convertido	0	0	0	0	0	\N	\N	0	\N
195	o	Título do material suplementar	0	0	0	0	0	\N	\N	0	\N
195	p	Designação da parte	0	0	0	0	0	\N	\N	0	\N
195	q	Condição física da parte	0	0	0	0	0	\N	\N	0	\N
195	s	Código de taxa de copyright	1	0	0	0	0	\N	\N	0	\N
195	t	Número de exemplar	0	0	0	0	0	\N	\N	0	\N
195	w	Indicador de interrupção	0	0	0	0	0	\N	\N	0	\N
195	x	Nota interna	1	0	0	0	0	\N	\N	0	\N
195	z	Nota pública	1	0	0	0	0	\N	\N	0	\N
195	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
196	a	Primeiro nível de enumeração	0	0	0	0	0	\N	\N	0	\N
196	b	Segundo nível de enumeração	0	0	0	0	0	\N	\N	0	\N
196	c	Terceiro nível de enumeração	0	0	0	0	0	\N	\N	0	\N
196	d	Quarto nível de enumeração	0	0	0	0	0	\N	\N	0	\N
196	e	Quinto nível de enumeração	0	0	0	0	0	\N	\N	0	\N
196	f	Sexto nível de enumeração	0	0	0	0	0	\N	\N	0	\N
196	g	Esquema de numeração alternativa, primeiro nível de enumeração	0	0	0	0	0	\N	\N	0	\N
196	h	Esquema de numeração alternativa, segundo nível de enumeração	0	0	0	0	0	\N	\N	0	\N
196	i	Primeiro nível de cronologia	0	0	0	0	0	\N	\N	0	\N
196	j	Segundo nível de cronologia	0	0	0	0	0	\N	\N	0	\N
196	k	Terceiro nível de cronologia	0	0	0	0	0	\N	\N	0	\N
196	l	Quarto nível de cronologia	0	0	0	0	0	\N	\N	0	\N
196	m	Esquema de numeração alternativa, cronologia	0	0	0	0	0	\N	\N	0	\N
196	n	Ano gregoriano convertido	0	0	0	0	0	\N	\N	0	\N
196	o	Título do índice	0	0	0	0	0	\N	\N	0	\N
196	p	Designação da parte	0	0	0	0	0	\N	\N	0	\N
196	q	Condição física da parte	0	0	0	0	0	\N	\N	0	\N
196	s	Código de taxa de copyright	1	0	0	0	0	\N	\N	0	\N
196	t	Número do exemplar	0	0	0	0	0	\N	\N	0	\N
196	w	indicador de interrupção	0	0	0	0	0	\N	\N	0	\N
196	x	Nota interna	1	0	0	0	0	\N	\N	0	\N
196	z	Nota pública	1	0	0	0	0	\N	\N	0	\N
196	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
197	a	Seqüência textual	0	0	0	0	0	\N	\N	0	\N
197	x	Nota interna	1	0	0	0	0	\N	\N	0	\N
197	z	Nota pública	1	0	0	0	0	\N	\N	0	\N
197	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
198	a	Holdings textual	0	0	0	0	0	\N	\N	0	\N
198	x	Nota interna	1	0	0	0	0	\N	\N	0	\N
198	z	Nota pública	1	0	0	0	0	\N	\N	0	\N
198	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
199	a	Holdings textual	0	0	0	0	0	\N	\N	0	\N
199	x	Nota interna	1	0	0	0	0	\N	\N	0	\N
199	z	Nota pública	1	0	0	0	0	\N	\N	0	\N
199	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
200	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
200	a	Número do item interno	0	0	0	0	0	\N	\N	0	\N
200	b	Número inválido ou cancelado do item interno	1	0	0	0	0	\N	\N	0	\N
200	c	Preço	1	0	0	0	0	\N	\N	0	\N
200	d	Data de aquisição	1	0	0	0	0	\N	\N	0	\N
200	e	Fonte de aquisição	1	0	0	0	0	\N	\N	0	\N
200	h	Restrição de uso	1	0	0	0	0	\N	\N	0	\N
200	j	Status do item	1	0	0	0	0	\N	\N	0	\N
200	l	Localização temporária	1	0	0	0	0	\N	\N	0	\N
200	p	Designação da parte	1	0	0	0	0	\N	\N	0	\N
200	r	Designação da parte inválida ou cancelada	1	0	0	0	0	\N	\N	0	\N
200	t	Número do exemplar	1	0	0	0	0	\N	\N	0	\N
200	x	Nota interna	1	0	0	0	0	\N	\N	0	\N
200	z	Nota pública	1	0	0	0	0	\N	\N	0	\N
200	3	Especificação dos materiais	0	0	0	0	0	\N	\N	0	\N
201	c	Preço	1	0	0	0	0	\N	\N	0	\N
201	a	Número do item interno	0	0	0	0	0	\N	\N	0	\N
201	b	Número inválido ou cancelado do item interno	1	0	0	0	0	\N	\N	0	\N
201	d	Data da aquisição	1	0	0	0	0	\N	\N	0	\N
201	e	Fonte da aquisição	1	0	0	0	0	\N	\N	0	\N
201	h	Restrição de uso	1	0	0	0	0	\N	\N	0	\N
201	j	Status do item	1	0	0	0	0	\N	\N	0	\N
201	l	Localização temporária	1	0	0	0	0	\N	\N	0	\N
201	p	Designação da parte	1	0	0	0	0	\N	\N	0	\N
201	r	Designação da parte inválida ou cancelada	1	0	0	0	0	\N	\N	0	\N
201	t	Número do exemplar	0	0	0	0	0	\N	\N	0	\N
201	x	Nota interna	1	0	0	0	0	\N	\N	0	\N
201	z	Nota pública	1	0	0	0	0	\N	\N	0	\N
201	3	Especificação dos materiais	0	0	0	0	0	\N	\N	0	\N
201	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
202	a	Número do item interno	0	0	0	0	0	\N	\N	0	\N
202	b	Número inválido ou cancelado do item interno	1	0	0	0	0	\N	\N	0	\N
202	c	Preço	1	0	0	0	0	\N	\N	0	\N
202	d	Data da aquisição	1	0	0	0	0	\N	\N	0	\N
202	e	Fonte de aquisição	1	0	0	0	0	\N	\N	0	\N
202	h	Restrições de uso	1	0	0	0	0	\N	\N	0	\N
202	j	Status do item	1	0	0	0	0	\N	\N	0	\N
202	l	Localização temporária	1	0	0	0	0	\N	\N	0	\N
202	p	Designação da parte	1	0	0	0	0	\N	\N	0	\N
202	r	Designação inválida ou cancelada da parte	1	0	0	0	0	\N	\N	0	\N
202	t	Número do exemplar	0	0	0	0	0	\N	\N	0	\N
202	x	Nota interna	1	0	0	0	0	\N	\N	0	\N
202	z	Nota pública	1	0	0	0	0	\N	\N	0	\N
202	3	Especificação dos materiais	0	0	0	0	0	\N	\N	0	\N
202	8	Ligação de campo e seqüência	1	0	0	0	0	\N	\N	0	\N
203	6	Ligação	0	0	0	0	0	\N	\N	0	\N
204	a	Etiqueta do campo MARC estrangeiro	0	0	0	0	0	\N	\N	0	\N
204	b	Conteúdo do campo MARC estrangeiro	0	0	0	0	0	\N	\N	0	\N
204	2	Fonte do dado	0	0	0	0	0	\N	\N	0	\N
205	a	Numero do tombo	1	0	1	0	0	\N	\N	0	\N
205	b	Volume	1	0	1	0	0	\N	\N	0	\N
205	c	Codigo do Exemplar	1	0	0	0	0	\N	\N	0	\N
205	g	Genero	1	0	0	0	0	\N	\N	0	\N
205	h	Data de abertura	1	0	0	0	0	\N	\N	0	\N
205	i	Data de atualização	1	0	0	0	0	\N	\N	0	\N
205	j	Coleção	1	0	0	0	0	\N	\N	0	\N
205	k	Nota OPAC	1	0	0	0	0	\N	\N	0	\N
205	l	Nota CIRC	1	0	0	0	0	\N	\N	0	\N
205	m	Operador de abertura	1	0	0	0	0	\N	\N	0	\N
205	n	Operador de atualização	1	0	0	0	0	\N	\N	0	\N
205	f	Preço	1	0	0	0	0	\N	\N	0	\N
205	d	Nota Interna	1	0	0	0	0	\N	\N	0	\N
205	o	Código do Estado	1	0	0	0	0	\N	\N	0	\N
205	e	Código da Unidade	1	0	0	0	0	\N	\N	0	\N
206	a	Tipo de Material	0	0	1	0	0	\N	\N	0	\N
207	a	Gênero	0	0	0	0	0	\N	\N	0	\N
208	a	Base de Dados	0	0	0	0	0	\N	\N	0	\N
209	a	Local	0	0	0	0	0	\N	\N	0	\N
210	a	Catalogador	1	0	0	0	0	\N	\N	0	\N
210	c	Data	1	0	0	0	0	\N	\N	0	\N
210	h	Hora	1	0	0	0	0	\N	\N	0	\N
154	f	Data da obra	0	0	0	0	0	\N	\N	0	\N
154	t	Título da obra	0	0	0	0	0	\N	\N	0	\N
193	l	Logon/login	0	0	0	0	0	\N	\N	0	\N
193	y	Texto de ligação	1	0	0	0	0	\N	\N	0	\N
\.



--
-- Data for Name: bt_transicao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_transicao (idestadopresente, idestadofuturo, idoperacao) FROM stdin;
\.


--
-- Data for Name: bt_unidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_unidade (idunidade, descricao, mnemonico, idsetor) FROM stdin;
38	Biblioteca Central	1	\N
\.


--
-- Data for Name: bt_usuarioexterno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_usuarioexterno (idusuario, numrg, nome, telefone, endereco, bairro, cep, idmunicipio, datanasc) FROM stdin;
\.


--
-- Data for Name: bt_validacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_validacao (idvalidacao, dtvalidacao, dtvalidacaoant, codigoacesso, idusuario, usuario_temp) FROM stdin;
\.


--
-- Data for Name: bt_vinculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_vinculo (idgrupo, idusuario, usuario_temp) FROM stdin;
\.

--
-- Data for Name: bt_camposubficha; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_camposubficha (idficha, idsubficha, idetiqueta, subcampo, ordem) FROM stdin;
1	5	14	a	1
1	5	27	a	1
1	5	28	a	1
1	5	28	h	2
1	5	30	a	1
1	5	32	a	1
1	5	53	c	3
1	5	47	a	1
1	5	53	a	1
1	5	53	b	2
1	5	53	d	4
1	5	53	q	5
1	5	54	a	1
1	5	54	b	2
1	5	54	c	5
1	5	65	a	1
1	5	54	d	4
1	5	54	n	3
1	5	55	a	1
1	5	55	c	4
1	5	55	d	3
1	5	55	n	2
1	5	56	a	1
1	5	56	d	1
1	5	56	f	1
1	5	56	l	1
1	5	56	n	1
1	5	70	a	1
1	5	56	p	1
1	5	59	a	1
1	5	59	d	1
1	5	59	k	1
1	5	59	l	1
1	5	62	a	1
1	5	62	b	2
1	5	62	c	3
1	5	62	h	4
1	5	70	b	2
1	5	70	c	3
1	5	75	a	1
1	5	75	b	2
1	5	75	c	3
1	5	75	e	4
1	5	92	a	1
1	5	92	v	2
1	5	93	a	1
1	5	95	a	1
1	5	96	a	1
1	5	97	a	1
1	5	97	r	1
1	5	139	a	1
1	5	140	a	1
1	5	140	b	2
1	5	140	c	3
1	5	140	d	4
1	5	140	q	5
1	5	140	t	6
1	5	140	x	7
1	5	140	y	8
1	5	140	z	9
1	5	141	b	2
1	5	142	a	1
1	5	141	n	3
1	5	141	d	4
1	5	142	n	2
1	5	142	d	3
1	5	142	c	4
1	5	142	g	5
1	5	143	a	1
1	5	143	d	1
1	5	143	k	1
1	5	143	p	1
1	5	143	x	1
1	5	143	y	1
1	5	144	a	1
1	5	144	x	2
1	5	144	y	3
1	5	144	z	4
1	5	145	a	1
1	5	145	x	2
1	5	145	y	3
1	5	145	z	4
1	5	153	a	1
1	5	153	x	2
1	5	153	y	3
1	5	153	z	4
1	5	154	a	1
1	5	154	b	2
1	5	154	c	3
1	5	154	d	4
1	5	154	e	5
1	5	154	q	6
1	5	154	t	7
1	5	155	a	1
1	5	155	b	2
1	5	155	c	3
1	5	155	n	5
1	5	156	a	1
1	5	156	c	4
1	5	156	d	3
1	5	156	n	2
1	5	158	a	1
1	5	158	d	1
1	5	158	f	1
1	5	158	l	1
1	5	158	n	1
1	5	158	p	1
1	5	159	a	1
1	5	170	a	1
1	5	170	b	1
1	5	170	d	1
1	5	170	g	1
1	5	170	s	1
1	5	170	t	1
1	5	170	w	1
1	5	189	a	1
1	5	189	b	2
1	5	189	c	3
1	5	207	a	1
1	5	155	d	4
1	5	54	l	6
1	5	55	g	5
1	5	141	c	5
1	5	141	t	6
1	5	141	k	7
1	5	141	l	8
1	5	141	x	9
1	5	143	z	1
1	5	141	a	1
1	5	141	y	10
1	5	141	z	11
1	5	63	b	2
1	5	193	a	1
1	5	193	b	2
1	5	193	c	3
1	5	193	d	4
1	5	193	f	5
1	5	193	h	6
1	5	193	i	7
1	5	193	j	8
1	5	193	k	9
1	5	193	l	10
1	5	193	m	11
1	5	193	n	12
1	5	193	o	13
1	5	193	p	14
1	5	193	q	15
1	5	193	r	16
1	5	193	s	17
1	5	193	t	18
1	5	193	u	19
1	5	193	v	20
1	5	193	w	21
1	5	193	x	22
1	5	193	y	23
1	5	193	z	24
1	5	193	2	25
1	5	193	3	26
1	5	193	6	27
1	5	193	8	28
3	9	14	a	1
3	9	27	a	1
3	9	28	a	1
3	9	47	a	1
3	9	53	a	1
3	9	53	b	2
3	9	53	d	3
3	9	54	a	1
3	9	62	a	1
3	9	62	c	2
3	9	65	a	1
3	9	70	a	1
3	9	70	b	2
3	9	70	c	3
3	9	75	a	1
3	9	75	e	2
3	9	92	a	1
3	9	93	a	1
3	9	95	a	1
3	9	96	a	1
3	9	97	a	1
3	9	140	a	1
3	9	140	d	2
3	9	140	x	3
3	9	141	a	1
3	9	141	b	2
3	9	141	x	3
3	9	141	y	4
3	9	141	z	5
3	9	144	a	1
3	9	144	x	2
3	9	144	y	3
3	9	145	a	1
3	9	145	x	2
3	9	145	y	3
3	9	153	a	1
3	9	154	a	1
3	9	154	b	2
3	9	154	d	3
3	9	155	a	1
3	9	155	b	2
3	9	189	a	1
3	9	189	b	2
3	9	189	c	3
1	5	15	a	1
1	5	63	a	1
1	5	63	d	3
1	5	63	e	4
1	5	63	f	5
1	5	63	g	6
1	5	63	h	7
1	5	63	i	8
1	5	63	n	9
1	5	63	p	10
1	5	63	5	11
1	5	63	6	12
1	5	63	8	13
\.

--
-- Data for Name: bt_posicaosubficha; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bt_posicaosubficha (idetiqueta, posicao, idficha, idsubficha) FROM stdin;
1	006	1	1
1	007	1	1
1	008	1	1
1	017	1	1
1	018	1	1
1	019	1	1
7	006	1	4
1	005	1	1
7	015	1	4
7	018	1	4
7	019	1	4
7	020	1	4
7	021	1	4
7	022	1	4
7	023	1	4
7	024	1	4
7	025	1	4
7	026	1	4
7	027	1	4
7	028	1	4
7	029	1	4
7	030	1	4
7	031	1	4
7	032	1	4
7	033	1	4
7	034	1	4
7	035	1	4
7	038	1	4
7	039	1	4
7	000	1	4
7	007	1	4
7	011	1	4
5	000	1	2
5	001	1	2
5	002	1	2
5	003	1	2
5	004	1	2
5	005	1	2
5	006	1	2
5	007	1	2
5	008	1	2
5	009	1	2
5	010	1	2
5	011	1	2
5	012	1	2
5	013	1	2
5	014	1	2
5	015	1	2
5	016	1	2
5	017	1	2
\.


--
-- PostgreSQL database dump complete
--

INSERT INTO bt_ficha (idficha,categoria,nivel) VALUES (6,'CR',5);
INSERT INTO bt_genero (idgenero,descricao, idficha)  VALUES (nextval('public.seq_bt_genero'), 'PERIODICO',6); 

INSERT INTO bt_transicao VALUES (1, 5, 1);
INSERT INTO bt_transicao VALUES (1, 6, 4);
INSERT INTO bt_transicao VALUES (1, 6, 5);
INSERT INTO bt_transicao VALUES (5, 6, 4);
INSERT INTO bt_transicao VALUES (5, 6, 5);
INSERT INTO bt_transicao VALUES (5, 1, 3);
INSERT INTO bt_transicao VALUES (6, 5, 1);

INSERT INTO ga_situacao(idsituacao,situacao) Values(1,'Ativo');

INSERT INTO bt_camposubficha (idficha,idsubficha,idetiqueta,subcampo,ordem) VALUES (1,5,48, 'a',1);

INSERT INTO bt_camposubficha (idficha,idsubficha,idetiqueta,subcampo,ordem) VALUES (6,13,108, 'a',1);
