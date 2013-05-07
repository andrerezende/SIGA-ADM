<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
    $navbar->AddOption('Relatório Mapa Utilização Motorista', 'adm', 'main:repMapUtilizacaoMotorista');
	$form = $ui->GetForm('adm','frmRepMapUtilizacaoMotorista',NULL,'requisicoes');
	$theme->InsertContent($form);
?>
