<?

$navbar->AddOption('Dados pessoais',$module,$self);
$ui = $MIOLO->GetUI();
$form = $ui->GetForm($module,'frmRepMapUtilizacaoMotoristaLog');
$theme->InsertContent($form);
// 09-11-2011 - Daniel BOnfim
        // add Menu lateral
        //include_once($MIOLO->GetConf('home.modules') .'/main_menu.inc');
?>
