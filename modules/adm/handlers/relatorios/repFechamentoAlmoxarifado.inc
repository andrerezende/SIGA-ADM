<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Fechamento Almoxarifado', $module, $self);
$form = $ui->GetForm($module,'frmRepFechamentoAlmoxarifado','','relatorios');
$theme->InsertContent($form);
?>
