<?
$perms->CheckAccess('adm_compras',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Propostas', $module, $self);
$form = $ui->GetForm($module,'frmProposta');
$theme->InsertContent($form);
?>
