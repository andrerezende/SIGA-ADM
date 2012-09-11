<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Ordenador de Despesas', $module, $self);
$listing = $ui->GetListing($module,'lstOrdenadorDespesa');
if ($theme->GetContent()  == '')
{
	$theme->InsertContent($form);
}
?>