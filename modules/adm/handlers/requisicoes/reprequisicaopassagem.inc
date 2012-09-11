<?
    /**
     * Adm Module - Report Requisicao Passagem Handler
     * Handler reprequisicaopassagem do módulo de Administração 
     * @package br.org.miolo.ufjf.adm
     */
    
    /**
     * Permissões necessárias
     *    Adm
     */
	global $MIOLO;
	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    
    if( ($idreq = Form::GetFormValue('req')) )
	{	
		$dados = setDados($idreq);

		if($dados->status != 7)
		{
			$MIOLO->Error('Esta requisição não pode ser impressa porque ela não está liberada.');
            return;
		}
		
		$report = new ezPDFReport('2');
		$pdf = $report->GetPdf(); 


		if($dados->tipoTransporte==1){ //terrestre
		
			$ui = $MIOLO->GetUI();
		
			for($via = 1; $via <= 2; $via++){
				if($via == 1)
					$pdf->ezSetY(720);
				else
					$pdf->ezSetY(415);
				
			    $pdf->rectangle(35,$pdf->y,525,72);
				$pdf->rectangle(400,$pdf->y,0,72);
				$pdf->rectangle(35,$pdf->y-=14,525,14);

				$pdf->rectangle(35,$pdf->y-=14,525,14);
				$pdf->rectangle(35,$pdf->y-=30,525,30);
				$pdf->rectangle(35,$pdf->y-=16,525,16);
			    $pdf->rectangle(35,$pdf->y-=20,525,20);
				$pdf->rectangle(35,$pdf->y-22,525,22);
				$pdf->rectangle(370,$pdf->y-22,0,102);
				$pdf->rectangle(35,$pdf->y-=100,525,100);
				$pdf->rectangle(35,$pdf->y-=16,525,16);

				$h = $pdf->getFontHeight(10);

				$pdf->ezSetY($pdf->y + 270);
				$pdf->addText(50,$pdf->y,10,'UFJF - Universidade Federal de Juiz de Fora');
				$pdf->addText(50,$pdf->y-$h,10,'CGCO - Centro de Gestão do Conhecimento Organizacional');
				$pdf->addText(50,$pdf->y-($h*2),10,'SIGA - Sistema Integrado de Gestão Acadêmica');
				$pdf->addText(50,$pdf->y-$h-$h-$h,10,'Módulo Administrativo - Setor de Finanças');
				$pdf->addText(50,$pdf->y-$h-$h-$h-$h,10,'Unidade Orçamentária: ' . $dados->nomeReq);
				$pdf->addText(50,$pdf->y-$h-$h-$h-$h-$h,10,'REQUISIÇÃO DE TRANSPORTE RODOVIÁRIO');
				$pdf->addText(450,$pdf->y-($h*2),10,'Número: ' . $dados->idRequisicao);
				$pdf->ezSetY($pdf->y-$h-$h-$h-$h-$h);

				$pdf->addText(40,$pdf->y-=14,10,'EMPRESA: ' . $dados->empresa);
				$pdf->addText(40,$pdf->y-=14,10,'NÚMERO DE PASSAGENS: 01');
				$pdf->addText(375,$pdf->y,10,'RUBRICA: 349033');
				$pdf->addText(40,$pdf->y-=18,10,'ORIGEM: ' . $dados->origem);
				$pdf->addText(375,$pdf->y,10,    '(      ) CONVENCIONAL');
				$pdf->addText(375,$pdf->y-=10,10,'(      ) EXECUTIVO / LEITO');
				if($dados->tipoOnibus=='C'){
					$pdf->addText(375,$pdf->y+10,10,'(  X');
				}
				if($dados->tipoOnibus=='E'){
					$pdf->addText(375,$pdf->y,10,'(  X');
				}
				$pdf->addText(40,$pdf->y-=16,10,'DESTINO: ' . $dados->destino);
				$pdf->addText(40,$pdf->y-=18,10,'USUÁRIO: ' . $dados->nome);
				$pdf->addText(375,$pdf->y,10,'IDENTIDADE: ' . $dados->identidade);
				
				$pdf->addText(40,$pdf->y-=20,10,'EMAIL: ' . $dados->emailRequisitante);
				if(!empty($dados->codLocalizador))
					$pdf->addText(375,$pdf->y,10,'CODIGO: ' . $dados->codLocalizador);
				
				$pdf->addText(40,$pdf->y-=20,10,'EM    ' . date('d / m / Y'));

				$pdf->addText(52,$pdf->y-=50,10, '.....................................................................................');
				$pdf->addText(325,$pdf->y,10, '...............................................................................');
				$pdf->addText(50,$pdf->y-=10,9,'CARIMBO E ASSINATURA DO SECRETÁRIO OU CHEFIA');
				$pdf->addText(380,$pdf->y,9,'ASSINATURA DO USUÁRIO');
				

				$pdf->addText(40,$pdf->y-=20,9,'OBS: 1) O CONTROLE E A NUMERAÇÃO DA REQUISIÇÃO SÃO DE RESPONSABILIDADE DA UNIDADE REQUERENTE');
			}
		}
		else{
			if($dados->tipoTransporte==2){ //aereo
				repHeader($pdf);

				$size = $pdf->getFontHeight(10);

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

				$pdf->addTextWrap($pdf->x,($pdf->y-=$size*3),400,10,'<b>Sr. Agente da </b>' . $dados->empresa, 'left');

				$pdf->y-=$size;
		        $pdf->ezText('<b>Requisitamos a V.Sa., por conta da REITORIA da UFJF e para pagamento à conta da Verba 339033 o fornecimento de transporte aéreo para </b>' . $dados->nome . '<b> que.......</b>', 10, array('justification' => 'full'));


		        define('POSICAO_DADOSPASSAGEM','135');
				$pdf->addTextWrap(($pdf->x),($pdf->y-=$size*2),400,10,'<b>Número de passagens:</b>', 'left');
				$pdf->addTextWrap(($pdf->x+POSICAO_DADOSPASSAGEM),($pdf->y),400,10,'01', 'left');
				$pdf->addTextWrap(($pdf->x),($pdf->y-=$size),400,10,'<b>Número do vôo: </b>', 'left');
				$pdf->addTextWrap(($pdf->x+POSICAO_DADOSPASSAGEM),($pdf->y),400,10,$dados->numeroVoo, 'left');
				$pdf->addTextWrap(($pdf->x),($pdf->y-=$size),400,10,'<b>Origem: </b>', 'left');
				$pdf->addTextWrap(($pdf->x+POSICAO_DADOSPASSAGEM),($pdf->y),400,10,$dados->origem, 'left');
				$pdf->addTextWrap(($pdf->x),($pdf->y-=$size),400,10,'<b>Destino: </b>', 'left');
				$pdf->addTextWrap(($pdf->x+POSICAO_DADOSPASSAGEM),($pdf->y),400,10,$dados->destino, 'left');
				$pdf->addTextWrap(($pdf->x),($pdf->y-=$size),400,10,'<b>Data e horário: </b>', 'left');
				$pdf->addTextWrap(($pdf->x+POSICAO_DADOSPASSAGEM),($pdf->y),400,10,$dados->dataHoraPassagem, 'left');
				$pdf->addTextWrap(($pdf->x),($pdf->y-=$size),400,10,'<b>Identidade do requisitante: </b>', 'left');
				$pdf->addTextWrap(($pdf->x+POSICAO_DADOSPASSAGEM),($pdf->y),400,10,$dados->identidade, 'left');

				$pdf->addText($pdf->x,($pdf->y-=$size*4),10,'Em ........ de ............................. de ............','left');
				$pdf->addText($pdf->x,($pdf->y-=$size*2),10,  '...................................................................','left');
				$pdf->addText($pdf->x,($pdf->y-=$size*8),10,'...................................................................................','left');
				$pdf->addText($pdf->x+20,($pdf->y-=$size),10,'PRÉ-REITOR DE LOGÍSTICA','left');

				$pdf->y-=$size;
				$pdf->addText($pdf->x,($pdf->y-=$size),10,'Obs.: As despesas acima correrão à conta da Categoria Econômica', 'full');

			}
		}

		$report->Execute();
	}

	function repHeader($pdf)
	{
		global $MIOLO;
		$ui = $MIOLO->GetUI();

		$h = $pdf->getFontHeight(12);
		$pdf->ezImage($ui->GetImageSrc('logonet.png'),5,50,'none','left');
	    $pdf->addText(90,800,12,'UFJF - Universidade Federal de Juiz de Fora');
		$pdf->addText(90,800-$h,12,'CGCO - Centro de Gestão do Conhecimento Organizacional');
		$pdf->addText(90,800-($h*2),12,'SIGA - Sistema Integrado de Gestão Acadêmica');
		$pdf->addText(90,800-$h-$h-$h,12,'Módulo Administrativo - Setor de Finanças');
		$pdf->addText(185,800-$h-$h-$h-$h-$h-$h,12,'REQUISIÇÃO DE TRANSPORTE AÉREO');
	    $pdf->ezSetY(800-$h-$h-$h-$h-$h-$h-$h-$h);
	}

	function setDados($idreq)
	{
		global $MIOLO;

		$objRequisicao = $MIOLO->GetBusiness('adm','requisicao',$idreq);

		$dados = new FormData();

		$dados->status = $objRequisicao->status;

		$dados->idRequisicao = $objRequisicao->idRequisicao;
		
		$itemPassagem = $objRequisicao->getItem();
		$itemPassagem->retrieveAssociation('pessoa');
		$itemPassagem->retrieveAssociation('municipioOrigem');
		$itemPassagem->retrieveAssociation('municipioDestino');
		$itemPassagem->retrieveAssociation('empresaPassagem');

		$dados->nome = $itemPassagem->pessoa->nome;
		$dados->identidade = $itemPassagem->pessoa->numrg;
		$dados->origem = $itemPassagem->municipioOrigem->municipio;
		$dados->destino = $itemPassagem->municipioDestino->municipio;
		$dados->empresa = $itemPassagem->empresaPassagem->nome;
		$dados->emailRequisitante = $itemPassagem->emailRequisitante;
		$dados->codLocalizador = $itemPassagem->codLocalizador;

		$dados->tipoTransporte = $itemPassagem->tipoTransporte;
		
		if($dados->tipoTransporte==1){ //terrestre
			$dados->tipoOnibus = $itemPassagem->classe;

			$objRequisicao->retrieveAssociation('uoRequisitante');
			$dados->nomeReq = $objRequisicao->uoRequisitante->sigla;

		}
		else{
			if($dados->tipoTransporte==2){ //aereo
				$usuarioReq = $MIOLO->getBusiness('common','usuario');
				$usuarioReq->getById($objRequisicao->idUsuarioRequisitante);
				$objPessoa = $MIOLO->getBusiness('common','pessoa',$usuarioReq->idPessoa);
				$dados->nomeUsuarioReq = $objPessoa->nome;
		
				$objRequisicao->retrieveAssociation('uoRequisitante');
				$objRequisicao->retrieveAssociation('uoExecutante');
		
				list($dados->dataRequisicao,$dados->horaRequisicao) = explode(' ',$objRequisicao->dataHora);
		
				$dados->nomeReq = $objRequisicao->uoRequisitante->nome;
				$dados->nomeExec = $objRequisicao->uoExecutante->nome;

				$dados->dataHoraPassagem = $itemPassagem->dataHoraPassagem;
				$dados->numeroVoo = $itemPassagem->bilhete;
			}
		}

		return $dados;
	}
?>
