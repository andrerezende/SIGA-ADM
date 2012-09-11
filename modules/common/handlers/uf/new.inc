<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Uf', 'common', 'main:uf:new');
	$form = $ui->GetForm('common','frmUfNew',NULL,'uf');
	$theme->InsertContent($form);
?>