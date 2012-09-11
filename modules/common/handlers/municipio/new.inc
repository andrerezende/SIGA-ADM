<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Municipio', 'common', 'main:municipio:new');
	$form = $ui->GetForm('common','frmMunicipioNew',NULL,'municipio');
	$theme->InsertContent($form);
?>