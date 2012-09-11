<?
    $navbar->AddOption('Doucmentação','main:doc');
    
    include_once($MIOLOCONF['home']['modules'] .'/main_menu.inc');
    
    $docMenu = & $theme->GetMenu('Documentation');
    $docMenu->AddOption('Index',$module,'main:doc:index');
    $docMenu->AddOption('Functions',$module,'main:doc:functions');
    $docMenu->AddSeparator();
    $docMenu->AddOption('Generate',$module,'main:doc:generate');
    
    if ( ! $MIOLO->InvokeHandler($module,'doc/' . $context->ShiftAction()) )
    {
        $MIOLO->InvokeHandler($module,'doc/index');
    }
    
?>
