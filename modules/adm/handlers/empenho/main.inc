<?
    $perms->CheckAccess('adm',A_ACCESS,true);
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $objEmpenho = $MIOLO->GetBusiness('adm','empenho',$item);
    $navbar->AddOption("Empenho {$objEmpenho->numero}", 'adm', 'main:empenho:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmEmpenho',$objEmpenho,'empenho');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
