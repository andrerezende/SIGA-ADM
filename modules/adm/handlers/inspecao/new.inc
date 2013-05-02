<?
       $parte = explode("_", $item);
       $uo = $this->manager->GetBusiness('adm','uo', $item);
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	//$navbar->AddOption('Nova Inspeção', 'adm', 'main:inspecao:new',$item);
	$form = $ui->GetForm('adm','frmInspecaoNew',$uo,'inspecao');
	$theme->InsertContent($form);
?>
