<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Relatórios',$module,'main:reports');

$navbar->AddOption('Relatório de Ordem de Entrega', $module, $self);
$form = $ui->GetForm($module,'frmOrdEntregaUnica');
if ($theme->GetContent()  == '')
{
	$theme->InsertContent($form);
}
?>