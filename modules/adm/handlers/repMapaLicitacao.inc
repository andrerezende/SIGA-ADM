<?
global $item;

$perms->CheckAccess('adm_compras',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Imprimir Mapa de Licitação Número '.$item, $module, $self);
$form = $ui->GetForm($module,'frmRepMapaLicitacao');
$theme->InsertContent($form);
?>
