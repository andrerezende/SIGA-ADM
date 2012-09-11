<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Manual', 'adm', 'main:manual');
$form = $ui->GetForm('adm','frmManual');
$theme->InsertContent($form);
?>
