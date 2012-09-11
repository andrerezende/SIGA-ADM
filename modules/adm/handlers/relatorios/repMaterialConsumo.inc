<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Material de Consumo', $module, $self);
$form = $ui->GetForm($module,'frmRepMaterialConsumo','','relatorios');
$theme->InsertContent($form);
?>
