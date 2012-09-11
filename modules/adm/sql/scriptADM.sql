-- Tabelas do adm
-- ad_acessobolsa
CREATE TABLE ad_acessobolsa (
    idusuario integer NOT NULL,
    idbolsa character(3) NOT NULL
);
-- ad_acessouoreq
CREATE TABLE ad_acessouoreq (
    idusuario integer NOT NULL,
    iduo integer NOT NULL
);
-- ad_andamento; 
CREATE TABLE ad_andamento (
    numpro character varying(12) NOT NULL,
    numanda integer NOT NULL,
    stampentr character varying(12),
    stampsai character varying(12),
    stampdesp character varying(12),
    inativo character varying(1),
    setor character varying(15),
    setordest character varying(15),
    despacho character varying(400),
    autor character varying(40)
);
-- ad_bolsa;
CREATE TABLE ad_bolsa (
    idbolsa character(3) NOT NULL,
    descricao character varying(30),
    acumulavel character(1),
    paga character(1),
    fontepag character varying(40)
);
-- ad_bolsista;
CREATE TABLE ad_bolsista (
    idbolsista integer NOT NULL,
    datainclusao character(10),
    dataexclusao character(10),
    horasprevistas integer,
    dataalt character(10),
    idbolsa character(3),
    idpessoa integer
);
-- ad_catmat; 
CREATE TABLE ad_catmat (
    codmaterial integer NOT NULL,
    nomematerial character varying(80),
    grupomaterial integer,
    nomegrupomaterial character varying(80),
    classematerial integer,
    nomeclassematerial character varying(80)
);
-- ad_classificador;
CREATE TABLE ad_classificador (
    idclassificador character varying(7) NOT NULL,
    descricao character varying(50)
);
-- ad_controle; 
CREATE TABLE ad_controle (
    travapag character(1),
	anoref char(4)
);
-- ad_controleprot; 
CREATE TABLE ad_controleprot (
    anopro integer NOT NULL,
    lastnumproc integer,
    lastnumprot integer
);
-- ad_dependencia;
CREATE TABLE ad_dependencia (
    iddependencia integer NOT NULL,
    idsetor integer,
    dependencia character varying(50)
);
-- ad_diaria; 
CREATE TABLE ad_diaria (
    categoriadiaria character(1) NOT NULL,
    categoriafunc character(3) NOT NULL,
    diaria numeric(10,2),
    meiadiaria numeric(10,2),
    dataini date NOT NULL,
    datafim date
);
-- ad_elemento;
CREATE TABLE ad_elemento (
    idelemento character(6) NOT NULL,
    descricao character varying(60)
);
-- ad_empenhado; 
CREATE TABLE ad_empenhado (
    idempenhado integer NOT NULL,
    valoremp numeric(12,2),
    quantidadeemp numeric(8,2),
    idempenho integer NOT NULL,
    idlicitacao integer NOT NULL,
    item integer NOT NULL,
    dataorcamento date,
    status character(1),
    idorcamento integer NOT NULL,
    valoranulado numeric(12,2),
    dataanulacao date,
    motivoanulacao character varying(100),
	quantidadeanulada integer,
	numeroanulacao character varying(10)
);


ALTER TABLE public.ad_empenhado OWNER TO siga;

-- Name: ad_empenhadodist

CREATE TABLE ad_empenhadodist(
	idempenhado INTEGER NOT NULL,
	idrequisicao INTEGER NOT NULL,
	valorunitario NUMERIC(12,2),
	quantidade INTEGER	
);
-- Name: ad_empenho;
CREATE TABLE ad_empenho (
    idempenho integer NOT NULL,
    numero character(12),
    dataempenho date,
    tipoempenho character(2),
    tipoentrega character(1),
    idfornecedor integer,
    status character(1),
    dataanulacao date,
    motivoanulacao character(1),
    modalidadeemp character(1),
    idempenhoref integer,
    numpro character varying(12),
    obs character varying(200),
    iduo integer
);
-- ad_empresapassagem;
CREATE TABLE ad_empresapassagem (
    idempresapassagem integer NOT NULL,
    nome character varying(30),
    ativo character(1)
);
-- ad_estoque; 
CREATE TABLE ad_estoque (
    idmaterial integer NOT NULL,
    estoquemin integer,
    estoque integer,
    valortotal numeric(14,4),
    localizacao character varying(50),
    iduo integer NOT NULL
);
-- ad_executa; 
CREATE TABLE ad_executa (
    idtiporeq integer NOT NULL,
    iduo integer NOT NULL,
    idrubrica character(20),
    ano character(4) NOT NULL
);
-- ad_executor;
CREATE TABLE ad_executor (
    iduo integer NOT NULL,
    idusuario integer NOT NULL,
    datainicio date NOT NULL,
    datafim date
);
-- ad_executoralmox; 
CREATE TABLE ad_executoralmox (
    idexecutoralmox integer NOT NULL,
    iduorequisitante integer NOT NULL,
    iduoexecutante integer NOT NULL
);
-- ad_executorservint; 
CREATE TABLE ad_executorservint (
    idexecutorservint integer NOT NULL,
    idtiposervint integer,
    idusuario integer,
    datainicio date,
    datafim date
);
-- ad_fonte;
CREATE TABLE ad_fonte (
    idfonte character(10) NOT NULL,
    descricao character varying(50)
);
-- ad_fornecedor;
CREATE TABLE ad_fornecedor (
    idfornecedor integer NOT NULL,
    contacorrente character varying(10),
    idinstituicao character(4),
    idpessoa integer,
    idbanco character(3),
    idagenc character(7)
);
-- ad_fpotencial; 
CREATE TABLE ad_fpotencial (
    idmaterial integer NOT NULL,
    idfornecedor integer NOT NULL
);
-- ad_funcionarioresp;
CREATE TABLE ad_funcionarioresp (
    idfunc character(9) NOT NULL,
    idsetor integer NOT NULL,
    dataini date NOT NULL,
    datafim date
);
-- ad_gestor; 
CREATE TABLE ad_gestor (
    iduo integer NOT NULL,
    idusuario integer NOT NULL,
    datainicio date NOT NULL,
    datafim date
);
-- ad_hotel; 
CREATE TABLE ad_hotel (
    idhotel integer NOT NULL,
    nome character varying(30),
    ativo character(1) NOT NULL,
    valordiaria numeric(10,2)
);
-- ad_itemlicitacao;
CREATE TABLE ad_itemlicitacao (
    idlicitacao integer NOT NULL,
    item integer NOT NULL,
    valor numeric(12,2),
    justificativa character varying(200),
    excecao character(1),
    quantidadelicitada integer
);
-- ad_itemnota;
CREATE TABLE ad_itemnota (
    iditemnota integer NOT NULL,
    idempenhado integer,
    idnotafiscal integer,
    quantitemnota numeric(8,2),
    valoritemnota numeric(12,2)
);
-- ad_itempatrimo;
CREATE TABLE ad_itempatrimo (
    idpatrimo integer NOT NULL,
    descricaoad character varying(60),
    datapatrimo date,
    empenho integer,
    tipoingresso character(1),
    tipoutilizacao character(1),
    estadoitem character(1),
    idmaterial integer,
    idsetor integer NOT NULL
);
-- ad_itempatrimonio;
CREATE TABLE ad_itempatrimonio (
    iditempatrimonio integer NOT NULL,
    descricao character varying(500),
    tipoingresso character(1),
    dataaquisicao date,
    marcamodelo character varying(50),
    valor numeric(12,2),
    notafiscal character varying(16),
    subelemento character(2),
    idmaterial integer,
    idempenhado integer,
    idclassificador character varying(7),
    numpro character varying(12),
    ativo character(1),
    iddependencia integer,
    idsetor integer NOT NULL,
    numeroserie character varying(15),
    numeroempenho character(12)
);
-- ad_itemreq; 
CREATE TABLE ad_itemreq (
    idrequisicao integer NOT NULL,
    idmaterial integer NOT NULL,
    quantpedida numeric(8,2),
    precoestimado numeric(12,2),
    quantautorizada numeric(8,2),
    status character(1),
    idlicitacao integer,
    item integer,
    prioridade character(1),
    descricaodetalhada character varying(500),
    valorreal numeric(12,2),
    motivorejeicao character varying(255),
    quantentregue numeric(8,2) default 0,
    quantempenhada integer,
	quantdevolvida integer
);
-- ad_itemreqdiaria;
CREATE TABLE ad_itemreqdiaria (
    idrequisicao integer NOT NULL,
    idvinculo character(7) NOT NULL,
    categoriafunc character(3),
    situacaofunc character(1),
    motivo character varying(200),
    datasaida date,
    dataretorno date,
    meiotransportediaria character(1),
    justdianaoutil character varying(200),
    valorest numeric(10,2),
    valorreal numeric(10,2),
    ocorrencias character varying(200),
    conceito character(1),
    obs character varying(200),
    ordembancaria character varying(16),
    dataordembancaria date,
    diariasconcedidas numeric(10,2),
    tiporeqdiaria character(1),
    idrequisicaooriginal integer,
    idvinculoprop character(7),
    idvinculochefe character(7),
    numpro character varying(12),
    passagemaerea character(1),
    bilhete character varying(20),
    idrequisicaoveiculo integer,
    nacional character(1)
);
-- ad_itemreqhotel;
CREATE TABLE ad_itemreqhotel (
    idrequisicao integer NOT NULL,
    idpessoa integer NOT NULL,
    motivo character varying(200),
    datahoraentprev date,
    datahorasaidaprev date,
    numerodiaria numeric(2,1),
    valorest numeric(10,2),
    datahoraent date,
    datahorasaida date,
    notafiscal character varying(16),
    datanotafiscal date,
    valorreal numeric(10,2),
    ocorrencias character varying(200),
    conceito character(1),
    obs character varying(200),
    idempenho integer,
    idhotelpref integer,
    informacoes character varying(200)
);
-- ad_itemreqpassagem; 
CREATE TABLE ad_itemreqpassagem (
    idrequisicao integer NOT NULL,
    idpessoa integer NOT NULL,
    tipotransporte character(1),
    motivo character varying(200),
    valorest numeric(10,2),
    bilhete character varying(20),
    notafiscal character varying(16),
    datanotafiscal date,
    valorreal numeric(10,2),
    ocorrencias character varying(200),
    conceito character(1),
    obs character varying(200),
    idempenho integer,
    idmunicipioorigem character(5) NOT NULL,
    idmunicipiodestino character(5) NOT NULL,
    datahorapassagem date,
    classe character(1),
    idempresapassagem integer,
    email character varying (100),
    codigolocalizador character varying(10)
);
-- ad_itemreqrestaurante; 
CREATE TABLE ad_itemreqrestaurante (
    idrequisicao integer NOT NULL,
    idpessoa integer NOT NULL,
    motivo character varying(200),
    valorest numeric(10,2),
    notafiscal character varying(200),
    datanotafiscal date,
    valorreal numeric(10,2),
    ocorrencias character varying(200),
    conceito character(1),
    obs character varying(200),
    idempenho integer,
    idpessoaacompanhante integer,
    idrestaurantepref integer,
    datainicio date,
    datafim date,
    numeroalmocos integer,
    numerojantares integer
);
-- ad_itemreqservext;
CREATE TABLE ad_itemreqservext (
    idrequisicao integer NOT NULL,
    idservico integer NOT NULL,
    complemento character varying(1500),
    quantidade numeric(8,2),
    valorest numeric(12,2),
    valorreal numeric(12,2),
    idlicitacao integer,
    item integer,
    prioridade character(1),
    status character(1),
    unidade character varying(10),
    descricaodetalhada character varying(500),
	quantempenhada integer,
	quantentregue integer,
	quantdevolvida integer
);
-- ad_itemreqservint;
CREATE TABLE ad_itemreqservint (
    idrequisicao integer NOT NULL,
    idtiposervint integer NOT NULL,
    procedimento character varying(400),
    quantidade integer,
    unidade character varying(12),
    urgente character(1),
    motivourgencia character varying(200),
    dataprevisao date,
    dataconclusao date,
    valorreal numeric(12,2),
    ocorrencias character varying(200),
    conceito character(1),
    obs character varying(200)
);
-- ad_itemreqservpf; 
CREATE TABLE ad_itemreqservpf (
    idrequisicao integer NOT NULL,
    idpessoa integer NOT NULL,
    descricaoservico character varying(200),
    valorreal numeric(10,2),
    irrf numeric(10,2),
    inssprestador numeric(10,2),
    insscontratante numeric(10,2),
    datapagamento date,
    ocorrencias character varying(200),
    conceito character(1),
    obs character varying(200),
    idempenho integer
);
-- ad_itemreqveiculo;
CREATE TABLE ad_itemreqveiculo (
    idrequisicao integer NOT NULL,
    idpessoa integer NOT NULL,
    tipotransporte character(1),
    enderecoorig character varying(100),
    bairroorig character varying(50),
    ceporig character varying(8),
    referenciaorig character varying(150),
    datahorasaidaorig timestamp with time zone,
    enderecodest character varying(100),
    bairrodest character varying(50),
    cepdest character varying(8),
    referenciadest character varying(150),
    prevdatahorachegdest timestamp with time zone,
    justificativa character varying(200),
    quilometragemest integer,
    valorest numeric(10,2),
    datahoraautexec timestamp with time zone,
    datahorasaidagar timestamp with time zone,
    datahoracheggar timestamp with time zone,
    odometrosaida integer,
    odometrocheg integer,
    valorreal numeric(10,2),
    ocorrencias character varying(200),
    conceito character(1),
    obs character varying(200),
    placa character(7),
    idmotorista integer,
    idmunicipiodestino character(5) NOT NULL,
    idmunicipioorigem character(5) NOT NULL,
    tipoveiculo character(1),
    prevdatahoraretorno timestamp with time zone,
    outrospassageiros character varying(300)
);
-- ad_lancamentoint;
CREATE TABLE ad_lancamentoint (
    idlancamentoint integer NOT NULL,
    tipolancamento character(1),
    ano character(4),
    data date,
    valor numeric(18,2),
    obs character varying(200),
    iduoreq integer,
    iduoexec integer,
    idrubrica character(11),
    idrequisicao integer,
    idusuario integer,
	idlicitacao INTEGER,
    item INTEGER
);
-- ad_licitacao;
CREATE TABLE ad_licitacao (
    idlicitacao integer NOT NULL,
    numero character varying(15),
    dataabertura date,
    datacriacao date,
    status character(1),
    pregao character(1),
    numpro character varying(12),
    idmodalidadelicitacao integer,
    imediato character(1),
    datahomologacao date,
    idtipolicitacao character(1),
    obs character varying(1000),
    validade character varying(20),
    tipoentrega character(1)
);
-- ad_liquidacao; 
CREATE TABLE ad_liquidacao (
    idliquidacao integer NOT NULL,
    dataliquidacao date,
    valor numeric(12,2),
    obs character varying(200),
    pago character(1),
    valorirrf numeric(12,2),
    valorinss numeric(12,2),
    valoriss numeric(12,2)
);
-- ad_localidadediaria;
CREATE TABLE ad_localidadediaria (
    idlocalidadediaria integer NOT NULL,
    quantdiarias numeric(5,1),
    idmunicipio character(5) NOT NULL,
    idrequisicao integer NOT NULL,
    idvinculo character(7) NOT NULL
);
-- ad_mapalicitacao;
CREATE TABLE ad_mapalicitacao (
    idlicitacao integer NOT NULL,
    item integer NOT NULL,
    preco numeric(11,2),
    vencedor character(1),
    quantidade numeric(8,2),
    importado character(1),
    status character(1),
    idfornecedor integer NOT NULL,
    marcamodelo character varying(50)
);
-- ad_material;
CREATE TABLE ad_material (
    idmaterial integer NOT NULL,
    descricao character varying(500),
    unidade character varying(10),
    permcons character(1),
    estocavel character(1),
    codmaterial integer NOT NULL,
    idelemento character(6),
    idsubelemento character(2),
    ativo character(1)
);
-- ad_modalidadelicitacao;
CREATE TABLE ad_modalidadelicitacao (
    idmodalidadelicitacao integer NOT NULL,
    descricao character varying(30),
    valorinicial numeric(12,2),
    valorfinal numeric(12,2)
);
-- ad_motorista; 
CREATE TABLE ad_motorista (
    idmotorista integer NOT NULL,
    carteirahab character varying(15),
    datavalidade date,
    categoria character(1),
    ativo character(1),
    idpessoa integer NOT NULL
);
-- ad_movimento; 
CREATE TABLE ad_movimento (
    idmovimento integer NOT NULL,
    tipomovimento character(1),
    datamov date,
    quantidade numeric(8,2),
    valortotal numeric(12,2),
    idordement integer,
    idrequisicao integer,
    idmaterial integer,
    iditemnota integer,
    idmovimentoref integer,
	iduoalmox integer
);
-- ad_movimentopat;
CREATE TABLE ad_movimentopat (
    idmovimentacao integer NOT NULL,
    tipomovimento character(1),
    motivobaixa character(1),
    numerotermo character varying(10),
    iditempatrimonio integer NOT NULL,
    idsetororigem integer NOT NULL,
    idsetordestino integer NOT NULL,
    data date,
    iddependenciaorigem integer,
    iddependenciadestino integer,
    numeroprocesso char(12)
);
-- ad_movimentoserv 

