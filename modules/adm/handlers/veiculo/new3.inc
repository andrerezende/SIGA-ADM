<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Veículo', 'adm', 'main:veiculo:new3');
	$form = $ui->GetForm('adm','frmVeiculoNew3',NULL,'veiculo');
	$theme->InsertContent($form);
?>
