ALTER TABLE rh_provimento add column idsetor integer;
ALTER TABLE rh_provimento ADD constraint fk_iddsetor foreign key (idsetor) references cm_setor;

--Também é necessário cadastrar os dados do professor no banco:
--insert into rh_funcionario (idfuncionario,idpessoa) values ('jobs',622929); 
--INSERT into rh_vinculo (idvinculo,dvidvinculo,idfuncionario) values ('jobs','1','jobs'); 
--insert into rh_situacaofuncional (idsituacao,descricao,regimejuridico) values (1,'Ativo','EST'); 
--insert into rh_provimento (idvinculo, datainicio,excedelotacao,idgrupocargo,idcargo,idsetor,idsituacao,regimejuridico) values ('jobs','2008-05-13','0',1,1,37,'1','EST');