CREATE TABLE ad_movimentoserv (
	idmovimentoserv INTEGER NOT NULL,
    tipomovimento 	varchar(20),
	datamov			date,
	quantidade		integer default 0,
	valortotal		numeric (12,0) default 0,
	idrequisicao	integer,
	iditemnota		integer,
	idmovimentoservref	integer
);
-- ad_notafiscal; 
CREATE TABLE ad_notafiscal (
    idnotafiscal integer NOT NULL,
    notafiscal character varying(16),
    datanotafiscal date,
    valor numeric(12,2),
    idliquidacao integer,
    idempenho integer,
    dataateste date,
    obs character varying(200),
    valordesconto numeric(12,2)
);
-- ad_novomaterial; 
CREATE TABLE ad_novomaterial (
    descricao character varying(500),
    iduoreq integer,
    status character(1),
    idnovomaterial integer NOT NULL,
    codmaterial integer,
    idusuario integer,
    aplicacao character varying(200),
    descricaodetalhada character varying(500),
    telefone character varying(20),
    datapedido date,
    ativo char(1);
);
-- Name: ad_orcamento; Type: TABLE; Schema: public; Owner: siga; Tablespace: 
CREATE TABLE ad_orcamento (
    idorcamento integer NOT NULL,
    ano character(4) NOT NULL,
    dotacao numeric(20,2) default 0,
    suplementacao numeric(20,2) default 0,
    bloqueio numeric(20,2) default 0,
    anulacao numeric(20,2) default 0,
    pago numeric(20,2) default 0,
    idptr character(7) NOT NULL,
    idfonte character(10) NOT NULL,
    idrubrica character(11) NOT NULL,
    esfera character(1)
);
-- ad_orcamentohist; 
CREATE TABLE ad_orcamentohist (
    idorcamento integer NOT NULL,
    data date NOT NULL,
    tipoorc character(1) NOT NULL,
    valor numeric(18,2)
);
-- ad_orcamentointerno;
CREATE TABLE ad_orcamentointerno (
    iduo integer NOT NULL,
    idrubrica character(11) NOT NULL,
    ano character(4) NOT NULL,
    credito numeric(18,2),
    debito numeric(18,2),
    previsaodebito numeric(18,2),
    creditoexecutante numeric(18,2)
);
-- ad_ordembancaria;
CREATE TABLE ad_ordembancaria (
    idordembancaria integer NOT NULL,
    numeroordembancaria character varying(16),
    dataordembancaria date,
    valor numeric(12,2),
    idliquidacao integer NOT NULL,
    darf character varying(12),
    gps character varying(12),
    datagps date
);
-- ad_ordentrega; 
CREATE TABLE ad_ordentrega (
    idordement integer NOT NULL,
    dataordent date,
    numeroordem integer,
    iduoexec integer,
    impresso character(1) DEFAULT 0
);
-- ad_pagbolsa; 
CREATE TABLE ad_pagbolsa (
    idbolsista integer NOT NULL,
    mesano character(7) NOT NULL,
    valor numeric(15,2),
    horastrabalhadas integer,
    folha integer NOT NULL
);
-- ad_paiempenho;
CREATE TABLE ad_paiempenho (
    idempenhopai integer NOT NULL,
    idempenho integer NOT NULL,
    tipofilho character(1)
);
CREATE TABLE ad_participante (
	idlicitacao INTEGER NOT NULL,
	idfornecedor INTEGER NOT NULL
);
-- ad_processo;
CREATE TABLE ad_processo (
    numpro character varying(12) NOT NULL,
    stampaber character varying(12),
    instit integer,
    cxarq character varying(7),
    setororig character varying(15),
    tipo character varying(1),
    interes character varying(80),
    titulo character varying(80),
    assunto character varying(240)
);
-- ad_ptr; 
CREATE TABLE ad_ptr (
    idptr character(7) NOT NULL,
    descricao character varying(50),
    progtrab character varying(17) NOT NULL,
    uorcamento character(5)
);
-- ad_requisicao;
CREATE TABLE ad_requisicao (
    idrequisicao integer NOT NULL,
    datahorareq timestamp with time zone,
    datahoraautreq timestamp with time zone,
    tiporequisicao character(1),
    status character(1) NOT NULL,
    motivorejeicao character varying(200),
    iduoreq integer NOT NULL,
    iduoexec integer NOT NULL,
    idusuarioreq integer,
    conceito character(1),
    obs character varying(200),
    idusuariogestor integer,
    coditemfinanciavel character(2),
    localentrega character varying(100),
    datahoraexecucao timestamp with time zone,
    datahoraavaliacao timestamp with time zone,
    suplementar character varying(50)
);
-- ad_reqrubrica

CREATE TABLE ad_reqrubrica (
    idrubrica character(8) NOT NULL,
    idtiporeq integer NOT NULL
);

