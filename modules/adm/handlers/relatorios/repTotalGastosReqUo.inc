<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Total de Gastos', $module, $self);
$form = $ui->GetForm($module,'frmTotalGastosReqUo','','relatorios');
$theme->InsertContent($form);
?>
