<?
$perms->CheckAccess('sispag',A_ACCESS,true);
$ui = $MIOLO->GetUI();
$theme->getMainMenu()->AddUserOption('sispag',A_ACCESS,'SisPag',$module,'sispag');
$navbar->AddUserOption('sispag',A_ACCESS,'Bolsas',$module,'sispag');
$theme->ClearContent();
//$theme->InsertContent(new ContentHeader('Módulo','Administração'));

$close = $MIOLO->GetActionURL($module,'main');
$panel = new ActionPanel('pnlSisPag','Sistema de Pagamento','',$close);

$panel->AddUserAction('bolsistas',A_ACCESS,'Bolsistas',$ui->GetImage($module,'bolsista.png'),$module,'main:bolsista');
$panel->AddUserAction('pagamento',A_ACCESS,'Pagamento',$ui->GetImage($module,'pagbolsa.png'),$module,'main:pagbolsa');
$panel->AddUserAction('cadacesso',A_ACCESS,'Cadastro de Acesso',$ui->GetImage($module,'cadacesso.png'),$module,'main:cadacesso');
$panel->AddUserAction('cadbolsa',A_ACCESS,'Cadastro de Bolsa',$ui->GetImage($module,'cadbolsa.png'),$module,'main:cadbolsa');
$panel->AddUserAction('relpagto',A_ACCESS,'Relatório Folha de Pagamento',$ui->GetImage($module,'pdf.png'),$module,'main:reppagbolsa');
$panel->AddUserAction('relbolsa',A_ACCESS,'Relatório de Bolsas',$ui->GetImage($module,'pdf.png'),$module,'main:repbolsa');
$panel->AddUserAction('banco',A_ACCESS,'Banco',$ui->GetImage($module,'banco.png'),'common','main:banco:find');
$panel->AddUserAction('definedataexclusao',A_ACCESS,'Define Data de Exclusão',$ui->GetImage($module,'muda_status.png'),$module,'main:defdataexclusao');
$panel->AddUserAction('definedataformatura',A_ACCESS,'Define Data de Formatura',$ui->GetImage($module,'document.png'),$module,'main:defdataformatura');
//$panel->AddUserAction('excluibolsa',A_ACCESS,'Excluir Bolsa',$ui->GetImage($module,'excluir.png'),$module,'main:excluibolsa');

$theme->AppendContent($panel);

$a = $context ? $context->ShiftAction() : 'main';
$handled = $MIOLO->InvokeHandler($module,$a);
?>
