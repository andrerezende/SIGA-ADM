<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
        $objInspecao = $MIOLO->GetBusiness('adm','inspecao', $item);
	$form = $MIOLO->GetUI()->GetForm($module,'frmInspecaoVeiculo', $objInspecao, 'inspecao');
	$theme->InsertContent($form);
       
?>
