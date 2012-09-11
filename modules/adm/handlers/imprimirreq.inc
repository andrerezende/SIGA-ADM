<?
	$action = $context->ShiftAction();
	$navbar->AddOption('Recursos',$module,'main:recursos');
    $navbar->AddOption('Imprimir Requisição', 'adm', 'main:imprimirreq');
	$MIOLO->InvokeHandler($module, 'recursos/imprimirreq');
?>
