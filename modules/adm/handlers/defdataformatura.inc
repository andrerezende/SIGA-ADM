<?

$perms->CheckAccess('pagamento',A_ACCESS,true);
$theme->ClearContent();
$ui = $MIOLO->GetUI();
$navbar->AddOption('Bolsas',$module,'main:sispag');
$navbar->AddOption('Define Data de Formatura', $module, $self);
$form = $ui->GetForm($module,'frmDefFormatura');
$theme->InsertContent($form); 
	
?>