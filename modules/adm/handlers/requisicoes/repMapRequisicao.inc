<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
    $navbar->AddOption('Relatório Mapa Utilização Veículo', 'adm', 'main:repMapRequisicao');
	$form = $ui->GetForm('adm','frmRepMapRequisicao',NULL,'requisicoes');
	$theme->InsertContent($form);
?>