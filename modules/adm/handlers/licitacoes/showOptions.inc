<?


	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Licitações','adm','main');
	
	$close = $MIOLO->GetActionURL($module,'main');
	
	$panel = new ActionPanel('pnlAdTables','Opções:','',$close);
		
	//$panel->AddUserAction('adm_compras',A_EXECUTE,'Licitações Abertas',$ui->GetImage('','default.png'),$module,'main:licitacoes:abertas');
	
	$panel->AddUserAction('adm_compras',A_EXECUTE,'Licitações em Andamento',$ui->GetImage('','default.png'),$module,'main:licitacoes:listarEmAndamento');
	$panel->AddUserAction('adm_compras',A_EXECUTE,'Itens da UFJF',$ui->GetImage('','default.png'),$module,'main:licitacoes:abertas');
	$panel->AddUserAction('adm_compras',A_EXECUTE,'Itens do HU',$ui->GetImage('','default.png'),$module,'main:licitacoes:abertas');
	$panel->AddUserAction('adm_compras',A_EXECUTE,'Serviços a Licitar',$ui->GetImage('','default.png'),$module,'main:licitacoes:abertas');
	
	
	
	//$panel->AddUserAction('adm_compras',A_EXECUTE,'Licitações Concluídas',$ui->GetImage('','default.png'),$module,'main:licitacoes:abertas');
	//$panel->AddUserAction('adm_compras',A_EXECUTE,'Licitações Abertas',$ui->GetImage('','default.png'),$module,'main:licitacoes:abertas');
	
	$theme->AppendContent($panel);
	
?>