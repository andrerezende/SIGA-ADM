<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Corrige Movimento', $module, $self);
$form = $ui->GetForm($module,'frmCorrigeMovimento','');
$theme->InsertContent($form);
?>
