<?
	// variáveis
    $theme->ClearContent();
	$ui = $MIOLO->GetUI();

    // barra de navegação
	$navbar->AddOption('Incluir Tipo Protocolado', 'protocolo','tipoprot:new');
    
    // insere o formulário frmProcessoNovo
	$form = $ui->GetForm('protocolo','frmTipoprotNew',NULL,'tipoprot');
	$theme->InsertContent($form);
?>