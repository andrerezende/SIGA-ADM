<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Fechamento', $module, $self);
$form = $ui->GetForm($module,'frmRepFechamento','','relatorios');
$theme->InsertContent($form);
?>