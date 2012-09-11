<?
$perms->CheckAccess('BIB_CATALOGACAO',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Importacao Na Tela', $module, 'main:catalogacao:importacao');
$form = $ui->GetForm($module,'frmImportacao');
$theme->InsertContent($form);
?>
