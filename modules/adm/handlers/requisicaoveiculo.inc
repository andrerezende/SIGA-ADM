<?
    $action = $context->ShiftAction();
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
	//$navbar->AddOption('Requisição', 'adm', 'main:requisicaoveiculo:findveiculo');
    $navbar->AddOption('Requisição', 'adm','main');
    
    
	switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'requisicoes/find');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'requisicaoveiculo/new');
            break;
        case 'findveiculo':
            $MIOLO->InvokeHandler($module, 'requisicaoveiculo/findveiculo');
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
        case 'loginmot':
            $MIOLO->InvokeHandler($module, 'requisicaoveiculo/loginmot');
            break;
        default:
            $MIOLO->InvokeHandler($module, 'requisicaoveiculo/main');
        }
?>
