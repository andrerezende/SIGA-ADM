<?
    /**
    * Configuração Handler of PROT Module
    * Handler de Configuração do módulo de protocolo
    * @package br.org.miolo.ufjf.protocolo
    */
    
    /**
    * Permissões necessárias
    *    PROT
    */

    $perms->CheckAccess('PROT_USR',A_ACCESS,true);
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Documentação','protocolo','main:documentos');
    $close = $MIOLO->GetActionURL($module,'main');

    $action = $context->ShiftAction();
    switch($action)
    {
        case 'hierarquia':
            $MIOLO->InvokeHandler($module, 'documentos/hierarquia');
        break;
        case 'processosabertos':
            $MIOLO->InvokeHandler($module, 'documentos/processosabertos');
        break;
		case 'processostramitados':
            $MIOLO->InvokeHandler($module, 'documentos/processostramitados');
        break;
        default:
            $panel = new ActionPanel('pnlAdTables','Documentação','',$close);
            $panel->SetIconType('small');
            $panel->AddUserAction('PROT_USR',A_EXECUTE,'Hierarquia',$ui->GetImage('protocolo','report_mini.png'),$module,'main:documentos:hierarquia');
	    $panel->AddUserAction('PROT_USR',A_EXECUTE,'Processos Abertos',$ui->GetImage('protocolo','report_mini.png'),$module,'main:documentos:processosabertos');
			$panel->AddUserAction('PROT_USR',A_EXECUTE,'Processos Tramitados',$ui->GetImage('protocolo','report_mini.png'),$module,'main:documentos:processostramitados');
            $theme->AppendContent($panel);
    }
?>
