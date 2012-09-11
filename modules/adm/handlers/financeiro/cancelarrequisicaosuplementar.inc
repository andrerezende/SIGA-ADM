<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Cancelar Requisição Suplementar', 'adm', 'main:financeiro:cancelarrequisicaosuplementar');
	$form = $ui->GetForm('adm','frmCancelarRequisicaoSuplementar',NULL,'financeiro');
	$theme->InsertContent($form);
?>