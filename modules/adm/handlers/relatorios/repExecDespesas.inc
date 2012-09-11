<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Execução de Despesas', $module, $self);
$form = $ui->GetForm($module,'frmRepExecDespesas','','relatorios');
$theme->InsertContent($form);
?>
