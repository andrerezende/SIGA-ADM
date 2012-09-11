<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Dependência', 'adm', 'main:dependencia:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'dependencia/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'dependencia/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'dependencia/main');
        }
?>
