<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Inspeção', 'adm', 'main:inspecao:final');
	switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'inspecao/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'inspecao/new');
            break; 
        case 'final':
            $MIOLO->InvokeHandler($module, 'inspecao/final');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'inspecao/main');
        }
?>
