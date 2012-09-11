<?
	// variáveis
    $theme->ClearContent();
	$ui = $MIOLO->GetUI();

    // barra de navegação
	$navbar->AddOption('Processos Vagos', 'protocolo','busca:vagos');
    
    // insere o formulário frmProcessoNovo
	$form = $ui->GetForm('protocolo','frmProcessosVagos',NULL,'busca');
	$theme->InsertContent($form);
?>
