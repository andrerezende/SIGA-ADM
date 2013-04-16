<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
        $objTipoReq = $MIOLO->GetBusiness('adm','tiporeq', 4);
	$navbar->AddOption('Nova Requisição', 'adm', 'main:requisicaoveiculo:new');
	$form = $ui->GetForm('adm','frmRequisicaoNewVeiculo',$objTipoReq,'requisicoes');
	$theme->InsertContent($form);
?>
