<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Requisições Devolvidas', $module, $self);
$form = $ui->GetForm($module,'frmRepRequisicoesDevolvidas','','relatorios');
$theme->InsertContent($form);
?>
