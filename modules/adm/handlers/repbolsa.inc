<?
$perms->CheckAccess('relbolsa',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Bolsas',$module,'main:sispag');

$navbar->AddOption('Relatorio Bolsa', $module, $self);
$form = $ui->GetForm($module,'frmRepBolsa');
$theme->InsertContent($form);
?>
