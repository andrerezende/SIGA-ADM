<?
$perms->CheckAccess('adm_compras',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Itens a Licitar', $module, $self);
$form = $ui->GetForm($module,'frmItensALicitar');
$theme->InsertContent($form);
?>
