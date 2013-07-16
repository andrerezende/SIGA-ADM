<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
        $navbar->AddOption('Relatório Mapa Utilização Motorista', 'adm', 'main:repMapUtilizacaoMotorista');
	$form = $ui->GetForm('adm','frmRepMapUtilizacaoMotoristaLog',NULL,'requisicoes');
	$theme->InsertContent($form);
?>
