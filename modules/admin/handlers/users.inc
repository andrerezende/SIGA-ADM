<?
$perms->CheckAccess('user',A_ACCESS,true);
$home = 'main:admin';
$navbar->AddOption('Users',$module,$self);
$ui = $MIOLO->GetUI();
$form = $ui->GetForm($module,'frmUser');
$theme->AppendContent($form);
?>
