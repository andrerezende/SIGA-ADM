<?
    $modulos = array(
            "ADM"=>"Administrativo",
            "ENS"=>"Ensino",
            );
    $action = $context->ShiftAction();
    if ($action == NULL) $action = 'main';
    $navbar->AddOption('Casos de Uso', 'common', "mad:casosdeuso:find");
    $modulo = MForm::GetFormValue('modulo');
    if ( $modulo )
    {
        $navbar->AddOption($modulos[$modulo], 'common', "mad:casosdeuso:find","",array("modulo"=>$modulo));

    }   
    $MIOLO->InvokeHandler($module, "casosdeuso/$action");
?>