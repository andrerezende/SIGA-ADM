<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Item', 'adm', 'main:itempatrimonio:new');
	$form = $ui->GetForm('adm','frmPatrimonioNew',NULL,'patrimonio');
	$theme->InsertContent($form);
?>
