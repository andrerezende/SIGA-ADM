<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
        $objTipoReq = $MIOLO->GetBusiness('adm','tiporeq', $item);
        //$navbar->AddOption('Requisição', 'adm', 'main:requisicaoveiculo:findveiculo');
        
	$form = $ui->GetForm('adm','frmRequisicaoFindVeiculo',$objTipoReq,'requisicoes');
	$theme->InsertContent($form);
        
?>
