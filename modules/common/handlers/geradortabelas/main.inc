<?php
	$theme->ClearContent();

	$ui = $MIOLO->GetUI();
	
	$obj = $MIOLO->GetBusiness('common','tabelarelat');

	$obj->getById($item);
	
	$navbar->AddOption(ucwords(strtolower($obj->nome)),'common','main:mad:geradortabelas:main',$item);
	
	$form = $MIOLO->GetUI()->GetForm($module,'frmGeradorTabelas',$obj,'geradortabelas');
	
	$theme->InsertContent($form);
?>