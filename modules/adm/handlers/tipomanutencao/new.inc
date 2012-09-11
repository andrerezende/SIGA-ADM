<?
	// variáveis
    $theme->ClearContent();
	$ui = $MIOLO->GetUI();

    // barra de navegação
	$navbar->AddOption('Novo Tipo de Manutenção','adm','tipomanutencao:new');
	$form = $ui->GetForm('adm','frmTipoManutencaoNew',NULL,'tipomanutencao');
	$theme->InsertContent($form);
?>
