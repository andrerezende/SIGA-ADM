<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Veículo', 'adm', 'main:uoveiculo:main');
        
	$form = $ui->GetForm('adm','frmUoVeiculoNew',NULL,'uoveiculo');
	$theme->InsertContent($form);
?>
