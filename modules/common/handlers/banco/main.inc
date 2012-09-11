<?
    $perms->CheckAccess('BANCO',A_ACCESS,true);
    
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();

    $objBanco = $MIOLO->GetBusiness('common','banco', $item);

    $navbar->AddOption(ucwords(strtolower($objBanco->nome)), 'common', 'main:banco:main',$item);
    $form = $MIOLO->GetUI()->GetForm($module,'frmBanco', $objBanco,'banco');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
