<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Histórico do Item', $module, $self);
$form = $ui->GetForm($module,'frmRepHistoricoItem','','relatorios');
$theme->InsertContent($form);
?>
