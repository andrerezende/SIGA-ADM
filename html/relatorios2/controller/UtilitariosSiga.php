<?php
/**
 * Utilitários Siga
 *
 * PHP 5
 *
 * Classe que auxilia em algumas operações ou tratamento de dados relacionado ao sistema SIGA
 *
 * @author		Daniel bonfim <daniel.bonfim@ifbaiano.edu.br>
 * @version 0.1
 */

class UtilitariosSiga 
{
    /**
     * Retorna o número do processo junto com a instituiçao de acordo com o padrão usado no SIGA.
     * @access public
     * Número do processo vindo do banco.
     * @param type $numProcesso 
     * Instituição
     * @param type $instit
     */
    public static function numeroProcessoFromBanco($numProcesso, $instit) {
        // chega assim: 201000000106
        // transformar em: 23327.000951/2011-62
        $inicio = substr($numProcesso, 0,4);
        $meio = substr($numProcesso, 4,6);
        $fim = substr($numProcesso, 10,2);
        
        return $instit.".".$meio."/".$inicio."-".$fim;

    }
    
    public static function dataFromBanco($data) {
        if($data) { 
            $data = explode("-", $data); 
            $data = $data[2]."/".$data[1]."/".$data[0];             
        }
        return $data;
    }
    
    /**
     * @param $dataHora Vem no formato 201005271444 
     * @param $tipoRetorno 
     * DATE: apenas a data
     * TIME: apenas o tempo
     * BOTH: ambos
     */
    public static function dataHoraFromBanco($dataHora, $tipoRetorno) {
        if(!$dataHora || !$tipoRetorno) 
            throw new Exception("Parâmetros não informados");
        
        switch($tipoRetorno) {
            case "DATE":
                $ano = substr($dataHora, 0,4);
                $mes = substr($dataHora, 4,2);
                $dia = substr($dataHora, 6,2);
                
                return $dia."/".$mes."/".$ano;
                
                break;
            case "TIME":
                $hora = substr($dataHora, 8,2);
                $minuto = substr($dataHora, 10,2);
                $segundo = "00";
                
                return $hora.":".$minuto.":".$segundo;
                
                break;
            case "BOTH":
                $ano = substr($dataHora, 0,4);
                $mes = substr($dataHora, 4,2);
                $dia = substr($dataHora, 6,2);
                
                $hora = substr($dataHora, 8,2);
                $minuto = substr($dataHora, 10,2);
                $segundo = "00";
                
                return $dia."/".$mes."/".$ano." ".$hora.":".$minuto.":".$segundo;
                
                break;
            default :
                throw new Exception("Parâmetro TipoRetorno incorreto");
            
        }
        
    }
    
    /**
     * Converte a data e hora no formato (d/m/Y H:i:s) para segundos (timestamp)
     * @param type $dataHora 
     */
    public static function dataHoraToTimestamp($dataHora) {
        if(!$dataHora) 
            throw new Exception("Parâmetro não informado");
        
        $dia = substr($dataHora, 0,2);
        $mes = substr($dataHora, 3,2);
        $ano = substr($dataHora, 6,4);

        $hora = substr($dataHora, 11,2);
        $minuto = substr($dataHora, 14,2);
        $segundo = "00";
        
        $timestamp = mktime($hora, $minuto, $segundo, $mes, $dia, $ano);
        
        return $timestamp;
    }
    
    
    
    
    
    
}