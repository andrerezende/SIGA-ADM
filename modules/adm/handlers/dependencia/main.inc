<?
    if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    $dependencia = $MIOLO->GetUI();
    $objDependencia = $MIOLO->GetBusiness('adm','dependencia', $item);

    $navbar->AddOption($objDependencia->dependencia, 'adm', 'main:dependencia:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmDependencia', $objDependencia, 'dependencia');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
