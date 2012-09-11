<?

	$ui = $MIOLO->GetUI();
    $navbar->AddOption('Manutenção de Veículos',$module,'main:manutencaoveiculo');
    $navbar->AddOption('Relatórios', 'adm', 'main:relatoriosmanutencaoveiculos');
    
    $close = $MIOLO->GetActionURL($module,'main');

    $panel = new ActionPanel('pnlManutencaoVeiculo','Relatórios','',$close);
    $panel->AddUserAction('adm_mv',A_EXECUTE,'Gastos Manutenção',$ui->GetImage('adm','relatorio.png'),$module,'main:relmanutencaoveiculo');
    $panel->AddUserAction('adm_mv',A_EXECUTE,'Gastos Abastecimento',$ui->GetImage('adm','relatorio.png'),$module,'main:relabastecimentoveiculo');
    //$panel->AddUserAction('',A_EXECUTE,'Total',$ui->GetImage('adm','relatorio.png'),$module,'main:relatorios');
	$theme->AppendContent($panel);
?>
