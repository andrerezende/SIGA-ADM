<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Tipo de Serviço Interno', 'adm', 'main:servInterno:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'servInterno/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'servInterno/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'servInterno/main');
        }
?>
