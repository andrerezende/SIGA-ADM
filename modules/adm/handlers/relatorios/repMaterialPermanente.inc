<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Material Permanente', $module, $self);
$form = $ui->GetForm($module,'frmRepMaterialPermanente','','relatorios');
$theme->InsertContent($form);
?>
