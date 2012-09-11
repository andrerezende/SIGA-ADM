<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Administração',$module,'main');
$navbar->AddOption('Relatórios',$module,'main:reports');
$navbar->AddOption('Relatório de Tomada de Conta', $module, $self);
$form = $ui->GetForm($module,'frmRepTomadaDeConta');
$theme->InsertContent($form);
?>