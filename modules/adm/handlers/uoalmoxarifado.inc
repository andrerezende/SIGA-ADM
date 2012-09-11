<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Almoxarifados', 'adm', 'main:uoalmoxarifado:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'uoalmoxarifado/find');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'uoalmoxarifado/main');
        }
?>
