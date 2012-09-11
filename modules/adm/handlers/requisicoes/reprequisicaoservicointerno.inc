<?
    /**
     * Adm Module - Report Requisicao Serviço Interno Handler
     * Handler reprequisicaoservicointerno do módulo de Administração 
     * @package br.org.miolo.ufjf.adm
     */
    
    /**
     * Permissões necessárias
     *    Adm
     */

	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    

   // if( ($idreq = if( ($idreq = Form::GetFormValue('req')) )) )
	//{	
		$dados = setDados(282); //$idreq

		$report = new ezPDFReport('2');
		$pdf = $report->GetPdf(); 

		repHeader($pdf);

		$size = $pdf->getFontHeight(10);

		$yOriginal = $pdf->y;
        $pdf->x = 30;
        define('POSICAO_DADOS','100');

		$pdf->addTextWrap($pdf->x,($pdf->y-=$size),400,10,'<b>Número:</b>','left');
        $pdf->addTextWrap(($pdf->x+POSICAO_DADOS),$pdf->y,400,10,$dados->idRequisicao,'left');
		$pdf->addTextWrap($pdf->x,($pdf->y-=$size),400,10,'<b>Data:</b>','left');
        $pdf->addTextWrap(($pdf->x+POSICAO_DADOS),($pdf->y),400,10,$dados->dataRequisicao,'left');
		$pdf->addTextWrap(($pdf->x+250),($pdf->y),400,10,'<b>Hora:</b>','left');
        $pdf->addTextWrap((($pdf->x+POSICAO_DADOS)+200),($pdf->y),400,10,$dados->horaRequisicao,'left');
        $pdf->addTextWrap($pdf->x,($pdf->y-=$size),400,10,'<b>Requisitante:</b>','left');
        $pdf->addTextWrap(($pdf->x+POSICAO_DADOS),($pdf->y),400,10,$dados->nomeUsuarioReq,'left');
		$pdf->addTextWrap($pdf->x,($pdf->y-=$size),400,10,'<b>UO Requisitante:</b> ','left');
        $pdf->addTextWrap(($pdf->x+POSICAO_DADOS),($pdf->y),400,10,$dados->nomeReq,'left');
		$pdf->addTextWrap($pdf->x,($pdf->y-=$size),400,10,'<b>Executor:</b> ','left');
        $pdf->addTextWrap(($pdf->x+POSICAO_DADOS),($pdf->y),400,10,$dados->nomeExec,'left');
        
		if ($dados->urgente = 'S') {$urgente = 'com urgência';}
		if ($dados->motivourgencia != "" || $dados->motivourgencia != NULL) {$urgente .= ', por que ' . $dados->motivourgencia;} else {$urgente .= '.';}
        $conteudo = '<b>Requisitamos a(ao) </b>' . $dados->nomeExec . '<b> o seguinte procedimento: </b>' . $dados->procedimento . ' ' . $urgente;

		$pdf->y-=$size;
        $pdf->ezText($conteudo, 10, array('justification' => 'full'));

		$pdf->addText($pdf->x,($pdf->y-=$size*4),10,'Em ........ de ............................. de ............','left');
		$pdf->addText($pdf->x,($pdf->y-=$size*2),10,  '...................................................................','left');
		$pdf->addText($pdf->x,($pdf->y-=$size*7),10,'Recebi o conhecimento a que se refere a presente','left');
		$pdf->addText($pdf->x,($pdf->y-=$size*2),10,'.................................................................................','left');

		$pdf->y-=$size;
		$pdf->ezText($obs, 10, array('justification' => 'full'));
        
        
		$report->Execute();
	 //}

	function repHeader($pdf)
	{
		global $MIOLO;
		$ui = $MIOLO->GetUI();

		$h = $pdf->getFontHeight(12);
		$pdf->ezImage($ui->GetImageSrc('logonet.png'),5,50,'none','left');
	    $pdf->addText(90,800,12,'UFJF - Universidade Federal de Juiz de Fora');
		$pdf->addText(90,800-$h,12,'CGCO - Centro de Gestâo do Conhecimento Organizacional');
		$pdf->addText(90,800-($h*2),12,'SIGA - Sistema Integrado de Gestão Acadêmica');
		$pdf->addText(90,800-$h-$h-$h,12,'Módulo Administrativo - Setor de Finanças');
		$pdf->addText(185,800-$h-$h-$h-$h-$h-$h,12,'REQUISIÇÃO DE SERVIÇO INTERNO');
	    $pdf->ezSetY(800-$h-$h-$h-$h-$h-$h-$h-$h);
	}

	function setDados($idreq)
	{
		global $MIOLO;

		$objRequisicao = $MIOLO->GetBusiness('adm','requisicao',$idreq);
		
		$usuarioReq = $MIOLO->getBusiness('common','usuario');
        $usuarioReq->getById($objRequisicao->idUsuarioRequisitante);
		$objPessoa = $MIOLO->getBusiness('common','pessoa',$usuarioReq->idPessoa);
		
		$dados = new FormData();
		
		$dados->nomeUsuarioReq = $objPessoa->nome;
		
		$usuarioReq = $MIOLO->getBusiness('common','usuario');
        
		
		$dados->idRequisicao = $objRequisicao->idRequisicao;
		
		$objRequisicao->retrieveAssociation('uoRequisitante');
		$objRequisicao->retrieveAssociation('uoExecutante');
		
		list($dados->dataRequisicao,$dados->horaRequisicao) = explode(' ',$objRequisicao->dataHora);
		
		$dados->nomeReq = $objRequisicao->uoRequisitante->nome;
		$dados->nomeExec = $objRequisicao->uoExecutante->nome;
		
		$itemServInt = $objRequisicao->getItem();
		
		$dados->procedimento = $itemServInt->procedimento;
		$dados->urgente = $itemServInt->urgente;
		$dados->motivourgencia = $itemServInt->motivoUrgencia;
		
		$dados->datainicio = $itemHotel->dataHoraEntPrev;
		$dados->datafim = $itemHotel->dataHoraSaidaPrev; 
		return $dados;
	}
?>