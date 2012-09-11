<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('ConRazão', $module, $self);
$form = $ui->GetForm($module,'frmRepConRazao','','relatorios');
$theme->InsertContent($form);
?>
