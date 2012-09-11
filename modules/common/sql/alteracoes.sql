-- Altualizando as sequencias

SELECT setval('seq_cm_arquivo',(SELECT max(idarquivo) FROM cm_arquivo));
--SELECT setval('seq_cm_common',(SELECT max(idcommon) FROM cm_common));
SELECT setval('seq_cm_grupoacesso',(SELECT max(idgrupo) FROM cm_grupoacesso));
--SELECT setval('seq_cm_instituicao',(SELECT max(idinstituicao) FROM cm_instituicao));
SELECT setval('seq_cm_log',(SELECT max(idlog) FROM cm_log));
SELECT setval('seq_cm_noticia',(SELECT max(idnoticia) FROM cm_noticia));
SELECT setval('seq_cm_pessoa',(SELECT max(idpessoa) FROM cm_pessoa));
SELECT setval('seq_cm_sessao',(SELECT max(idsessao) FROM cm_sessao));
SELECT setval('seq_cm_setor',(SELECT max(idsetor) FROM cm_setor));
SELECT setval('seq_cm_tabelageral',(SELECT max(idtabelageral) FROM cm_tabelageral));
SELECT setval('seq_cm_tipoorganograma',(SELECT max(idtipoorganograma) FROM cm_tipoorganograma));
SELECT setval('seq_cm_transacao',(SELECT max(idtrans) FROM cm_transacao));
SELECT setval('seq_cm_usuario',(SELECT max(idusuario) FROM cm_usuario));