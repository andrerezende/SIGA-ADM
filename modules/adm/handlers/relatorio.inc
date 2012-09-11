<?
$perms->CheckAccess('RELATORIO',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Relatorio', $module, $self);
$form = $ui->GetForm($module,'frmRelatorio');
if ($theme->GetContent()  == '')
{
	$theme->InsertContent($form);
}
?>
