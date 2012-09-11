<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Requisições Pendentes', $module, $self);
$form = $ui->GetForm($module,'frmRepReqPendente','','relatorios');
$theme->InsertContent($form);
?>
