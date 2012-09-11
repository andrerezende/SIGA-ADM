<?
	// variáveis
    $theme->ClearContent();
	$ui = $MIOLO->GetUI();

    // barra de navegação
	$navbar->AddOption('Incluir Setor', 'protocolo','setor:new');
    
    // insere o formulário frmProcessoNovo
	$form = $ui->GetForm('protocolo','frmSetorNovo',NULL,'setor');
	$theme->InsertContent($form);
?>
