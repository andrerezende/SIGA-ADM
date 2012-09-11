<?
    $action = $context->ShiftAction();
    if ($action == NULL) $action = 'main'; 
    //$navbar->AddOption('Bancos', 'common', "main:banco:$action");
    $navbar->AddOption('Bancos', $module, "main:banco:find");
    $MIOLO->InvokeHandler($module, "banco/$action");
	//$theme->ClearContent();
	//$ui = $MIOLO->GetUI();
	//$navbar->AddOption('Bancos', $module, $self);
//	$form = $ui->GetForm($module,'frmRequisicao');
	//$theme->InsertContent($form);
?>
