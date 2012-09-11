<?
$perms->CheckAccess('enviaemail',A_ACCESS,true);
$home = 'main:admin';
$navbar->AddOption('email',$module,$self);
$ui = $MIOLO->GetUI();
$form = $ui->GetForm($module,'frmEnviaEmail');
$theme->InsertContent($form);
?>