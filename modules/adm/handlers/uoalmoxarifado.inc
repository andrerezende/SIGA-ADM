<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Almoxarifado', 'adm', 'main:uoalmoxarifado:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'uoalmoxarifado/find');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'uoalmoxarifado/main');
        }
?>
