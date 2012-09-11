<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Execução Financeira Por Fatura', $module, $self);
$form = $ui->GetForm($module,'frmRepExecucaoFinanceiraPorFatura','','relatorios');
$theme->InsertContent($form);
?>
