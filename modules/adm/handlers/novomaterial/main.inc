<?
    $perms->CheckAccess('ADM',A_ACCESS,true);
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $objMaterial = $MIOLO->GetBusiness('adm','novomaterial',$item);
    $navbar->AddOption('Editar Novo Material','adm','main:novomaterial:main',$item);
    $form = $MIOLO->GetUI()->GetForm($module,'frmNovoMaterial',$objMaterial,'novomaterial');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
