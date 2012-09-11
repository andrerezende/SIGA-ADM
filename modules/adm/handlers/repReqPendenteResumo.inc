<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Resumo de Requisições Pendentes', $module, $self);
$form = $ui->GetForm($module,'frmRepReqPendenteResumo','','relatorios');
$theme->InsertContent($form);
?>
