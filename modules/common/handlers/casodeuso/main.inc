<?
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    
    //grupo está fazendo o papel de ator para o caso de uso
    $grupo = $MIOLO->getBusinessMAD('group');
    $grupo->getById($item);

    $navbar->AddOption("Caso de uso para $grupo->grupo", 'common', "mad:casosdeuso",$grupo->idGrupo);
    $form = $MIOLO->GetUI()->GetForm($module,'frmCasosDeUso', $grupo,'casodeuso');

    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>