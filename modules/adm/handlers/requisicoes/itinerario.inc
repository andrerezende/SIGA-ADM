<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
    $navbar->AddOption('Incluir Itinerário', 'adm', 'main:requisicoes:itinerarioNew');
	$form = $ui->GetForm('adm','frmItinerarioNew',NULL,'requisicoes');
	$theme->InsertContent($form);
?>
