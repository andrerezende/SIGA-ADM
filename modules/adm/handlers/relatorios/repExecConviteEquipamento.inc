<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Convite Equipamento', $module, $self);
$form = $ui->GetForm($module,'frmRepExecConviteEquipamento','','relatorios');
$theme->InsertContent($form);
?>