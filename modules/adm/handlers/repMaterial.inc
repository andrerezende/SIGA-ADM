<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Relatórios',$module,'main:reports');
$navbar->AddOption('Relatório de Material', $module, $self);
$form = $ui->GetForm($module,'frmMaterial');
if ($theme->GetContent()  == '')
{
	$theme->InsertContent($form);
}
?>
