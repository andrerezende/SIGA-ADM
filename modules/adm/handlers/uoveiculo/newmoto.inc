<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Veículo', 'adm', 'main:uoveiculo:main');
	$form = $ui->GetForm('adm','frmUoMotoristaNew',NULL,'uoveiculo');
	$theme->InsertContent($form);
?>
