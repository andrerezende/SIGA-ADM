<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Endereço', 'adm', 'main:uoveiculo:main');
	$form = $ui->GetForm('adm','frmEnderecoNew',NULL,'uoveiculo');
	$theme->InsertContent($form);
?>
