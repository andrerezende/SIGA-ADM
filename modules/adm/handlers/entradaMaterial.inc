<?
$perms->CheckAccess('adm_opalmoxarifado',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Entrada de Material', $module, $self);
$form = $ui->GetForm($module,'frmEntradaMaterial');
$theme->InsertContent($form);
?>
