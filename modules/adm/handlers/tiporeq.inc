<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Tipo de Requisição', 'adm', 'main:tiporeq:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'tiporeq/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'tiporeq/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'tiporeq/main');
        }
?>
