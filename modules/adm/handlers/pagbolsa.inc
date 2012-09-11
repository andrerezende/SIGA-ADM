<?

$perms->CheckAccess('pagamento',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Bolsas',$module,'main:sispag');
$navbar->AddOption('Pagamento Bolsa', $module, 'main:pagbolsa');
$navbar->AddOption('Pagamentos por mês', $module, $self);
$form = $ui->GetForm($module,'frmPagBolsa');
$theme->InsertContent($form);
	
?>