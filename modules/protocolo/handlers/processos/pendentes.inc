<?
// 25-10-2011 - Daniel Bonfim
    // variáveis
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
    
        // pegando o login
        $auth = $this->manager->auth;
        $login = $auth->login;
        
    // insere formulário frmAccess        
	$form = $ui->GetForm("common",'frmAccess', $login);
	$theme->InsertContent($form);
        // 09-11-2011 - Daniel BOnfim
        // add Menu lateral
        include_once($MIOLO->GetConf('home.modules') .'/main_menu.inc');
?>

