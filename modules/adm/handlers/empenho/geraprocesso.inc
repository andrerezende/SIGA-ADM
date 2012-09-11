<?	
	$perms->CheckAccess('adm',A_ACCESS,true);
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $objEmpenho = $MIOLO->GetBusiness('adm','empenho',$item);
	//$navbar->AddOption('Gerar Nº de Processo', 'adm', 'main:empenho:geraprocesso');
	$navbar->AddOption("Empenho {$objEmpenho->numero}", 'adm', 'main:empenho:geraprocesso');
	$form = $MIOLO->GetUI()->GetForm('adm','frmEmpenhoProcesso',$item,'empenho');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
	
?>
