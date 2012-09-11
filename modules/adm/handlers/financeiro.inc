<?php
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Financeiro','adm','main:financeiro');
    $close = $MIOLO->GetActionURL($module,'main');
    $panel = new ActionPanel('pnlAdTables','Financeiro','',$close);
    $panel->SetIconType('large');
	$panel->AddUserAction('adm_orcamento',A_EXECUTE,'Cadastro de Orçamento',$ui->GetImageTheme('','icons/cadastro_de_orcamento.png'),$module,'main:orcamento:find');
	$panel->AddUserAction('adm_orcamento',A_EXECUTE,'Transferir Orçamento',$ui->GetImageTheme('','icons/transferir_orcamento.png'),$module,'main:financeiro:transforcamento');       
	$panel->AddUserAction('adm_orcamento',A_EXECUTE,'Suplementação de Licitação',$ui->GetImageTheme('','icons/suplementacao_de_licitacao.png'),$module,'main:financeiro:suplementalicitacao');       
	$panel->AddUserAction('adm_orcamento',A_EXECUTE,'Estorno de Suplementação',$ui->GetImageTheme('','icons/estorno_de_suplementacao.png'),$module,'main:financeiro:estornosuplementacao');       
	$panel->AddUserAction('adm_orcamento',A_EXECUTE,'Cancelar Requisição Suplementar',$ui->GetImageTheme('','icons/cancelar_requisicao_suplementar.png'),$module,'main:financeiro:cancelarrequisicaosuplementar');
//Takanori
	//$panel->AddUserAction('adm_orcamento',A_EXECUTE,'Atribuir Orçamento',$ui->GetImageTheme('','icons/atribuir_orcamento.png'),$module,'main:financeiro:empenho');	
	$panel->AddUserAction('adm_empenho',A_EXECUTE,'Atribuir Orçamento',$ui->GetImageTheme('','icons/atribuir_orcamento.png'),$module,'main:financeiro:empenho');
//Takanori	
	$panel->AddUserAction('adm_orcamento',A_EXECUTE,'Estorno de Empenho',$ui->GetImageTheme('','icons/estorno_de_empenho.png'),$module,'main:financeiro:estornoempenho');       
	$panel->AddUserAction('adm_consultaempenho',A_EXECUTE,'Consulta de Empenho',$ui->GetImageTheme('','icons/consulta_de_empenho.png'),$module,'main:financeiro:controle');       
	$panel->AddUserAction('adm_orcamento',A_EXECUTE,'Consulta Licitação Original',$ui->GetImageTheme('','icons/consulta_licitacao_original.png'),$module,'main:financeiro:licitacaooriginal');       
	$panel->AddUserAction('adm_empenho',A_EXECUTE,'Anulação de Empenho',$ui->GetImageTheme('','icons/anulacao_de_empenho.png'),$module,'main:financeiro:anulacao');       
	$panel->AddUserAction('adm_empenho',A_EXECUTE,'Empenho', $ui->GetImageTheme('','icons/empenho.png'),$module,'main:empenho:find');       
	$panel->AddUserAction('adm_orcamento',A_EXECUTE,'Distribuir Itens Empenhados',$ui->GetImageTheme('','icons/distribuir_itens_empenhados.png'),$module,'main:financeiro:distribuiritens');
	$panel->AddUserAction('adm_liqpag',A_EXECUTE,'Liquidação', $ui->GetImageTheme('','icons/liquidacao.png'),$module,'main:financeiro:liquidacao');       
	$panel->AddUserAction('adm_liqpag',A_EXECUTE,'Pagamento', $ui->GetImageTheme('','icons/pagamento.png'),$module,'main:financeiro:pagamento');       
	//$panel->AddUserAction('adm_empenho',A_EXECUTE,'Novo Empenho', $ui->GetImageTheme('','icons/default.png'),$module,'main:financeiro:saldoempenho');       
	$panel->AddUserAction('adm_empenho',A_EXECUTE,'Inserir Item no Empenho', $ui->GetImageTheme('','icons/inserir_item_no_empenho.png'),$module,'main:financeiro:itemempenho');       
	//$panel->AddAction('Empenhos 2006',$ui->GetImageTheme('','icons/default.png'),  $module,'main:financeiro:empenho2006');
	//imagens abaixo inseridas por José Roberto
$panel->AddUserAction('adm_empenho',A_EXECUTE,'Entrada de Serviço', $ui->GetImageTheme('','icons/entrada_de_servico.png'),$module,'main:financeiro:entradaempfind');
	$panel->AddUserAction('adm_empenho',A_EXECUTE,'Estorno de Serviço', $ui->GetImageTheme('','icons/estorno_de_servico.png'),$module,'main:financeiro:estornoservico');
	$panel->AddUserAction('adm_solicitacao',A_EXECUTE,'Solicitação - HU', $ui->GetImageTheme('','icons/solicitacao_hu.png'),$module,'main:financeiro:solicitacaohu');
	$panel->AddUserAction('adm_orcamento',A_EXECUTE,'Solicitação', $ui->GetImageTheme('','icons/solicitacao.png'),$module,'main:financeiro:solicitacao');
	$panel->AddUserAction('adm_solicitacao',A_EXECUTE,'Consulta Solicitação', $ui->GetImageTheme('','icons/consulta_solicitacao.png'),$module,'main:financeiro:consultasolicitacao');
	$panel->AddUserAction('adm_solicitacao',A_EXECUTE,'Anulação de Licitação', $ui->GetImageTheme('','icons/anulacao_de_licitacao.png'),$module,'main:financeiro:anulalicitacao');
	$panel->AddUserAction('adm_liqpag',A_EXECUTE,'Alteração de Liquidação / Pagamento', $ui->GetImageTheme('','icons/alteracao_de_liquidacao_pagamento.png'),$module,'main:financeiro:alteracaoliquidacaopagamento');  

	
    $theme->AppendContent($panel);

	$a = $context->ShiftAction();
	if($a != 'find')
	{
		$handled = $MIOLO->InvokeHandler($module, 'financeiro/' . $a);
	}
	else
	{
		$handled = $MIOLO->InvokeHandler($module, 'orcamento/' . $a);
	}
?>
