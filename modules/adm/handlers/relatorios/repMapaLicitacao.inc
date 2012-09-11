<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Mapa de Licitações', $module, $self);
$form = $ui->GetForm($module,'frmRepMapaLicitacao','','relatorios');
$theme->InsertContent($form);
?>