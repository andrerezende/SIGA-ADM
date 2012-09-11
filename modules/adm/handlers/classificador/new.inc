<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Classificador', 'adm', 'main:classificador:new');
	$form = $ui->GetForm('adm','frmClassificadorNew',NULL,'classificador');
	$theme->InsertContent($form);
?>
