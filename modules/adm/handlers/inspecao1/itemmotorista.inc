<?php

$theme->ClearContent();
	$ui = $MIOLO->GetUI();
        $parte = explode("_", $item);
        $theme->ClearContent();
    $objInspecao = $MIOLO->GetBusiness('adm','inspecao', $parte[1]);
    $objInspecao->confirmacao = 3;
    $navbar->AddOption($objInspecao->idInspecao, 'adm', 'main:inspecao:main');
    $form = $MIOLO->GetUI()->GetForm($module,'frmInspecaoComponenteNew', $objInspecao, 'inspecao');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
        
         
?>
