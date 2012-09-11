<?
$perms->CheckAccess('adm_compras',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Participantes', $module, $self);
$form = $ui->GetForm($module,'frmGestaoParticipantes');
$theme->InsertContent($form);
?>
