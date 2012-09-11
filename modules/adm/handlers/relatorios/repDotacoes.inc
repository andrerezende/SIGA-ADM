<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Dotacoes', $module, $self);
$form = $ui->GetForm($module,'frmRepDotacoes','','relatorios');
$theme->InsertContent($form);
?>
