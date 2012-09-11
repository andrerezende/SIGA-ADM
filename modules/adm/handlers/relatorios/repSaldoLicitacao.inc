<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Relatório de Saldo de Licitação', $module, $self);
$form = $ui->GetForm($module,'frmRepSaldoLicitacao','','relatorios');
$theme->InsertContent($form);
?>
