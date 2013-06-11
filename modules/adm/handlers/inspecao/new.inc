<?
       $parte = explode("_", $item);
       $uo = $this->manager->GetBusiness('adm','uo', $item);
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$navbar->AddOption('Veículos', 'adm', 'main:uoveiculo:main');
	$form = $ui->GetForm('adm','frmInspecaoNew',$uo,'inspecao');
	$theme->InsertContent($form);
?>
