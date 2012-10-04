<?php
require_once 'Conexao.php';

class DAOSetor {
    
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
    
    public function getNomeNickFromAllSetores() {
        $sql = "SELECT p.nome, u.login, s.siglasetor FROM CM_SETOR s
                JOIN cm_usuario u ON (u.idsetor = s.idsetor)
                JOIN cm_pessoa p ON (p.idpessoa = u.idpessoa)
                WHERE u.ativo = 'S';";
        
        try {        
            //$this->db->beginTransaction();
            $consulta = $this->db->query($sql);        
            $arr = $consulta->fetchAll(PDO::FETCH_ASSOC);
            //$this->db->commit();
        
        } catch (PDOException $e) {
            $e->getMessage();
            // rollback
        }
        
        return $arr;
    }
    
    public function getNomeNickBySetor($setor) {
        $sql = "SELECT p.nome, u.login FROM CM_SETOR s
                JOIN cm_usuario u ON (u.idsetor = s.idsetor)
                JOIN cm_pessoa p ON (p.idpessoa = u.idpessoa)
                WHERE s.siglasetor = :setor
                AND u.ativo = 'S';";
        
        try {            
            //$this->db->beginTransaction();
            $preparedStatment = $this->db->prepare($sql);
            $preparedStatment->bindParam(':setor', $setor);
            $preparedStatment->execute();
            $rows = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);
            //$this->db->commit();
            
        } catch (PDOException $e) {
            $e->getMessage();
        }
        
        return $rows;
    }
    
    public function getAllSetores() {
        $sql = "SELECT siglasetor, nomesetor FROM cm_setor;";
        
        try {
            $consulta = $this->db->query($sql);        
            $arr = $consulta->fetchAll(PDO::FETCH_ASSOC);
                    
        } catch (PDOException $e) {
            $e->getMessage();
        }
        
        return $arr;
    }
    
    // 07-11-2011 - Daniel Bonfim
    public function getSetorById($idSetor) {
        $sql = "SELECT * FROM CM_SETOR
                WHERE idsetor = :idsetor;";
        
        try {            
            //$this->db->beginTransaction();
            $preparedStatment = $this->db->prepare($sql);
            $preparedStatment->bindParam(':idsetor', $idSetor);
            $preparedStatment->execute();
            $rows = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);
            //$this->db->commit();
            
        } catch (PDOException $e) {
            $e->getMessage();
        }
        
        //var_dump($rows);exit;
        return $rows[0];
    }
    
    
}