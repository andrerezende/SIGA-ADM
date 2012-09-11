<?
    // barra de navegação
    $navbar->AddOption('Setor','protocolo','main:setor:find');
    
    // se ação
    $action = $context->ShiftAction();
    switch($action)
    {
    
        // find
        case 'find':
        
            $MIOLO->InvokeHandler($module, 'setor/find');
            
        break;

        // new
        case 'new':
        
            $MIOLO->InvokeHandler($module, 'setor/new');
            
        break;
        
        // padrão 
        default:
            $MIOLO->InvokeHandler($module, 'setor/main');
        
    }
?>
