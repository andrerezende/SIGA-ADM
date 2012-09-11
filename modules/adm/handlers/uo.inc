<?
    $action = $context->ShiftAction();

    $navbar->AddOption('Manutenção',$module,'main:manutencao');
    $navbar->AddOption('Unidade Orçamentária', 'adm', 'main:uo:find');
    switch($action)
    {
        case 'find':
            $MIOLO->InvokeHandler($module, 'uo/find');
            break;
		case 'findInativas':
            $MIOLO->InvokeHandler($module, 'uo/findInativas');
            break;
        case 'new':
            $MIOLO->InvokeHandler($module, 'uo/new');
            break;
        case 'orcamentointerno':
            $MIOLO->InvokeHandler($module, 'uo/orcamentointerno');
            break;
        case 'orcamentointernofind':
			$MIOLO->InvokeHandler($module, 'uo/orcamentointernofind');
            break;
        case 'orcamentointernonew':
			$MIOLO->InvokeHandler($module, 'uo/orcamentointernonew');
            break;
        case 'orcamentointernoedit':
			$MIOLO->InvokeHandler($module, 'uo/orcamentointernoedit'); 
            break;
        default:
            $MIOLO->InvokeHandler($module, 'uo/main');
        }
?>
