<?
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$pos = strpos($item,"_");
if($pos == true){
$arquivo = explode('_', $item);
$objRequisicao = $MIOLO->GetBusiness('adm','requisicao',$arquivo[1]);	
$form = $ui->GetForm($module,'frmAbastecimento', $objRequisicao);
if ($theme->GetContent()  == '')
{
	$theme->InsertContent($form);
}
}else{

$objRequisicao = $MIOLO->GetBusiness('adm','requisicao',$item);	
$form = $ui->GetForm($module,'frmAbastecimento', $objRequisicao);
if ($theme->GetContent()  == '')
{
	$theme->InsertContent($form);
}
}
?>
