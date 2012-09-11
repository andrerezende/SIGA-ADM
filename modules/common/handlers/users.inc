<?
    $perms->CheckAccess('usuario',A_ACCESS,true);
    $home = 'main:adm';
    $navbar->AddOption('Usuários',$module,$self);
    $ui = $MIOLO->GetUI();
    $form = $ui->GetForm($module,'frmUsuario');
    $theme->AppendContent($form);
?>
