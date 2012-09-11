<?php
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Relatórios',$module,'main:reports');
    $close = $MIOLO->GetActionURL($module,'main');
	$panel = new ActionPanel('pnlAdTables','Relatórios','',$close);
    $panel->SetIconType('large');


    /******************************************************************
    *
    * ATENÇÃO: PARA FACILITAR, FAVOR DEIXAR EM ORDEM ALFABÉTICA!!!!
    * Use os índices para facilitar a ordenação.
    *
    ******************************************************************/

	//A
	$panel->AddUserAction('adm',A_EXECUTE,'Atribuicão de Orçamento',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repAtribOrc');
	
    // B
	$panel->AddUserAction('adm_bolsista',A_EXECUTE,'Bolsas Por Curso',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repBolsa');

    // C
    $panel->AddUserAction('adm_adminorcamento',A_EXECUTE,'ConRazão',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repConRazao');
    $panel->AddUserAction('adm_compras',A_EXECUTE,'Convite Equipamento',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repExecConviteEquipamento');

    // D
    $panel->AddUserAction('adm_executorhotel',A_EXECUTE,'Desp. Hotel',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:repDespesasHotel');
	$panel->AddUserAction('adm_executorpsg',A_EXECUTE,'Desp. Passagem',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:repDespesasPassagem');
	$panel->AddUserAction('adm_executorrest',A_EXECUTE,'Desp. Rest',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:repDespesasRestaurante');
	$panel->AddUserAction('adm',A_EXECUTE,'Diária',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:recursos:reportDiaria');    
    $panel->AddUserAction('adm_adminorcamento',A_EXECUTE,'Dotação Debito',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repDotacaoDebito');
    $panel->AddUserAction('adm_adminorcamento',A_EXECUTE,'Dotações',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repDotacoes');

	if ( $MIOLO->getPerms()->isMemberOf($MIOLO->getLogin()->id,'adm_adminorcamento') or $MIOLO->getPerms()->isAdmin())
	{
        $panel->AddUserAction('adm_adminorcamento',A_EXECUTE,'Dotações Por UO',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:repLancamentosPorUO');
	}
	else
	{
        $panel->AddUserAction('adm_gestoruo',A_EXECUTE,'Dotações Por UO',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:repLancamentosPorUO');
	}


    // E
    $panel->AddUserAction('adm_financas',A_EXECUTE,'Empenho',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:reports:repEmpenho');
    $panel->AddUserAction('adm_almoxarifado',A_EXECUTE,'Estoque',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:repEstoque');	
    $panel->AddUserAction('adm_empenho',A_EXECUTE,'Execução Financeira',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:reports:repExecucaoFinanceira');
//	$panel->AddUserAction('adm_empenho',A_EXECUTE,'Ficha Financeira',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:reports:repFichaFinanceira');
    $panel->AddUserAction('adm_abrelicitacao',A_EXECUTE,'Execução Financeira',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:reports:repExecucaoFinanceira');

    // F
	$panel->AddUserAction('adm_financas',A_EXECUTE,'Fechamento',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:repFechamento');
	$panel->AddUserAction('adm_financas',A_EXECUTE,'Fechamento Diária',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:reports:repFechamentoDiaria');
	$panel->AddUserAction('adm_financas',A_EXECUTE,'Fechamento Almoxarifado',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:reports:repFechamentoAlmoxarifado');
	$panel->AddUserAction('adm_gestoruo',A_EXECUTE,'Financeiro',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:recursos:relatfinanc');
	$panel->AddUserAction('adm_gestoruo',A_EXECUTE,'Fracionamento',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:reports:repFracionamento');

    // H
	$panel->AddUserAction('adm_adminorcamento',A_EXECUTE,'Histórico do Item',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repHistoricoItem');

    // K
	$panel->AddUserAction('adm_executorgarag',A_EXECUTE,'Quilômetros Percorridos',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repKilometrosPercorridos');

    // L
	$panel->AddUserAction('adm_executorgarag',A_EXECUTE,'Liberação de Viagens',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:repLiberacaoViagens');
	$panel->AddUserAction('adm_adminorcamento',A_EXECUTE,'Licitações A Empenhar',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repLicitacoesAEmpenhar');
	$panel->AddUserAction('adm',A_EXECUTE,'Licitacoes Em Execucao',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:repLicitacoesEmExecucao');

    // M
	$panel->AddUserAction('adm_cadastromaterial',A_EXECUTE,'Material Consumo',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repMaterialConsumo');
    $panel->AddUserAction('adm_cadastromaterial',A_EXECUTE,'Material Permanente',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repMaterialPermanente');

    // O
	$panel->AddUserAction('adm_almoxarifado',A_EXECUTE,'Ordem Entrega',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:repOrdEntrega');

    // P
	$panel->AddUserAction('adm_executorpsg',A_EXECUTE,'Passagem Aérea',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repPassagemAerea');

    // R
	$panel->AddUserAction('adm_financas',A_EXECUTE,'Relação de Empenhos',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:reports:repRelacaoEmpenhos');    
    $panel->AddUserAction('adm',A_EXECUTE,'Rel. Viagem',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:recursos:reportRelatorioViagem');
	$panel->AddUserAction('adm',A_EXECUTE,'Requisição',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:recursos:imprimirreq');
    $panel->AddUserAction('adm_empenho',A_EXECUTE,'Requisições Devolvidas',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:reports:repRequisicoesDevolvidas');
    $panel->AddUserAction('adm',A_EXECUTE,'Requisições de Veiculo A serem Liberadas',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repReqALiberar');
    $panel->AddUserAction('adm',A_EXECUTE,'Requisições de Veiculo por data origem e destino',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repReqViagens');
	$acesso = $MIOLO->GetBusiness('adm','acessouoreq');
	$uoSaldoPublico = $acesso->listUoSaldoPublicoByUsuario($MIOLO->getLogin()->idkey);
	if ( $MIOLO->getPerms()->isMemberOf($MIOLO->getLogin()->idkey,'adm_gestoruo') or $uoSaldoPublico)
	{
        $panel->AddAction('Requisições Feitas',$ui->GetImageTheme('','icons/relatorio.png'),$module,'main:relatorios:repExecFinanceira');
	}
	$panel->AddUserAction('adm',A_EXECUTE,'Requisições Pendentes',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:repReqPendente');
	$panel->AddUserAction('adm',A_EXECUTE,'Requisições Pendentes Resumo',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:repReqPendenteResumo');
	$panel->AddUserAction('adm_financas',A_EXECUTE,'Requisições Suplementares por UO',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:reports:repRequisicoesSuplementaresPorUo');    
    $panel->AddUserAction('adm_almoxarifado',A_EXECUTE,'Resumo de Empenho',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:repResumoEmpenho');

    // S
    $panel->AddUserAction('adm_financas',A_EXECUTE,'Saldo de Licitação',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:reports:repSaldoLicitacao');
	$panel->AddUserAction('adm_compras',A_EXECUTE,'Solicitação Empenho',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repSolicitacaoEmpenho');
	$panel->AddUserAction('adm_financas',A_EXECUTE,'Solicitação HU por Item',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:reports:repSolicitacaoHUItem');
	$panel->AddUserAction('adm_financas',A_EXECUTE,'Solicitação HU por Empresa',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:reports:repSolicitacaoHUEmpresa');
	$panel->AddUserAction('adm',A_EXECUTE,'Situação Geral da Requisição',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:repSitGeralRequisicao');

    // T
    $panel->AddUserAction('adm_adminorcamento',A_EXECUTE,'Total de Gastos',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repTotalGastosReqUo');

    // V
    $panel->AddUserAction('adm_executorgarag',A_EXECUTE,'Viagem Motorista',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repViagemMotorista');
	
	$theme->AppendContent($panel);

	$handled = $MIOLO->InvokeHandler($module, 'relatorios/' . $context->ShiftAction());
?>
