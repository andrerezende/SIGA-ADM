<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Relatórios',$module,'main:reports');
$navbar->AddOption('Relatório de Liberação de Viagens', $module, $self);
$form = $ui->GetForm($module,'frmLiberacaoViagens','','relatorios');
if ($theme->GetContent()  == '')
{
	$theme->InsertContent($form);
}
?>
