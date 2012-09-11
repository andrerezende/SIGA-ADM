<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Resumo de Empenho', $module, $self);
$form = $ui->GetForm($module,'frmRepResumoEmpenho','','relatorios');
$theme->InsertContent($form);
?>
