<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $objMaterial = $MIOLO->GetBusiness('adm','material', $item);
    $navbar->AddOption(ucwords(strtolower($objMaterial->codmaterial)),'adm','main:material:main',$item);
    $form = $MIOLO->GetUI()->GetForm($module,'frmMaterial', $objMaterial,'material');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?> 
