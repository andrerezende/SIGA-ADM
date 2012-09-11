<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$objRequisicao = $MIOLO->GetBusiness('adm','requisicao',$item);	
$form = $ui->GetForm($module,'frmAbastecimento', $objRequisicao);
if ($theme->GetContent()  == '')
{
	$theme->InsertContent($form);
}
?>
