<?

    $perms->CheckAccess('sessao',A_ACCESS,true);
    $navbar->AddOption('Sessões',$module,$self);
    $ui = $MIOLO->GetUI();
    $form = $ui->GetForm($module,'frmSessao');
    $theme->InsertContent($form);
?>
