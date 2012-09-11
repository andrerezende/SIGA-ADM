<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	
	$objTransacao = $MIOLO->GetBusiness('common','transacao');

	$objTransacao->getById($item);
	
	$navbar->AddOption(ucwords(strtolower($objTransacao->transacao)),'common','main:mad:transacao:main',$item);
	
	$form = $MIOLO->GetUI()->GetForm($module,'frmTransacao',$objTransacao,'transacao');
	
	$theme->InsertContent($form);
?>
