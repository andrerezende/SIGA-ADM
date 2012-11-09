<?php
//ini_set('display_errors', 1);

require_once 'Conexao.php';
require_once '../../view/itemPatrimonio/vw_itemPatrimonio.php';
//require_once '../../../relatorios/classes/Relatorio.php';
class DAOItemPatrimonio {

    protected $db;
    protected $dataSource;

    function __construct() {
        $this->db = Conexao::getInstance()->getDB();
    }

    /**
     * Quando o objeto for destruído, ele acessará o singleton Conexão para usset as variáveis do bd
     */
    public function getNomesInstituicoes($params = array()) {
        $params1= $params['idInstituicao'];
//                var_dump($params1);exit;
//                $nomesInstituicoes = $this->dataSource->execute("
			$sql="SELECT instituicao AS nome
			FROM cm_instituicao
			WHERE idinstituicao IN ($params1)
			ORDER BY idinstituicao";
//                        var_dump($sql);exit;
                        try {$preparedStatment = $this->db->prepare($sql);

            $preparedStatment->execute();

            $rows = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);
//            var_dump($rows);exit;
        } catch (PDOException $e) {
            $e->getMessage();

        } catch (Exception $e) {
            $e2->getMessage();
        }
        return $rows;
//		);
////                var_dump($params1);exit;
//		foreach ($nomesInstituicoes as $idInstituicao) {
//			$idInstituicoes .= substr($idInstituicao->nome, 10) . ',';
//		}
//		return ucwords(mb_strtolower(substr($idInstituicoes, 0, -1)));
	}
        
    function __destruct() {
        Conexao::getInstance()->disconnect();
    }

    public function getItensPatrimonioBy($idSetor = null, $idInstituicao = null, $idVidaUtil = null,
            $numeroEmpenho = null, $cnpj = null,  $orderby = null) {
//var_dump($idSetor,$idInstituicao,$idVidaUtil, $numeroEmpenho, $cnpj, $orderby);exit;
        
        $sql = "SELECT
   
   i.iditempatrimonio, i.descricao as itempat_descricao, i.valor as itempat_valor,


   s.siglasetor, s.idsetor,

   
   inst.idinstituicao, inst.instituicao,

   
   v.idvidautil, v.descricao as vidautil_descricao,

  
   i.notafiscal,

   
   n.cnpj,

   
   TO_CHAR(n.dataateste,'DD/MM/YYYY') AS dataAteste,
   TO_CHAR(i.dataaquisicao, 'DD/MM/YYYY') AS dataAquisicao,
   TO_CHAR(i.datainiciouso, 'DD/MM/YYYY') AS dataIniciouso,

   
   i.numeroempenho ";

        $sql .= " FROM
   ad_itempatrimonio i
   INNER JOIN ad_vidautil v ON i.idvidautil = v.idvidautil
   INNER JOIN cm_setor s ON i.idsetor = s.idsetor
   INNER JOIN cm_instituicao inst ON s.idinstituicao = inst.idinstituicao
   LEFT JOIN ad_notafiscal n ON i.idnotafiscal = n.idnotafiscal ";

        $sql .= " WHERE i.ativo = 'S' ";
//var_dump($sql);exit;
        if($idSetor || $idInstituicao || $idVidaUtil || $numeroEmpenho || $cnpj) {
            
            if($idSetor == "") {
                $sql ;
            }else{ 
                $sql .= " AND i.idsetor IN ($idSetor) ";
            }
//            var_dump($sql);exit;
            
            if($idInstituicao) $sql .= " AND inst.idinstituicao IN ($idInstituicao)";
            if($idVidaUtil) $sql .= " AND v.idvidautil IN ($idVidaUtil)";
            if($numeroEmpenho) $sql .= " AND i.numeroempenho IN ($numeroEmpenho)";
            if($cnpj) $sql .= " AND n.cnpj IN ($cnpj)";

       
// var_dump($sql);exit;         
            
            }

//        if($orderby)
//            $sql .= " ORDER BY $orderby ASC";
        try {
            $preparedStatment = $this->db->prepare($sql);

//            if($idSetor) $preparedStatment->bindParam('i.idsetor', $idSetor);
//            if($idInstituicao) $preparedStatment->bindParam ($idInstituicao);
//            if($idVidaUtil) $preparedStatment->bindParam('v.idvidautil', $idVidaUtil);
//            if($numeroEmpenho) $preparedStatment->bindParam('i.numeroempenho', $numeroEmpenho);
//            if($cnpj) $preparedStatment->bindParam('n.cnpj', $cnpj);
//            var_dump($sql);exit;
            $preparedStatment->execute();

            $rows = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);
// var_dump($sql);exit;
            
        } catch (PDOException $e) {
            $e->getMessage();
        }

        return $rows;

    }

    public function getDepreciacaoPorItem($mesRelatorio, $idInstituicao = null, $idVidaUtil = null, $situacao) {
        //die("$mesRelatorio, $idInstituicao, $idVidaUtil");

	if($situacao=='Estornados'){
	    $situacao='';
	}else{
	    $situacao='NOT';
	}

        // SELECT
        $sql = "SELECT
vw_depreciacao.iditempatrimonio,
vw_depreciacao.datamovimento,
item,

valor as valor_bruto,
dataaquisicao,



SUM(CASE extract(day from iniciouso) WHEN 1 THEN
    CASE (((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))-1) > mesesdepreciacao OR
          ((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))-1) = 0) WHEN true THEN
        0
    ELSE
        valordepreciavelmes
    END
