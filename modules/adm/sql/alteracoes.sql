-- Sequencias:

	--1 
		CREATE SEQUENCE seq_ad_requisicao START WITH 1;
	--2
		CREATE SEQUENCE seq_ad_suplementacaoitem start with 1;
	--3
		CREATE SEQUENCE seq_ad_orcamento start with 1;
	--4
		CREATE SEQUENCE seq_ad_empenho start with 1;
	--5 
		CREATE SEQUENCE seq_ad_notafiscal start with 1;
	-- 6 
		CREATE SEQUENCE seq_ad_ordentrega start with 1;
	-- 7
		CREATE SEQUENCE seq_ad_movimento start with 1;
	-- 8
		CREATE SEQUENCE seq_ad_liquidacao start with 1;
	-- 9
		CREATE SEQUENCE seq_ad_novomaterial start with 1;



-- Colunas:

	-- 1 - Tabela ad_itemreqpassagem
	ALTER TABLE ad_itemreqpassagem ADD COLUMN email character varying (100);
	-- 2 - Tabela ad_itemreq
	ALTER TABLE ad_itemreq ADD COLUMN quantdevolvida integer;
	-- 3 
	ALTER TABLE ad_empenhado ADD COLUMN numeroanulacao character varying (10) ; 
	-- 4 
	ALTER TABLE ad_itemreqservext ADD COLUMN quantempenhada integer ;
	-- 5 
	ALTER TABLE ad_itemreqservext ADD COLUMN quantentregue integer ; 
	-- 6 
	ALTER TABLE ad_itemreqservext ADD COLUMN quantdevolvida integer ; 
	-- 7 
	ALTER TABLE ad_empenhado ADD COLUMN quantidadeanulada integer;
	-- 8 
	ALTER TABLE ad_movimento ADD COLUMN iduoalmox INTEGER;
	-- 9 
	ALTER TABLE ad_orcamento ALTER COLUMN dotacao SET DEFAULT '0';
	-- 10
	ALTER TABLE ad_orcamento ALTER COLUMN suplementacao SET DEFAULT '0';
	-- 11
	ALTER TABLE ad_orcamento ALTER COLUMN bloqueio SET DEFAULT '0';
	-- 12
	ALTER TABLE ad_orcamento ALTER COLUMN anulacao SET DEFAULT '0';
	-- 13
	ALTER TABLE ad_orcamento ALTER COLUMN pago SET DEFAULT '0';
	-- 14
	ALTER TABLE ad_movimento ADD COLUMN iduoalmox INTEGER ;
	-- 15
  	ALTER TABLE ad_itemreq ALTER COLUMN quantentregue SET DEFAULT '0';
	-- 16
  	ALTER TABLE ad_ordentrega ALTER COLUMN impresso SET DEFAULT '0';
	-- 17
	ALTER TABLE ad_novomaterial add COLUMN ativo char(1) DEFAULT 'S';
	-- 18 
	ALTER TABLE ad_movimentopat ADD COLUMN numeroprocesso char(12);
  
  
-- Tabelas:

	--1 
		CREATE TABLE ad_participante (
		idlicitacao INTEGER NOT NULL,
		idfornecedor INTEGER NOT NULL
		);
		ALTER TABLE ONLY ad_participante
		ADD CONSTRAINT fk_ad_participante_licitacaoid FOREIGN KEY (idlicitacao) REFERENCES ad_licitacao(idlicitacao);
		ALTER TABLE ONLY ad_participante
		ADD CONSTRAINT fk_ad_participante_fornecedorid FOREIGN KEY (idfornecedor) REFERENCES ad_fornecedor(idfornecedor);

	--2
		CREATE TABLE ad_suplementacaoitem(
		idsuplementacaoitem INTEGER NOT NULL,
		idlicitacao INTEGER NOT NULL,
		item  CHAR(50),
		data date,
		quantidadesuplementar INTEGER,
		valorunitsuplementar NUMERIC(12,2),
		idsuplementacaoitemref INTEGER,
		idrequisicao INTEGER NOT NULL
		 );

		ALTER TABLE ad_suplementacaoitem ADD primary key(idlicitacao,idrequisicao);
		ALTER TABLE ad_suplementacaoitem ADD CONSTRAINT fk_suplementacaoitem_RequisicaoId FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);
		ALTER TABLE ad_suplementacaoitem ADD CONSTRAINT fk_suplementacaoitem_LicitacaoId FOREIGN KEY (idlicitacao) REFERENCES ad_licitacao(idlicitacao);

	-- 3 
		CREATE TABLE ad_empenhadodist(
		idempenhado INTEGER NOT NULL,
		idrequisicao INTEGER NOT NULL,
		valorunitario NUMERIC(12,2),
		quantidade INTEGER	
		);
		
		ALTER TABLE ONLY ad_empenhadodist
		ADD CONSTRAINT pk_ad_empenhadodist PRIMARY KEY (idempenhado,idrequisicao);
		ALTER TABLE ONLY ad_empenhadodist
    	ADD CONSTRAINT fk_ad_empenhadodist_requisicaoid FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);
		ALTER TABLE ONLY ad_empenhadodist
	    ADD CONSTRAINT fk_ad_empenhadodist_empenhadoid FOREIGN KEY (idempenhado) REFERENCES ad_empenhado(idempenhado);

  -- 4
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
		ALTER TABLE ONLY ad_movimentoserv
    ADD CONSTRAINT pk_ad_movimentoserv PRIMARY KEY (idmovimentoserv);

    ALTER TABLE ONLY ad_movimentoserv
    ADD CONSTRAINT fk_ad_movimentoserv_itemnota FOREIGN KEY (iditemnota) REFERENCES ad_itemnota(iditemnota);	
