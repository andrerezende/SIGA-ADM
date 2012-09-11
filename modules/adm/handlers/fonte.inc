<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Fonte', 'adm', 'main:fonte:find');
	switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'fonte/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'fonte/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'fonte/main');
    }
?>