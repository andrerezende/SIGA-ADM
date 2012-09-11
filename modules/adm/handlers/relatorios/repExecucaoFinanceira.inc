<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Execução Financeira', $module, $self);
$form = $ui->GetForm($module,'frmRepExecucaoFinanceira','','relatorios');
$theme->InsertContent($form);
?>
