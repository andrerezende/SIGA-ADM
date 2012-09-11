<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Licitacoes em Execucao', $module, $self);
$form = $ui->GetForm($module,'frmRepLicitacoesEmExecucao','','relatorios');
$theme->InsertContent($form);
?>
