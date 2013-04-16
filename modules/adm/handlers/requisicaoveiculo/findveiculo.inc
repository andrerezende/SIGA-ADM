<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
        $objTipoReq = $MIOLO->GetBusiness('adm','tiporeq', $item);
	$form = $ui->GetForm('adm','frmRequisicaoFindVeiculo',$objTipoReq,'requisicoes');
	$theme->InsertContent($form);
        
?>
