<?
$ui = $MIOLO->GetUI();
$theme->ClearContent();
$navbar->AddOption('Senha', $module, 'lostpass');
$form = $ui->GetForm($module,'frmLostPass');
$theme->InsertContent($form);
?>