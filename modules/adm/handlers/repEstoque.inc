<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Relatórios',$module,'main:reports');
$navbar->AddOption('Relatório de Itens do Estoque', $module, $self);
$form = $ui->GetForm($module,'frmEstoque');
if ($theme->GetContent()  == '')
{
	$theme->InsertContent($form);
}
?>