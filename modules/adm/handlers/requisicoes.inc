<?
    $action = $context->ShiftAction();
    $navbar->AddOption('Requisição', 'adm', 'main:requisicoes:find');
	switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'requisicoes/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'requisicoes/new');
            break;
		case 'reprequisicaoveiculo':
            $MIOLO->InvokeHandler($module, 'requisicoes/reprequisicaoveiculo');
            break;			
		case 'reprequisicaoalimentacao':
            $MIOLO->InvokeHandler($module, 'requisicoes/reprequisicaoalimentacao');
            break;			
		case 'reprequisicaohospedagem':
            $MIOLO->InvokeHandler($module, 'requisicoes/reprequisicaohospedagem');
            break;			
		case 'reprequisicaopassagem':
            $MIOLO->InvokeHandler($module, 'requisicoes/reprequisicaopassagem');
            break;
		case 'reprequisicaodiaria':
            $MIOLO->InvokeHandler($module, 'requisicoes/reprequisicaodiaria');
            break;
		case 'reprequisicaorelatorioviagem':
            $MIOLO->InvokeHandler($module, 'requisicoes/reprequisicaorelatorioviagem');
            break;
		case 'reprequisicaoservicointerno':
            $MIOLO->InvokeHandler($module, 'requisicoes/reprequisicaoservicointerno');
            break;           
		case 'requisicaosuplementar':
            $MIOLO->InvokeHandler($module, 'requisicoes/requisicaosuplementar');
            break;
            case 'repMapUtilizacaoVeiculo':
            $MIOLO->InvokeHandler($module, 'requisicoes/repMapUtilizacaoVeiculo');
            break;
            case 'repMapUtilizacaoMotorista':
            $MIOLO->InvokeHandler($module, 'requisicoes/repMapUtilizacaoMotorista');
            break;
            case 'repMapReqAbastecimento':
            $MIOLO->InvokeHandler($module, 'requisicoes/repMapReqAbastecimento');
            break;
            case 'repMapRequisicao':
            $MIOLO->InvokeHandler($module, 'requisicoes/repMapRequisicao');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'requisicoes/main');
        }
?>
