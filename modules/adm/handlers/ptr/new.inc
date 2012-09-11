<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo PTR', 'adm', 'main:ptr:new');
	$form = $ui->GetForm('adm','frmPtrNew',NULL,'ptr');
	$theme->InsertContent($form);
?>
