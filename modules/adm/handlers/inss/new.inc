<?	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Novo Valor', 'adm', 'main:inss:new');
	$form = $ui->GetForm('adm','frmInssNew',NULL,'inss');
	$theme->InsertContent($form);
?>
