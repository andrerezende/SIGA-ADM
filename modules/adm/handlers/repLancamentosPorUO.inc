<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Lançamentos Por UO', $module, $self);
$form = $ui->GetForm($module,'frmRepLancamentosPorUO','','relatorios');
$theme->InsertContent($form);
?>
