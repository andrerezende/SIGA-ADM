<?
	if($perms->CheckAccess('ADM_EXECUTORGARAG',A_ACCESS,true))
    $theme->ClearContent();
    $motorista = $MIOLO->GetUI();
    $objMotorista = $MIOLO->GetBusiness('adm','motorista', $item);
    $navbar->AddOption($objMotorista->pessoa->nome, 'adm', 'main:motorista:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmMotorista', $objMotorista, 'motorista');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
