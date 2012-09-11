<?
$MIOLO->LogMessage('[LOGIN] file:'.$_SERVER['SCRIPT_NAME']);
$MIOLO->LogMessage('[LOGIN] Using login prompt');
$ui = $MIOLO->GetUI();
$theme->ClearContent();
$navbar->AddOption('Login', $module, 'login');
$login = $auth->GetLogin();
if ($login)
{
   $form = $ui->GetForm($module,'frmAccess',$login);
}
elseif ($MIOLO->GetConf('options.authmd5'))
{
   $form = $ui->GetForm($module,'frmLoginMD5');
}
else
{
   $form = $ui->GetForm($module,'frmLogin');
}
if ($theme->GetContent()  == '')
{
   $theme->InsertContent($form);
}
?>