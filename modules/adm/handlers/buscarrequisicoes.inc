<?
$ui = $MIOLO->GetUI();
$navbar->AddOption('Busca de requisições por data', $module, $self);
$theme->BreakContent();
$form = $ui->GetForm($module,'frmBuscarRequisicoesPorData');
$theme->AppendContent($form);
?>
