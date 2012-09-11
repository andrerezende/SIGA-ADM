<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();

    $obj = $MIOLO->GetBusiness('common','sistema', $item);

    $navbar->AddOption(ucwords(strtolower($obj->sistema)), 'common', 'main:sistema:main',$item);
    $form = $MIOLO->GetUI()->GetForm($module,'frmSistema', $obj,'sistema');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>