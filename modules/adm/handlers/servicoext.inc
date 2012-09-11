<?
   $action = $context->ShiftAction();
   $navbar->AddOption('Manutenção',$module,'main:manutencao');
   $navbar->AddOption('Serviço Externo', 'adm', 'main:servicoext:find');
   switch($action)
   {
       case 'find':
           $MIOLO->InvokeHandler($module, 'servicoext/find');
           break;
       case 'new':
           $MIOLO->InvokeHandler($module, 'servicoext/new');
           break;
      
       default:
           $MIOLO->InvokeHandler($module, 'servicoext/main');
           break;
   }
?>