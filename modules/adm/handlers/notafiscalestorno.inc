<?
$ui = $MIOLO->GetUI();
//$navbar->AddOption('Estornar Nota Fiscal', $module, $self);
$theme->BreakContent();
$form = $ui->GetForm($module,'frmNotaFiscalEstorno');
$theme->AppendContent($form);
?>
