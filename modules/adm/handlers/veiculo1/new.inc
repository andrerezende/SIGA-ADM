<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Veículo', 'adm', 'main:veiculo:new');
	$form = $ui->GetForm('adm','frmVeiculoNew',NULL,'veiculo');
	$theme->InsertContent($form);
?>
