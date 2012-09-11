<?php
    // permissões
    $perms->checkAccess('PROT_USR', A_ACCESS,'');
    // barra de navegação
    $navbar->AddOption('Protocolo','protocolo','main');
    // variáveis
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    // se existir handler
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
    if (!$handled)
    {
        // insere painel de controle 
        $close = $MIOLO->GetActionURL('common','main');
        $panel = new ActionPanel('pnlProtocolo','Protocolo','',$close);
        //$panel->SetIconType('small');
        $panel->AddUserAction('PROT_USR',A_EXECUTE,'Processos',$ui->GetImageTheme('','icons/processos.png'),$module,'main:processos:find');
        // 31-10-2011 - Daniel Bonfim
        $panel->AddUserAction('prot',A_ACCESS, 'Pendências de Protocolo', $ui->GetImageTheme('','icons/protocolo.png'), 'protocolo', 'main:processos:pendentes');
//        $panel->AddUserAction('PROT_USR',A_EXECUTE,'Múltiplos Processos',$ui->GetImageTheme('','icons/multiplos_processos.png'),$module,'main:multiplos');
        $panel->AddUserAction('PROT_CONF',A_EXECUTE,'Configuração',$ui->GetImageTheme('','icons/configuracao.png'), $module,'main:configuracao');
// Manual Protocolo
	//	$panel->AddUserAction('adm_requisicao',A_EXECUTE,'Manuais',$ui->GetImageTheme('','icons/manuais.png'),$module,'main:manual');
        $theme->AppendContent($panel);
        // 09-11-2011 - Daniel BOnfim
        // add Menu lateral
        include_once($MIOLO->GetConf('home.modules') .'/main_menu.inc');
    } 
?>
