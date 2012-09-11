<?
	// variáveis
    $theme->ClearContent();
	$ui = $MIOLO->GetUI();

    // barra de navegação
	$navbar->AddOption('Novo Tipo de Manutenção','controle','tipomanutencao:new');
	$form = $ui->GetForm('controle','frmTipoManutencaoNew',NULL,'tipomanutencao');
	$theme->InsertContent($form);
?>
