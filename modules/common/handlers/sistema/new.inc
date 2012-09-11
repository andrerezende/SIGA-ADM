<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Sistema', 'common', 'main:sistema:new');
	$form = $ui->GetForm('common','frmSistemaNew',NULL,'sistema');
	$theme->InsertContent($form);
?>