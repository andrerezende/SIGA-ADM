<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Licitações A Empenhar', $module, $self);
$form = $ui->GetForm($module,'frmRepLicitacoesAEmpenhar','','relatorios');
$theme->InsertContent($form);
?>
