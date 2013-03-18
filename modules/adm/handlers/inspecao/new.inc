<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Nova Requisição', 'adm', 'main:requisicoes:new');
	$form = $ui->GetForm('adm','frmRequisicaoNew',NULL,'requisicoes');
	$theme->InsertContent($form);
?>
