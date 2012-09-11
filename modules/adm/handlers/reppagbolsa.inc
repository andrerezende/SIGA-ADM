<?
$perms->CheckAccess('relpagto',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Bolsas',$module,'main:sispag');
$navbar->AddOption('Folha de Pag. Bolsa', $module, $self);
$form = $ui->GetForm($module,'frmRepPagBolsa');
if ($theme->GetContent()  == '')
{
	$theme->InsertContent($form);
}
?>
