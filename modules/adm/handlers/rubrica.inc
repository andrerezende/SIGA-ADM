<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Rubrica', 'adm', 'main:rubrica:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'rubrica/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'rubrica/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'rubrica/main');
        }
?>