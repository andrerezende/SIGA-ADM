<?
    $theme->ClearContent();

    $ui = $MIOLO->GetUI();
   
    $navbar->AddOption('Ajuda', 'ajuda', 'main');
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);

    if (!$handled)
    {
        $close = $MIOLO->GetActionURL('common','main');
        $panel = new MActionPanel('pnlHELP','Tutoriais','',$close);
	$panel->AddUserAction('adm',A_EXECUTE,'Usuário',$ui->GetImage('ajuda','user.png'), $module,'main:tutorial:usuario');
	$panel->AddUserAction('adm',A_EXECUTE,'Desenvolvimento',$ui->GetImage('ajuda','desenvolvimento.png'), $module,'main:tutorial:desenv');

        $theme->AppendContent($panel);
    } 
?>
