<?
        $navbar->AddOption('Patrimônio',$module,'main:patrimonio');
        $navbar->AddOption('Baixa em bloco', 'adm', 'main:itempatrimonio:find');
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$form = $ui->GetForm('adm', 'frmPatrimonioBaixaBloco', 'NULL', 'patrimonio');
	$theme->InsertContent($form);
?>
