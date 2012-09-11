<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Licitações', 'adm', 'main:listarLicitacoes:find');
	switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'licitacoes/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'licitacoes/new');
            break;
        case 'tabbed':
            $MIOLO->InvokeHandler($module, 'licitacoes/tabbed');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'licitacoes/main');
        }
?>
