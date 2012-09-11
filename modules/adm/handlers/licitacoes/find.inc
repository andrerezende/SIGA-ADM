<?

	

	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	
	
	/**
	 * Explicação:
	 * 
	 * Na aba "Itens da UFJF" é usado um grid "live" com ajax.
	 * Para que ele funcione, é preciso retornar somente o grid
	 * e esta verificação é checada abaixo
	 * 
	 * Qualquer duvida falar com Daniel 
	 * 
	 */
	if ($_POST["cpaint_function"])
	{
		$form =  $ui->GetGrid('adm','gridItensALicitarAjax');
	}
	else 
	{	
		$form = $ui->GetForm('adm','frmLicitacaoTabbed',NULL,'licitacoes');
	}
	
	
	
	$theme->InsertContent($form);
?>
