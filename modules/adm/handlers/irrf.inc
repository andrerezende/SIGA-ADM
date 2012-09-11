<?php
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('IRRF', 'adm', 'main:irrf:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'irrf/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'irrf/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'irrf/main');
        }
?>