<?
	// permissões
    $perms->CheckAccess('PROT_USR',A_ACCESS,true);
    // variáveis
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    // instancia o objeto processo e busca
    $objProcesso = $MIOLO->GetBusiness('protocolo','processo',$item);
    $objBusca = $MIOLO->GetBusiness('protocolo','busca',$item);
	// se existir handler
    $a = $context ? $context->ShiftAction() : 'main';
    $handled = $MIOLO->InvokeHandler($module,$a);
    if (!$handled)
    {
        // insere painel de controle 
        $close = $MIOLO->GetActionURL('common','main');
        $panel = new ActionPanel('pnlBusca','Outras Consultas','',$close);
        $panel->SetIconType('small');
        $panel->AddUserAction('PROT_ADMIN',A_EXECUTE,'Processos Vagos',$ui->GetImage('protocolo','editar_mini.png'),$module,'main:busca:vagos');
        $panel->AddUserAction('PROT_USR',A_EXECUTE,'Consulta Trâmite',$ui->GetImage('protocolo','find.png'),$module,'main:busca:tramite');
        $theme->AppendContent($panel);
    } 
  

?>
