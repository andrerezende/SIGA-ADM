<?
    /**
     * Adm Module - Report Requisicao Hospedagem Handler
     * Handler reprequisicaohospedagem do módulo de Administração 
     * @package br.org.miolo.ufjf.adm
     */
    
    /**
     * Permissões necessárias
     *    Adm
     */

	if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
   
    if( ($idreq = Form::GetFormValue('req')) )
	{	
		global $MIOLO;
        
        $k = new MKrono();
	    $dados = setDados($idreq);
		$objRequisicao = $MIOLO->GetBusiness('adm','requisicao',$idreq);
		$objRequisicao->retrieveAssociation('uoRequisitante');
        $objRequisicao->retrieveAssociation('usuarioGestor');
        
        $itemDiaria = $objRequisicao->getItem();
        $itemDiaria->retrieveAssociation('processo');

        $vinculo = $this->manager->getBusiness('rh','vinculo',$itemDiaria->idVinculo);
        $funcaoAtual = $this->manager->getBusiness('rh','funcaoatual',$itemDiaria->idVinculo);

        // A função atual prevalece, se existir. Exceto para os NS com função atual FG. Prevalece o maior (NS)
        if (!$funcaoAtual->funcao || substr($funcaoAtual->funcao,0,2) == 'FG')
        {
            $vinculo->getProvimentos();
            $provimento = $vinculo->getProvimentoAtual();
            $provimento->getCargo();
            
            if ((substr($funcaoAtual->funcao,0,2) == 'FG' && $provimento->cargo->escolaridadeMinima == 'NS') || (substr($funcaoAtual->funcao,0,2) != 'FG'))
                $funcaoAtual->funcao = $provimento->cargo->escolaridadeMinima;
        }

        $tabelaGeral = $this->manager->getBusiness('common','tabelageral');
        $tabelaGeral->GetByItem('AD_CATEGORIAFUNC',$funcaoAtual->funcao);
        $funcao = $tabelaGeral->item2;

        $vinculo->getProvimentos();
        $provimento = $vinculo->getProvimentoAtual();
        $provimento->getCargo();
        
        //var_dump($provimento->cargo->descricao);
        //var_dump($tabelaGeral->item2);
        $vinculoProp = $this->manager->getBusiness('rh','vinculo',$itemDiaria->idVinculoProp);        
        $funcionarioProponente = $this->manager->getBusiness('rh','funcionario',$vinculoProp->idFuncionario);
        $pessoaProponente  = $this->manager->getBusiness('common','pessoa',$funcionarioProponente->idPessoa);        

        $vinculoChefe = $this->manager->getBusiness('rh','vinculo',$itemDiaria->idVinculoChefe);        
        $funcionarioChefe = $this->manager->getBusiness('rh','funcionario',$vinculoChefe->idFuncionario);
        $pessoaChefe  = $this->manager->getBusiness('common','pessoa',$funcionarioChefe->idPessoa);        

        $vinculo->retrieveAssociation('funcionario');
        $banco = $this->manager->getBusiness('common','banco',$vinculo->funcionario->pessoa->idbanco);
               
		$tabelaGeral = $MIOLO->GetBusiness('common','tabelageral');
        $tabelaGeral->GetByItem('AD_MEIOTRANSPORTEDIARIA',$itemDiaria->meioTransporteDiaria);

		$report = new ezPDFReport('2');
		$pdf = $report->GetPdf(); 
		$ui = $MIOLO->GetUI();
        
        // PRIMEIRA PÁGINA
		$h = $pdf->getFontHeight(12);
	    $pdf->ezSetY(795-$h);

		$size = $pdf->getFontHeight(9);

		$yOriginal = $pdf->y;
        $pdf->x = 30;
        define('POSICAO_DADOS','100');
        
        // PRIMEIRA PÁGINA
		$ui = $MIOLO->GetUI();
		$h = $pdf->getFontHeight(12);

		$pdf->ezImage($ui->GetImageSrc('logo_ufjf.png'),5,50,'none','left');
		$pdf->addText(240,800,12,'<b>Relatório de Viagem Relativo à Proposta - Requisição '.$idreq.'</b>');
        
        if ($itemDiaria->processo)
        {
            $pdf->addText(240,800-$h,12,'Processo '.$itemDiaria->processo->instituicao.'.'.$itemDiaria->processo->numProcessoFormatado());
        }
        
		$pdf->addText(240,800-2*$h,10,'Deverá ser preenchido pelo PROPONENTE e PROPOSTO e encaminhado');
		$pdf->addText(240,800-3*$h,10,'à PROFIC em até CINCO DIAS ÚTEIS após a data de retorno da viagem.');
	    $pdf->ezSetY(795-3*$h);

        $pdf->line(15,$pdf->y,570,$pdf->y);
		$pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),400,10,'<b>PROPONENTE: SIAPE:</b>'.$itemDiaria->idVinculoProp.'<b> NOME: </b>'.$pessoaProponente->nome,'left');
		//$pdf->addTextWrap($pdf->x,($pdf->y-=$size),400,10,'<b>SIAPE: </b>'.$itemDiaria->idVinculoProp,'left');
        //$pdf->addTextWrap(($pdf->x+POSICAO_DADOS-20),($pdf->y),400,10,'<b>NOME: </b>'.$pessoaProponente->nome,'left');
        $pdf->line(15,$pdf->y-=$size,570,$pdf->y);
        
		$pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),400,10,'<b>CHEFE DO PROPONENTE: SIAPE:</b>'.$itemDiaria->idVinculoChefe.'<b> NOME: </b>'.$pessoaChefe->nome,'left');
        $pdf->line(15,$pdf->y-=$size,570,$pdf->y);

        $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),400,10,'<b>PROPOSTO (Beneficiário)</b>','left');
		$pdf->addTextWrap($pdf->x,($pdf->y-=$size),400,10,'<b>SIAPE:</b>'.$itemDiaria->idVinculo,'left');
        $pdf->addTextWrap(($pdf->x+POSICAO_DADOS-20),($pdf->y),500,10,'<b>NOME: </b>'.$vinculo->funcionario->pessoa->nome.' - <b>CARGO: </b>'.$provimento->cargo->descricao,'left');

		$pdf->addTextWrap($pdf->x,($pdf->y-=$size),500,10,'<b>EMAIL: </b> '.$vinculo->funcionario->pessoa->email.' - <b>TELEFONES: </b>'.$vinculo->funcionario->pessoa->telefone.' / '.$vinculo->funcionario->pessoa->celular.' - <b>FUNÇÃO: </b>'.$funcao,'left');
        $pdf->addTextWrap($pdf->x,($pdf->y-=$size),400,10,'<b>CPF: </b>'.substr($vinculo->funcionario->pessoa->cpf,0,3).".".substr($vinculo->funcionario->pessoa->cpf,3,3).".".substr($vinculo->funcionario->pessoa->cpf,6,3)."-".substr($vinculo->funcionario->pessoa->cpf,9,2));
        $pdf->addTextWrap($pdf->x+POSICAO_DADOS,($pdf->y),400,10,'<b>BANCO: </b>'.$banco->idBanco.' - '.$banco->nome.' - <b>AGENCIA: </b>'.substr($vinculo->funcionario->pessoa->idagencia,1,4).' - <b>CONTA: </b>'.(0+$vinculo->funcionario->pessoa->conta),'left');

