<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Manutenção de Veículos',$module,'main:manutencaoveiculo');
    $navbar->AddOption('Tipo de Manutenção', 'adm', 'main:tipomanutencao:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'tipomanutencao/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'tipomanutencao/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'tipomanutencao/main');
        }
?>