<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Requisições por UO', $module, $self);
$form = $ui->GetForm($module,'frmRepRequisicaoUo','','relatorios');
$theme->InsertContent($form);
?>
