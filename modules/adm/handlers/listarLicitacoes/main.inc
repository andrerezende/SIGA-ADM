<?php
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Licitações','adm','main');
	$close = $MIOLO->GetActionURL($module,'main');
	
	if ($action = $context->ShiftAction())
	{
		$handled = $MIOLO->InvokeHandler($module,"listarLicitacoes/" . $action);
	}

	$panel2 = new ActionPanel('pnlAdTables','Itens a Licitar:','',$close);
	$panel2->SetIconType('large');
	$panel2->AddUserAction('adm_compras',A_EXECUTE,'Material de Consumo',$ui->GetImageTheme('','icons/material_de_consumo.png'),$module,'main:listarLicitacoes:itens');
	$panel2->AddUserAction('adm_compras',A_EXECUTE,'Material Permanente',$ui->GetImageTheme('','icons/material_permanente.png'),$module,'main:listarLicitacoes:materialPermanenteALicitar');
	$panel2->AddUserAction('adm_compras',A_EXECUTE,'Serviços',$ui->GetImageTheme('','icons/servico_licitacoes.png'),$module,'main:listarLicitacoes:aLicitar');
	$panel2->AddUserAction('adm_compras',A_EXECUTE,'Livros',$ui->GetImageTheme('','icons/livros.png'),$module,'main:listarLicitacoes:livrosALicitar');
	$theme->InsertContent($panel2);

	$panel = new ActionPanel('pnlAdTables','Listar Licitações:','',$close);
	$panel->SetIconType('large');	
	$panel->AddUserAction('adm_compras',A_EXECUTE,'Em Andamento',$ui->GetImageTheme('','icons/em_andamento.png'),$module,'main:listarLicitacoes:emAndamento');
	$panel->AddUserAction('adm_compras',A_EXECUTE,'Vencidas',$ui->GetImageTheme('','icons/vencidas.png'),$module,'main:listarLicitacoes:vencedoresdefinidos');
	$panel->AddUserAction('adm_compras',A_EXECUTE,'Empenhadas',$ui->GetImageTheme('','icons/empenhadas.png'),$module,'main:listarLicitacoes:empenhadas');
	$panel->AddUserAction('adm_compras',A_EXECUTE,'Canceladas',$ui->GetImageTheme('','icons/canceladas.png'),$module,'main:listarLicitacoes:canceladas');
	$panel->AddUserAction('adm_compras',A_EXECUTE,'Por Material ou Serviço',$ui->GetImageTheme('','icons/por_material_ou_servico.png'),$module,'main:listarLicitacoes:descricao');//por descrição
	
	$theme->InsertContent(new MSpacer(1));
	$theme->InsertContent($panel);

	$panel3 = new ActionPanel('pnlAdTables','Operações:','',$close);
	$panel3->SetIconType('large');	
	$panel3->AddUserAction('adm_compras',A_EXECUTE,'Liberação de Termo de Orçamento',$ui->GetImageTheme('','icons/financeiro.png'),$module,'main:liberarorcterm');
	
	$theme->InsertContent(new MSpacer(1));
	$theme->InsertContent($panel3);
?>
