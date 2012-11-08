<?php
if($perms->CheckAccess('adm',A_ACCESS,true))
$ui = $MIOLO->GetUI();
$navbar->AddOption('Administração', 'adm', 'main');
$theme->SetContent($content);
$a = $context ? $context->ShiftAction() : '';
$handled = $MIOLO->InvokeHandler($module, $a);




if (!$handled) {
	//verifica se usuário é requisitante de alguma uo. se for mostra opção Requisição Suplementar
	$idUsuario = $this->manager->GetLogin()->idkey;
	$acessouoreq = $this->manager->GetBusiness('adm', 'acessouoreq');
	$result = $acessouoreq->listUoByUsuario($idUsuario);
	$uos = count($result->result);
	$panel = new ActionPanel('pnlAdm', 'Administração', '', NULL);
	//$panel->SetIconType('small');

	$panel->adduseraction('adm_almoxarifado', a_execute, 'Almoxarifado', $ui->GetImageTheme('', 'icons/almoxarifado.png'), $module, 'main:uoalmoxarifado:find');
	$panel->AddAction('Consultas', $ui->GetImageTheme('', 'icons/consultas.png'), $module, 'main:consultas');
	$panel->AddUserAction('adm_financas', A_EXECUTE, 'Financeiro', $ui->GetImageTheme('', 'icons/financeiro.png'), $module, 'main:financeiro');
	$panel->AddUserAction('adm_compras', A_EXECUTE, 'Licitações', $ui->GetImageTheme('', 'icons/licitacoes.png'), $module, 'main:listarLicitacoes');
	$panel->AddUserAction('adm_requisicao', A_EXECUTE, 'Manuais', $ui->GetImageTheme('', 'icons/manuais.png'), $module, 'main:manual');
	$panel->AddUserAction('adm_manutencao', A_EXECUTE, 'Manutenção', $ui->GetImageTheme('', 'icons/manutencao.png'), $module, 'main:manutencao');
	//$panel->AddUserAction('adm_ordenador',A_EXECUTE,'Ordenador',$ui->GetImageTheme('','icons/ordenador.png'),$module,'main:ordenador');
	$panel->AddUserAction('adm_patrimonio', A_EXECUTE, 'Patrimônio', $ui->GetImageTheme('', 'icons/patrimonio.png'), $module, 'main:patrimonio');
	$panel->AddUserAction('adm_recursos', A_EXECUTE, 'Recursos', $ui->GetImageTheme('', 'icons/recursos.png'), $module, 'main:recursos');
	$panel->AddUserAction('adm', A_EXECUTE, 'Relatórios', $ui->GetImageTheme('', 'icons/relatorio.png'), $module, 'main:reports');
	$panel->AddUserAction('adm_requisicao', A_EXECUTE, 'Requisições', $ui->GetImageTheme('', 'icons/requisicoes.png'), $module, 'main:requisicoes:find');
	$panel->AddAction('Solicitar Cadastro de Material', $ui->GetImageTheme('', 'icons/novo_material.png'), $module, 'main:novomaterial:new');
	// Orçamento Termo
	//$panel->AddAction('Orçamento Termo',$ui->GetImageTheme('','icons/financeiro.png'),$module,'main:orcterm');
	$panel->AddAction('Orçamento Termo', $ui->GetImageTheme('', 'icons/financeiro.png'), $module, 'main:pedidocompra:find');
	$panel->AddUserAction('adm_mv', A_EXECUTE, 'Manutenção de Veículos', $ui->GetImage('adm', 'kcontrol.png'), $module, 'main:manutencaoveiculo');
	if ($uos > 0) {
		$panel->AddUserAction('adm_requisicao', A_EXECUTE, 'Requisição Suplementar', $ui->GetImageTheme('', 'icons/requisicao_suplementar.png'), $module, 'main:requisicoes:requisicaosuplementar');
	}
        $login = $this->manager->GetLogin();        
        if ($login->id == "romero.freire") $panel->AddUserAction('adm_almoxarifado', A_EXECUTE, 'Corrigir movimento', $ui->GetImageTheme('', 'icons/manutencao.png'), $module, 'main:corrigeMovimento');
	$theme->AppendContent($panel);

        // 09-11-2011 - Daniel BOnfim
        // add Menu lateral
        include_once($MIOLO->GetConf('home.modules') .'/main_menu.inc');

}