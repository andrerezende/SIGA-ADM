<?
    // barra de navegação
    $navbar->AddOption('Tipo protocolado','protocolo','main:tipoprot:find');
    
    // se ação
    $action = $context->ShiftAction();
    switch($action)
    {
    
        // find
        case 'find':
        
            $MIOLO->InvokeHandler($module, 'tipoprot/find');
            
        break;

        // new
        case 'new':
        
            $MIOLO->InvokeHandler($module, 'tipoprot/new');
            
        break;
        
        // padrão 
        default:
            $MIOLO->InvokeHandler($module, 'tipoprot/main');
        
    }
?>