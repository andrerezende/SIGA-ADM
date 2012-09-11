<?
$ui = $MIOLO->GetUI();
$navbar->AddOption('Requisição de compra', $module, $self);
$theme->BreakContent();
$form = $ui->GetForm($module,'frmRequisicaoExterna');
$theme->AppendContent($form);
?>
