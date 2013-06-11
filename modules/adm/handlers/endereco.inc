<?php
$action = $context->ShiftAction();
$navbar->AddOption('U.O. Veículos', 'adm', 'main:uoveiculo:find');
//$navbar->AddOption('Endereço',$module,'main:endereco');
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