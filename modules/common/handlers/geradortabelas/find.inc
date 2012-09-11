<?php
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$form = $ui->GetForm('common','frmGeradorTabelasFind',NULL,'geradortabelas');
	$theme->InsertContent($form);
?>