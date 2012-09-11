<?
$perms->CheckAccess('adm_opalmoxarifado',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Relatório de Ordem de Entrega', $module, $self);
$form = $ui->GetForm($module,'frmRepOrdemEntrega');
$theme->InsertContent($form);
?>
