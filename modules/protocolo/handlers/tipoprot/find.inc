<?
    // variáveis
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
    
	$form = $ui->GetForm('protocolo','frmTipoprotFind',NULL,'tipoprot');
	$theme->InsertContent($form);
?>
