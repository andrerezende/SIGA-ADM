<?php
//ini_set('display_errors', 1);

require_once 'UtilitariosSiga.php';
require_once '../../model/DAO/DAOSetor.php';
require_once '../../model/DAO/DAOAndamento.php';

class Setor {
    
    // Relatório de usuários por todos os setores
    public static function getNameAndNickFromAllSetores() {
        
        $DAOSetor = new DAOSetor();
        $rows = $DAOSetor->getNomeNickFromAllSetores();        
        unset($DAOSetor);
        
        foreach($rows as $row) {
            $setores[] = $row['siglasetor'];
        }

        $setores = array_unique($setores);
        $setores = array_values($setores);
        
        $arrTratado = Array('setores'=>$setores, 'rows'=>$rows);
        
        return $arrTratado;
    }
    
    public static function getInativosFromAllSetores() {
        
        $DAOSetor = new DAOSetor();
        $rows = $DAOSetor->getInativosFromAllSetores();        
        unset($DAOSetor);
        
        foreach($rows as $row) {
            $setores[] = $row['siglasetor'];
        }

        $setores = array_unique($setores);
        $setores = array_values($setores);
        
        $arrTratado = Array('setores'=>$setores, 'rows'=>$rows);
        
        return $arrTratado;
    }
    
    // Relatório de usuários por setor escolhido
    public static function getNameAndNickBySetor($setor) {
        $setor = strtoupper(trim($setor));
        $DAOSetor = new DAOSetor();
        $rows = $DAOSetor->getNomeNickBySetor($setor);

        // destruindo o objeto
        unset($DAOSetor);
        
        return $rows;
    }
    
