<?
  //$perms->CheckAccess('',A_ACCESS,true);

    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Manutenção de Veículos',$module,'main:manutencaoveiculo');
    
    $close = $MIOLO->GetActionURL($module,'main');
    
    

    $panel = new ActionPanel('pnlManutencaoVeiculo','Manutenção de Veículos','',$close);
    $panel->AddUserAction('adm_mv',A_EXECUTE,'Manutenção de Veículos',$ui->GetImage('adm','kcontrol.png'),$module,'main:notafiscalmanutencaoveiculo:find');
    $panel->AddUserAction('adm_mv',A_EXECUTE,'Empresa',$ui->GetImage('adm','empresa.png'),$module,'main:empresamanutencaoveiculo:find');
	$panel->AddUserAction('adm_mv',A_EXECUTE,'Tipo de Manutenção',$ui->GetImage('adm','tools.gif'),$module,'main:tipomanutencao:find');
    //Comentado devido ao problema #214
	//$panel->AddUserAction('adm_mv',A_EXECUTE,'Veículo',$ui->GetImage('adm','veiculo.png'), 'adm','main:veiculo:find');
	$panel->AddUserAction('adm_mv',A_EXECUTE,'Previsão de Revisão',$ui->GetImage('adm','veiculos_editar.png'), $module,'main:prevrevisao:find');
	$panel->AddUserAction('adm_mv',A_EXECUTE,'Relatórios',$ui->GetImage('adm','relatorio.png'),$module,'main:relatoriosmanutencaoveiculos');
	
	$objPrevisaoRevisao = $MIOLO->GetBusiness($module,'prevrevisao');
	$previsoes = $objPrevisaoRevisao->listRevisoesPrevistas();
	if ($previsoes->result)
		$panel->AddControl(new MLabel("<b>ATENÇÃO:</b> Há previsões de revisão com data prevista vencendo em menos de 30 dias",'red',true));
	$theme->AppendContent($panel);
	
?>
