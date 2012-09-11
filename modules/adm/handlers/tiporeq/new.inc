<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Tipo de Requisição', 'adm', 'main:tiporeq:new');
	$form = $ui->GetForm('adm','frmTipoReqNew',NULL,'tiporeq');
	$theme->InsertContent($form);
?>
