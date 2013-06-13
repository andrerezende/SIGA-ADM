<?php
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('U.O. Veículos', 'adm', 'main:uoveiculo:find');
    //$navbar->AddOption('Relatórios',$module,'main:reports');
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
	$panel->AddUserAction('AD_REL_VEICULOS',A_EXECUTE,'Mapa de Utilização de Veículo',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatoriosvei:repMapUtilizacaoVeiculo');
	
    // B
	$panel->AddUserAction('AD_REL_VEICULOS',A_EXECUTE,'Mapa de Utilização de Motorista',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repMapUtilizacaoMotorista');

    // C
        $panel->AddUserAction('AD_REL_VEICULOS',A_EXECUTE,'Abastecimentos',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatoriosvei:repMapReqAbastecimento');
        $panel->AddUserAction('AD_REL_VEICULOS',A_EXECUTE,'Imprimir Requisição',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatoriosvei:repMapRequisicao');
        $panel->AddUserAction('AD_REL_VEICULOS',A_EXECUTE,'Imprimir Inspeção',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatoriosvei:repMapInspecaoVeiculo');
    //$panel->AddUserAction('adm_adminorcamento',A_EXECUTE,'ConRazão',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repConRazao');
    //$panel->AddUserAction('adm_compras',A_EXECUTE,'Convite Equipamento',$ui->GetImageTheme('','icons/relatorio.png'),$module, 'main:relatorios:repExecConviteEquipamento');

  
	
	$theme->AppendContent($panel);

	$handled = $MIOLO->InvokeHandler($module, 'relatorios/' . $context->ShiftAction());
?>
