<?php
ini_set('display_errors', 1);

require_once 'Conexao.php';

class DAOMovimentacao {
    
    protected $db;
    
    function __construct() {
        $this->db = Conexao::getInstance()->getDB();
    }
    
    /**
     * Quando o objeto for destruído, ele acessará o singleton Conexão para usset as variáveis do bd
     */
    function __destruct() {
        Conexao::getInstance()->disconnect();
    }
    
    public function getMovimentacaoBy($idNotaFiscal, $idSubElemento, $idUO, $dataInicio, $dataFim) {
                
        $sql = "
            SELECT ad_movimento.*, ad_subelemento.descricao, ad_subelemento.idsubelemento,
            ad_material.descricao as descricao_mat,
            ad_notafiscal.notafiscal,
            ad_notafiscal.cnpj,
            ad_empenhado.idempenhado ";
        
        $sql .= " 
            FROM ad_movimento ";
        
        $sql .= " 
            INNER JOIN ad_material ON ad_movimento.idmaterial = ad_material.idmaterial 
            INNER JOIN ad_subelemento ON ad_material.idelemento = ad_subelemento.idelemento 
                AND ad_material.idsubelemento = ad_subelemento.idsubelemento 
                
            LEFT JOIN ad_itemnota ON (ad_movimento.iditemnota = ad_itemnota.iditemnota) 
            LEFT JOIN ad_notafiscal ON (ad_itemnota.idnotafiscal = ad_notafiscal.idnotafiscal) 
            LEFT JOIN ad_empenhado ON (ad_itemnota.idempenhado = ad_empenhado.idempenhado) ";
        
        if($idNotaFiscal || $idSubElemento || $idUO || $dataInicio || $dataFim) {
            
            $sql .= "WHERE true ";
            
            if($idNotaFiscal) $sql .= " AND cast(ad_notafiscal.idnotafiscal as text) = '$idNotaFiscal' ";            
            if($idSubElemento) $sql .= " AND cast(ad_subelemento.idsubelemento as text) = '$idSubElemento' ";            
            if($idUO) $sql .= " AND cast(ad_movimento.iduoalmox as text) = '$idUO'";
            
            $dataRange = '';
            if($dataInicio && !$dataFim) {
                $dataRange = " AND ad_movimento.datamov >= '$dataInicio'";
            } else
                if(!$dataInicio && $dataFim) {
                    $dataRange = " AND ad_movimento.datamov <= '$dataFim'";
                } else
                    if($dataInicio && $dataFim) {
                        $dataRange = " AND (ad_movimento.datamov >= '$dataInicio' AND ad_movimento.datamov <= '$dataFim')";
                    }
            $sql .= $dataRange;
        }
        
        //var_dump($sql);exit;
        
        //if($orderby) 
          //  $sql .= " ORDER BY $orderby ASC";
        
        try {    
            $consulta = $this->db->query($sql);        
            $rows = $consulta->fetchAll(PDO::FETCH_ASSOC);
        
        } catch (PDOException $e) {
            $e->getMessage();
        }
        
        //print_r($rows);exit;
        return $rows;
    }
    
    public function getNotaFiscal_ad_movimento($notaFiscal, $idUO, $dataInicio, $dataFim) {
        $sql = "
            SELECT 
                ad_movimento.*, ad_subelemento.descricao as descricao_mat, ad_subelemento.idsubelemento
            FROM ad_movimento 
                INNER JOIN ad_material ON ad_movimento.idmaterial = ad_material.idmaterial 
                INNER JOIN ad_subelemento ON ad_material.idelemento = ad_subelemento.idelemento 
                    AND ad_material.idsubelemento = ad_subelemento.idsubelemento                 
            ";
        
        if($notaFiscal || $idUO || $dataInicio || $dataFim) {
            
            $sql .= "WHERE true ";
            
            if($notaFiscal) $sql .= " AND notafiscal = '$notaFiscal' ";  
            if($idUO) $sql .= " AND cast(ad_movimento.iduoalmox as text) = '$idUO'";
            
            $dataRange = '';
            if($dataInicio && !$dataFim) {
                $dataRange = " AND ad_movimento.datamov >= '$dataInicio'";
            } else
                if(!$dataInicio && $dataFim) {
                    $dataRange = " AND ad_movimento.datamov <= '$dataFim'";
                } else
                    if($dataInicio && $dataFim) {
                        $dataRange = " AND (ad_movimento.datamov >= '$dataInicio' AND ad_movimento.datamov <= '$dataFim')";
                    }
            $sql .= $dataRange;
        }
        
        $sql .= "ORDER BY descricao_mat, datamov";
        
        try {    
            $consulta = $this->db->query($sql);        
            $rows = $consulta->fetchAll(PDO::FETCH_ASSOC);
        
        } catch (PDOException $e) {
            $e->getMessage();
        }
        
        //print_r($rows);exit;
        return $rows;
    }
    
    


    
}