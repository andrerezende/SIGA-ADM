<?
	// variáveis
    $theme->ClearContent();
	$ui = $MIOLO->GetUI();

    // barra de navegação
	$navbar->AddOption('Consulta Trâmite', 'protocolo','busca:tramite');
    
    // insere o formulário frmProcessoNovo
	$form = $ui->GetForm('protocolo','frmBuscaTramite',NULL,'busca');
	$theme->InsertContent($form);
?>
