<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
        $objTipoReq = $MIOLO->GetBusiness('adm','tiporeq', 8);
	$navbar->AddOption('Nova Requisição', 'adm', 'main:requisicoes:new');
	$form = $ui->GetForm('adm','frmRequisicaoNew',$objTipoReq,'requisicoes');
	$theme->InsertContent($form);
?>
