<?/*Business$this->objRequisicao->getUoExecutante();
   $this->objRequisicao->uoExecutante->isExecutorOf($idUsuario)*/

	$theme->ClearContent();
	$ui = $MIOLO->GetUI();
	$form = $ui->GetForm('adm','frmInspecaoFind',NULL,'inspecao');
	$theme->InsertContent($form);
       
?>
