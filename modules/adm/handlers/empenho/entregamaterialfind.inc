<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
    $navbar->AddOption('Entrega de Material','adm','main:empenho:entregamaterialfind');
	$form = $ui->GetForm('adm','frmEmpenhoEntregaMaterialFind',NULL,'empenho');
	$theme->InsertContent($form);
?>