-- ad_requisita;
CREATE TABLE ad_requisita (
    idtiporeq integer NOT NULL,
    iduo integer NOT NULL,
    idrubrica character(11),
    ano character(4) NOT NULL,
    ativo char(1)
);
-- ad_restaurante;
CREATE TABLE ad_restaurante (
    idrestaurante integer NOT NULL,
    nome character varying(30),
    ativo character(1),
    valorrefeicao numeric(10,2)
);
-- ad_retencao; 
CREATE TABLE ad_retencao (
    numpro character varying(12) NOT NULL,
    setor character varying(15),
    setordest character varying(15),
    stampentr character varying(12),
    stampsai character varying(12),
    stampdesp character varying(12),
    inativo character varying(1),
    numanda integer
);
-- ad_rubrica; 
CREATE TABLE ad_rubrica (
    idrubrica character(11) NOT NULL,
    descricao character varying(100)
);
-- ad_saldolic;
CREATE TABLE ad_saldolic (
    modalidadelic character(1),
    numerolic character varying(15) NOT NULL,
    item integer NOT NULL,
    idmaterial integer,
    qtde numeric(8,2),
    valor numeric(12,2),
    idfornecedor integer,
    descricaodetalhada character varying(500),
    idservico integer,
    iduoreq integer,
    autoria character(4)
);
-- ad_servico;
CREATE TABLE ad_servico (
    idservico integer NOT NULL,
    codservico integer,
    descricao character varying(200),
    idelemento character(6),
    idsubelemento character(2),
    ativo character(1)
);
-- ad_setoracesso;
CREATE TABLE ad_setoracesso (
    setor character varying(15) NOT NULL,
    setorfilho character varying(15) NOT NULL
);
-- ad_solicitacao;
CREATE TABLE ad_solicitacao (
    idlicitacao integer NOT NULL,
    item integer NOT NULL,
    data date NOT NULL,
    quantidade numeric(8,2),
    status character(1),
    numero character varying(10)
);
-- ad_sompal;
CREATE TABLE ad_sompal (
    som character(4),
    numpro character varying(12)
);
-- ad_subelemento; 
CREATE TABLE ad_subelemento (
    idelemento character(6) NOT NULL,
    idsubelemento character(2) NOT NULL,
    descricao character varying(100)
);
-- ad_suplementacaoitem
CREATE TABLE ad_suplementacaoitem(
	idsuplementacaoitem INTEGER NOT NULL,
	idlicitacao INTEGER NOT NULL,
	item  character(50),
	data date,
	quantidadesuplementar INTEGER,
	valorunitsuplementar NUMERIC(12,2),
	idsuplementacaoitemref INTEGER,
	idrequisicao INTEGER NOT NULL
				 );

-- ad_taxi; 
CREATE TABLE ad_taxi (
    dataini date NOT NULL,
    datafim date NOT NULL,
    valor numeric(8,2)
);
-- ad_tiporeq;
CREATE TABLE ad_tiporeq (
    idtiporeq integer NOT NULL,
    descricao character varying(30),
    idrubrica character(11)
);
-- ad_tiposervint;
CREATE TABLE ad_tiposervint (
    idtiposervint integer NOT NULL,
    descricao character varying(30),
    idrubrica character(11),
    iduoprestadora integer
);
-- ad_tipoveiculo;
CREATE TABLE ad_tipoveiculo (
    tipoveiculo character(1) NOT NULL,
    descricao character varying(20),
    valorkm numeric(6,2),
    valorfixo numeric(8,2)
);
-- ad_trecho; 
CREATE TABLE ad_trecho (
    idrequisicao integer NOT NULL,
    idpessoa integer NOT NULL,
    idtrecho integer NOT NULL,
    datahoraviagem date,
    origem character varying(50),
    destino character varying(50),
    codigoviagem character varying(20),
    situacao character(1)
);
-- ad_uo;
CREATE TABLE ad_uo (
    iduo integer NOT NULL,
    sigla character varying(30),
    nome character varying(50),
    tipo character(1),
    documentoref character varying(200),
    idsetor integer NOT NULL,
    saldopublico character(1),
    ativo char(1)
);
-- ad_uoalmox;
CREATE TABLE ad_uoalmox (
    iduoreq integer NOT NULL,
    iduoalmox integer NOT NULL
);
-- ad_valetransporte;
CREATE TABLE ad_valetransporte (
    dataini date NOT NULL,
    datafim date,
    valor numeric(8,2)
);
-- ad_veiculo;
CREATE TABLE ad_veiculo (
    placa character(7) NOT NULL,
    renavam character varying(12),
    chassis character varying(20),
    marca character varying(15),
    modelo character varying(20),
    anofab character(4),
    anomod character(4),
    capacidade integer,
    combustivel character(1),
    ativo character(1),
    tipoveiculo character(1),
    valorkm numeric(9,2)
);




-- Sequencias

CREATE SEQUENCE seq_ad_bolsa start with 1;
CREATE SEQUENCE seq_ad_bolsista start with 1;
CREATE SEQUENCE seq_ad_dependencia start with 1;
CREATE SEQUENCE seq_ad_empenhado start with 1;
CREATE SEQUENCE seq_ad_empenho start with 1;
CREATE SEQUENCE seq_ad_executoralmox start with 1;
CREATE SEQUENCE seq_ad_fornecedor start with 1;
CREATE SEQUENCE seq_ad_hotel start with 1;
CREATE SEQUENCE seq_ad_itemnota start with 1;
CREATE SEQUENCE seq_ad_itempatrimonio start with 1;
CREATE SEQUENCE seq_ad_lancamentoint start with 1;
CREATE SEQUENCE seq_ad_licitacao start with 1;
CREATE SEQUENCE seq_ad_liquidacao start with 1;
CREATE SEQUENCE seq_ad_localidadediaria start with 1;
CREATE SEQUENCE seq_ad_material start with 1;
CREATE SEQUENCE seq_ad_modalidadelicitacao start with 1;
CREATE SEQUENCE seq_ad_motorista start with 1;
CREATE SEQUENCE seq_ad_movimento start with 1;
CREATE SEQUENCE seq_ad_movimentopat start with 1;
CREATE SEQUENCE seq_ad_movimentopat_termo start with 1;
CREATE SEQUENCE seq_ad_notafiscal start with 1;
CREATE SEQUENCE seq_ad_orcamento start with 1;
CREATE SEQUENCE seq_ad_ordembancaria start with 1;
CREATE SEQUENCE seq_ad_ordentrega start with 1;
CREATE SEQUENCE seq_ad_requisicao start with 1;
CREATE SEQUENCE seq_ad_restaurante start with 1;
CREATE SEQUENCE seq_ad_servico start with 1;
CREATE SEQUENCE seq_ad_solicitacao start with 1;
CREATE SEQUENCE seq_ad_suplementacaoitem start with 1;
CREATE SEQUENCE seq_ad_tiporeq start with 1;
CREATE SEQUENCE seq_ad_tiposervint start with 1;
CREATE SEQUENCE seq_ad_uo start with 1;
CREATE SEQUENCE seq_ad_novomaterial start with 1;

-- Chave primária

ALTER TABLE ONLY ad_acessobolsa
    ADD CONSTRAINT pk_ad_acessobolsa PRIMARY KEY (idusuario, idbolsa);
ALTER TABLE ONLY ad_acessouoreq
    ADD CONSTRAINT pk_ad_acessouoreq PRIMARY KEY (idusuario, iduo);
ALTER TABLE ONLY ad_andamento
    ADD CONSTRAINT pk_ad_andamento PRIMARY KEY (numpro, numanda);
ALTER TABLE ONLY ad_bolsa
    ADD CONSTRAINT pk_ad_bolsa PRIMARY KEY (idbolsa);
ALTER TABLE ONLY ad_bolsista
    ADD CONSTRAINT pk_ad_bolsista PRIMARY KEY (idbolsista);
ALTER TABLE ONLY ad_catmat
    ADD CONSTRAINT pk_ad_catmat PRIMARY KEY (codmaterial);
ALTER TABLE ONLY ad_classificador
    ADD CONSTRAINT pk_ad_classificador PRIMARY KEY (idclassificador);
ALTER TABLE ONLY ad_controleprot
    ADD CONSTRAINT pk_ad_controleprot PRIMARY KEY (anopro);
ALTER TABLE ONLY ad_dependencia
    ADD CONSTRAINT pk_ad_dependencia PRIMARY KEY (iddependencia);
ALTER TABLE ONLY ad_diaria
    ADD CONSTRAINT pk_ad_diaria PRIMARY KEY (dataini, categoriadiaria, categoriafunc);
ALTER TABLE ONLY ad_elemento
    ADD CONSTRAINT pk_ad_elemento PRIMARY KEY (idelemento);
ALTER TABLE ONLY ad_empenhado
    ADD CONSTRAINT pk_ad_empenhado PRIMARY KEY (idempenhado);
ALTER TABLE ONLY ad_empenhadodist
	ADD CONSTRAINT pk_ad_empenhadodist PRIMARY KEY (idempenhado,idrequisicao);
ALTER TABLE ONLY ad_empenho
    ADD CONSTRAINT pk_ad_empenho PRIMARY KEY (idempenho);
ALTER TABLE ONLY ad_empresapassagem
    ADD CONSTRAINT pk_ad_empresapassagem PRIMARY KEY (idempresapassagem);
ALTER TABLE ONLY ad_estoque
    ADD CONSTRAINT pk_ad_estoque PRIMARY KEY (idmaterial, iduo);
ALTER TABLE ONLY ad_executa
    ADD CONSTRAINT pk_ad_executa PRIMARY KEY (idtiporeq, iduo, ano);
ALTER TABLE ONLY ad_executor
    ADD CONSTRAINT pk_ad_executor PRIMARY KEY (iduo, idusuario, datainicio);
ALTER TABLE ONLY ad_executoralmox
    ADD CONSTRAINT pk_ad_executoralmox PRIMARY KEY (idexecutoralmox);
ALTER TABLE ONLY ad_executorservint
    ADD CONSTRAINT pk_ad_executorservint PRIMARY KEY (idexecutorservint);
ALTER TABLE ONLY ad_fonte
    ADD CONSTRAINT pk_ad_fonte PRIMARY KEY (idfonte);
ALTER TABLE ONLY ad_fornecedor
    ADD CONSTRAINT pk_ad_fornecedor PRIMARY KEY (idfornecedor);
ALTER TABLE ONLY ad_fpotencial
    ADD CONSTRAINT pk_ad_fpotencial PRIMARY KEY (idmaterial, idfornecedor);
ALTER TABLE ONLY ad_funcionarioresp
    ADD CONSTRAINT pk_ad_funcionarioresp PRIMARY KEY (idfunc, idsetor, dataini);
ALTER TABLE ONLY ad_gestor
    ADD CONSTRAINT pk_ad_gestor PRIMARY KEY (iduo, idusuario, datainicio);
ALTER TABLE ONLY ad_hotel
    ADD CONSTRAINT pk_ad_hotel PRIMARY KEY (idhotel);
ALTER TABLE ONLY ad_itemlicitacao
    ADD CONSTRAINT pk_ad_itemlicitacao PRIMARY KEY (idlicitacao, item);
ALTER TABLE ONLY ad_itemnota
    ADD CONSTRAINT pk_ad_itemnota PRIMARY KEY (iditemnota);
ALTER TABLE ONLY ad_itempatrimo
    ADD CONSTRAINT pk_ad_itempatrimo PRIMARY KEY (idpatrimo);
ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT pk_ad_itempatrimonio PRIMARY KEY (iditempatrimonio);
ALTER TABLE ONLY ad_itemreq
    ADD CONSTRAINT pk_ad_itemreq PRIMARY KEY (idrequisicao, idmaterial);
ALTER TABLE ONLY ad_itemreqdiaria
    ADD CONSTRAINT pk_ad_itemreqdiaria PRIMARY KEY (idrequisicao, idvinculo);
ALTER TABLE ONLY ad_itemreqhotel
    ADD CONSTRAINT pk_ad_itemreqhotel PRIMARY KEY (idrequisicao, idpessoa);
