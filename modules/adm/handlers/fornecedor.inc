<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Fornecedor', 'adm', 'main:fornecedor:find');
	switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'fornecedor/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'fornecedor/new');
            break;
       case 'edit':
            $MIOLO->InvokeHandler($module, 'fornecedor/edit');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'fornecedor/main');
        }
?>
