<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $objEmpresa = $MIOLO->GetBusiness('controle','empresa',$item);

    $navbar->AddOption($objEmpresa->nome, 'empresa', 'main:empresa:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmEmpresa', $objEmpresa, 'empresa');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
