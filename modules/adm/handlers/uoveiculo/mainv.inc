<?
	if($perms->CheckAccess('ADM_VEICULO',A_ACCESS,true))
    $theme->ClearContent();
        $item1 = JSP3410;
    $objVeiculo = $MIOLO->GetBusiness('adm','uoveiculo', $item1);
    $navbar->AddOption('Veículos', 'adm', 'main:uoveiculo:main');
    $navbar->AddOption($objVeiculo->placa." - ".$objVeiculo->modelo, 'adm', 'main:uoveiculo:main');
    //$navbar->AddOption($objVeiculo->placa." - ".$objVeiculo->modelo, 'adm', 'main:veiculo:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmVeiculo1', $objVeiculo, 'uoveiculo');
    $theme->InsertContent($form);
    /*$a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);*/
?>
