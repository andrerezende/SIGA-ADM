<?
    // variáveis
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
    
    // insere formulário frmSetorAcessoFind
	$form = $ui->GetForm($module,'frmSetorFind',NULL,'setor');
	$theme->InsertContent($form);
?>

