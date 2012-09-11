<?
    $perms->checkAccess('alunopessoa', A_ACCESS,true);
    $theme->ClearContent();
    $navbar->AddOption('Consultar Aluno',$module,$self);
    $ui = $MIOLO->GetUI();
    $form = $ui->GetForm($module,'frmAlunoPessoasFind',NULL,'alunopessoa');
    $theme->InsertContent($form);
?>
