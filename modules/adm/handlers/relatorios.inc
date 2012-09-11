<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Relatorios',$module,'main:reports');
    switch($action)
    {
        case 'repRequisicoesDevolvidas':
            $MIOLO->InvokeHandler($module, 'relatorios/repRequisicoesDevolvidas');
        break;
        case 'repSaldoLicitacao':
            $MIOLO->InvokeHandler($module, 'relatorios/repSaldoLicitacao');
        break;
        case 'repRequisicoesSuplementaresPorUo':
            $MIOLO->InvokeHandler($module, 'relatorios/repRequisicoesSuplementaresPorUo');
        break;
        case 'repLicitacoesAEmpenhar':
            $MIOLO->InvokeHandler($module, 'relatorios/repLicitacoesAEmpenhar');
        break;
        case 'repHistoricoItem':
            $MIOLO->InvokeHandler($module, 'relatorios/repHistoricoItem');
        break;
        case 'repConRazao':
            $MIOLO->InvokeHandler($module, 'relatorios/repConRazao');
        break;
        case 'repTotalGastosReqUo':
            $MIOLO->InvokeHandler($module, 'relatorios/repTotalGastosReqUo');
        break;
        case 'repKilometrosPercorridos':
            $MIOLO->InvokeHandler($module, 'relatorios/repKilometrosPercorridos');
        break;
		
        case 'repRelacaoFinanceira':
            $MIOLO->InvokeHandler($module, 'relatorios/repRelacaoFinanceira');
        break;

		case 'repExecFinanceira':
            $MIOLO->InvokeHandler($module, 'relatorios/repExecFinanceira');
        break;
        
        case 'repExecFinanceira2':
            $MIOLO->InvokeHandler($module, 'relatorios/repExecFinanceira2');
        break;
        
        case 'repViagemMotorista':
            $MIOLO->InvokeHandler($module, 'relatorios/repExecViagemMotorista');
        break;
        
        case 'repMaterialConsumo':
            $MIOLO->InvokeHandler($module, 'relatorios/repMaterialConsumo');
        break;
        
         case 'repMaterialPermanente':
            $MIOLO->InvokeHandler($module, 'relatorios/repMaterialPermanente');
        break;
        
        case 'repDotacaoDebito':
            $MIOLO->InvokeHandler($module, 'relatorios/repDotacaoDebito');
        break;
        
        case 'repDotacoes':
            $MIOLO->InvokeHandler($module, 'relatorios/repDotacoes');
        break;      

        case 'repPassagemAerea':
            $MIOLO->InvokeHandler($module, 'relatorios/repPassagemAerea');
        break;  
		
		case 'repBolsa':
            $MIOLO->InvokeHandler($module, 'relatorios/repBolsa');
        break;  	        
        
        case 'repExecConviteEquipamento':
            $MIOLO->InvokeHandler($module, 'relatorios/repExecConviteEquipamento');
        break;
	
        case 'repSolicitacaoEmpenho':
            $MIOLO->InvokeHandler($module, 'relatorios/repSolicitacaoEmpenho');
        break;
        
        case 'repFechamentoDiaria':
            $MIOLO->InvokeHandler($module, 'relatorios/repFechamentoDiaria');
        break;

        case 'repSolicitacaoItens':
            $MIOLO->InvokeHandler($module, 'relatorios/repSolicitacaoItens');
        break;

        case 'repSolicitacaoEmpresa':
            $MIOLO->InvokeHandler($module, 'relatorios/repSolicitacaoEmpresa');
        break;
		case 'repReqALiberar':
 	  	             $MIOLO->InvokeHandler($module, 'relatorios/repReqALiberar');
        break;
        case 'repReqViagens':
 	  	             $MIOLO->InvokeHandler($module, 'relatorios/repReqViagens');
        break;
		/*
        case 'repMapaLicitacao':
            $MIOLO->InvokeHandler($module, 'relatorios/repMapaLicitacao');
        break;
        */
		 case 'repAtribOrc':
 	  	             $MIOLO->InvokeHandler($module, 'relatorios/repAtribOrc');
        break;
    }
?>
