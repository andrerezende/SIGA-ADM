<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Viagem Motorista', $module, $self);
$form = $ui->GetForm($module,'frmRepExecViagemMotorista','','relatorios');
$theme->InsertContent($form);
?>