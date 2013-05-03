<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
        
        //$objInspecao = $MIOLO->GetBusiness('adm','inspecao', $item);
        //$navbar->AddOption('Motorista Login', 'adm', 'main:inspecao:itinerarioNew');
	$form = $ui->GetForm('adm','frmConformidadeMotorista',null,'inspecao');
	$theme->InsertContent($form);
?>
