<?
$perms->CheckAccess('adm_compras',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Vencedores', $module, $self);
$form = $ui->GetForm($module,'frmVencedores');
$theme->InsertContent($form);
?>
