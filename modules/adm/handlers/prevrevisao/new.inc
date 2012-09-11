<?
    $theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Nova Previsão de Revisão','adm','prevrevisao:new');
	$form = $ui->GetForm('adm','frmPrevRevisaoNew',NULL,'prevrevisao');
	$theme->InsertContent($form);
?>
