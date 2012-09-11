<?
$perms->CheckAccess('cadbolsa',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Bolsas',$module,'main:sispag');
$navbar->AddOption('Cadastro de Bolsa', $module, $self);
$form = $ui->GetForm($module,'frmCadastroBolsa');
$theme->InsertContent($form);
?>
