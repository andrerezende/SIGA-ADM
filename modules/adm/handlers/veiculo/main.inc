<?
	if($perms->CheckAccess('ADM_EXECUTORGARAG',A_ACCESS,true))
    $theme->ClearContent();
    $objVeiculo = $MIOLO->GetBusiness('adm','veiculo', $item);
    $navbar->AddOption($objVeiculo->placa." - ".$objVeiculo->modelo, 'adm', 'main:veiculo:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmVeiculo', $objVeiculo, 'veiculo');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
