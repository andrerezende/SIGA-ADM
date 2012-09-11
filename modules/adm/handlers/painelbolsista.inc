<?
	/**
	 * Main Handler of RH Module
	 * Handler principal do módulo de Recursos Humanos 
	 * @package br.org.miolo.ufjf.rh
	 */
	
	/**
	 * Permissões necessárias
	 *	RH
	 */
	$perms->CheckAccess('adm',A_ACCESS,true);

	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Bolsas e Bolsistas', 'adm', 'painelbolsista');
	$theme->ClearContent();
	$close = $MIOLO->GetActionURL('adm','main');

	$Panel = new ActionPanel('pnlBolsista','Bolsistas','',$close);
	$PanelBolsa = new ActionPanel('pnlBolsa','Bolsas','',$close);

	$PanelBolsa->AddAction('Cadastro Bolsa',$ui->GetImage('','default.png'),$module,'main:cadbolsa');
	$PanelBolsa->AddAction('Cadastro Acesso Bolsa',$ui->GetImage('','default.png'),$module,'main:cadacesso');
	$PanelBolsa->AddAction('Relatório de Bolsas',$ui->GetImage('','default.png'),$module,'main:repbolsa');

	$Panel->AddAction('Cadastro Bolsista',$ui->GetImage('','default.png'),$module,'main:bolsista');
	$Panel->AddAction('Pagamento Bolsista',$ui->GetImage('','default.png'),$module,'main:pagbolsa');
	$Panel->AddAction('Folha de Pagamento Bolsista',$ui->GetImage('','default.png'),$module,'main:reppagbolsa');
	
	$theme->AppendContent($PanelBolsa);
	$theme->AppendContent($Panel);

	$a = $context ? $context->ShiftAction() : 'main';
	$handled = $MIOLO->InvokeHandler($module,$a);
?>
