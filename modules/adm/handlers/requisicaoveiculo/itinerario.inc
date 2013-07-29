<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
   // $navbar->AddOption('Incluir Itinerário', 'adm', 'main:requisicoes:itinerarioNew');
    $objRequisicao = $MIOLO->GetBusiness('adm','requisicao', $item);
	$form = $ui->GetForm('adm','frmItinerarioNew',$objRequisicao,'requisicaoveiculo');
	$theme->InsertContent($form);
?>
