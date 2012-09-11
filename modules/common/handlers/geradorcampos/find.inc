<?php
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$form = $ui->GetForm('common','frmGeradorCamposFind',NULL,'geradorcampos');
	$theme->InsertContent($form);
?>