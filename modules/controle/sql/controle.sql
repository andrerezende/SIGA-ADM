-- Script da opção Veículos do módulo controle

CREATE TABLE ct_tipomanutencao (idtipomanutencao INTEGER NOT NULL primary key, tipomanutencao VARCHAR(30) NOT NULL);
CREATE SEQUENCE seq_ct_tipomanutencao START WITH 1;

CREATE TABLE ct_empresa (idempresa INTEGER NOT NULL primary key, cnpj CHAR(18), nome VARCHAR(50), razaosocial VARCHAR(50), rua VARCHAR(40), numero CHAR(5), bairro VARCHAR(50),cep CHAR(8), telefone VARCHAR(10), idmunicipio VARCHAR(5) NOT NULL);
ALTER TABLE ONLY ct_empresa ADD CONSTRAINT ct_empresa_municipio_fkey FOREIGN KEY (idmunicipio) REFERENCES cm_municipio(idmunicipio);
CREATE SEQUENCE seq_ct_empresa START WITH 1;

CREATE TABLE ct_prevrevisao (idprevrevisao INTEGER NOT NULL primary key, placa CHAR(7) NOT NULL, data_prevista DATE, kmestimada NUMERIC(8,2), situacao CHAR(1));
ALTER TABLE ONLY ct_prevrevisao ADD CONSTRAINT ct_prevrevisao_veiculo_fkey FOREIGN KEY (placa) REFERENCES ad_veiculo (placa);
CREATE SEQUENCE seq_ct_prevrevisao START WITH 1;

CREATE TABLE ct_notafiscal (idnotafiscal INTEGER NOT NULL primary key, placa CHAR(7) NOT NULL, idempresa INTEGER NOT NULL, idprevrevisao INTEGER, data_manutencao DATE, valortotal NUMERIC(8,2));
ALTER TABLE ONLY ct_notafiscal ADD CONSTRAINT ct_notafiscal_veiculo_fkey FOREIGN KEY (placa) REFERENCES ad_veiculo(placa);
ALTER TABLE ONLY ct_notafiscal ADD CONSTRAINT ct_notafiscal_prevrevisao_fkey FOREIGN KEY (idprevrevisao) REFERENCES ct_prevrevisao(idprevrevisao);
ALTER TABLE ONLY ct_notafiscal ADD CONSTRAINT ct_notafiscal_empresa_fkey FOREIGN KEY (idempresa) REFERENCES ct_empresa(idempresa);
CREATE SEQUENCE seq_ct_notafiscal START WITH 1;




CREATE TABLE ct_manutencaoveiculo (idmanutencao INTEGER NOT NULL primary key, idtipomanutencao INTEGER NOT NULL, idnotafiscal INTEGER NOT NULL, valor NUMERIC(8,2), obs VARCHAR(500));
ALTER TABLE ONLY ct_manutencaoveiculo ADD CONSTRAINT ct_manutencao_veiculo_tipomanutencao_fkey FOREIGN KEY (idtipomanutencao) REFERENCES ct_tipomanutencao(idtipomanutencao);
ALTER TABLE ONLY ct_manutencaoveiculo ADD CONSTRAINT ct_manutencao_veiculo_notafiscal_fkey FOREIGN KEY (idnotafiscal) REFERENCES ct_notafiscal(idnotafiscal);
CREATE SEQUENCE seq_ct_manutencaoveiculo START WITH 1;

CREATE TABLE ct_combustivel (id INTEGER NOT NULL PRIMARY KEY, mes CHAR(15) not null, ano CHAR(4) not null, tipocombustivel CHAR(15) not null, valor NUMERIC (8,2) not null, nummes CHAR(2));
CREATE SEQUENCE seq_ct_combustivel START with 1;


-- Fim da opção Veículos

-- Tabelas referentes a ADM Abastecimento de veículo

CREATE TABLE ad_abastecimento(idabastecimento INTEGER NOT NULL, posto VARCHAR(50), enderecoposto VARCHAR(50), cidadeposto VARCHAR(50), datahoraabastecimento TIMESTAMP WITH TIME ZONE, valorabastecimento NUMERIC(8,2), quantidade NUMERIC(4,2), combustivel CHAR(1));

CREATE TABLE ad_abastecimentorequisicao (idabastecimento INTEGER NOT NULL, idrequisicao INTEGER NOT NULL);
