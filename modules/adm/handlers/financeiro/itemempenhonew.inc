<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Inserir itens no empenho', 'adm', 'main:financeiro:itemempenhonew');
	$objEmpenho = $MIOLO->GetBusiness('adm','empenho',$item);
	$form = $ui->GetForm('adm','frmItemEmpenhoNew',$objEmpenho,'financeiro');
	$theme->InsertContent($form);
?>