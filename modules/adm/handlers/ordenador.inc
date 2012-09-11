<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Ordenador de Despesas','adm','main:ordenador');
	switch($action)
    {
        case 'itens':
            $MIOLO->InvokeHandler($module, 'ordenador/itens');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'ordenador/main');
    }
?>
