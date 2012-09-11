<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Relação de Dotação e Debito', $module, $self);
$form = $ui->GetForm($module,'frmDotacaoDebito','','relatorios');
$theme->InsertContent($form);
?>