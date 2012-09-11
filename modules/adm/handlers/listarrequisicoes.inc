<?
$ui = $MIOLO->GetUI();
$navbar->AddOption('Lista de requisições', $module, $self);
$theme->BreakContent();
$form = $ui->GetForm($module,'frmRequisicoes');
$theme->AppendContent($form);
?>
