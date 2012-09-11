<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Requisições a serem liberadas', $module, $self);
$form = $ui->GetForm($module,'frmRepReqALiberar','','relatorios');
$theme->InsertContent($form);
?>