<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Restaurante', 'adm', 'main:restaurante:new');
	$form = $ui->GetForm('adm','frmRestauranteNew',NULL,'restaurante');
	$theme->InsertContent($form);
?>
