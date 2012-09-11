<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Classificador', 'adm', 'main:classificador:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'classificador/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'classificador/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'classificador/main');
        }
?>
