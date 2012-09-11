<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Execução Financeira', $module, $self);
$form = $ui->GetForm($module,'frmRepExecucaoFinanceiraResumo','','relatorios');
$theme->InsertContent($form);
?>
