<?
    $theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Nova Previsão de Revisão','controle','prevrevisao:new');
	$form = $ui->GetForm('controle','frmPrevRevisaoNew',NULL,'prevrevisao');
	$theme->InsertContent($form);
?>
