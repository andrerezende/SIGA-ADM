<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Empenhos do Ano Anterior', 'adm', 'main:financeiro:empenhoAnoAnterior');
	$form = $ui->GetForm('adm','frmEmpenhoAnoAnterior',$item,'financeiro');

	$theme->InsertContent($form);
?>
