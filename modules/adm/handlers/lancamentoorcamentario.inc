<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Lançamento Orçamentário', $module, $self);
$form = $ui->GetForm($module,'frmOrcamentario');

if ($theme->GetContent()  == '')
{
	$theme->InsertContent($form);
}
?>