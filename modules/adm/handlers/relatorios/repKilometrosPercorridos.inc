<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Quilômetros Percorridos', $module, $self);
$form = $ui->GetForm($module,'frmRepKilometrosPercorridos','','relatorios');
$theme->InsertContent($form);
?>
