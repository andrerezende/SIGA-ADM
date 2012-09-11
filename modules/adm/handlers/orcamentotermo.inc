<?

	$theme->ClearContent();
//	$navbar->AddOption(('Orc Term','adm'),'adm','main:orcterm');
	$ui = $MIOLO->GetUI();
	$form = $ui->GetForm('adm','frmOrcamentoTermo',$itens);
	$theme->InsertContent($form);

?>
