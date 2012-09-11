<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Bolsas Acadêmicas', $module, $self);
$form = $ui->GetForm($module,'frmRepBolsa','','relatorios');
$theme->InsertContent($form);
?>