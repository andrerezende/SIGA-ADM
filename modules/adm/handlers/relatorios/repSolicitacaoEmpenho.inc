<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Solicitação de Empenho', $module, $self);
$form = $ui->GetForm($module,'frmRepSolicitacaoEmpenho','','relatorios');
$theme->InsertContent($form);
?>
