<?php
require_once 'Conexao.php';

class DAOAndamento {
    
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
    
    /**
     * Esse método trás todos os registros de cm_andamento agrupados pelo numero do processo
     * que possuam o maximo valor na coluna numanda
     */
    public function getAllProcessosWithMaxNumanda() {
        $sql = "           
            SELECT 
		a.numanda as numeroandamento, 
                a.numpro as processo,
                p.instit as instituicao, 
                p.setororig as setororigem,
                a.setor as setoratual,
                a.stampentr as datahoraentrada,  -- deverá ser tratado no php e inserido o campo no array tempoparado
                a.inativo as situacao,
                a.autor as solicitante,
                p.titulo as titulo,
                p.assunto as assunto

            FROM ad_andamento a 
            JOIN ad_processo p ON (a.numpro = p.numpro)

            WHERE a.numanda = 
            (SELECT 
               max(b.numanda)
            FROM 
               ad_andamento b
            WHERE
               a.numpro = b.numpro
            )
            ORDER BY a.stampentr desc;";
        
        try {
            $consulta = $this->db->query($sql);        
            $arr = $consulta->fetchAll(PDO::FETCH_ASSOC);
                    
        } catch (PDOException $e) {
            $e->getMessage();
        }
        
        return $arr;
    }
    
    // 11-10-2011 - Daniel Bonfim
    public function getProcessosWithMaxNumandaBySetor($setor) {
        
        $sql = "           
            SELECT 
		a.numanda as numeroandamento, 
                a.numpro as processo,
                p.instit as instituicao, 
                p.setororig as setororigem,
                a.setor as setoratual,
                a.stampentr as datahoraentrada,  -- deverá ser tratado no php e inserido o campo no array tempoparado
                a.inativo as situacao,
                a.autor as solicitante,
                p.titulo as titulo,
                p.assunto as assunto

            FROM ad_andamento a 
            JOIN ad_processo p ON (a.numpro = p.numpro)

            WHERE a.numanda = 
            (SELECT 
               max(b.numanda)
            FROM 
               ad_andamento b
            WHERE
               a.numpro = b.numpro
            ) AND a.setor = :setor
            ORDER BY a.stampentr desc;";
        
        try {
            $preparedStatment = $this->db->prepare($sql);
            $preparedStatment->bindParam(':setor', $setor);
            $preparedStatment->execute();
            $rows = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);
                    
        } catch (PDOException $e) {
            $e->getMessage();
        }
        
        return $rows;
        
    }
    
}   