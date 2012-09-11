<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Nova Rubrica', 'adm', 'main:rubrica:new');
	$form = $ui->GetForm('adm','frmRubricaNew',NULL,'rubrica');
	$theme->InsertContent($form);
?>
