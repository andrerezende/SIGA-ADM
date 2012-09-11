<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Pais', 'common', 'main:pais:new');
	$form = $ui->GetForm('common','frmPaisNew',NULL,'pais');
	$theme->InsertContent($form);
?>