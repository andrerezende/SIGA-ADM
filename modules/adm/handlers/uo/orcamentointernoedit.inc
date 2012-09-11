<?
	global $item;
//var_dump($item);
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
    $objUo = $MIOLO->GetBusiness('adm','uo');
    $objUo = $objUo->GetById($item);
	$form = $ui->GetForm('adm','frmUoOrcamentoInternoEdit',$objUo,'uo');
	$theme->InsertContent($form);
?>
