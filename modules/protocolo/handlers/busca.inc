<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Outras Consultas','protocolo','main:busca');
   switch($action)
    {
    	 // main
        case 'buscadoc':
            $MIOLO->InvokeHandler($module, 'busca/buscadoc');
        break;
        // tramite
        case 'tramite':
            $MIOLO->InvokeHandler($module, 'busca/tramite');
        break;
         // processos vagos
        case 'vagos':
            $MIOLO->InvokeHandler($module, 'busca/vagos');
        break;
    	default:
       		$MIOLO->InvokeHandler($module, 'busca/main');
    }
?>
