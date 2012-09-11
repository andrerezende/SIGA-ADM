<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
        $navbar->AddOption('Pesquisar Itens', 'adm', 'main:itempatrimonio:find');
	$form = $ui->GetForm('adm','frmPatrimonioFind',NULL,'patrimonio');
	$theme->InsertContent($form);
?>
