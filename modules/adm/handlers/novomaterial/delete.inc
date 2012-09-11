<?  
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $objMaterial = $MIOLO->GetBusiness('adm','novomaterial',$item);
    $form = $MIOLO->GetUI()->GetForm($module,'frmNovoMaterialDel',$objMaterial,'novomaterial');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
/*
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $form = $ui->GetForm('adm','frmNovoMaterialDel',NULL,'novomaterial');
    $theme->InsertContent($form);*/
?>
