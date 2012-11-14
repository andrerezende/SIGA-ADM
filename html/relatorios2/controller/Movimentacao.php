<?php
//ini_set('display_errors', 1);

require_once 'UtilitariosSiga.php';
require_once '../../model/DAO/DAOMovimentacao.php';

class Movimentacao {
    
    // Relatório de Movimentação por Subelemento
    public static function MovimentacaoPorSubelemento($idNotaFiscal, $idSubElemento, $idUO, $dataInicio, $dataFim) {
        
        $DAOMovimentacao = new DAOMovimentacao();  
        $rows = $DAOMovimentacao->getMovimentacaoBy($idNotaFiscal, $idSubElemento, $idUO, $dataInicio, $dataFim);
        
        return $rows;
    }
    
    // Relatório de Movimentação por NotaFiscal em ad_movimento
    public static function MovimentacaoPorNotaFiscal($notaFiscal, $idUO, $dataInicio, $dataFim) {
        
        $DAOMovimentacao = new DAOMovimentacao();  
        $rows = $DAOMovimentacao->getNotaFiscal_ad_movimento($notaFiscal, $idUO, $dataInicio, $dataFim);
        
        return $rows;
    }
        
}

?>
