<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
        $navbar->AddOption('Veículos', 'adm', 'main:uoveiculo:main');
        $navbar->AddOption('Relatório Mapa Utilização Motorista', 'adm', 'main:repMapUtilizacaoMotorista');
	$form = $ui->GetForm('adm','frmRepMapUtilizacaoMotorista',NULL,'requisicoes');
	$theme->InsertContent($form);
?>
