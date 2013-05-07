<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
        $navbar->AddOption('Requisição', 'adm', 'main:requisicoes:find');
	$form = $ui->GetForm('adm','frmRequisicaoFindVeiculo',NULL,'requisicoes');
	$theme->InsertContent($form);
        
?>
