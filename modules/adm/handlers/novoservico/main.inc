<?
    $perms->CheckAccess('ADM',A_ACCESS,true);
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $objServico = $MIOLO->GetBusiness('adm','novoservico',$item);
    $navbar->AddOption('Editar Novo Servico','adm','main:novoservico:main',$item);
    $form = $MIOLO->GetUI()->GetForm($module,'frmNovoServico',$objServico,'novoservico');
    $theme->InsertContent($form);
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
?>
