<?
	$theme->ClearContent();
        $ui = $MIOLO->GetUI();
        $navbar->AddOption('Nova Tabelageral', 'common', 'main:tabelageral:new');
	$form = $ui->GetForm('common','frmTabelageralNew',NULL,'tabelageral');
	$theme->InsertContent($form);
?>
