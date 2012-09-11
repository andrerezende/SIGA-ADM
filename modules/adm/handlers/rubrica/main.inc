<?
    if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    $rubrica = $MIOLO->GetUI();
    $objRubrica = $MIOLO->GetBusiness('adm','rubrica', $item);

    $navbar->AddOption($objRubrica->descricao, 'adm', 'main:rubrica:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmRubrica', $objRubrica, 'rubrica');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
