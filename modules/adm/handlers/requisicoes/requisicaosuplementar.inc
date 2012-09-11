<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
    $navbar->AddOption('Requisição Suplementar', 'adm', 'main:requisicaosuplementar');
	$form = $ui->GetForm('adm','frmRequisicaoSuplementar',NULL,'requisicoes');
	$theme->InsertContent($form);
?>
