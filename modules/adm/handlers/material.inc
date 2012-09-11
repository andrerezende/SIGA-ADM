<?
   $action = $context->ShiftAction();
   $navbar->AddOption('Manutenção',$module,'main:manutencao');
   $navbar->AddOption('Material', 'adm', 'main:material:find');
   switch($action)
   {
       case 'find':
           $MIOLO->InvokeHandler($module, 'material/find');
           break;
       case 'new':
           $MIOLO->InvokeHandler($module, 'material/new');
           break;
      
       default:
           $MIOLO->InvokeHandler($module, 'material/main');
           break;
   }
?>