    // Relatório de processos por todos os setores
    public static function getProcessosByAllSetores() {
        
        $DAOSetor = new DAOSetor();
        $DAOAndamento = new DAOAndamento();

        $setores = $DAOSetor->getAllSetores();
        $processos = $DAOAndamento->getAllProcessosWithMaxNumanda();

        // cria registro atribuindo o setor atual à chave
        foreach($setores as $setor) {
            $setor['siglasetor_nomesetor'] = $setor['siglasetor']." - ".$setor['nomesetor'];
            $i = 0;
            foreach($processos as $processo) {
                if($setor['siglasetor'] == $processo['setoratual']) {

                    // PROCESSO
                    $registro[$setor['siglasetor_nomesetor']][$i]['processo']  = UtilitariosSiga::numeroProcessoFromBanco($processo['processo'], $processo['instituicao']);

                    // INSTITUIÇÃO
                    //$registro[$setor['siglasetor']][$i]['instituicao']  = $processo['instituicao']; 

                    //ORIGEM
                    $registro[$setor['siglasetor_nomesetor']][$i]['setororigem']  = $processo['setororigem'];

                    // DATA E HORA DE ENTRADA
                    $registro[$setor['siglasetor_nomesetor']][$i]['datahoraentrada']  = ($processo['datahoraentrada']) ? UtilitariosSiga::dataHoraFromBanco($processo['datahoraentrada'], "BOTH") : null;

                    // TEMPO PARADO
                    /*  calculo entre a datahora de entrada com a atual para descobrir 
                                              a quanto tempo o processo esta esperando */
                    $timestampDataHoraEntrada = UtilitariosSiga::dataHoraToTimestamp(UtilitariosSiga::dataHoraFromBanco($processo['datahoraentrada'], "BOTH"));
                    $timestampDataHoraAtual = time();

                    // data mais recente menos a mais antiga
                    $timestampTempoParado = $timestampDataHoraAtual - $timestampDataHoraEntrada;

                    // round para arredondar o valor
                    $dias = round(($timestampTempoParado / 60 / 60 / 24));

                    if($dias > 30) {
                        $meses = round($dias / 30);
                        $dias = round($dias % 30);
                        $tempo = "$meses meses e $dias dias";
                    } else {
                        $tempo = $dias;
                    }

                    $registro[$setor['siglasetor_nomesetor']][$i]['tempo_parado'] = $tempo;

                    /*  Fim dos calculos para o campo qtd_dias_parado  */

                    // SITUAÇÃO            
                    $registro[$setor['siglasetor_nomesetor']][$i]['situacao']  = $processo['situacao'];

                    // SOLICITANTE    
                    $registro[$setor['siglasetor_nomesetor']][$i]['solicitante']  = $processo['solicitante'];            

                    // TÍTULO
                    $registro[$setor['siglasetor_nomesetor']][$i]['titulo']  = $processo['titulo'];

                    // ASSUNTO
                    $registro[$setor['siglasetor_nomesetor']][$i]['assunto']  = $processo['assunto'];


                    $i++;

                }
            }        
        }
        
        // DEBUG
        //print_r($registro);exit;
        /*
        foreach($registro as $chave1=>$valor1) {
            echo $chave1; ?> <br/> <?php
            foreach($valor1 as $numSub => $sub) {
                echo "NUMERO: $numSub;"; ?> <br/> <?php
                foreach($sub as $chave2 => $valor2) {
                    echo $chave2." => ".$valor2; ?> <br/> <?php
                }        
            }
            ?> <br/><br/> <?php
        }

        exit;
        */
        
        return $registro;
    }
    
    
    // 11-10-2011 - Daniel Bonfim
    public static function getProcessosBySetor($setor) {
        //$DAOSetor = new DAOSetor();
        $setor = strtoupper(trim($setor));
        $DAOAndamento = new DAOAndamento();

        $processos = $DAOAndamento->getProcessosWithMaxNumandaBySetor($setor);
        //print_r(count($processos));exit;

        $i = 0;
            foreach($processos as $processo) {

                    // PROCESSO
                    $processoTratado[$i]['processo']  = UtilitariosSiga::numeroProcessoFromBanco($processo['processo'], $processo['instituicao']);

                    // INSTITUIÇÃO
                    //$registro[$setor['siglasetor']][$i]['instituicao']  = $processo['instituicao']; 

                    //ORIGEM
                    $processoTratado[$i]['setororigem']  = $processo['setororigem'];

                    // DATA E HORA DE ENTRADA
                    $processoTratado[$i]['datahoraentrada']  = ($processo['datahoraentrada']) ? UtilitariosSiga::dataHoraFromBanco($processo['datahoraentrada'], "BOTH") : null;

                    // TEMPO PARADO
                    /*  calculo entre a datahora de entrada com a atual para descobrir 
                                              a quanto tempo o processo esta esperando */
                    $timestampDataHoraEntrada = UtilitariosSiga::dataHoraToTimestamp(UtilitariosSiga::dataHoraFromBanco($processo['datahoraentrada'], "BOTH"));
                    $timestampDataHoraAtual = time();

                    // data mais recente menos a mais antiga
                    $timestampTempoParado = $timestampDataHoraAtual - $timestampDataHoraEntrada;

                    // round para arredondar o valor
                    $dias = round(($timestampTempoParado / 60 / 60 / 24));

                    if($dias > 30) {
                        $meses = round($dias / 30);
                        $dias = round($dias % 30);
                        $tempo = "$meses meses e $dias dias";
                    } else {
                        $tempo = $dias;
                    }

                    $processoTratado[$i]['tempo_parado'] = $tempo;

                    /*  Fim dos calculos para o campo qtd_dias_parado  */

                    // SITUAÇÃO            
                    $processoTratado[$i]['situacao']  = $processo['situacao'];

                    // SOLICITANTE    
                    $processoTratado[$i]['solicitante']  = $processo['solicitante'];            

                    // TÍTULO
                    $processoTratado[$i]['titulo']  = $processo['titulo'];

                    // ASSUNTO
                    $processoTratado[$i]['assunto']  = $processo['assunto'];

                    $i++;
            }       
                
        return $processoTratado;
    }
    
    // 07-11-2011 - Daniel Bonfim
    public static function getSetorById($idSetor) {
        $DAOSetor = new DAOSetor();        
        $setor = $DAOSetor->getSetorById($idSetor);
        
        return $setor;        
    }
    
    
    
}