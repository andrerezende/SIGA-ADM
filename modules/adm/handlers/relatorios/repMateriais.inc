<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Materiais', $module, $self);
$form = $ui->GetForm($module,'frmRepMateriais','','relatorios');
$theme->InsertContent($form);
?>
