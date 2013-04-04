<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
    $navbar->AddOption('Relatório Mapa Utilização Veículo', 'adm', 'main:repMapReqAbastecimento');
	$form = $ui->GetForm('adm','frmReqAbastecimento',NULL,'requisicoes');
	$theme->InsertContent($form);
?>
