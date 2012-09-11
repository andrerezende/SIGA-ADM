<?
$login = $auth->getLogin();
$perms->CheckAccess('ensino',A_ACCESS,true);
$home = 'main:admin';
$navbar->AddOption('Aviso',$module,$self);
$ui = $MIOLO->GetUI();
$form = $ui->GetForm($module,'frmIngressoAviso',$login);
$theme->InsertContent($form);
?>