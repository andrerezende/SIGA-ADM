<?
$home = 'main:admin';
$navbar->AddOption('email',$module,$self);
$ui = $MIOLO->GetUI();
$form = $ui->GetForm($module,'frmEmail');
$theme->InsertContent($form);
?>