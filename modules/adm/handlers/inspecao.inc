<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Inspeção', 'adm', 'main:inspecao:find');
	switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'inspecao/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'inspecao/new');
            break;           
        default:
            $MIOLO->InvokeHandler($module, 'inspecao/main');
        }
?>