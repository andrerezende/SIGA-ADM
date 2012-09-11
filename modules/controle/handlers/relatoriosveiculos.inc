<?

	$ui = $MIOLO->GetUI();
    $navbar->AddOption('Controle de Veículos',$module,'main:manutencaoveiculo');
    $navbar->AddOption('Relatórios', 'controle', 'main:relatoriosveiculos');
    
    $close = $MIOLO->GetActionURL($module,'main');

    $panel = new ActionPanel('pnlManutencaoVeiculo','Relatórios','',$close);
    $panel->AddUserAction('',A_EXECUTE,'Gastos Manutenção',$ui->GetImage('controle','relatorio.png'),$module,'main:relmanutencaoveiculo');
    $panel->AddUserAction('',A_EXECUTE,'Gastos Abastecimento',$ui->GetImage('controle','relatorio.png'),$module,'main:relabastecimentoveiculo');
    //$panel->AddUserAction('',A_EXECUTE,'Total',$ui->GetImage('controle','relatorio.png'),$module,'main:relatorios');
	$theme->AppendContent($panel);
?>
