<?
    $action = $context->ShiftAction();
    $navbar->AddOption('U.O. Veículos', 'adm', 'main:uoveiculo:find');
    //$navbar->AddOption('Relatorios',$module,'main:reports');
    switch($action)
    {
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
            case 'repMapInspecaoVeiculo':
                $MIOLO->InvokeHandler($module,'requisicoes/repMapInspecaoVeiculo');
            break;
    }
?>
