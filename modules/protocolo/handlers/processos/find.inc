<?
    // variáveis
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
    
    // insere formulário frmProcessosFind
	$form = $ui->GetForm($module,'frmProcessosFind',NULL,'processos');
	$theme->InsertContent($form);
        // 09-11-2011 - Daniel BOnfim
        // add Menu lateral
        include_once($MIOLO->GetConf('home.modules') .'/main_menu.inc');
?>

