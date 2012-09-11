<?

$perms->CheckAccess('pagamento',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Bolsas',$module,'main:sispag');
$navbar->AddOption('Pag. Bolsa', $module, $self);
$form = $ui->GetForm($module,'frmPagBolsabloco');
$theme->InsertContent($form); 
	
?>