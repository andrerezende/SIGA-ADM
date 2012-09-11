<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Recursos',$module,'main:recursos');
    $navbar->AddOption('Requisitantes', 'adm', 'main:uoacesso:main');
    switch($action)
    {
        case 'new':
            $MIOLO->InvokeHandler($module, 'uoacesso/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'uoacesso/main');
    }
?>
