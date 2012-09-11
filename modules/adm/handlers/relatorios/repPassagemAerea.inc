<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Relatório de Passagem Aérea', $module, $self);
$form = $ui->GetForm($module,'frmPassagemAerea','','relatorios');
$theme->InsertContent($form);
?>