<?php
	$theme->ClearContent();

	$ui = $MIOLO->GetUI();
	
	$obj = $MIOLO->GetBusiness('common','camporelat');

	$obj->getById($item);
	
	$navbar->AddOption(ucwords(strtolower($obj->nome)),'common','main:mad:geradorcampos:main',$item);
	
	$form = $MIOLO->GetUI()->GetForm($module,'frmGeradorCampos',$obj,'geradorcampos');
	
	$theme->InsertContent($form);
?>