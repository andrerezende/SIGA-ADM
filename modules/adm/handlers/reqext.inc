<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Requisões Externas', $module, $self);
$form = $ui->GetForm($module,'frmRequisicoesExternas');
if ($theme->GetContent()  == '')
{
	$theme->InsertContent($form);
}
?>