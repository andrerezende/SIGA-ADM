<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();

    $obj = $MIOLO->GetBusiness('common','municipio', $item);

    $navbar->AddOption(ucwords(strtolower($obj->municipio)), 'common', 'main:municipio:main',$item);
    $form = $MIOLO->GetUI()->GetForm($module,'frmMunicipio', $obj,'municipio');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>