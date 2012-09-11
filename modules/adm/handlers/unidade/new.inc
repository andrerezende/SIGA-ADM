<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Nova Unidade', 'adm', 'main:unidade:new');
	$form = $ui->GetForm('adm','frmUnidadeNew',NULL,'unidade');
	$theme->InsertContent($form);
?>
