<?
	// variáveis
    $theme->ClearContent();
	$ui = $MIOLO->GetUI();

    // barra de navegação
	$navbar->AddOption('Incluir Processo', 'protocolo','processos:new');
    
    // insere o formulário frmProcessoNovo
	$form = $ui->GetForm('protocolo','frmProcessoNovo',NULL,'processos');
	$theme->InsertContent($form);
?>
