<?
$perms->CheckAccess('bolsistas',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Bolsas',$module,'main:sispag');
$navbar->AddOption('Bolsistas', $module, $self);
$form = $ui->GetForm($module,'frmBolsista');
if ($theme->GetContent()  == '')
{
	$theme->InsertContent($form);
}
?>
