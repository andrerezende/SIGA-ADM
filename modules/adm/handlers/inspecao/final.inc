<?/*Business$this->objRequisicao->getUoExecutante();
   $this->objRequisicao->uoExecutante->isExecutorOf($idUsuario)*/

	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
        $uo = $this->manager->GetBusiness('adm','uo', $item);
	$form = $ui->GetForm('adm','frmInspecaoFind',$uo,'inspecao');
	$theme->InsertContent($form);
       
?>
