<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
        $navbar->AddOption('Relatório Mapa Utilização Veículo', 'adm', 'main:repMapUtilizacaoVeiculo');
	$form = $ui->GetForm('adm','frmRepMapUtilizacaoVeiculo',NULL,'requisicoes');
	$theme->InsertContent($form);
?>
