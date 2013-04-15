<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Nova Requisição', 'adm', 'main:requisicaoveiculo:new');
	$form = $ui->GetForm('adm','frmRequisicaoNewVeiculo',NULL,'requisicoes');
	$theme->InsertContent($form);
?>
