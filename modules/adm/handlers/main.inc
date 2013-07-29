<?php
if($perms->CheckAccess('adm',A_ACCESS,true))
$ui = $MIOLO->GetUI();
$theme->SetContent($content);
$navbar->AddOption('Administração', 'adm', 'main');
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
        $objTipoReqVei = $this->manager->GetBusiness('adm','tiporeq');
        $objTipoReqAlm = $this->manager->GetBusiness('adm','tiporeq');
        $objTipoReqVei->GetById(4);
        $objTipoReqAlm->GetById(8);

	$panel->adduseraction('adm_almoxarifado', a_execute, 'Almoxarifado', $ui->GetImageTheme('', 'icons/almoxarifado.png'), $module, 'main:uoalmoxarifado:find');
	//$panel->AddAction('Consultas', $ui->GetImageTheme('', 'icons/consultas.png'), $module, 'main:consultas');
        if (!$MIOLO->getPerms()->isAdmin())
	$panel->AddUserAction('adm_financas', A_EXECUTE, 'Financeiro', $ui->GetImageTheme('', 'icons/financeiro.png'), $module, 'main:financeiro');
        if (!$MIOLO->getPerms()->isAdmin())
	$panel->AddUserAction('adm_compras', A_EXECUTE, 'Licitações', $ui->GetImageTheme('', 'icons/licitacoes.png'), $module, 'main:listarLicitacoes');
	//$panel->AddUserAction('adm_requisicao', A_EXECUTE, 'Manuais', $ui->GetImageTheme('', 'icons/manuais.png'), $module, 'main:manual');
	$panel->AddUserAction('adm_manutencao', A_EXECUTE, 'Manutenção', $ui->GetImageTheme('', 'icons/manutencao.png'), $module, 'main:manutencao');
	//$panel->AddUserAction('adm_ordenador',A_EXECUTE,'Ordenador',$ui->GetImageTheme('','icons/ordenador.png'),$module,'main:ordenador');
	$panel->AddUserAction('adm_patrimonio', A_EXECUTE, 'Patrimônio', $ui->GetImageTheme('', 'icons/patrimonio.png'), $module, 'main:patrimonio');
	//$panel->AddUserAction('adm_recursos', A_EXECUTE, 'Recursos', $ui->GetImageTheme('', 'icons/recursos.png'), $module, 'main:recursos');
	//$panel->AddUserAction('AD_REL_VEICULOS', A_EXECUTE, 'Relatórios de Veículos', $ui->GetImageTheme('', 'icons/relatorio.png'), $module, 'main:reports');
	$panel->AddUserAction('adm_requisicao', A_EXECUTE, 'Requisições Veículo', $ui->GetImageTheme('', 'icons/requisicoes.png'), $module, 'main:requisicaoveiculo:findveiculo',$objTipoReqVei->idTipoReq,array("form"=>"item","tipoReq"=>$objTipoReqVei->idTipoReq));
        $panel->AddUserAction('adm_requisicao', A_EXECUTE, 'Requisições Almoxarifado', $ui->GetImageTheme('', 'icons/requisicoes.png'), $module, 'main:requisicoes:find',$objTipoReqAlm->idTipoReq,array("form"=>"item","tipoReq"=>$objTipoReqAlm->idTipoReq));
        
	//$panel->AddAction('Solicitar Cadastro de Material', $ui->GetImageTheme('', 'icons/novo_material.png'), $module, 'main:novomaterial:new');
        $executante= $this->manager->GetBusiness('adm', 'executor');
        if($executante->isExecutorOf($this->manager->GetLogin()->idkey))
        //$panel->AddUserAction('AD_INSPECAO_VEICULO', A_EXECUTE, 'Inspeção de Veículo', $ui->GetImageTheme('', 'icons/carroManutencao.png'), $module, 'main:inspecao:find');
	$panel->AddUserAction('AD_GERENCIAR_VEICULO', A_EXECUTE, 'Gerenciar Veículos', $ui->GetImageTheme('', 'icons/gerenciar_carros.png'), $module, 'main:uoveiculo:find');
	$panel->AddAction('Orçamento Termo', $ui->GetImageTheme('', 'icons/financeiro.png'), $module, 'main:pedidocompra:find');
        if (!$MIOLO->getPerms()->isAdmin())
	$panel->AddUserAction('adm_mv', A_EXECUTE, 'Manutenção de Veículos', $ui->GetImage('adm', 'kcontrol.png'), $module, 'main:manutencaoveiculo');
	/*if ($uos > 0) {
		$panel->AddUserAction('adm_requisicao', A_EXECUTE, 'Requisição Suplementar', $ui->GetImageTheme('', 'icons/requisicao_suplementar.png'), $module, 'main:requisicoes:requisicaosuplementar');
	}*/
$login = $this->manager->GetLogin();        
        if ($login->id == "romero.freire") $panel->AddUserAction('adm_almoxarifado', A_EXECUTE, 'Corrigir movimento', $ui->GetImageTheme('', 'icons/manutencao.png'), $module, 'main:corrigeMovimento');
	$theme->AppendContent($panel);

        // 09-11-2011 - Daniel BOnfim
        // add Menu lateral
        include_once($MIOLO->GetConf('home.modules') .'/main_menu.inc');

}