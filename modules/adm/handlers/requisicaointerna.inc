<?
$ui = $MIOLO->GetUI();
$navbar->AddOption('Requisição para almoxarifado', $module, $self);
$theme->BreakContent();
$form = $ui->GetForm($module,'frmRequisicaoInterna');
$theme->AppendContent($form);
?>
