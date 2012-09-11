<?
$action = $context->ShiftAction();
    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Lançamento', 'adm', 'main:lancamento:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'lancamento/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'lancamento/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'lancamento/main');
        }
?>
