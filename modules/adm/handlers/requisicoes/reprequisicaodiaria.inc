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
        $cf = new MCurrencyFormatter();

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

		
        // Pagina da Capa do Processo
        if ($itemDiaria->processo && !$itemDiaria->idRequisicaoOriginal)
        {            
            $report->pdf->ezSetCmMargins(8.5,2.5,3.5,2.5);
            $tipo = array('P'=>'PROCESSO','A'=>'PROTOCOLADO');
            $report->pdf->ezText($tipo[$itemDiaria->processo->tipo],12);
            $report->pdf->ezText($itemDiaria->processo->instituicao.'.'.$itemDiaria->processo->numProcessoFormatado(),24);
            
            $options['textCol'] = array(0,0,0);
            $options['shaded'] = 0;
            $options['showLines'] = 0;
            $options['fontSize'] = 12;
            $options['maxWidth'] = 480;
            $options['xPos'] = 'left';
            $options['xOrientation'] = 'right';
            $cols = array('','');
            $dataRel[] = array('INTERESSADO:',$vinculo->funcionario->pessoa->nome);
            $dataRel[] = array('','');
            $dataRel[] = array('ENTRADA SISTEMA:',$itemDiaria->processo->dataFormatada($itemDiaria->processo->dataAbertura));
            $dataRel[] = array('','');
            $dataRel[] = array('SETOR ORIGEM:',$itemDiaria->processo->setorOrigem);
            $dataRel[] = array('','');
            $dataRel[] = array('TÍTULO:',$itemDiaria->processo->titulo);
            $dataRel[] = array('','');
            $dataRel[] = array('ASSUNTO:',$itemDiaria->processo->assunto);
            $report->pdf->ezTable($dataRel,$cols,'',$options);
            $pdf->ezNewPage();        
        }
        
        // PRIMEIRA PÁGINA
		$h = $pdf->getFontHeight(12);
		$pdf->ezImage($ui->GetImageSrc('logo_ufjf.png'),5,50,'none','left');
		$pdf->addText(280,800,12,'<b>Proposta de Concessão de Diárias - Requisição '.$idreq.'</b>');
        
        if ($itemDiaria->processo)
        {
            $pdf->addText(280,800-$h,12,'Processo '.$itemDiaria->processo->instituicao.'.'.$itemDiaria->processo->numProcessoFormatado());
        }
        
        if ($itemDiaria->idRequisicaoOriginal)
        {
            $pdf->addText(280,800-2*$h,10,'Esta requisição COMPLEMENTA a Requisição '.$itemDiaria->idRequisicaoOriginal);
			$pdf->ezSetY(795-2*$h);
        }
		else
			$pdf->ezSetY(795-$h);

		$size = $pdf->getFontHeight(9);

		$yOriginal = $pdf->y;
        $pdf->x = 30;
        define('POSICAO_DADOS','100');
        
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
        $pdf->addTextWrap($pdf->x+POSICAO_DADOS,($pdf->y),400,10,'<b>BANCO: </b>'.$banco->idBanco.' - '.$banco->nome.' - <b>AG: </b>'.substr($vinculo->funcionario->pessoa->idagencia,1,4).' - <b>CC: </b>'.($vinculo->funcionario->pessoa->conta),'left');

        $pdf->line(15,$pdf->y-=$size,570,$pdf->y);
        $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),500,10,'<b>UNIDADE ORÇAMENTÁRIA: </b>'.$objRequisicao->uoRequisitante->nome,'left');
        
        $pdf->line(15,$pdf->y-=$size,570,$pdf->y);
        $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),500,10,'<b>PERIODO DA VIAGEM:</b> de '.$itemDiaria->dataSaida.' a '.$itemDiaria->dataRetorno.' ('.($k->DaysDiff($itemDiaria->dataSaida,$itemDiaria->dataRetorno)+1).' dias)','left');

        $pdf->line(15,$pdf->y-=$size,570,$pdf->y);
        $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),500,10,'<b>OBJETO DA VIAGEM (Anexar comprovante do objeto da viagem ao processo)</b>','left');
        $pdf->addTextWrap($pdf->x,($pdf->y-=$size+5),500,10,$itemDiaria->motivo,'left');

        if (!is_null($itemDiaria->justDiaNaoUtil))
        {
            $pdf->line(15,$pdf->y-=$size,570,$pdf->y);
            $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),500,10,'<b>JUSTIFICATIVA DA SAÍDA</b>','left');
            $pdf->addTextWrap($pdf->x,($pdf->y-=$size+5),500,10,$itemDiaria->justDiaNaoUtil,'left');           
        }
        
        if ($itemDiaria->passagemAerea == 'S')
            $passagemAerea = "SIM";
        else $passagemAerea = "NÃO";
        
        $pdf->line(15,$pdf->y-=$size,570,$pdf->y);       
        $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),500,10,'<b>FORMA DE TRANSPORTE UTILIZADA: </b>'.$tabelaGeral->item2,'left');
        $pdf->addTextWrap($pdf->x+350,($pdf->y),150,10,'<b>PASSAGEM AÉREA: </b>'.$passagemAerea,'right');

        $pdf->line(15,$pdf->y-=$size,570,$pdf->y);
        $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),500,10,'<b>DETALHAMENTO DAS DIÁRIAS: </b>','left');

        $pdf->addTextWrap($pdf->x,($pdf->y-=$size+5),300,10,'<b>Localidade/Estado</b>','left');
        // Em requisicoes de complementação não mostrar valor das diárias
        if (!$itemDiaria->idRequisicaoOriginal)	
        {
            $pdf->addTextWrap($pdf->x+3*POSICAO_DADOS,($pdf->y),40,10,'<b>Diárias</b>','right');
            $pdf->addTextWrap($pdf->x+3.5*POSICAO_DADOS,($pdf->y),70,10,'<b>Valor Unit.</b>','right');
            $pdf->addTextWrap($pdf->x+4.7*POSICAO_DADOS,($pdf->y),70,10,'<b>Valor Bruto</b>','right');
        }
        $pdf->line(30,$pdf->y-=$size-5,570,$pdf->y);

        $diaria = $MIOLO->getBusiness('adm','diaria');
        $municipio = $MIOLO->getBusiness('common','municipio');
        $feriado = $MIOLO->getBusiness('common','feriado');
        
        $maxDiarias = $k->DaysDiff($itemDiaria->dataSaida,$itemDiaria->dataRetorno) + 0.5;
        $totalDiarias = $objRequisicao->getTotalDiarias();
      
        $query = $objRequisicao->listLocalidadeDiarias();
        foreach ($query->result as $rs)
        {
            $i++;

            if ($itemDiaria->nacional == "S") //Diaria Nacional
            {
                $municipio->GetById2($rs[0]);
                // gambiarra pro problema dos municipios cat 5 usarem os valores do cat4
                if ($municipio->categoriaDiaria == '5')
                    $categoriaDiariaMunicipio = 4;
                else
                    $categoriaDiariaMunicipio = $municipio->categoriaDiaria;
                
                $diaria->GetById($categoriaDiariaMunicipio,$itemDiaria->categoriaFunc);
               
                $quantDiaria = explode(",",$rs[3]);
                $valorUnit = str_replace(',','.',$diaria->diaria);
                $valorTotal = ($quantDiaria[0] * str_replace(',','.',$diaria->diaria));
                
                // se a quantidade de diárias tiver meia diária
                if ($quantDiaria[1] == '5')
                {
                    $valorTotal += (str_replace(',','.',$diaria->meiaDiaria));
                }

                $pdf->addTextWrap($pdf->x,($pdf->y-=$size+5),300,10,$rs[1].' / '.$rs[2],'left');

                // Em requisicoes de complementação não mostrar valor das diárias
                if (!$itemDiaria->idRequisicaoOriginal)	
                {															
                    $pdf->addTextWrap($pdf->x+3*POSICAO_DADOS,($pdf->y),40,10,$cf->toDecimal($rs[3]),'right');
                    $pdf->addTextWrap($pdf->x+3.5*POSICAO_DADOS,($pdf->y),70,10,number_format(str_replace(',','.',$valorUnit),2,',',''),'right');
                    $pdf->addTextWrap($pdf->x+4.7*POSICAO_DADOS,($pdf->y),70,10,number_format(str_replace(',','.',$valorTotal),2,',',''),'right');
                }
            }
            else
            {
                $municipio->GetById2($rs[0]);
                $dolar = 1.9;
                // gambiarra pro problema dos municipios cat 5 usarem os valores do cat4
                if ($municipio->categoriaDiaria == '5')
                    $categoriaDiariaMunicipio = 4;
                else
                    $categoriaDiariaMunicipio = $municipio->categoriaDiaria;
                
                $diaria->GetById($categoriaDiariaMunicipio,$itemDiaria->categoriaFunc);
               
                $quantDiaria = explode(",",$rs[3]);
                $valorUnit = $cf->toDecimal($diaria->diaria);
                $valorTotal = ($quantDiaria[0] * $cf->toDecimal($diaria->diaria));

                /*
                // Diária internacional não tem meia diária
                // se a quantidade de diárias tiver meia diária
                if ($quantDiaria[1] == '5')
                {
                    $valorTotal += ($cf->toDecimal($diaria->meiaDiaria));
                }
                */

                $pdf->addTextWrap($pdf->x,($pdf->y-=$size+5),300,10,$rs[1].' / '.$rs[2],'left');
                $pdf->addTextWrap($pdf->x+3*POSICAO_DADOS,($pdf->y),40,10,$cf->toDecimal($rs[3]),'right');

                // Em requisicoes de complementação não valor das diárias
                if (!$itemDiaria->idRequisicaoOriginal)	
                {															
                    $pdf->addTextWrap($pdf->x+3.5*POSICAO_DADOS,($pdf->y),70,10,number_format(str_replace(',','.',$valorUnit*$dolar),2,',',''),'right');
                    $pdf->addTextWrap($pdf->x+4.7*POSICAO_DADOS,($pdf->y),70,10,number_format(str_replace(',','.',$valorTotal*$dolar),2,',',''),'right');
                }
            }

        }
        
        //Calculo do valor dos vales refeição   
        $dia = $itemDiaria->dataSaida;
        if ($totalDiarias == $maxDiarias)
        {       
            while ($k->DaysDiff($dia,$itemDiaria->dataRetorno) >= 0)
            {
                // Se for feriado nacional
                if (
                    (!$feriado->feriado($dia)) && 
                    ($feriado->getAbrangencia($dia) != 4) && //Feriado Nacional
                    ($feriado->getAbrangencia($dia) != 5) && //Feriado Mundial
                    (date("D",mktime(0,0,0,substr($dia,3,2),substr($dia,0,2),substr($dia,6,4))) != "Sat") &&
                    (date("D",mktime(0,0,0,substr($dia,3,2),substr($dia,0,2),substr($dia,6,4))) != "Sun")                  
                   )
                    $diasUteis++;
                    
                $dia = $k->Operation('+',$dia,'1%D');
            }
            $total -= $diasUteis * 6.55;
            $valesRefeicao = $diasUteis * 6.55;
        }
        else
        {
            // Meia diária desconta um VR inteiro
            if (!is_int($totalDiarias)) $td = $totalDiarias+0.5;
            else $td = $totalDiarias;

            $total -= $td * 6.55;                
            $valesRefeicao = $td * 6.55;
        }

		// Em requisicoes de complementação não existe vale-refeição
		if (!$itemDiaria->idRequisicaoOriginal && $itemDiaria->nacional =='S')
		{
	        $pdf->addTextWrap($pdf->x+2.2*POSICAO_DADOS,($pdf->y-=$size+5),200,10,'Vale Refeição (Dec. 2.050)','right');
        	$pdf->addTextWrap($pdf->x+4.7*POSICAO_DADOS,($pdf->y),70,10,number_format(str_replace(',','.',$valesRefeicao),2,',',''),'right');
		}

        // Adicional de taxi se não for usado só veículo da UFJF
        if (!$itemDiaria->idRequisicaoOriginal && $itemDiaria->meioTransporteDiaria != '1' && $itemDiaria->nacional =='S')
        {
            $diariasTaxi = 54.98*$i;
            $pdf->addTextWrap($pdf->x+2.2*POSICAO_DADOS,($pdf->y-=$size+5),200,10,'Adicional (Dec. 343/91 - artigo 9)','right');
            $pdf->addTextWrap($pdf->x+4.7*POSICAO_DADOS,($pdf->y),70,10,number_format(str_replace(',','.',$diariasTaxi),2,',',''),'right');
        }

        $pdf->addTextWrap($pdf->x+2.2*POSICAO_DADOS,($pdf->y-=$size+5),200,10,'<b>VALOR TOTAL: R$</b>','right');
        $pdf->addTextWrap($pdf->x+4.7*POSICAO_DADOS,($pdf->y),70,10,number_format(str_replace(',','.',$itemDiaria->valorEstimado),2,',',''),'right');

   		$pdf->line(15,$pdf->y-=$size-5,570,$pdf->y);

		if (!$itemDiaria->idRequisicaoOriginal) //Se não é uma requisiçao de complemento
        {            	
			$pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),600,10,'<b>TERMO DE COMPROMISSO</b>','left');
			$pdf->addTextWrap($pdf->x,($pdf->y-=$size),600,10,'Assumo a responsabilidade de encaminhar, em até CINCO DIAS após a data de retorno da viagem, os seguintes itens:','left');
			$pdf->addTextWrap($pdf->x,($pdf->y-=2*$size),600,10,' - Relatório de Viagem (modelo anexo), conforme determina a Portaria n.98, 16/07/2003-MPOG.','left');
			$pdf->addTextWrap($pdf->x,($pdf->y-=$size),600,10,' - As diárias recebidas em excesso, se por qualquer circunstância não puder me afastar no período solicitado,','left');
			$pdf->addTextWrap($pdf->x+11,($pdf->y-=$size),600,10,'(Decreto 343/91 artigo 8).','left');

			if ($itemDiaria->meioTransporteDiaria == '2') //Avião
			{
				$pdf->addTextWrap($pdf->x,($pdf->y-=$size),600,10,' - Bilhete de passagem aérea, sob pena de devolução integral das diárias, ficando a Universidade Federal de Juiz de Fora,','left');
				$pdf->addTextWrap($pdf->x+11,($pdf->y-=$size),600,10,'autorizada a tomar as providências necessárias ao ressarcimento através de desconto em minha conta corrente na folha','left');
				$pdf->addTextWrap($pdf->x+11,($pdf->y-=$size),600,10,'de pagamento do mês subsequente ao que se deu o fato (IN 14, de 09/11/1998 da STN).','left');
			}

			if ($totalDiarias < $maxDiarias)
			{
				$pdf->addTextWrap($pdf->x,($pdf->y-=2*$size),300,10,'<b>NÚMERO DE DIÁRIAS A MENOR</b>','left');
				$pdf->addTextWrap($pdf->x,($pdf->y-=$size),600,10,'Declaro para os devidos fins que estou ciente e concordo que irei receber um número menor de diárias do que aquele a','left');
				$pdf->addTextWrap($pdf->x,($pdf->y-=$size),600,10,'que tenho direito.','left');
			}

			$pdf->addTextWrap($pdf->x+1.5*POSICAO_DADOS,($pdf->y-=2*$size),600,10,'Juiz de Fora, '.date("d/m/Y"),'left');
			$pdf->addTextWrap($pdf->x+1.5*POSICAO_DADOS,($pdf->y-=2*$size),390,8,$vinculo->funcionario->pessoa->nome,'right');
		}
        else
		{
			// Se for uma requisição de complemento
			$pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),600,10,'<b>MOTIVO DO COMPLEMENTO DE DIÁRIA</b>','left');
			$pdf->addTextWrap($pdf->x,($pdf->y-=2*$size),600,10,' (_) Alteração da tabela do decreto 343/91 ','left');
			$pdf->addTextWrap($pdf->x,($pdf->y-=2*$size),600,10,' (_) Prorrogação de Prazo','left');
		}

        $pdf->line(15,$pdf->y-=$size,570,$pdf->y);
		//$pdf->line(15,$pdf->y-=5,570,$pdf->y);
        $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),500,10,'<b>AUTORIZAÇÃO:</b> Autorizo o débito desta despesa nesta unidade orçamentária.','left');
        //$pdf->addTextWrap($pdf->x,($pdf->y-=2*$size),600,10,'Autorizo o débito desta despesa nesta unidade orçamentária.','left');

        $pdf->addTextWrap($pdf->x,($pdf->y-=2*$size),600,10,'Juiz de Fora, '.date("d/m/Y"),'left');
        $pdf->addTextWrap($pdf->x+1.0*POSICAO_DADOS,($pdf->y-=3*$size),390,8,$pessoaProponente->nome,'center');
        $pdf->addTextWrap($pdf->x+2.5*POSICAO_DADOS,($pdf->y),390,8,$pessoaChefe->nome,'center');
        $pdf->addTextWrap($pdf->x+1.0*POSICAO_DADOS,($pdf->y-=$size),390,6,'PROPONENTE','center');
        $pdf->addTextWrap($pdf->x+2.5*POSICAO_DADOS,($pdf->y),390,6,'CHEFE DO PROPONENTE','center');

        $pdf->line(15,$pdf->y-=5,570,$pdf->y);
        $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),500,10,'<b>CONCESSÃO</b>: Concedo e autorizo o pagamento desta despesa.','left');
        //$pdf->addTextWrap($pdf->x,($pdf->y-=2*$size),600,10,'Concedo e autorizo o pagamento desta despesa.','left');

        $pdf->addTextWrap($pdf->x+0.8*POSICAO_DADOS,($pdf->y-=4*$size),600,10,'Juiz de Fora, _____ de _________________ de _____','left');
        $pdf->addTextWrap($pdf->x+3.5*POSICAO_DADOS,($pdf->y),600,8,'Jucilene Melandre Silva - Ordenadora de Despesas','left');

        $pdf->line(15,$pdf->y-=5,570,$pdf->y);
        $pdf->addTextWrap($pdf->x-15,($pdf->y-=$size),600,10,'<b>PAGAMENTO</b>: Informamos que a(s) presente(s) diária(s) foi(ram) paga(s) através da Ordem Bancária n. ______','left');
        //$pdf->addTextWrap($pdf->x,($pdf->y-=2*$size),600,10,'Informamos que a(s) presente(s) diária(s) foi(ram) paga(s) através da Ordem Bancária n. ______','left');

        $pdf->addTextWrap($pdf->x+0.8*POSICAO_DADOS,($pdf->y-=4*$size),600,10,'Juiz de Fora, _____ de _________________ de _____','left');
        $pdf->addTextWrap($pdf->x+3.5*POSICAO_DADOS,($pdf->y),600,8,'Célio Martins de Freitas - Ger. Exec. Financeira','left');
        $pdf->line(15,$pdf->y-=5,570,$pdf->y);
        
		
		// TERCEIRA PÁGINA
        if (!$itemDiaria->idRequisicaoOriginal)
		{
			$pdf->ezNewPage();
			
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
			$pdf->addTextWrap($pdf->x+POSICAO_DADOS,($pdf->y),400,10,'<b>BANCO: </b>'.$banco->idBanco.' - '.$banco->nome.' - <b>AG: </b>'.substr($vinculo->funcionario->pessoa->idagencia,1,4).' - <b>CC: </b>'.($vinculo->funcionario->pessoa->conta),'left');

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
		}
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
