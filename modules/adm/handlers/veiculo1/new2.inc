<?
        if($perms->CheckAccess('ADM_VEICULO',A_ACCESS,true))
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();        
	$navbar->AddOption('Novo Veículo', 'adm', 'main:veiculo:new2');
	$form = $ui->GetForm('adm','frmVeiculoNew2',NULL,'veiculo');
	$theme->InsertContent($form);
?>
