<?
    if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    $ptr = $MIOLO->GetUI();
    $objPtr = $MIOLO->GetBusiness('adm','ptr', $item);

    $navbar->AddOption($objPtr->descricao, 'adm', 'main:ptr:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmPtr', $objPtr, 'ptr');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
