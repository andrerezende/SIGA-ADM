<?php
$action = $context->ShiftAction();
$navbar->AddOption('U.O. Veículos', 'adm', 'main:uoveiculo:find');
//$navbar->AddOption('Endereço',$module,'main:endereco');
switch($action) {
    case 'find':
        $MIOLO->InvokeHandler($module, 'endereco1/find');
        break;   
    case 'edit':
        $MIOLO->InvokeHandler($module, 'endereco1/edit', $item);
        break;  
    case 'new':
        $MIOLO->InvokeHandler($module, 'endereco1/new');
        break;  
    default:
        $MIOLO->InvokeHandler($module, 'endereco1/find');
}