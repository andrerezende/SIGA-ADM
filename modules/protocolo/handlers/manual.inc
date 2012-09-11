<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Manual', 'protocolo', 'main:manual');
$form = $ui->GetForm('protocolo','frmManual');
$theme->InsertContent($form);
?>
