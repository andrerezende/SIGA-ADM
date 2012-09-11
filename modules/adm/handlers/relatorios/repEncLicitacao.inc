<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Fechamento Licitação', $module, $self);
$form = $ui->GetForm($module,'frmRepEncLicitacao','','relatorios');
$theme->InsertContent($form);
?>
