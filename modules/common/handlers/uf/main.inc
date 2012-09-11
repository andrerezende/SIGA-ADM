<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();

    $obj = $MIOLO->GetBusiness('common','uf', $item);

    $navbar->AddOption(ucwords(strtolower($obj->UF)), 'common', 'main:uf:main',$item);
    $form = $MIOLO->GetUI()->GetForm($module,'frmUf', $obj,'uf');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>