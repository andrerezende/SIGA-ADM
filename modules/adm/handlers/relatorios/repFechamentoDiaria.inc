<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Fechamento Diária', $module, $self);
$form = $ui->GetForm($module,'frmRepFechamentoDiaria','','relatorios');
$theme->InsertContent($form);
?>
