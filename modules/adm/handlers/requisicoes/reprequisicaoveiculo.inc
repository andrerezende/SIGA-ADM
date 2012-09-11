<?
    /**
     * Adm Module - Report Requisicao Veiculo Handler
     * Handler reprequisicaoveiculo do módulo de Administração 
     * @package br.org.miolo.ufjf.adm
     */
    
    /**
     * Permissões necessárias
     *    Adm
     */

    if($perms->CheckAccess('adm',A_ACCESS,true))
    $theme->ClearContent();
    
  //TAKA  
	/*if( ($idreq = Form::GetFormValue('req')) )
        {        
                $dados = setDados($idreq);

                global $MIOLO;
            $report = new MJasperReport('sigaept');
                $parameters['SUBREPORT_DIR']         =
		$MIOLO->GetConf('home.modules');
                $parameters['pURL']                          =
		$MIOLO->GetConf('home.url');
                $parameters['pIdUsuario']                   =
		$MIOLO->login->idkey;
                $parameters['pIdReq']                        = $idreq;
                $report->Execute('adm', 'RelVeiculo', $parameters);        
        }*/
    if( ($idreq = Form::GetFormValue('req')) )
	{	
		$dados = setDados($idreq);
                
		global $MIOLO;
	    $report = new MJasperReport('sigaept');
		$parameters['SUBREPORT_DIR'] = $MIOLO->GetConf('home.modules');
		$parameters['pURL']          = $MIOLO->GetConf('home.url'); //'http://siga.cefetsp.br';
		$parameters['int_pIdUsuario']    = $MIOLO->login->idkey;
		$parameters['int_pIdReq']        = $idreq;
		$report->Execute('adm', 'RelVeiculo', $parameters);	
		
	}
//TAKA
	function repHeader($pdf)
	{
		global $MIOLO;
		$ui = $MIOLO->GetUI();

		$h = $pdf->getFontHeight(12);
		$pdf->ezImage($ui->GetImageSrc('logonet.png'),5,50,'none','left');
	    $pdf->addText(90,800,12,'UFJF - Universidade Federal de Juiz de Fora');
		$pdf->addText(90,800-$h,12,'CGCO - Centro de Gestão do Conhecimento Organizacional');
		$pdf->addText(90,800-($h*2),12,'SIGA - Sistema Integrado de Gestão Acadêmica');
		$pdf->addText(90,800-$h-$h-$h,12,'Módulo Administrativo - Setor de Transportes');
		$pdf->addText(185,800-$h-$h-$h-$h-$h-$h,12,'REQUISIÇÃO DE VEÍCULO');
	    $pdf->ezSetY(800-$h-$h-$h-$h-$h-$h-$h-$h);
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

       	$tabelaGeral = $MIOLO->getBusiness('common','tabelageral');
	   	$status = $tabelaGeral->GetByItem('AD_ALMOXSTATUSREQ',$objRequisicao->status);
				
		$dados->idRequisicao = $objRequisicao->idRequisicao;
		$dados->status = $status->item2;
		
		$objRequisicao->retrieveAssociation('uoRequisitante');
		$objRequisicao->retrieveAssociation('uoExecutante');
		
		list($dados->dataRequisicao,$dados->horaRequisicao) = explode(' ',$objRequisicao->dataHora);
		
		$dados->nomeReq = $objRequisicao->uoRequisitante->nome;
		$dados->nomeExec = $objRequisicao->uoExecutante->nome;

		
		$itemVeiculo = $objRequisicao->getItem();
		$itemVeiculo->retrieveAssociation('pessoa');
    	$itemVeiculo->retrieveAssociation('veiculo');

 		$municipio = $MIOLO->getBusiness('common','municipio');
	    $municipio = $municipio->GetById2($itemVeiculo->pessoa->idmunicipio);
       
 		$municipioOrigem = $MIOLO->getBusiness('common','municipio');
	    $municipioOrigem = $municipioOrigem->GetById2($itemVeiculo->idMunicipioOrig);

  		$municipioDestino = $MIOLO->getBusiness('common','municipio');
	    $municipioDestino = $municipioDestino->GetById2($itemVeiculo->idMunicipioDest);

		$dados->nome = $itemVeiculo->pessoa->nome;
		$dados->cpf = $itemVeiculo->pessoa->cpf;
		$dados->telefone = $itemVeiculo->pessoa->telefone;
		$dados->endereco = $itemVeiculo->pessoa->endereco;
		$dados->bairro = $itemVeiculo->pessoa->bairro;        
		$dados->cep = $itemVeiculo->pessoa->cep;
		$dados->municipio = $municipio->municipio;
        $dados->estado = $municipio->iduf;
		
        $objTabGeral = $MIOLO->getBusiness('common','tabelageral');
	   	$objTabGeral = $objTabGeral->GetByItem('AD_TIPOCARGA',$itemVeiculo->tipoTransporte);
        $dados->tipoTransporte = $objTabGeral->item2;
        
        $objVeiculo = $MIOLO->getBusiness('adm','tipoveiculo');
        $objVeiculo->getById($itemVeiculo->tipoVeiculo);
        $dados->tipoVeiculo = $objVeiculo->descricao;
		
        $dados->enderecoOrig = $itemVeiculo->enderecoOrig;
		$dados->bairroOrig = $itemVeiculo->bairroOrig;
        $dados->municipioOrig = $municipioOrigem->municipio;
        $dados->estadoOrig = $municipioOrigem->iduf;
		$dados->cepOrig = $itemVeiculo->cepOrig;
		$dados->referenciaOrig = $itemVeiculo->referenciaOrig;
        $dados->dataSaidaOrig = substr($itemVeiculo->dataHoraSaidaOrig,0,10);
        $dados->horaSaidaOrig = substr($itemVeiculo->dataHoraSaidaOrig,11,5);     
		$dados->enderecoDest = $itemVeiculo->enderecoDest;
		$dados->bairroDest = $itemVeiculo->bairroDest;
        $dados->municipioDest = $municipioDestino->municipio;
        $dados->estadoDest = $municipioDestino->iduf;
		$dados->cepDest = $itemVeiculo->cepDest;
		$dados->referenciaDest = $itemVeiculo->referenciaDest;
		$dados->prevDataChegDest = substr($itemVeiculo->prevDataHoraChegDest,0,10);
        $dados->prevHoraChegDest = substr($itemVeiculo->prevDataHoraChegDest,11,5);
		$dados->justificativa = $itemVeiculo->justificativa;
        $dados->outrosPassageiros = $itemVeiculo->outrosPassageiros;
		$dados->quilometragemEst = $itemVeiculo->quilometragemEst;
		$dados->valorEstimado = number_format(str_replace(',','.',$itemVeiculo->valorEstimado),2,',','.');
        $dados->motorista = $itemVeiculo->motorista->pessoa->nome;
        $dados->veiculo = $itemVeiculo->veiculo->modelo;
        $dados->placa = $itemVeiculo->placa;
		$dados->prevDataRetorno = substr($itemVeiculo->prevDataHoraRetorno,0,10);
        $dados->prevHoraRetorno = substr($itemVeiculo->prevDataHoraRetorno,11,5);

		return $dados;
	}
?>
