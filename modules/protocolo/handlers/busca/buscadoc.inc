<?
	// variáveis
    $theme->ClearContent();
	$ui = $MIOLO->GetUI();

    // barra de navegação
	$navbar->AddOption('Busca de Documentos', 'protocolo','busca:buscadoc');
    
    // insere o formulário frmProcessoNovo
	$form = $ui->GetForm('protocolo','frmBusca',NULL,'busca');
	$theme->InsertContent($form);
?>