ALTER TABLE ONLY ad_itemreqpassagem
    ADD CONSTRAINT pk_ad_itemreqpassagem PRIMARY KEY (idrequisicao, idpessoa);
ALTER TABLE ONLY ad_itemreqrestaurante
    ADD CONSTRAINT pk_ad_itemreqrestaurante PRIMARY KEY (idrequisicao, idpessoa);
ALTER TABLE ONLY ad_itemreqservext
    ADD CONSTRAINT pk_ad_itemreqservext PRIMARY KEY (idrequisicao, idservico);
ALTER TABLE ONLY ad_itemreqservint
    ADD CONSTRAINT pk_ad_itemreqservint PRIMARY KEY (idrequisicao, idtiposervint);
ALTER TABLE ONLY ad_itemreqservpf
    ADD CONSTRAINT pk_ad_itemreqservpf PRIMARY KEY (idrequisicao, idpessoa);
ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT pk_ad_itemreqveiculo PRIMARY KEY (idrequisicao, idpessoa);
ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT pk_ad_lancamentoint PRIMARY KEY (idlancamentoint);
ALTER TABLE ONLY ad_licitacao
    ADD CONSTRAINT pk_ad_licitacao PRIMARY KEY (idlicitacao);
ALTER TABLE ONLY ad_liquidacao
    ADD CONSTRAINT pk_ad_liquidacao PRIMARY KEY (idliquidacao);
ALTER TABLE ONLY ad_localidadediaria
    ADD CONSTRAINT pk_ad_localidadediaria PRIMARY KEY (idlocalidadediaria);
ALTER TABLE ONLY ad_mapalicitacao
    ADD CONSTRAINT pk_ad_mapalicitacao PRIMARY KEY (idlicitacao, item, idfornecedor);
ALTER TABLE ONLY ad_material
    ADD CONSTRAINT pk_ad_material PRIMARY KEY (idmaterial);
ALTER TABLE ONLY ad_modalidadelicitacao
    ADD CONSTRAINT pk_ad_modalidadelicitacao PRIMARY KEY (idmodalidadelicitacao);
ALTER TABLE ONLY ad_motorista
    ADD CONSTRAINT pk_ad_motorista PRIMARY KEY (idmotorista);
ALTER TABLE ONLY ad_movimento
    ADD CONSTRAINT pk_ad_movimento PRIMARY KEY (idmovimento);
ALTER TABLE ONLY ad_movimentopat
    ADD CONSTRAINT pk_ad_movimentopat PRIMARY KEY (idmovimentacao);
ALTER TABLE ONLY ad_movimentoserv
    ADD CONSTRAINT pk_ad_movimentoserv PRIMARY KEY (idmovimentoserv);
ALTER TABLE ONLY ad_notafiscal
    ADD CONSTRAINT pk_ad_notafiscal PRIMARY KEY (idnotafiscal);
ALTER TABLE ONLY ad_orcamento
    ADD CONSTRAINT pk_ad_orcamento PRIMARY KEY (idorcamento);
ALTER TABLE ONLY ad_orcamentohist
    ADD CONSTRAINT pk_ad_orcamentohist PRIMARY KEY (idorcamento, data, tipoorc);
ALTER TABLE ONLY ad_orcamentointerno
    ADD CONSTRAINT pk_ad_orcamentointerno PRIMARY KEY (iduo, idrubrica, ano);
ALTER TABLE ONLY ad_ordembancaria
    ADD CONSTRAINT pk_ad_ordembancaria PRIMARY KEY (idordembancaria);
ALTER TABLE ONLY ad_ordentrega
    ADD CONSTRAINT pk_ad_ordentrega PRIMARY KEY (idordement);
ALTER TABLE ONLY ad_pagbolsa
    ADD CONSTRAINT pk_ad_pagbolsa PRIMARY KEY (idbolsista, mesano, folha);
ALTER TABLE ONLY ad_paiempenho
    ADD CONSTRAINT pk_ad_paiempenho PRIMARY KEY (idempenhopai, idempenho);
ALTER TABLE ONLY ad_processo
    ADD CONSTRAINT pk_ad_processo PRIMARY KEY (numpro);
ALTER TABLE ONLY ad_ptr
    ADD CONSTRAINT pk_ad_ptr PRIMARY KEY (idptr);
ALTER TABLE ONLY ad_requisicao
    ADD CONSTRAINT pk_ad_requisicao PRIMARY KEY (idrequisicao);
ALTER TABLE ONLY ad_requisita
    ADD CONSTRAINT pk_ad_requisita PRIMARY KEY (idtiporeq, iduo, ano);
ALTER TABLE ONLY ad_reqrubrica
    ADD CONSTRAINT ad_reqrubrica_pkey PRIMARY KEY (idrubrica, idtiporeq);
ALTER TABLE ONLY ad_restaurante
    ADD CONSTRAINT pk_ad_restaurante PRIMARY KEY (idrestaurante);
ALTER TABLE ONLY ad_retencao
    ADD CONSTRAINT pk_ad_retencao PRIMARY KEY (numpro);
ALTER TABLE ONLY ad_rubrica
    ADD CONSTRAINT pk_ad_rubrica PRIMARY KEY (idrubrica);
ALTER TABLE ONLY ad_saldolic
    ADD CONSTRAINT pk_ad_saldolic PRIMARY KEY (numerolic, item);
ALTER TABLE ONLY ad_servico
    ADD CONSTRAINT pk_ad_servico PRIMARY KEY (idservico);
ALTER TABLE ONLY ad_setoracesso
    ADD CONSTRAINT pk_ad_setoracesso PRIMARY KEY (setor, setorfilho);
ALTER TABLE ONLY ad_solicitacao
    ADD CONSTRAINT pk_ad_solicitacao PRIMARY KEY (idlicitacao, item, data);
ALTER TABLE ONLY ad_subelemento
    ADD CONSTRAINT pk_ad_subelemento PRIMARY KEY (idelemento, idsubelemento);
ALTER TABLE ONLY ad_suplementacaoitem
	ADD CONSTRAINT pk_ad_suplementacaoitem PRIMARY KEY(idsuplementacaoitem);
ALTER TABLE ONLY ad_taxi
    ADD CONSTRAINT pk_ad_taxi PRIMARY KEY (dataini);
ALTER TABLE ONLY ad_tiporeq
    ADD CONSTRAINT pk_ad_tiporeq PRIMARY KEY (idtiporeq);
ALTER TABLE ONLY ad_tiposervint
    ADD CONSTRAINT pk_ad_tiposervint PRIMARY KEY (idtiposervint);
ALTER TABLE ONLY ad_tipoveiculo
    ADD CONSTRAINT pk_ad_tipoveiculo PRIMARY KEY (tipoveiculo);
ALTER TABLE ONLY ad_trecho
    ADD CONSTRAINT pk_ad_trecho PRIMARY KEY (idrequisicao, idpessoa, idtrecho);
ALTER TABLE ONLY ad_uo
    ADD CONSTRAINT pk_ad_uo PRIMARY KEY (iduo);
ALTER TABLE ONLY ad_uoalmox
    ADD CONSTRAINT pk_ad_uoalmox PRIMARY KEY (iduoreq, iduoalmox);
ALTER TABLE ONLY ad_valetransporte
    ADD CONSTRAINT pk_ad_valetransporte PRIMARY KEY (dataini);
ALTER TABLE ONLY ad_veiculo
    ADD CONSTRAINT pk_ad_veiculo PRIMARY KEY (placa);

-- Chave Estrangeira

ALTER TABLE ONLY ad_acessobolsa
    ADD CONSTRAINT fk_ad_acessobolsa1_ad_bo FOREIGN KEY (idbolsa) REFERENCES ad_bolsa(idbolsa);
ALTER TABLE ONLY ad_acessobolsa
    ADD CONSTRAINT fk_ad_acessobolsa2_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);
ALTER TABLE ONLY ad_acessouoreq
    ADD CONSTRAINT fk_ad_acessouoreq1_ad_uo FOREIGN KEY (iduo) REFERENCES ad_uo(iduo);
ALTER TABLE ONLY ad_acessouoreq
    ADD CONSTRAINT fk_ad_acessouoreq2_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);
ALTER TABLE ONLY ad_andamento
    ADD CONSTRAINT fk_ad_andamento1_ad_pr FOREIGN KEY (numpro) REFERENCES ad_processo(numpro) ON DELETE CASCADE;
ALTER TABLE ONLY ad_bolsista
    ADD CONSTRAINT fk_ad_bolsista1_ad_bo FOREIGN KEY (idbolsa) REFERENCES ad_bolsa(idbolsa);
ALTER TABLE ONLY ad_bolsista
    ADD CONSTRAINT fk_ad_bolsista2_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);
--ALTER TABLE ONLY bt_emprestimo
--    ADD CONSTRAINT fk_ad_bt_emprestimo_cm_usu FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);
--ALTER TABLE ONLY bt_logoperacao
--    ADD CONSTRAINT fk_ad_bt_logoperacao_cm_usu FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);
--ALTER TABLE ONLY bt_multa
--    ADD CONSTRAINT fk_ad_bt_multa_bt_emprestimo FOREIGN KEY (idemprestimo) REFERENCES bt_emprestimo(idemprestimo);
ALTER TABLE ONLY ad_dependencia
    ADD CONSTRAINT fk_ad_dependencia1_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);
ALTER TABLE ONLY ad_empenhado
    ADD CONSTRAINT fk_ad_empenhado1_ad_em FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);
ALTER TABLE ONLY ad_empenhado
    ADD CONSTRAINT fk_ad_empenhado2_ad_or FOREIGN KEY (idorcamento) REFERENCES ad_orcamento(idorcamento);
ALTER TABLE ONLY ad_empenhado
    ADD CONSTRAINT fk_ad_empenhado3_ad_it FOREIGN KEY (idlicitacao, item) REFERENCES ad_itemlicitacao(idlicitacao, item);
ALTER TABLE ONLY ad_empenhadodist
    ADD CONSTRAINT fk_ad_empenhadodist_requisicaoid FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);
ALTER TABLE ONLY ad_empenhadodist
    ADD CONSTRAINT fk_ad_empenhadodist_empenhadoid FOREIGN KEY (idempenhado) REFERENCES ad_empenhado(idempenhado);
ALTER TABLE ONLY ad_empenho
    ADD CONSTRAINT fk_ad_empenho1_ad_fo FOREIGN KEY (idfornecedor) REFERENCES ad_fornecedor(idfornecedor);
ALTER TABLE ONLY ad_empenho
    ADD CONSTRAINT fk_ad_empenho1_ad_pr FOREIGN KEY (numpro) REFERENCES ad_processo(numpro);
ALTER TABLE ONLY ad_empenho
    ADD CONSTRAINT fk_ad_empenho1_ad_uo FOREIGN KEY (iduo) REFERENCES ad_uo(iduo);
ALTER TABLE ONLY ad_empenho
    ADD CONSTRAINT fk_ad_empenho2_ad_em FOREIGN KEY (idempenhoref) REFERENCES ad_empenho(idempenho);
ALTER TABLE ONLY ad_estoque
    ADD CONSTRAINT fk_ad_estoque2_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);
ALTER TABLE ONLY ad_executa
    ADD CONSTRAINT fk_ad_executa1_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);
ALTER TABLE ONLY ad_executa
    ADD CONSTRAINT fk_ad_executa1_ad_uo FOREIGN KEY (iduo) REFERENCES ad_uo(iduo);
