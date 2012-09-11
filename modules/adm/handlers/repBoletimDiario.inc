<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Boletim Diário', $module, $self);
$form = $ui->GetForm($module,'frmRepBoletimDiario','','relatorios');
$theme->InsertContent($form);
?>
