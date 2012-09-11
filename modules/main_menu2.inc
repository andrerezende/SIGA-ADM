<?php
/**
 *  Put in this file your menus/links for the Main Menu
 */

$session = $MIOLO->session;
$session->setValue("num_mainmenu",0);

$menu = $theme->getMainMenu();
$menu->setTitle('Menu Principal');

$login = $MIOLO->getLogin();

/*
if ( $perms->checkAccess($MIOLO->mad, A_ADMIN, false) )
{
    $sysMenu = $theme->getMenu('system');
    $sysMenu->setTitle(_M('System'));
    $sysMenu->addOption(_M('Administration'),$MIOLO->mad,'main:admin');
    $sysMenu->addSeparator('-');
}
*/

if ($login)
{
   //$menu->addUserOption('ensino',A_ACCESS,'Ensino','ensino','');
   $menu->addUserOption('adm',A_ACCESS,'ADMINISTRAÇÃO','adm','main');
   $menu->addUserOption('prot',A_ACCESS,'PROTOCOLO','protocolo','main');
   $menu->addUserOption('mad',A_ACCESS,'Mad','common','main:mad');
   $menu->addUserOption('biblioteca',A_ACCESS,'Biblioteca','biblioteca','main');
   $menu->addUserOption('rh',A_ACCESS,'Recursos Humanos','rh','main');

   //$menu->addoption('Atendimento','common','main:contato');
   //$menu->addoption('Not�cias','common','main:lnoticia','common');
   //$menu->addUserOption('MIOLOWIDE',A_ACCESS,'MIOLOWIDE','miolowide','main');
   //$menu->addOption(_M('Tutorial'),'tutorial','main');
   $menu->addOption('SAIR','common','logout');
}
else
{
//   $sysMenu->AddOption('Entrar',$module,'login');
}

/*
if ( $perms->checkAccess('common', A_ADMIN, false) )
{
    $devMenu = $theme->getMenu('develop');
    $devMenu->setTitle('Development');
    $devMenu->addOption('Documentation', 'common','main:doc');
    $devMenu->addSeparator('-');
    $devMenu->addLink('Homepage', 'http://miolo.codigolivre.org.br/','home');
    $devMenu->addLink('CVS', 'http://cvs.miolo.codigolivre.org.br/cgi-bin/cvsweb.cgi/?cvsroot=miolo','cvs');
}
*/
?>