ALTER TABLE ONLY ad_executa
    ADD CONSTRAINT fk_ad_executa2_ad_ti FOREIGN KEY (idtiporeq) REFERENCES ad_tiporeq(idtiporeq);
ALTER TABLE ONLY ad_executoralmox
    ADD CONSTRAINT fk_ad_executoralmox1_ad_uo FOREIGN KEY (iduorequisitante) REFERENCES ad_uo(iduo);
ALTER TABLE ONLY ad_executoralmox
    ADD CONSTRAINT fk_ad_executoralmox2_ad_uo FOREIGN KEY (iduoexecutante) REFERENCES ad_uo(iduo);
ALTER TABLE ONLY ad_executorservint
    ADD CONSTRAINT fk_ad_executorservint1_ad_ti FOREIGN KEY (idtiposervint) REFERENCES ad_tiposervint(idtiposervint);
ALTER TABLE ONLY ad_executorservint
    ADD CONSTRAINT fk_ad_executorservint1_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);
ALTER TABLE ONLY ad_fornecedor
    ADD CONSTRAINT fk_ad_fornecedor1_cm_in FOREIGN KEY (idinstituicao) REFERENCES cm_instituicao(idinstituicao);
ALTER TABLE ONLY ad_fornecedor
    ADD CONSTRAINT fk_ad_fornecedor2_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);
ALTER TABLE ONLY ad_fornecedor
    ADD CONSTRAINT fk_ad_fornecedor3_cm_ag FOREIGN KEY (idbanco, idagenc) REFERENCES cm_agencia(idbanco, idagenc);
ALTER TABLE ONLY ad_fpotencial
    ADD CONSTRAINT fk_ad_fpotencial1_ad_fo FOREIGN KEY (idfornecedor) REFERENCES ad_fornecedor(idfornecedor);
ALTER TABLE ONLY ad_fpotencial
    ADD CONSTRAINT fk_ad_fpotencial2_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);
ALTER TABLE ONLY ad_funcionarioresp
    ADD CONSTRAINT fk_ad_funcionarioresp0_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);
ALTER TABLE ONLY ad_funcionarioresp
    ADD CONSTRAINT fk_ad_funcionarioresp1_rh_fu FOREIGN KEY (idfunc) REFERENCES rh_funcionario(idfuncionario);
ALTER TABLE ONLY ad_itemlicitacao
    ADD CONSTRAINT fk_ad_itemlicitacao1_ad_li FOREIGN KEY (idlicitacao) REFERENCES ad_licitacao(idlicitacao);
ALTER TABLE ONLY ad_itemnota
    ADD CONSTRAINT fk_ad_itemnota1_ad_em FOREIGN KEY (idempenhado) REFERENCES ad_empenhado(idempenhado);
ALTER TABLE ONLY ad_itemnota
    ADD CONSTRAINT fk_ad_itemnota2_ad_no FOREIGN KEY (idnotafiscal) REFERENCES ad_notafiscal(idnotafiscal);
ALTER TABLE ONLY ad_itempatrimo
    ADD CONSTRAINT fk_ad_itempatrimo1_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);
ALTER TABLE ONLY ad_itempatrimo
    ADD CONSTRAINT fk_ad_itempatrimo2_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);
ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT fk_ad_itempatrimonio1_ad_de FOREIGN KEY (iddependencia) REFERENCES ad_dependencia(iddependencia);
ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT fk_ad_itempatrimonio1_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);
ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT fk_ad_itempatrimonio1_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);
ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT fk_ad_itempatrimonio3_ad_em FOREIGN KEY (idempenhado) REFERENCES ad_empenhado(idempenhado);
ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT fk_ad_itempatrimonio4_ad_cl FOREIGN KEY (idclassificador) REFERENCES ad_classificador(idclassificador);
ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT fk_ad_itempatrimonio5_proce FOREIGN KEY (numpro) REFERENCES ad_processo(numpro);
ALTER TABLE ONLY ad_itemreq
    ADD CONSTRAINT fk_ad_itemreq1_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);
ALTER TABLE ONLY ad_itemreq
    ADD CONSTRAINT fk_ad_itemreq2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);
ALTER TABLE ONLY ad_itemreq
    ADD CONSTRAINT fk_ad_itemreq4_ad_it FOREIGN KEY (idlicitacao, item) REFERENCES ad_itemlicitacao(idlicitacao, item);
ALTER TABLE ONLY ad_itemreqdiaria
    ADD CONSTRAINT fk_ad_itemreqdiaria2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);
ALTER TABLE ONLY ad_itemreqdiaria
    ADD CONSTRAINT fk_ad_itemreqdiaria2_rh_vi FOREIGN KEY (idvinculoprop) REFERENCES rh_vinculo(idvinculo);
ALTER TABLE ONLY ad_itemreqdiaria
    ADD CONSTRAINT fk_ad_itemreqdiaria5_ad_pr FOREIGN KEY (numpro) REFERENCES ad_processo(numpro);
ALTER TABLE ONLY ad_itemreqdiaria
    ADD CONSTRAINT fk_ad_itemreqdiaria5_rh_vi FOREIGN KEY (idvinculochefe) REFERENCES rh_vinculo(idvinculo);
ALTER TABLE ONLY ad_itemreqhotel
    ADD CONSTRAINT fk_ad_itemreqhotel1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);
ALTER TABLE ONLY ad_itemreqhotel
    ADD CONSTRAINT fk_ad_itemreqhotel2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);
ALTER TABLE ONLY ad_itemreqhotel
    ADD CONSTRAINT fk_ad_itemreqhotel3_ad_em FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);
ALTER TABLE ONLY ad_itemreqhotel
    ADD CONSTRAINT fk_ad_itemreqhotel4_ad_ho FOREIGN KEY (idhotelpref) REFERENCES ad_hotel(idhotel);
ALTER TABLE ONLY ad_itemreqpassagem
    ADD CONSTRAINT fk_ad_itemreqpassagem1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);
ALTER TABLE ONLY ad_itemreqpassagem
    ADD CONSTRAINT fk_ad_itemreqpassagem2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);
ALTER TABLE ONLY ad_itemreqpassagem
    ADD CONSTRAINT fk_ad_itemreqpassagem3_ad_em FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);
ALTER TABLE ONLY ad_itemreqpassagem
    ADD CONSTRAINT fk_ad_itemreqpassagem4_cm_mu FOREIGN KEY (idmunicipioorigem) REFERENCES cm_municipio(idmunicipio);
ALTER TABLE ONLY ad_itemreqpassagem
    ADD CONSTRAINT fk_ad_itemreqpassagem5_cm_mu FOREIGN KEY (idmunicipiodestino) REFERENCES cm_municipio(idmunicipio);
ALTER TABLE ONLY ad_itemreqrestaurante
    ADD CONSTRAINT fk_ad_itemreqrestaurante1_cm_p FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);
ALTER TABLE ONLY ad_itemreqrestaurante
    ADD CONSTRAINT fk_ad_itemreqrestaurante2_ad_r FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);
ALTER TABLE ONLY ad_itemreqrestaurante
    ADD CONSTRAINT fk_ad_itemreqrestaurante3_ad_e FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);
ALTER TABLE ONLY ad_itemreqrestaurante
    ADD CONSTRAINT fk_ad_itemreqrestaurante4_cm_p FOREIGN KEY (idpessoaacompanhante) REFERENCES cm_pessoa(idpessoa);
ALTER TABLE ONLY ad_itemreqrestaurante
    ADD CONSTRAINT fk_ad_itemreqrestaurante5_ad_r FOREIGN KEY (idrestaurantepref) REFERENCES ad_restaurante(idrestaurante);
ALTER TABLE ONLY ad_itemreqservext
    ADD CONSTRAINT fk_ad_itemreqservext1_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);
ALTER TABLE ONLY ad_itemreqservext
    ADD CONSTRAINT fk_ad_itemreqservext1_ad_se FOREIGN KEY (idservico) REFERENCES ad_servico(idservico);
ALTER TABLE ONLY ad_itemreqservext
    ADD CONSTRAINT fk_ad_itemreqservext3_ad_it FOREIGN KEY (idlicitacao, item) REFERENCES ad_itemlicitacao(idlicitacao, item);
ALTER TABLE ONLY ad_itemreqservint
    ADD CONSTRAINT fk_ad_itemreqservint1_ad_ti FOREIGN KEY (idtiposervint) REFERENCES ad_tiposervint(idtiposervint);
ALTER TABLE ONLY ad_itemreqservint
    ADD CONSTRAINT fk_ad_itemreqservint2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);
ALTER TABLE ONLY ad_itemreqservpf
    ADD CONSTRAINT fk_ad_itemreqservpf1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);
ALTER TABLE ONLY ad_itemreqservpf
    ADD CONSTRAINT fk_ad_itemreqservpf2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);
ALTER TABLE ONLY ad_itemreqservpf
    ADD CONSTRAINT fk_ad_itemreqservpf3_ad_em FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);
ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);
ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);
ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo3_ad_ve FOREIGN KEY (placa) REFERENCES ad_veiculo(placa);
ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo4_ad_mo FOREIGN KEY (idmotorista) REFERENCES ad_motorista(idmotorista);
ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo5_cm_mu FOREIGN KEY (idmunicipiodestino) REFERENCES cm_municipio(idmunicipio);
ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo6_cm_mu FOREIGN KEY (idmunicipioorigem) REFERENCES cm_municipio(idmunicipio);
ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo7_ad_ti FOREIGN KEY (tipoveiculo) REFERENCES ad_tipoveiculo(tipoveiculo);
ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT fk_ad_lancamentoint1_ad_uo FOREIGN KEY (iduoreq) REFERENCES ad_uo(iduo);
ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT fk_ad_lancamentoint1_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);
ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT fk_ad_lancamentoint2_ad_uo FOREIGN KEY (iduoexec) REFERENCES ad_uo(iduo);
ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT fk_ad_lancamentoint3_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);
ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT fk_ad_lancamentoint4_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);
ALTER TABLE ONLY ad_lancamentoint
    ADD constraint fk_ad_lancamentoint4_ad_it FOREIGN KEY (idlicitacao,item) REFERENCES ad_itemlicitacao (idlicitacao,item);
ALTER TABLE ONLY ad_licitacao
    ADD CONSTRAINT fk_ad_licitacao1_ad_mo FOREIGN KEY (idmodalidadelicitacao) REFERENCES ad_modalidadelicitacao(idmodalidadelicitacao);
ALTER TABLE ONLY ad_licitacao
    ADD CONSTRAINT fk_ad_licitacao1_ad_pr FOREIGN KEY (numpro) REFERENCES ad_processo(numpro);
ALTER TABLE ONLY ad_localidadediaria
    ADD CONSTRAINT fk_ad_localidadediaria1_cm_mu FOREIGN KEY (idmunicipio) REFERENCES cm_municipio(idmunicipio);
ALTER TABLE ONLY ad_localidadediaria
    ADD CONSTRAINT fk_ad_localidadediaria2_ad_it FOREIGN KEY (idrequisicao, idvinculo) REFERENCES ad_itemreqdiaria(idrequisicao, idvinculo);
ALTER TABLE ONLY ad_mapalicitacao
    ADD CONSTRAINT fk_ad_mapalicitacao1_ad_fo FOREIGN KEY (idfornecedor) REFERENCES ad_fornecedor(idfornecedor);
