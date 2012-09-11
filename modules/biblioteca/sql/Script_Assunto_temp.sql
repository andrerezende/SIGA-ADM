CREATE TABLE bt_assunto (idassunto integer not null, idetiqueta integer not null, subcampo character(1), conteudo character varying(3000), indicador character(1), linha integer, ocorrencia integer, classificacao varchar(15));


ALTER TABLE bt_assunto ADD CONSTRAINT PK_BT_ASSUNTO PRIMARY KEY(idassunto);

ALTER TABLE bt_assunto add constraint FK_BT_ASSUNTO_ETIQUETA foreign key (idetiqueta) references bt_etiqueta(idetiqueta);

CREATE SEQUENCE seq_bt_assunto START WITH 1;

CREATE TABLE bt_assuntoobra (idassunto integer not null, idobra integer not null, idmaterial integer not null, ocorrencia integer not null);

