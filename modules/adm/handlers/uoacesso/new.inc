<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Requisitante', 'adm', 'main:uoacesso:new');
	$form = $ui->GetForm('adm','frmUoAcessoNew',NULL,'uoacesso');
	$theme->InsertContent($form);
?>