ELSE
    CASE ((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso))) > mesesdepreciacao OR
           extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)) = 0) WHEN true THEN
        0
    ELSE
        valordepreciavelmes
    END
END) as valordepreciavelmes,


SUM((valordepreciavelmes *
CASE extract(day from iniciouso) WHEN 1 THEN
    CASE ((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))-1) > mesesdepreciacao WHEN true THEN
        mesesdepreciacao
    ELSE
        ((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))-1)
    END
ELSE
    CASE (extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso))) > mesesdepreciacao WHEN true THEN
        mesesdepreciacao
    ELSE
        (extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))
    END
END)) as valordepreciado,

valorresidual,


SUM((valor - (valordepreciavelmes *
CASE extract(day from iniciouso) WHEN 1 THEN
    CASE ((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))-1) > mesesdepreciacao WHEN true THEN
        mesesdepreciacao
    ELSE
        ((extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))-1)
    END
ELSE
    CASE (extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso))) > mesesdepreciacao WHEN true THEN
        mesesdepreciacao
    ELSE
        (extract(year from AGE(date('$mesRelatorio'), iniciouso))* 12 + extract(month from AGE(date('$mesRelatorio'), iniciouso)))
    END
END))) as valorLiquido ";

        // FROM
        $sql .= " FROM vw_depreciacao

	    ";

        // WHERE
        $sql .= " WHERE
	iniciouso < date('$mesRelatorio')
	AND vw_depreciacao.iditempatrimonio $situacao IN
	(select
	iditempatrimonio
	from ad_movimentopat where tipomovimento='4'
	)
	";

	if($idInstituicao)
            $sql .= "AND cast(idinstituicao as integer) = $idInstituicao ";

        if($idVidaUtil)
            $sql .= "AND idrubrica = $idVidaUtil";

        // GROUP BY
        $sql .= " GROUP BY
	vw_depreciacao.iditempatrimonio,
	item,
	vw_depreciacao.datamovimento,
	valor,
	dataaquisicao,
	valorresidual ";

        // ORDER BY
        $sql .= " ORDER BY
iditempatrimonio;";

        try {
            $preparedStatment = $this->db->prepare($sql);

            //$preparedStatment->bindParam(':mesRelatorio', $mesRelatorio);
            //if($idInstituicao) $preparedStatment->bindParam(':idinstituicao', $idInstituicao);
            //if($idVidaUtil) $preparedStatment->bindParam(':idVidaUtil', $idVidaUtil);

            $preparedStatment->execute();

            $rows = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);

        } catch (PDOException $e) {
            $e->getMessage();

        } catch (Exception $e) {
            $e2->getMessage();
        }
        return $rows;
    }



}