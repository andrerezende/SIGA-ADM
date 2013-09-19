<?php
ini_set('display_errors', 1);

require_once 'UtilitariosSiga.php';
require_once '../../model/DAO/DAOAlmoxerifado.php';

class Almoxerifado {
    
    // RMA SubElemento Consolidado acumulado por preço
    public static function RMASubElementoConsolidadoAcumuladoPorValorTotal($IdUoAlmoxerifado, $mes, $ano, $notaFiscal = null) {
        $DAOAlmoxerifado = new DAOAlmoxerifado();
        $rows = $DAOAlmoxerifado->RMASubElementoConsolidadoAcumuladoPorValorTotal($IdUoAlmoxerifado, $mes, $ano, $notaFiscal);        
        unset($DAOAlmoxerifado);
        
        Almoxerifado::addContaContabil($rows);
        Almoxerifado::addSaldoAtual($rows);
        
        return $rows;
    }
    
    // RMA SubElemento Consolidado acumulado por quantidade
    public static function RMASubElementoConsolidadoAcumuladoPorQuantidade($IdUoAlmoxerifado, $mes, $ano) {
        
        $DAOAlmoxerifado = new DAOAlmoxerifado();
        $rows = $DAOAlmoxerifado->RMASubElementoConsolidadoAcumuladoPorQuantidade($IdUoAlmoxerifado, $mes, $ano);        
        unset($DAOAlmoxerifado);
        
        Almoxerifado::addContaContabil($rows);
        Almoxerifado::addSaldoAtual($rows);
        
        return $rows;
    }
    
    // 22-12-2011
    // RMA Material Consolidado acumulado por preço
    public static function RMAMaterialConsolidadoAcumuladoPorValorTotal($IdUoAlmoxerifado, $mes, $ano, $notaFiscal = null) {
        $DAOAlmoxerifado = new DAOAlmoxerifado();
        $rows = $DAOAlmoxerifado->RMAMaterialConsolidadoAcumuladoPorValorTotal($IdUoAlmoxerifado, $mes, $ano, $notaFiscal);        
        unset($DAOAlmoxerifado);
        
        Almoxerifado::addSaldoAtual($rows);
        
        return $rows;
    }    
    
    // 22-12-2011
    // RMA Material Consolidado acumulado por quantidade
    public static function RMAMaterialConsolidadoAcumuladoPorQuantidade($IdUoAlmoxerifado, $mes, $ano, $notaFiscal = null) {
        
        $DAOAlmoxerifado = new DAOAlmoxerifado();
        $rows = $DAOAlmoxerifado->RMAMaterialConsolidadoAcumuladoPorQuantidade($IdUoAlmoxerifado, $mes, $ano, $notaFiscal);        
        unset($DAOAlmoxerifado);
        
        Almoxerifado::addSaldoAtual($rows);
        
        return $rows;
    }
    
    private static function addContaContabil(&$rows) {
        for($i=0; $i<count($rows); $i++) {
            
            // conta contabil
            $rows[$i]['idsubelemento'] = "11.318.01.00.".$rows[$i]['idsubelemento'];            
            
        }
    }
    
    private static function addSaldoAtual(&$rows) {
        for($i=0; $i<count($rows); $i++) {
            
            // saldo atual: saldo_anterior + entrada - saida
            $rows[$i]['saldo_atual'] = (($rows[$i]['saldo_anterior'] + $rows[$i]['entrada'] + $rows[$i]['entrada_extra']) - $rows[$i]['saida']);
        }
    }
    
}