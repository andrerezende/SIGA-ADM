<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo IRRF', 'adm', 'main:irrf:new');
	$form = $ui->GetForm('adm','frmIrrfNew',NULL,'irrf');
	$theme->InsertContent($form);
?>
