<?
$MIOLO->checkAccess('admin', A_ACCESS,true);

$navbar->AddOption('Administration',$module,'main:admin');

$ui = $MIOLO->GetUI();

$theme->ClearContent();

$close = $MIOLO->GetActionURL('admin','main');

$admMenu = & $theme->GetMenu('admin');
$admMenu->SetTitle('Administration');
$admMenu->AddOption('Usuários',$module,'main:admin:users');
$admMenu->AddOption('Módulos',$module,'main:admin:modules');
$admMenu->AddOption('Grupos',$module,'main:admin:groups');

$cmPanel = new ActionPanel('pnlCommon','Administration Module','', $close, $ui->GetImage($module,'tools1.png'));
$cmPanel->AddAction( 'Modules', $ui->GetImage($module,'system.png'), $module, 'main:admin:modules');
$cmPanel->AddAction( 'Users', $ui->GetImage($module,'user.png'), $module, 'main:admin:users');
$cmPanel->AddAction( 'Groups', $ui->GetImage($module,'groups.png'), $module, 'main:admin:groups');

$handled = $MIOLO->InvokeHandler($module, $context->ShiftAction());


if ( ! $handled )
{
   $theme->SetContent($cmPanel);
//   $MIOLO->InvokeHandler($module, 'admin/users');
}

?>
