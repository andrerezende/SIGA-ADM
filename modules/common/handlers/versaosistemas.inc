<?
    $perms->CheckAccess('versaosistemas',A_ACCESS,TRUE);
    $ui = $MIOLO->GetUI();
    $form = $ui->GetForm($module,'frmVersaoSistemasNew');
    $theme->SetContent($form);
    // 09-11-2011 - Daniel BOnfim
        // add Menu lateral
        include_once($MIOLO->GetConf('home.modules') .'/main_menu.inc');
?>
