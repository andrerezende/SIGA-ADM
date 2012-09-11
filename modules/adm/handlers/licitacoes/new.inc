<?    
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Nova Licitação', 'adm', 'main:licitacoes:new');
	$form = $ui->GetForm('adm','frmLicitacaoNew',$item,'licitacoes');
	$theme->InsertContent($form);
?>
