<?
//  permissões
    $perms->CheckAccess('PROT_ADMIN',A_ACCESS,true);
	
    // variáveis
    $theme->ClearContent();
	$ui = $MIOLO->GetUI();

    // barra de navegação
    $objProcesso = $MIOLO->GetBusiness('protocolo','processo',$item);
	$navbar->AddOption(ucwords(strtolower($objProcesso->numProcessoFormatado())),'protocolo','processos:vago');
    
    // insere o formulário frmProcessoNovo
	$form = $ui->GetForm('protocolo','frmProcessoVago',NULL,'processos');
	$theme->InsertContent($form);
?>
