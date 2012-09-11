<?
$perms->CheckAccess('adm_opalmoxarifado',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Relatório de Movimentos por Sub-elemento', $module, $self);
$form = $ui->GetForm($module,'frmRepSubElemento');
$theme->InsertContent($form);
?>
