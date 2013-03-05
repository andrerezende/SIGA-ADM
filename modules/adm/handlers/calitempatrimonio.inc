<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Calitempatrimonio', 'adm', 'main:calitempatrimonio:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'itempatrimonio/find');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'itempatrimonio/main');
        }
?>