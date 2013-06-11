<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
        $navbar->AddOption('Veículos', 'adm', 'main:uoveiculo:main');
        $navbar->AddOption('Relatório Mapa Utilização Veículo', 'adm', 'main:repMapUtilizacaoVeiculo');
	$form = $ui->GetForm('adm','frmRepMapUtilizacaoVeiculo',NULL,'requisicoes');
	$theme->InsertContent($form);
?>
