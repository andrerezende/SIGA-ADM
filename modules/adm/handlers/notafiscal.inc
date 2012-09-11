<?php
$action = $context->ShiftAction();
$navbar->AddOption('Patrimonio',$module,'main:patrimonio');
//$navbar->AddOption('Itens', 'adm', 'main:itempatrimonio:find');
switch($action) {
    case 'find':
        $MIOLO->InvokeHandler($module, 'patrimonio/notafiscal/find');
        break;   
    case 'edit':
        $MIOLO->InvokeHandler($module, 'patrimonio/notafiscal/edit', $item);
        break;  
    // 23-09-2011 - Daniel Bonfim
    case 'new':
        $MIOLO->InvokeHandler($module, 'patrimonio/notafiscal/new');
        break;  
    default:
	$MIOLO->InvokeHandler($module, 'notafiscal/main');
}