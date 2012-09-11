<?
//  permissões
    $perms->CheckAccess('PROT_ADMIN',A_ACCESS,true);
	
	// variáveis
    $theme->ClearContent();
	$ui = $MIOLO->GetUI();

    // barra de navegação
	$navbar->AddOption('Listar Processos Vagos', 'protocolo','processos:vagos');
    
    // insere o formulário frmProcessoNovo
	$form = $ui->GetForm('protocolo','frmProcessosVagos',NULL,'processos');
	$theme->InsertContent($form);
?>
