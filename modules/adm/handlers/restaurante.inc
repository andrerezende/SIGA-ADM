<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Restaurante', 'adm', 'main:restaurante:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'restaurante/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'restaurante/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'restaurante/main');
        }
?>
