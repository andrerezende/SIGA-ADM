<?
$home = 'main:admin';
$navbar->AddOption('DotProject',$module,$self);
$ui = $MIOLO->GetUI();
$form = $ui->GetForm($module,'frmDotProject');
$theme->InsertContent($form);
?>