ALTER TABLE ONLY ad_mapalicitacao
    ADD CONSTRAINT fk_ad_mapalicitacao2_ad_it FOREIGN KEY (idlicitacao, item) REFERENCES ad_itemlicitacao(idlicitacao, item);
ALTER TABLE ONLY ad_material
    ADD CONSTRAINT fk_ad_material1_ad_ca FOREIGN KEY (codmaterial) REFERENCES ad_catmat(codmaterial);
ALTER TABLE ONLY ad_material
    ADD CONSTRAINT fk_ad_material2_ad_su FOREIGN KEY (idelemento, idsubelemento) REFERENCES ad_subelemento(idelemento, idsubelemento);
ALTER TABLE ONLY ad_motorista
    ADD CONSTRAINT fk_ad_motorista1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);
ALTER TABLE ONLY ad_movimento
    ADD CONSTRAINT fk_ad_movimento1_ad_mo FOREIGN KEY (iditemnota) REFERENCES ad_itemnota(iditemnota);
ALTER TABLE ONLY ad_movimento
    ADD CONSTRAINT fk_ad_movimento1_ad_or FOREIGN KEY (idordement) REFERENCES ad_ordentrega(idordement);
ALTER TABLE ONLY ad_movimento
    ADD CONSTRAINT fk_ad_movimento2_ad_it FOREIGN KEY (idrequisicao, idmaterial) REFERENCES ad_itemreq(idrequisicao, idmaterial);
ALTER TABLE ONLY ad_movimento
    ADD CONSTRAINT fk_ad_movimento2_ad_mo FOREIGN KEY (idmovimentoref) REFERENCES ad_movimento(idmovimento);
ALTER TABLE ONLY ad_movimentopat
    ADD CONSTRAINT fk_ad_movimentopat1_ad_de FOREIGN KEY (iddependenciaorigem) REFERENCES ad_dependencia(iddependencia);
ALTER TABLE ONLY ad_movimentopat
    ADD CONSTRAINT fk_ad_movimentopat1_ad_it FOREIGN KEY (iditempatrimonio) REFERENCES ad_itempatrimonio(iditempatrimonio);
ALTER TABLE ONLY ad_movimentopat
    ADD CONSTRAINT fk_ad_movimentopat2_ad_de FOREIGN KEY (iddependenciadestino) REFERENCES ad_dependencia(iddependencia);
ALTER TABLE ONLY ad_movimentopat
    ADD CONSTRAINT fk_ad_movimentopat2_cm_se FOREIGN KEY (idsetororigem) REFERENCES cm_setor(idsetor);
ALTER TABLE ONLY ad_movimentopat
    ADD CONSTRAINT fk_ad_movimentopat3_cm_se FOREIGN KEY (idsetordestino) REFERENCES cm_setor(idsetor);
ALTER TABLE ONLY ad_movimentoserv
    ADD CONSTRAINT fk_ad_movimentoserv_itemnota FOREIGN KEY (iditemnota) REFERENCES ad_itemnota(iditemnota);
ALTER TABLE ONLY ad_notafiscal
    ADD CONSTRAINT fk_ad_notafiscal1_ad_li FOREIGN KEY (idliquidacao) REFERENCES ad_liquidacao(idliquidacao);
ALTER TABLE ONLY ad_notafiscal
    ADD CONSTRAINT fk_ad_notafiscal2_ad_em FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);
ALTER TABLE ONLY ad_novomaterial
    ADD CONSTRAINT fk_ad_novomaterial2_ad_uo FOREIGN KEY (iduoreq) REFERENCES ad_uo(iduo);
ALTER TABLE ONLY ad_novomaterial
    ADD CONSTRAINT fk_ad_novomaterial3_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);
ALTER TABLE ONLY ad_orcamento
    ADD CONSTRAINT fk_ad_orcamento1_ad_pt FOREIGN KEY (idptr) REFERENCES ad_ptr(idptr);
ALTER TABLE ONLY ad_orcamento
    ADD CONSTRAINT fk_ad_orcamento2_ad_fo FOREIGN KEY (idfonte) REFERENCES ad_fonte(idfonte);
ALTER TABLE ONLY ad_orcamento
    ADD CONSTRAINT fk_ad_orcamento3_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);
ALTER TABLE ONLY ad_orcamentohist
    ADD CONSTRAINT fk_ad_orcamentohist1_ad_or FOREIGN KEY (idorcamento) REFERENCES ad_orcamento(idorcamento);
ALTER TABLE ONLY ad_orcamentointerno
    ADD CONSTRAINT fk_ad_orcamentointerno0_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);
ALTER TABLE ONLY ad_orcamentointerno
    ADD CONSTRAINT fk_ad_orcamentointerno1_ad_uo FOREIGN KEY (iduo) REFERENCES ad_uo(iduo);
ALTER TABLE ONLY ad_ordembancaria
    ADD CONSTRAINT fk_ad_ordembancaria1_ad_li FOREIGN KEY (idliquidacao) REFERENCES ad_liquidacao(idliquidacao);
ALTER TABLE ONLY ad_pagbolsa
    ADD CONSTRAINT fk_ad_pagbolsa1_ad_bo FOREIGN KEY (idbolsista) REFERENCES ad_bolsista(idbolsista);
ALTER TABLE ONLY ad_paiempenho
    ADD CONSTRAINT fk_ad_paiempenho0_ad_em FOREIGN KEY (idempenhopai) REFERENCES ad_empenho(idempenho);
ALTER TABLE ONLY ad_paiempenho
    ADD CONSTRAINT fk_ad_paiempenho1_ad_em FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);
ALTER TABLE ONLY ad_participante
	ADD CONSTRAINT fk_ad_participante_licitacaoid FOREIGN KEY (idlicitacao) REFERENCES ad_licitacao(idlicitacao);
ALTER TABLE ONLY ad_participante
	ADD CONSTRAINT fk_ad_participante_fornecedorid FOREIGN KEY (idfornecedor) REFERENCES ad_fornecedor(idfornecedor);
ALTER TABLE ONLY ad_requisicao
    ADD CONSTRAINT fk_ad_requisicao2_ad_uo FOREIGN KEY (iduoreq) REFERENCES ad_uo(iduo);
ALTER TABLE ONLY ad_requisicao
    ADD CONSTRAINT fk_ad_requisicao3_ad_uo FOREIGN KEY (iduoexec) REFERENCES ad_uo(iduo);
ALTER TABLE ONLY ad_requisicao
    ADD CONSTRAINT fk_ad_requisicao4_cm_us FOREIGN KEY (idusuarioreq) REFERENCES cm_usuario(idusuario);
ALTER TABLE ONLY ad_requisicao
    ADD CONSTRAINT fk_ad_requisicao5_cm_us FOREIGN KEY (idusuariogestor) REFERENCES cm_usuario(idusuario);
ALTER TABLE ONLY ad_requisita
    ADD CONSTRAINT fk_ad_requisita1_ad_uo FOREIGN KEY (iduo) REFERENCES ad_uo(iduo);
ALTER TABLE ONLY ad_requisita
    ADD CONSTRAINT fk_ad_requisita2_ad_ti FOREIGN KEY (idtiporeq) REFERENCES ad_tiporeq(idtiporeq);
ALTER TABLE ONLY ad_requisita
    ADD CONSTRAINT fk_ad_requisita3_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);
ALTER TABLE ONLY ad_reqrubrica
    ADD CONSTRAINT ad_reqrubrica_idrubrica_fkey FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);
ALTER TABLE ONLY ad_reqrubrica
    ADD CONSTRAINT ad_reqrubrica_idtiporeq_fkey FOREIGN KEY (idtiporeq) REFERENCES ad_tiporeq(idtiporeq);
ALTER TABLE ONLY ad_retencao
    ADD CONSTRAINT fk_ad_retencao1_ad_pr FOREIGN KEY (numpro) REFERENCES ad_processo(numpro) ON DELETE CASCADE;
ALTER TABLE ONLY ad_saldolic
    ADD CONSTRAINT fk_ad_saldolic2_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);
ALTER TABLE ONLY ad_saldolic
    ADD CONSTRAINT fk_ad_saldolic3_ad_fo FOREIGN KEY (idfornecedor) REFERENCES ad_fornecedor(idfornecedor);
ALTER TABLE ONLY ad_saldolic
    ADD CONSTRAINT fk_ad_saldolic3_adse FOREIGN KEY (idservico) REFERENCES ad_servico(idservico);
ALTER TABLE ONLY ad_saldolic
    ADD CONSTRAINT fk_ad_saldolic4_ad_uo FOREIGN KEY (iduoreq) REFERENCES ad_uo(iduo);
ALTER TABLE ONLY ad_servico
    ADD CONSTRAINT fk_ad_servico1_ad_su FOREIGN KEY (idelemento, idsubelemento) REFERENCES ad_subelemento(idelemento, idsubelemento);
ALTER TABLE ONLY ad_solicitacao
    ADD CONSTRAINT fk_ad_solicitacao1_ad_it FOREIGN KEY (idlicitacao, item) REFERENCES ad_itemlicitacao(idlicitacao, item);
ALTER TABLE ONLY ad_subelemento
    ADD CONSTRAINT fk_ad_subelemento1_ad_el FOREIGN KEY (idelemento) REFERENCES ad_elemento(idelemento);
ALTER TABLE ONLY ad_suplementacaoitem
	ADD CONSTRAINT fk_suplementacaoitem_RequisicaoId FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);
ALTER TABLE ONLY ad_suplementacaoitem
	ADD CONSTRAINT fk_suplementacaoitem_LicitacaoId FOREIGN KEY (idlicitacao) REFERENCES ad_licitacao(idlicitacao);
ALTER TABLE ONLY ad_tiporeq
    ADD CONSTRAINT fk_ad_tiporeq1_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);
ALTER TABLE ONLY ad_tiposervint
    ADD CONSTRAINT fk_ad_tiposervint1_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);
ALTER TABLE ONLY ad_trecho
    ADD CONSTRAINT fk_ad_trecho1_ad_it FOREIGN KEY (idrequisicao, idpessoa) REFERENCES ad_itemreqpassagem(idrequisicao, idpessoa);
ALTER TABLE ONLY ad_uo
    ADD CONSTRAINT fk_ad_uo2_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);
ALTER TABLE ONLY ad_uoalmox
    ADD CONSTRAINT fk_ad_uoalmox1_ad_uo FOREIGN KEY (iduoalmox) REFERENCES ad_uo(iduo) ON DELETE CASCADE;
ALTER TABLE ONLY ad_uoalmox
    ADD CONSTRAINT fk_ad_uoalmox2_ad_uo FOREIGN KEY (iduoreq) REFERENCES ad_uo(iduo) ON DELETE CASCADE;
ALTER TABLE ONLY ad_veiculo
    ADD CONSTRAINT fk_ad_veiculo1_ad_ti FOREIGN KEY (tipoveiculo) REFERENCES ad_tipoveiculo(tipoveiculo);

-- INDEX

--
-- Name: sys_c006134; Type: CONSTRAINT; Schema: public; Owner: siga; Tablespace: 
--

ALTER TABLE ONLY ad_novomaterial
    ADD CONSTRAINT sys_c006134 PRIMARY KEY (idnovomaterial);


--
-- Name: idx_ad_acessobolsa1_ad_bo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_acessobolsa1_ad_bo ON ad_acessobolsa USING btree (idbolsa);


--
-- Name: idx_ad_acessobolsa2_cm_us; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_acessobolsa2_cm_us ON ad_acessobolsa USING btree (idusuario);


