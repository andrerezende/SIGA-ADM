CREATE TABLE GA_SITUACAO ( 
       IDSITUACAO                    CHAR(2)        NOT NULL,
       SITUACAO                      VARCHAR(20));

ALTER TABLE GA_SITUACAO ADD CONSTRAINT PK_GA_SITUACAO PRIMARY KEY(IDSITUACAO);

CREATE TABLE GA_ALUNO ( 
       MATRICULA                     CHAR(20)       NOT NULL,
       ANOCONCL2GR                   VARCHAR(4),
       ANOINGRESSO                   VARCHAR(4)     NOT NULL,
       SEMINGRESSO                   VARCHAR(1)     NOT NULL,
       SITUACAOALUNO                 VARCHAR(15)    NOT NULL,
       IDTIPOINGRESSO                CHAR(2)        NOT NULL,
       IDMOTIVOSAIDA                 CHAR(2),
       IDSITUACAO                    CHAR(2)        NOT NULL,
       IDINSTITUICAO                 CHAR(4)        NOT NULL,
       IDPESSOA                      INTEGER        NOT NULL);

ALTER TABLE GA_ALUNO ADD CONSTRAINT PK_GA_ALUNO PRIMARY KEY(MATRICULA);

ALTER TABLE GA_ALUNO ADD CONSTRAINT FK_GA_ALUNO4_CM_IN FOREIGN KEY(IDINSTITUICAO) REFERENCES CM_INSTITUICAO;

ALTER TABLE GA_ALUNO ADD CONSTRAINT FK_GA_ALUNO5_CM_PE FOREIGN KEY(IDPESSOA) REFERENCES CM_PESSOA;

ALTER TABLE GA_ALUNO ADD CONSTRAINT FK_GA_ALUNO3_GA_SI FOREIGN KEY(IDSITUACAO) REFERENCES GA_SITUACAO;

alter table ga_aluno add escola2g integer; 
alter table ga_aluno add cidade2g integer; 
alter table ga_aluno add pais2g integer; 
alter table ga_aluno add idinstituicaodest integer; 
alter table ga_aluno add obs varchar(300); 
alter table ga_aluno add obsperiodo varchar(300); 
