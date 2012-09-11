<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Financeiro',$module,'main:financeiro');
    $navbar->AddOption('Orçamento',$module,'main:orcamento:find');
//    $navbar->AddOption('PTR', 'adm', 'main:ptr:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'orcamento/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'orcamento/new');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'orcamento/main');
    }
?>