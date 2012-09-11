<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Tipo de Serviço Interno', 'adm', 'main:servInterno:new');
	$form = $ui->GetForm('adm','frmServInternoNew',NULL,'servInterno');
	$theme->InsertContent($form);
?>
