<?php
class gridUoVeiculoAbastecimento extends MObjectGrid
{
    protected $objUoVeiculo;
    function __construct($objUo)
    {
        global $MIOLO, $page,$item;
        $this->objUoVeiculo = $objUo;
	$cf = new MCurrencyFormatter();
        //-----------------------------------------------------------------------------------
        $objRequisicao = $MIOLO->GetBusiness('adm','requisicao');
        $uo = $MIOLO->GetBusiness('adm','uo');
        $objTipoReq = $MIOLO->GetBusiness('adm','tiporeq');
        $objTipoReq->GetById((int)$item);
        $uoRequisitante = $uo->listByUsuarioTipoReqVei($idUsuario,$objTipoReq->idTipoReq);
        $cont = count($uoRequisitante->result);
        
        for($i = 0;$i < $cont;$i++){
           $idUo =  $uoRequisitante->result[$i][0];
           $tam++;
           if($tam == $cont)
           $lista_iduo .= $idUo;
           else
               $lista_iduo .= $idUo . ",";
        }
        //-----------------------------------------------------------------------------------
        $this->setTitle('Resultados encontrados-');
        //$href = $MIOLO->getActionURL('adm','main:uoveiculo',$this->objUoVeiculo->idUo,array('form'=>'saidamaterial','idRequisicao'=>'#0#'));
        $columns = array(
			new MDataGridControl($linkRequisicao,'requisicao','Número','center','10%'),
			new MDataGridColumn('datahorareq','Data/Hora','center',false,'25%'),
			new MDataGridColumn('login','Login','center',false,'20%'),
			new MDataGridColumn('siglasetor','Setor','center',false,'20%'),
			new MDataGridColumn('item2','Status','center',false,'25%)%'),
			//new MDataGridColumn('descricao','Origem','center',false,'20%'),
		);
        $this->setFilter(false);
        $idRequisicao = Form::getFormValue('idRequisicao');
        $requisitante = Form::getFormValue('requisitante');
        $requisicoes = $this->objUoVeiculo->listReqVeiculoFinalizadasAbastecimento($requisicao,$lista_iduo);
        $cf = new MCurrencyFormatter();
        
        $href_grid = $MIOLO->getActionURL('adm','main:uoalmoxarifado',$this->uoalmoxarifado->idUo,array('form'=>'saidamaterial'));
        parent::__construct($requisicoes, $columns, $href_grid,25);
        $this->SetLinkType('hyperlink');
        $this->with = '100%';
        //$href = $this->manager->GetActionURL('adm','main:empenho:new','', array('idEmpenho'=>'$id') );
    }
}
