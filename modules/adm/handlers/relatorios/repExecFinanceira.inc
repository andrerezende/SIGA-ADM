<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Requisições Feitas', $module, $self);
$form = $ui->GetForm($module,'frmRepExecFinanceira','','relatorios');
$theme->InsertContent($form);
?>
