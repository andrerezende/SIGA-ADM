<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Solicitação HU por Item', $module, $self);
$form = $ui->GetForm($module,'frmRepSolicitacaoHUItem','','relatorios');
$theme->InsertContent($form);
?>
