<?php
$action = $context->ShiftAction();
$navbar->AddOption('Patrimonio',$module,'main:patrimonio');

switch($action) {
    case 'find':
        $MIOLO->InvokeHandler($module, 'patrimonio/vidautil/find');
        break;   
    case 'edit':
        $MIOLO->InvokeHandler($module, 'patrimonio/vidautil/edit', $item);
        break; 
    case 'new':
        $MIOLO->InvokeHandler($module, 'patrimonio/vidautil/new', $item);
        break; 
    default:
        $MIOLO->InvokeHandler($module, 'patrimonio/main');
}