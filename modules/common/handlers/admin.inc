<?

//$perms->CheckAccess('admin',A_ACCESS,true);

$navbar->AddUserOption('admin',A_ACCESS,'Administração',$module,'main:admin');
$navbar->AddUserOption('sispag',A_ACCESS,'SisPag','adm','main:sispag');

$admMenu = $theme->GetMenu('admin');
$admMenu->SetTitle('Administração');
$admMenu->AddUserOption('admin',A_ACCESS,'Transações',$module,'main:admin:transaction');
$admMenu->AddUserOption('admin',A_ACCESS,'Usuários',$module,'main:admin:user');
$admMenu->AddUserOption('admin',A_ACCESS,'Senha',$module,'main:admin:password');
$admMenu->AddUserOption('admin',A_ACCESS,'Grupos',$module,'main:admin:groups');
$admMenu->AddUserOption('admin',A_ACCESS,'Setor',$module,'main:admin:setor');
$admMenu->AddUserOption('admin',A_ACCESS,'Tipo Organograma',$module,'main:admin:tipoorganograma');
$admMenu->AddUserOption('admin',A_ACCESS,'Log',$module,'main:admin:log');
$admMenu->AddUserOption('admin',A_ACCESS,'Notícias',$module,'main:admin:news');
$admMenu->AddUserOption('admin',A_ACCESS,'Tabela Geral',$module,'main:admin:table');
$admMenu->AddUserOption('admin',A_ACCESS,'Sessões',$module,'main:admin:session');
$admMenu->AddUserOption('admin',A_ACCESS,'Pessoas',$module,'main:admin:pessoas');
$admMenu->AddUserOption('admin',A_ACCESS,'Bancos',$module,'main:admin:banco:find');
$handled = $MIOLO->InvokeHandler($module, 'admin/' . $context->ShiftAction());
if (! $handled)
{
//   $MIOLO->InvokeHandler($module, 'admin/users');
}
?>
