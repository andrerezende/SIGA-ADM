<?
    $perms->CheckAccess('alunopessoa',A_ACCESS,true);
    $home = 'main';
    $navbar->AddOption('Consulta de Alunos',$module,$self);
    $ui = $MIOLO->GetUI();
    $matricula = MForm::GetFormValue('matricula');
    $form = $ui->GetForm($module,'frmAlunoPessoa',$matricula,'alunopessoa');
    $theme->InsertContent($form);
?>