--
-- Name: idx_ad_acessouoreq1_ad_uo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_acessouoreq1_ad_uo ON ad_acessouoreq USING btree (iduo);


--
-- Name: idx_ad_acessouoreq2_cm_us; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_acessouoreq2_cm_us ON ad_acessouoreq USING btree (idusuario);


--
-- Name: idx_ad_bolsista1_ad_bo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_bolsista1_ad_bo ON ad_bolsista USING btree (idbolsa);


--
-- Name: idx_ad_bolsista2_cm_pe; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_bolsista2_cm_pe ON ad_bolsista USING btree (idpessoa);


--
-- Name: idx_ad_dependencia1_cm_se; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_dependencia1_cm_se ON ad_dependencia USING btree (idsetor);


--
-- Name: idx_ad_empenhado1_ad_em; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_empenhado1_ad_em ON ad_empenhado USING btree (idempenho);


--
-- Name: idx_ad_empenhado2_ad_it; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_empenhado2_ad_it ON ad_empenhado USING btree (idlicitacao, item);


--
-- Name: idx_ad_empenho; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE UNIQUE INDEX idx_ad_empenho ON ad_empenho USING btree (numero);


--
-- Name: idx_ad_empenho1_ad_fo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_empenho1_ad_fo ON ad_empenho USING btree (idfornecedor);


--
-- Name: idx_ad_empenho3_ad_pr; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_empenho3_ad_pr ON ad_empenho USING btree (numpro);


--
-- Name: idx_ad_empenho4_ad_uo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_empenho4_ad_uo ON ad_empenho USING btree (iduo);


--
-- Name: idx_ad_empenho5_ad_em; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_empenho5_ad_em ON ad_empenho USING btree (idempenhoref);


--
-- Name: idx_ad_estoque1_ad_uo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_estoque1_ad_uo ON ad_estoque USING btree (iduo);


--
-- Name: idx_ad_estoque2_ad_ma; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_estoque2_ad_ma ON ad_estoque USING btree (idmaterial);


--
-- Name: idx_ad_executa1_ad_ru; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_executa1_ad_ru ON ad_executa USING btree (idrubrica);


--
-- Name: idx_ad_executa1_ad_uo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_executa1_ad_uo ON ad_executa USING btree (iduo);


--
-- Name: idx_ad_executa2_ad_ti; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_executa2_ad_ti ON ad_executa USING btree (idtiporeq);


--
-- Name: idx_ad_executor1_cm_us; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_executor1_cm_us ON ad_executor USING btree (idusuario);


--
-- Name: idx_ad_executor2_ad_uo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_executor2_ad_uo ON ad_executor USING btree (iduo);


--
-- Name: idx_ad_executoralmox1_ad_uo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_executoralmox1_ad_uo ON ad_executoralmox USING btree (iduoexecutante);


--
-- Name: idx_ad_executoralmox2_ad_uo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_executoralmox2_ad_uo ON ad_executoralmox USING btree (iduorequisitante);


--
-- Name: idx_ad_executorservint1_ad_ti; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_executorservint1_ad_ti ON ad_executorservint USING btree (idtiposervint);


--
-- Name: idx_ad_executorservint2_cm_us; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_executorservint2_cm_us ON ad_executorservint USING btree (idusuario);


--
-- Name: idx_ad_fornecedor1_cm_in; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_fornecedor1_cm_in ON ad_fornecedor USING btree (idinstituicao);


--
-- Name: idx_ad_fornecedor2_cm_pe; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_fornecedor2_cm_pe ON ad_fornecedor USING btree (idpessoa);


--
-- Name: idx_ad_fornecedor3_cm_ag; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_fornecedor3_cm_ag ON ad_fornecedor USING btree (idagenc);


--
-- Name: idx_ad_fpotencial1_ad_fo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_fpotencial1_ad_fo ON ad_fpotencial USING btree (idfornecedor);


--
-- Name: idx_ad_fpotencial2_ad_ma; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_fpotencial2_ad_ma ON ad_fpotencial USING btree (idmaterial);


--
-- Name: idx_ad_funcionarioresp1_cm_se; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_funcionarioresp1_cm_se ON ad_funcionarioresp USING btree (idsetor);


--
-- Name: idx_ad_funcionarioresp2_rh_fu; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_funcionarioresp2_rh_fu ON ad_funcionarioresp USING btree (idfunc);


--
-- Name: idx_ad_gestor1_cm_us; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_gestor1_cm_us ON ad_gestor USING btree (idusuario);


--
-- Name: idx_ad_gestor2_ad_uo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_gestor2_ad_uo ON ad_gestor USING btree (iduo);


--
-- Name: idx_ad_itemlicitacao1_ad_li; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemlicitacao1_ad_li ON ad_itemlicitacao USING btree (idlicitacao);


--
-- Name: idx_ad_itemnota1_ad_em; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemnota1_ad_em ON ad_itemnota USING btree (idempenhado);


--
-- Name: idx_ad_itemnota2_ad_no; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemnota2_ad_no ON ad_itemnota USING btree (idnotafiscal);


--
-- Name: idx_ad_itempatrimo1_ad_ma; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimo1_ad_ma ON ad_itempatrimo USING btree (idmaterial);


--
-- Name: idx_ad_itempatrimo2_cm_se; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimo2_cm_se ON ad_itempatrimo USING btree (idsetor);


--
-- Name: idx_ad_itempatrimonio1_ad_de; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimonio1_ad_de ON ad_itempatrimonio USING btree (iddependencia);


--
-- Name: idx_ad_itempatrimonio2_ad_ma; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimonio2_ad_ma ON ad_itempatrimonio USING btree (idmaterial);


--
-- Name: idx_ad_itempatrimonio3_cm_se; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimonio3_cm_se ON ad_itempatrimonio USING btree (idsetor);


--
-- Name: idx_ad_itempatrimonio4_ad_em; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimonio4_ad_em ON ad_itempatrimonio USING btree (idempenhado);


--
-- Name: idx_ad_itempatrimonio5_ad_cl; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimonio5_ad_cl ON ad_itempatrimonio USING btree (idclassificador);


--
-- Name: idx_ad_itempatrimonio6_proce; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimonio6_proce ON ad_itempatrimonio USING btree (numpro);


--
-- Name: idx_ad_itemreq1_ad_ma; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreq1_ad_ma ON ad_itemreq USING btree (idmaterial);


--
-- Name: idx_ad_itemreq2_ad_re; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreq2_ad_re ON ad_itemreq USING btree (idrequisicao);


--
-- Name: idx_ad_itemreq3_ad_it; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreq3_ad_it ON ad_itemreq USING btree (idlicitacao, item);


--
-- Name: idx_ad_itemreqdiaria1_rh_vi; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqdiaria1_rh_vi ON ad_itemreqdiaria USING btree (idvinculo);


--
-- Name: idx_ad_itemreqdiaria2_ad_re; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqdiaria2_ad_re ON ad_itemreqdiaria USING btree (idrequisicao);


--
-- Name: idx_ad_itemreqdiaria2_rh_vi; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqdiaria2_rh_vi ON ad_itemreqdiaria USING btree (idvinculoprop);


--
-- Name: idx_ad_itemreqdiaria3_ad_pr; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqdiaria3_ad_pr ON ad_itemreqdiaria USING btree (numpro);


--
-- Name: idx_ad_itemreqdiaria4_rh_vi; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqdiaria4_rh_vi ON ad_itemreqdiaria USING btree (idvinculochefe);


--
-- Name: idx_ad_itemreqhotel1_cm_pe; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqhotel1_cm_pe ON ad_itemreqhotel USING btree (idpessoa);


--
-- Name: idx_ad_itemreqhotel2_ad_re; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqhotel2_ad_re ON ad_itemreqhotel USING btree (idrequisicao);


--
-- Name: idx_ad_itemreqhotel3_ad_em; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqhotel3_ad_em ON ad_itemreqhotel USING btree (idempenho);


--
-- Name: idx_ad_itemreqhotel4_ad_ho; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqhotel4_ad_ho ON ad_itemreqhotel USING btree (idhotelpref);


--
-- Name: idx_ad_itemreqpassagem1_cm_pe; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqpassagem1_cm_pe ON ad_itemreqpassagem USING btree (idpessoa);


--
-- Name: idx_ad_itemreqpassagem2_ad_re; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqpassagem2_ad_re ON ad_itemreqpassagem USING btree (idrequisicao);


--
-- Name: idx_ad_itemreqpassagem3_ad_em; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqpassagem3_ad_em ON ad_itemreqpassagem USING btree (idempenho);


--
-- Name: idx_ad_itemreqpassagem4_cm_mu; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqpassagem4_cm_mu ON ad_itemreqpassagem USING btree (idmunicipioorigem);


--
-- Name: idx_ad_itemreqpassagem5_cm_mu; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqpassagem5_cm_mu ON ad_itemreqpassagem USING btree (idmunicipiodestino);


--
-- Name: idx_ad_itemreqpassagem7_ad_em; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqpassagem7_ad_em ON ad_itemreqpassagem USING btree (idempresapassagem);


--
-- Name: idx_ad_itemreqrest1_cm_p; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqrest1_cm_p ON ad_itemreqrestaurante USING btree (idpessoa);


--
-- Name: idx_ad_itemreqrest2_ad_r; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqrest2_ad_r ON ad_itemreqrestaurante USING btree (idrequisicao);


--
-- Name: idx_ad_itemreqrest3_ad_e; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqrest3_ad_e ON ad_itemreqrestaurante USING btree (idempenho);


--
-- Name: idx_ad_itemreqrest4_cm_p; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqrest4_cm_p ON ad_itemreqrestaurante USING btree (idpessoaacompanhante);


--
-- Name: idx_ad_itemreqrest5_ad_r; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqrest5_ad_r ON ad_itemreqrestaurante USING btree (idrestaurantepref);


--
-- Name: idx_ad_itemreqservext1_ad_re; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservext1_ad_re ON ad_itemreqservext USING btree (idrequisicao);


--
-- Name: idx_ad_itemreqservext2_ad_it; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservext2_ad_it ON ad_itemreqservext USING btree (idlicitacao, item);


--
-- Name: idx_ad_itemreqservint1_ad_ti; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservint1_ad_ti ON ad_itemreqservint USING btree (idtiposervint);


--
-- Name: idx_ad_itemreqservint2_ad_re; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservint2_ad_re ON ad_itemreqservint USING btree (idrequisicao);


--
-- Name: idx_ad_itemreqservpf1_cm_pe; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservpf1_cm_pe ON ad_itemreqservpf USING btree (idpessoa);


--
-- Name: idx_ad_itemreqservpf2_ad_re; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservpf2_ad_re ON ad_itemreqservpf USING btree (idrequisicao);


--
-- Name: idx_ad_itemreqservpf3_ad_em; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservpf3_ad_em ON ad_itemreqservpf USING btree (idempenho);


--
-- Name: idx_ad_itemreqveiculo1_cm_pe; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo1_cm_pe ON ad_itemreqveiculo USING btree (idpessoa);


--
-- Name: idx_ad_itemreqveiculo2_ad_re; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo2_ad_re ON ad_itemreqveiculo USING btree (idrequisicao);


--
-- Name: idx_ad_itemreqveiculo3_ad_ve; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo3_ad_ve ON ad_itemreqveiculo USING btree (placa);


--
-- Name: idx_ad_itemreqveiculo4_ad_mo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo4_ad_mo ON ad_itemreqveiculo USING btree (idmotorista);


