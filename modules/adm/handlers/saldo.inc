<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Recursos',$module,'main:recursos');
    $navbar->AddOption('Saldo', 'adm', 'main:saldo');
	$MIOLO->InvokeHandler($module, 'recursos/saldo');
?>
