<?
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
        $tipoItem = explode("_", $item);
        if($tipoItem[0] == "v"){
           $objInspecao = $MIOLO->GetBusiness('adm','requisicao', (int)$tipoItem[1]); 
           $navbar->AddOption('Motorista Login', 'adm', 'main:inspecao:itinerarioNew');
	  $form = $ui->GetForm('adm','frmConformidadeMotorista',$objInspecao,'inspecao');
	  $theme->InsertContent($form);
        }else {
        $objInspecao = $MIOLO->GetBusiness('adm','inspecao', $item);
    $navbar->AddOption('Motorista Login', 'adm', 'main:inspecao:itinerarioNew');
	$form = $ui->GetForm('adm','frmConformidadeMotorista',$objInspecao,'inspecao');
	$theme->InsertContent($form);}
?>