--
-- Name: idx_ad_itemreqveiculo5_cm_mu; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo5_cm_mu ON ad_itemreqveiculo USING btree (idmunicipiodestino);


--
-- Name: idx_ad_itemreqveiculo6_cm_mu; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo6_cm_mu ON ad_itemreqveiculo USING btree (idmunicipioorigem);


--
-- Name: idx_ad_itemreqveiculo7_ad_ti; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo7_ad_ti ON ad_itemreqveiculo USING btree (tipoveiculo);


--
-- Name: idx_ad_lancamentoint1_ad_uo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_lancamentoint1_ad_uo ON ad_lancamentoint USING btree (iduoreq);


--
-- Name: idx_ad_lancamentoint2_ad_uo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_lancamentoint2_ad_uo ON ad_lancamentoint USING btree (iduoexec);


--
-- Name: idx_ad_lancamentoint3_ad_ru; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_lancamentoint3_ad_ru ON ad_lancamentoint USING btree (idrubrica);


--
-- Name: idx_ad_lancamentoint4_ad_re; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_lancamentoint4_ad_re ON ad_lancamentoint USING btree (idrequisicao);


--
-- Name: idx_ad_licitacao1_ad_mo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_licitacao1_ad_mo ON ad_licitacao USING btree (idmodalidadelicitacao);


--
-- Name: idx_ad_licitacao2_ad_pr; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_licitacao2_ad_pr ON ad_licitacao USING btree (numpro);


--
-- Name: idx_ad_localidadediaria1_cm_mu; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_localidadediaria1_cm_mu ON ad_localidadediaria USING btree (idmunicipio);


--
-- Name: idx_ad_localidadediaria2_ad_it; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_localidadediaria2_ad_it ON ad_localidadediaria USING btree (idrequisicao, idvinculo);


--
-- Name: idx_ad_mapalicitacao1_ad_fo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_mapalicitacao1_ad_fo ON ad_mapalicitacao USING btree (idfornecedor);


--
-- Name: idx_ad_mapalicitacao2_ad_it; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_mapalicitacao2_ad_it ON ad_mapalicitacao USING btree (idlicitacao, item);


--
-- Name: idx_ad_material1_ad_ca; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_material1_ad_ca ON ad_material USING btree (codmaterial);


--
-- Name: idx_ad_material2_ad_su; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_material2_ad_su ON ad_material USING btree (idelemento, idsubelemento);


--
-- Name: idx_ad_motorista1_cm_pe; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_motorista1_cm_pe ON ad_motorista USING btree (idpessoa);


--
-- Name: idx_ad_movimento1_ad_mo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_movimento1_ad_mo ON ad_movimento USING btree (iditemnota);


--
-- Name: idx_ad_movimento1_ad_or; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_movimento1_ad_or ON ad_movimento USING btree (idordement);


--
-- Name: idx_ad_movimento2_ad_it; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_movimento2_ad_it ON ad_movimento USING btree (idrequisicao, idmaterial);


--
-- Name: idx_ad_movimentopat1_ad_de; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_movimentopat1_ad_de ON ad_movimentopat USING btree (iddependenciaorigem);


--
-- Name: idx_ad_movimentopat2_ad_it; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_movimentopat2_ad_it ON ad_movimentopat USING btree (iditempatrimonio);


--
-- Name: idx_ad_movimentopat3_ad_de; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_movimentopat3_ad_de ON ad_movimentopat USING btree (iddependenciadestino);


--
-- Name: idx_ad_movimentopat4_cm_se; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_movimentopat4_cm_se ON ad_movimentopat USING btree (idsetororigem);


--
-- Name: idx_ad_movimentopat5_cm_se; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_movimentopat5_cm_se ON ad_movimentopat USING btree (idsetordestino);


--
-- Name: idx_ad_notafiscal1_ad_li; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_notafiscal1_ad_li ON ad_notafiscal USING btree (idliquidacao);


--
-- Name: idx_ad_notafiscal2_ad_em; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_notafiscal2_ad_em ON ad_notafiscal USING btree (idempenho);


--
-- Name: idx_ad_novomaterial1_ad_uo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_novomaterial1_ad_uo ON ad_novomaterial USING btree (iduoreq);


--
-- Name: idx_ad_novomaterial2_cm_us; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_novomaterial2_cm_us ON ad_novomaterial USING btree (idusuario);


--
-- Name: idx_ad_orcamento1_ad_pt; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_orcamento1_ad_pt ON ad_orcamento USING btree (idptr);


--
-- Name: idx_ad_orcamento2_ad_fo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_orcamento2_ad_fo ON ad_orcamento USING btree (idfonte);


--
-- Name: idx_ad_orcamento3_ad_ru; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_orcamento3_ad_ru ON ad_orcamento USING btree (idrubrica);


--
-- Name: idx_ad_orcamentohist1_ad_or; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_orcamentohist1_ad_or ON ad_orcamentohist USING btree (idorcamento);


--
-- Name: idx_ad_orcamentointerno1_ad_ru; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_orcamentointerno1_ad_ru ON ad_orcamentointerno USING btree (idrubrica);


--
-- Name: idx_ad_orcamentointerno2_ad_uo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_orcamentointerno2_ad_uo ON ad_orcamentointerno USING btree (iduo);


--
-- Name: idx_ad_ordembancaria1_ad_li; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_ordembancaria1_ad_li ON ad_ordembancaria USING btree (idliquidacao);


--
-- Name: idx_ad_ordentrega1_ad_uo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_ordentrega1_ad_uo ON ad_ordentrega USING btree (iduoexec);


--
-- Name: idx_ad_pagbolsa1_ad_bo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_pagbolsa1_ad_bo ON ad_pagbolsa USING btree (idbolsista);


--
-- Name: idx_ad_paiempenho1_ad_em; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_paiempenho1_ad_em ON ad_paiempenho USING btree (idempenhopai);


--
-- Name: idx_ad_paiempenho2_ad_em; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_paiempenho2_ad_em ON ad_paiempenho USING btree (idempenho);


--
-- Name: idx_ad_requisicao2_ad_uo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_requisicao2_ad_uo ON ad_requisicao USING btree (iduoreq);


--
-- Name: idx_ad_requisicao3_ad_uo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_requisicao3_ad_uo ON ad_requisicao USING btree (iduoexec);


--
-- Name: idx_ad_requisicao4_cm_us; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_requisicao4_cm_us ON ad_requisicao USING btree (idusuarioreq);


--
-- Name: idx_ad_requisita1_ad_uo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_requisita1_ad_uo ON ad_requisita USING btree (iduo);


--
-- Name: idx_ad_requisita2_ad_ti; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_requisita2_ad_ti ON ad_requisita USING btree (idtiporeq);


--
-- Name: idx_ad_requisita3_ad_ru; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_requisita3_ad_ru ON ad_requisita USING btree (idrubrica);


--
-- Name: idx_ad_saldolic1_ad_ma; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_saldolic1_ad_ma ON ad_saldolic USING btree (idmaterial);


--
-- Name: idx_ad_saldolic2_ad_fo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_saldolic2_ad_fo ON ad_saldolic USING btree (idfornecedor);


--
-- Name: idx_ad_servico1_ad_su; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_servico1_ad_su ON ad_servico USING btree (idelemento, idsubelemento);


--
-- Name: idx_ad_subelemento1_ad_el; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_subelemento1_ad_el ON ad_subelemento USING btree (idelemento);


--
-- Name: idx_ad_tiporeq1_ad_ru; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_tiporeq1_ad_ru ON ad_tiporeq USING btree (idrubrica);


--
-- Name: idx_ad_tiposervint1_ad_ru; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_tiposervint1_ad_ru ON ad_tiposervint USING btree (idrubrica);


--
-- Name: idx_ad_trecho1_ad_it; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_trecho1_ad_it ON ad_trecho USING btree (idrequisicao, idpessoa);


--
-- Name: idx_ad_uo1_cm_se; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_uo1_cm_se ON ad_uo USING btree (idsetor);


--
-- Name: idx_ad_uoalmox1_ad_uo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_uoalmox1_ad_uo ON ad_uoalmox USING btree (iduoalmox);


--
-- Name: idx_ad_uoalmox2_ad_uo; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_uoalmox2_ad_uo ON ad_uoalmox USING btree (iduoreq);


--
-- Name: idx_ad_veiculo1_ad_ti; Type: INDEX; Schema: public; Owner: siga; Tablespace: 
--

CREATE INDEX idx_ad_veiculo1_ad_ti ON ad_veiculo USING btree (tipoveiculo);




-- Valores:
-- Cadastrando os tipos de requisições (que são padronizados);
INSERT INTO ad_tiporeq VALUES (nextval('seq_ad_tiporeq'),'RESTAURANTE');
INSERT INTO ad_tiporeq VALUES (nextval('seq_ad_tiporeq'),'HOTEL');
INSERT INTO ad_tiporeq VALUES (nextval('seq_ad_tiporeq'),'PASSAGEM');
INSERT INTO ad_tiporeq VALUES (nextval('seq_ad_tiporeq'),'VEICULO');
INSERT INTO ad_tiporeq VALUES (nextval('seq_ad_tiporeq'),'DIARIA');
INSERT INTO ad_tiporeq VALUES (nextval('seq_ad_tiporeq'),'COMPRA PERMANENTE');
INSERT INTO ad_tiporeq VALUES (nextval('seq_ad_tiporeq'),'COMPRA CONSUMO');
INSERT INTO ad_tiporeq VALUES (nextval('seq_ad_tiporeq'),'ALMOXARIFADO');
INSERT INTO ad_tiporeq VALUES (nextval('seq_ad_tiporeq'),'SERVICO EXTERNO');
INSERT INTO ad_tiporeq VALUES (nextval('seq_ad_tiporeq'),'BIBLIOTECA');

-- Cadastrando os tipos de veículos

INSERT INTO ad_tipoveiculo VALUES (1,'AUTOMOVEL',NULL,NULL);
INSERT INTO ad_tipoveiculo VALUES (2,'ONIBUS',NULL,NULL);
INSERT INTO ad_tipoveiculo VALUES (3,'CAMINHAO',NULL,NULL);
INSERT INTO ad_tipoveiculo VALUES (4,'VAN','0',NULL);
INSERT INTO ad_tipoveiculo VALUES (5,'MICRO-ONIBUS','0',NULL);

-- Tabela ad_controle 

INSERT INTO ad_controle VALUES ('N','2008');

-- Cadastramento dos tipos de modalidade para licitação

INSERT INTO ad_modalidadelicitacao VALUES (1,'CONVITE',NULL,'80000.00');
INSERT INTO ad_modalidadelicitacao VALUES (2,'TOMADA PREÇO',NULL,'650000.00');
INSERT INTO ad_modalidadelicitacao VALUES (3,'CONCORRÊNCIA','650000.00',NULL);
INSERT INTO ad_modalidadelicitacao VALUES (4,'DISPENSA DE LICITAÇÃO',NULL,'8000.00');
INSERT INTO ad_modalidadelicitacao VALUES (5,'PREGÃO',NULL,NULL);
INSERT INTO ad_modalidadelicitacao VALUES (6,'CONCURSO',NULL,NULL);
INSERT INTO ad_modalidadelicitacao VALUES (7,'LEILÃO',NULL,'650000.00');
INSERT INTO ad_modalidadelicitacao VALUES (8,'INEXIBILIDADE',NULL,NULL);

