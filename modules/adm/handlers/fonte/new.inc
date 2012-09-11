<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Nova Fonte', 'adm', 'main:fonte:new');
	$form = $ui->GetForm('adm','frmFonteNew',NULL,'fonte');
	$theme->InsertContent($form);
?>
