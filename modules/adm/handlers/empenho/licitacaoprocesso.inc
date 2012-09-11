<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Gerar N. de Processo', 'adm', 'main:empenho:licitacaoprocesso');
	$form = $ui->GetForm('adm','frmEmpenhoProcessoLicitacao',$item,'empenho');
	$theme->InsertContent($form);
?>
