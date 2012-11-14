<?php
$action = $context->ShiftAction();
$navbar->AddOption('Endereço',$module,'main:endereco');
//$navbar->AddOption('Itens', 'adm', 'main:itempatrimonio:find');
switch($action) {
    case 'find':
        $MIOLO->InvokeHandler($module, 'endereco/find');
        break;   
    case 'edit':
        $MIOLO->InvokeHandler($module, 'endereco/edit', $item);
        break;  
    case 'new':
        $MIOLO->InvokeHandler($module, 'endereco/new');
        break;  
    default:
        $MIOLO->InvokeHandler($module, 'endereco/find');
}