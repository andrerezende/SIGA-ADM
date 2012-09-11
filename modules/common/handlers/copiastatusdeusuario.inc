<?
/*
** Instancia Form  que loga como qualquer usuario
*/
	$perms->CheckAccess('admin',A_ACCESS,true);
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Copia Status de Usuário', $module, $self);
	$form = $ui->GetForm($module,'frmCopiaStatusDeUsuario');
	if ($theme->GetContent()  == '')
	{
		$theme->InsertContent($form);
	}
?>

