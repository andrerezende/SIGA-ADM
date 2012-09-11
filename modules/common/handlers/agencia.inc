<?
$perms->CheckAccess('AGENCIA',A_ACCESS,true);
$home='main:admin';
$navbar->AddOption('Cadastro de Agências', $module, $self);
$ui = $MIOLO->GetUI();
$form = $ui->GetForm($module,'frmAgencia');
if ($theme->GetContent()  == '')
{
	$theme->InsertContent($form);
}
?>
