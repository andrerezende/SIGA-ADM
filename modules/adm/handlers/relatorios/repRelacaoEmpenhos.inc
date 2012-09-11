<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Relação de Empenhos', $module, $self);
$form = $ui->GetForm($module,'frmRepRelacaoEmpenhos','','relatorios');
$theme->InsertContent($form);
?>
