<?
$perms->CheckAccess('cadacesso',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Bolsas',$module,'main:sispag');
$navbar->AddOption('Cadastro de Acesso a Bolsa', $module, $self);
$form = $ui->GetForm($module,'frmCadAcessoBolsa');
if ($theme->GetContent()  == '')
{
	$theme->InsertContent($form);
}
?>
