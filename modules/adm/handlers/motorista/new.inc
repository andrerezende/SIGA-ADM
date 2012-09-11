<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Motorista', 'adm', 'main:motorista:new');
	$form = $ui->GetForm('adm','frmMotoristaNew',NULL,'motorista');
	$theme->InsertContent($form);
?>
