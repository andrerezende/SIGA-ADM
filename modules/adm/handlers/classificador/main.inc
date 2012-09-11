<?
    if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    $objClassificador = $MIOLO->GetBusiness('adm','classificador', $item);

    $navbar->AddOption($objClassificador->idClassificador, 'adm', 'main:classificador:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmClassificador', $objClassificador, 'classificador');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