/*
        $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),400,10,'<b>PROPONENTE</b>','left');
		$pdf->addTextWrap($pdf->x,($pdf->y-=$size),400,10,'<b>SIAPE: </b>'.$itemDiaria->idVinculoProp,'left');
        $pdf->addTextWrap(($pdf->x+POSICAO_DADOS),($pdf->y),400,10,'<b>NOME: </b>'.$pessoaProponente->nome,'left');

        $pdf->line(15,$pdf->y-=$size,570,$pdf->y);

        $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),400,10,'<b>PROPOSTO (Beneficiário)</b>','left');
		$pdf->addTextWrap($pdf->x,($pdf->y-=$size),400,10,'<b>SIAPE:</b>'.$itemDiaria->idVinculo,'left');
        $pdf->addTextWrap(($pdf->x+POSICAO_DADOS),($pdf->y),400,10,'<b>NOME: </b>'.$vinculo->funcionario->pessoa->nome,'left');
		$pdf->addTextWrap($pdf->x,($pdf->y-=$size),400,10,'<b>EMAIL: </b> '.$vinculo->funcionario->pessoa->email.' - <b>TELEFONES: </b>'.$vinculo->funcionario->pessoa->telefone.' / '.$vinculo->funcionario->pessoa->celular,'left');
*/
        $pdf->line(15,$pdf->y-=$size,570,$pdf->y);
        $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),500,10,'<b>UNIDADE ORÇAMENTÁRIA: </b>'.$objRequisicao->uoRequisitante->nome,'left');
        
        $pdf->line(15,$pdf->y-=$size,570,$pdf->y);
        $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),500,10,'<b>PERIODO DA VIAGEM: de         /        /          a          /        /        </b> ','left');
        $pdf->line(15,$pdf->y-=$size,570,$pdf->y);
        $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),500,10,'<b>OBJETO DA VIAGEM</b>','left');
        $pdf->addTextWrap($pdf->x,($pdf->y-=$size+5),500,10,$itemDiaria->motivo,'left');

        $pdf->line(15,$pdf->y-=$size,570,$pdf->y);
        $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),500,10,'<b>LOCALIDADES VISITADAS</b>','left');

        $pdf->addTextWrap($pdf->x,($pdf->y-=$size+5),100,10,'<b>Localidade/Estado</b>','left');
        $pdf->addTextWrap($pdf->x+2.5*POSICAO_DADOS,($pdf->y),200,10,'<b>Período da estadia na localidade</b>','left');
        $pdf->addTextWrap($pdf->x+4.6*POSICAO_DADOS,($pdf->y),200,10,'<b>Número de dias</b>','left');
        
        for ($i=0;$i<6;$i++)
        {
            $pdf->line(30,$pdf->y-=$size-5,570,$pdf->y);
            $pdf->addTextWrap($pdf->x+2.4*POSICAO_DADOS,($pdf->y-=$size),300,10,'<b>de          /           /           a          /           /</b>','left');
       	}

        $pdf->line(15,$pdf->y-=$size,570,$pdf->y);
        $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),500,10,'<b>RELATO SUCINTO DA VIAGEM</b>','left');
        
        $pdf->line(15,$pdf->y-=18*$size,570,$pdf->y);
        $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),500,10,'<b>COMPROMISSOS</b>','left');
        
        $pdf->addTextWrap($pdf->x,($pdf->y-=2*$size),300,10,'<b>DEVOLUÇÃO PARCIAL OU TOTAL DE DIÁRIAS EM EXCESSO</b>','left');
        $pdf->addTextWrap($pdf->x,($pdf->y-=$size),600,10,'Assumo a responsabilidade de devolver em, até CINCO DIAS ÚTEIS após a data de retorno da viagem, o valor das diárias','left');
        $pdf->addTextWrap($pdf->x,($pdf->y-=$size),600,10,'recebidas em excesso, conforme cálculo a ser efetuado pela PROFIC e informado ao beneficiário das diárias.','left');
        $pdf->addTextWrap($pdf->x,($pdf->y-=$size),600,10,'(Decreto 343/91 artigo 8)','left');

        $pdf->addTextWrap($pdf->x,($pdf->y-=2*$size),300,10,'<b>BILHETE DE PASSAGEM AÉREA</b>','left');
        $pdf->addTextWrap($pdf->x,($pdf->y-=$size),600,10,'Anexar a este relatório os bilhetes de passagem aérea, sob pena de devolução integral das diárias concedidas, ficando a','left');
        $pdf->addTextWrap($pdf->x,($pdf->y-=$size),600,10,'Universidade Federal de Juiz de Fora, autorizada a tomar as providências necessárias ao ressarcimento através de','left');
        $pdf->addTextWrap($pdf->x,($pdf->y-=$size),600,10,'desconto em minha conta corrente na folha de pagamento do mês subsequente ao que se deu o fato.','left');
        $pdf->addTextWrap($pdf->x,($pdf->y-=$size),600,10,'(IN 14, de 09/11/1998 da STN).','left');
        
        $pdf->addTextWrap($pdf->x+0.5*POSICAO_DADOS,($pdf->y-=2*$size),600,10,'Juiz de Fora, ________/________/________','left');
        $pdf->addTextWrap($pdf->x+1.5*POSICAO_DADOS,($pdf->y-=$size),390,10,$vinculo->funcionario->pessoa->nome,'right');
        
        /*
        $pdf->line(15,$pdf->y-=$size,570,$pdf->y);
        $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),500,10,'<b>BALANÇO DO PAGAMENTO DAS DIÁRIAS (a ser preenchido pela PROFIC)</b>','left');

        $pdf->addTextWrap($pdf->x,($pdf->y-=$size+5),100,10,'Valor recebido    R$','left');
        $pdf->addTextWrap($pdf->x+3*POSICAO_DADOS,($pdf->y),200,10,'Número de dias da viagem','left');
        $pdf->line(30,$pdf->y-=$size-5,570,$pdf->y);

        $pdf->addTextWrap($pdf->x,($pdf->y-=$size+5),100,10,'Valor a restituir   R$','left');
        $pdf->addTextWrap($pdf->x+3*POSICAO_DADOS,($pdf->y),200,10,'Número de dias recebidos','left');
        $pdf->line(30,$pdf->y-=$size-5,570,$pdf->y);
        
        $pdf->addTextWrap($pdf->x+0.5*POSICAO_DADOS,($pdf->y-=2*$size),600,10,'Juiz de Fora, ________/________/________','left');
        $pdf->addTextWrap($pdf->x+2*POSICAO_DADOS,($pdf->y-=$size),340,10,'ELIZABETH DUARTE RODRIGUES','right');
        */
        $pdf->line(15,$pdf->y-=$size,570,$pdf->y);
        $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),550,10,'* PROFIC - CEP 36036-900 - Juiz de Fora - MG    Telefone (32) 3229-3951    Fax (32) 3229-3956','center');

		$report->Execute();
	}

	function repHeader($pdf,$idreq)
	{
		global $MIOLO;
		$ui = $MIOLO->GetUI();

		$h = $pdf->getFontHeight(12);
		$pdf->ezImage($ui->GetImageSrc('logo_ufjf.png'),5,50,'none','left');
		$pdf->addText(280,800,12,'<b>Proposta de Concessão de Diárias - Requisição '.$idreq.'</b>');
		$pdf->addText(280,800-$h,10,'Esta requisição COMPLEMENTA a Requisição XXX');
	    $pdf->ezSetY(795-$h);
	}

	function setDados($idreq)
	{
		global $MIOLO;

		$objRequisicao = $MIOLO->GetBusiness('adm','requisicao',$idreq);

		$dados = new FormData();

		$usuarioReq = $MIOLO->getBusiness('common','usuario');
        $usuarioReq->getById($objRequisicao->idUsuarioRequisitante);
		$objPessoa = $MIOLO->getBusiness('common','pessoa',$usuarioReq->idPessoa);
		$dados->nomeUsuarioReq = $objPessoa->nome;
		
		$dados->idRequisicao = $objRequisicao->idRequisicao;
		
		$objRequisicao->retrieveAssociation('uoRequisitante');
		$objRequisicao->retrieveAssociation('uoExecutante');
		
		list($dados->dataRequisicao,$dados->horaRequisicao) = explode(' ',$objRequisicao->dataHora);
		
		$dados->nomeReq = $objRequisicao->uoRequisitante->nome;
		$dados->nomeExec = $objRequisicao->uoExecutante->nome;

        $itemDiaria = $objRequisicao->getItem();
		//$itemDiaria->retrieveAssociation('pessoa');
	//	$itemDiaria->retrieveAssociation('hotel');

		$dados->nome = $itemDiaria->pessoa->nome;
        $dados->hotel = $itemDiaria->hotel->nome;
		
		$dados->datainicio = $itemDiaria->dataHoraEntPrev;
		$dados->datafim = $itemDiaria->dataHoraSaidaPrev;
		return $dados;
	}
?>
