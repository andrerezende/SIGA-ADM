<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Impressão da Nota de Empenho', $module, $self);
$form = $ui->GetForm($module,'frmRepEmpenho','','relatorios');
$theme->InsertContent($form);
?>
