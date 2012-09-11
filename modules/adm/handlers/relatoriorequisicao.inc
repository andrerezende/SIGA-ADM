<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Requisição', $module, $self);
$form = $ui->GetForm($module,'frmRelatorioRequisicao');
if ($theme->GetContent()  == '')
{
	$theme->InsertContent($form);
}
?>