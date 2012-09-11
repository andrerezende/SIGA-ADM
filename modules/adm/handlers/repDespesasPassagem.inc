<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Relatórios',$module,'main:reports');
$navbar->AddOption('Relatório de Despesas', $module, $self);
$form = $ui->GetForm($module,'frmDespesasPassagem');
if ($theme->GetContent()  == '')
{
	$theme->InsertContent($form);
}
?>