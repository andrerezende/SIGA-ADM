<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Relatório de Viagens', $module, $self);
$form = $ui->GetForm($module,'frmRepReqViagens','','relatorios');
$theme->InsertContent($form);
?>