<?php
    /**
     * Configuração Handler of Adm Module
     * Handler de Configuração do módulo de Administração 
     * @package br.org.miolo.ufjf.rh
     */
    
    /**
     * Permissões necessárias
     *    RH
     */

    //$perms->CheckAccess('adm_manutencao',A_ACCESS,true);

    $ui = $MIOLO->GetUI();

    $navbar->AddOption('Manutenção','adm','main:manutencao');
    $login = $this->manager->GetLogin();
   
    $close = $MIOLO->GetActionURL($module,'main');

    $panel = new ActionPanel('pnlAdTables','Manutenção do Sistema','',$close);
    $panel->SetIconType('large');
   
    $panel->AddUserAction('adm_cadastromaterial',A_EXECUTE,'Altera Material de Requisição',$ui->GetImageTheme('','icons/altera_material_de_requisicao.png'),$module, 'main:alteraMaterialRequisicao');
    $panel->AddUserAction('adm_patrimonio',A_EXECUTE,'Classificador',$ui->GetImageTheme('','icons/classificador.png'),$module,'main:classificador:find');
    $panel->AddUserAction('adm_patrimonio',A_EXECUTE,'Dependência',$ui->GetImageTheme('','icons/dependencia.png'),$module, 'main:dependencia:find');
    $panel->AddUserAction('adm_adminorcamento',A_EXECUTE,'Fonte',$ui->GetImageTheme('','icons/fonte.png'),$module,'main:fonte:find');
    $panel->AddUserAction('adm_cadastrofornecedor',A_EXECUTE,'Fornecedor',$ui->GetImageTheme('','icons/fornecedor.png'),$module, 'main:fornecedor:find');
    $panel->AddUserAction('adm_executorhotel',A_EXECUTE,'Hotel',$ui->GetImageTheme('','icons/hotel.png'),$module,'main:hotel:find');
    $panel->AddUserAction('adm_adminorcamento',A_EXECUTE,'Informações',$ui->GetImageTheme('','icons/informacoes.png'),$module,'main:altera:find');
    $panel->AddUserAction('adm_financas',A_EXECUTE,'INSS',$ui->GetImageTheme('','icons/inss.png'),$module, 'main:inss:find');
    $panel->AddUserAction('adm_financas',A_EXECUTE,'IRRF',$ui->GetImageTheme('','icons/irrf.png'),$module, 'main:irrf:find');
    $panel->AddUserAction('adm',A_EXECUTE, 'Material',$ui->GetImageTheme('','icons/material_manutencao.png'),  $module,'main:material:find');
    $panel->AddUserAction('adm_cadastromaterial',A_EXECUTE,'Endereços',$ui->GetImageTheme('','icons/altera_material_de_requisicao.png'),$module, 'main:endereco');
    $panel->AddUserAction('adm_executorgarag',A_EXECUTE,'Motorista',$ui->GetImageTheme('','icons/motorista.png'),$module,'main:motorista:find');
    $panel->AddUserAction('adm_adminorcamento',A_EXECUTE,'PTR',$ui->GetImageTheme('','icons/ptr.png'),$module,'main:ptr:find');
    $panel->AddUserAction('adm_executorrest',A_EXECUTE,'Restaurante',$ui->GetImageTheme('','icons/restaurante.png'),$module,'main:restaurante:find');
    $panel->AddUserAction('adm_adminorcamento',A_EXECUTE,'Rubrica',$ui->GetImageTheme('','icons/rubrica.png'),$module,'main:rubrica:find');
    $panel->AddUserAction('adm',A_EXECUTE, 'Serviço Externo',$ui->GetImageTheme('','icons/servico_externo.png'),  $module,'main:servicoext:find');
    $panel->AddUserAction('adm_adminorcamento',A_EXECUTE,'Serviços Internos',$ui->GetImageTheme('','icons/servico_interno.png'),$module,'main:servInterno:find');
    $panel->AddUserAction('adm_financas',A_EXECUTE,'Taxi',$ui->GetImageTheme('','icons/taxi.png'),$module,'main:taxi:find');
    $panel->AddUserAction('adm_adminorcamento',A_EXECUTE,'Tipo Requisição',$ui->GetImageTheme('','icons/tipo_requisicao.png'),$module,'main:tiporeq:find');
  //  $panel->AddUserAction('adm_adminorcamento',A_EXECUTE,'Tipo Requisição',$ui->GetImageTheme('','default.png'),$module,'main:tiporeq:find');
    $panel->AddUserAction('adm_adminuo',A_EXECUTE,'U.O.',$ui->GetImageTheme('','icons/uo.png'),$module,'main:uo:find');
    $panel->AddUserAction('adm_executorgarag',A_EXECUTE,'Veiculo',$ui->GetImageTheme('','icons/veiculo.png'),$module,'main:veiculo:find');
   // $panel->AddUserAction('adm_unidade',A_EXECUTE,'Unidade',$ui->GetImageTheme('','icons/unidadem.jpg'),$module,'main:unidade:find');
    $panel->AddUserAction('adm_unidade',A_EXECUTE,'Unidade',$ui->GetImageTheme('','icons/umedidas.png'),$module,'main:unidade:find');
    if($login->id == 'romero.freire')
    $panel->AddUserAction('adm_unidade',A_EXECUTE,'Calcula Itens Patrimoniais',$ui->GetImageTheme('','icons/itenspatrimonio.png'),$module,'main:calitempatrimonio:find');


    
    
	
    
    
    
    
    
	
	
		
	
		
	
    
	
	
	
	
	




	$theme->AppendContent($panel);
?>

