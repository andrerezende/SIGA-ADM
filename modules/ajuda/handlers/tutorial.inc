<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Tutoriais', 'ajuda', 'main:ajuda:main');
    switch($action)
    {
        case 'usuario':
            $MIOLO->InvokeHandler($module, 'tutorial/usuario');
            break;
        case 'desenv':
            $MIOLO->InvokeHandler($module, 'tutorial/desenv');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'tutorial/main');
    }
?>
