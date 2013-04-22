<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
    $navbar->AddOption('Relatório Mapa de Inspeção de Veículo', 'adm', 'main:repMapInspecaoVeiculo');
	$form = $ui->GetForm('adm','frmRepMapInspecaoVeiculo',NULL,'inspecao');
	$theme->InsertContent($form);
?>
