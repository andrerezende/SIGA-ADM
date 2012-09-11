<?
$home = 'main:admin';
$navbar->AddOption('Valida Carteira',$module,$self);
$ui = $MIOLO->GetUI();
$form = $ui->GetForm($module,'frmValidaCarteira');
$theme->InsertContent($form);
?>