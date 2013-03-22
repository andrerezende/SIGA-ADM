<?/*Business$this->objRequisicao->getUoExecutante();
   $this->objRequisicao->uoExecutante->isExecutorOf($idUsuario)*/

        $executante= $this->manager->GetBusiness('adm', 'executor');
        $e = $executante->listaexecutor($this->manager->GetLogin()->idkey)->result[0][0];
        if($e < 1){
	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$form = $ui->GetForm('adm','frmInspecaoFind',NULL,'inspecao');
	$theme->InsertContent($form);
        }else{
            $theme->ClearContent();
	    $ui = $MIOLO->GetUI();
	    $form = $ui->GetForm('adm','frmInspecaoUo',NULL,'inspecao');
	    $theme->InsertContent($form);
        }
?>
