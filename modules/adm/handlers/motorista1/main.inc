<?
	if($perms->CheckAccess('ADM_MOTORISTA',A_ACCESS,true))
    $theme->ClearContent();
    $motorista = $MIOLO->GetUI();
    $objMotorista = $MIOLO->GetBusiness('adm','motorista', $item);
    //$navbar->AddOption('Veículos', 'adm', 'main:uoveiculo:main');
    $navbar->AddOption($objMotorista->pessoa->nome, 'adm', 'main:uoveiculo:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmMotorista', $objMotorista, 'uoveiculo');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>