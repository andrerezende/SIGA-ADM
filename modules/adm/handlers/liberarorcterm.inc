<?

	$theme->ClearContent();
//	$navbar->AddOption(('Orc Term','adm'),'adm','main:orcterm');
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Liberar Termo',$module,'main:listarLicitacoes');
	$close = $MIOLO->GetActionURL($module,'main');
	/*	
	if ($_POST["cpaint_function"])
	{
		$form =  $ui->GetGrid('adm','gridOrcTermoAjax');
	}
	else 
	{	
		//$form = $ui->GetForm('adm','frmListarItens',NULL,'licitacoes');
	//	$form = $ui->GetForm('adm','frmOrcTerm');
	}
	*/
	$theme->InsertContent($form);
	$form = $ui->GetForm('adm','frmLiberaOrcTerm');
	$theme->InsertContent($form);

?>
