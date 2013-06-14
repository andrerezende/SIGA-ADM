<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
        $navbar->AddOption('Requisição', 'adm','main');
	$form = $ui->GetForm('adm','frmRequisicaoFind',NULL,'requisicoes');
	$theme->InsertContent($form);
?>
