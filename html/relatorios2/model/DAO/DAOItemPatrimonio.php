<?php
//ini_set('display_errors', 1);

require_once 'Conexao.php';

class DAOItemPatrimonio {

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

    public function getItensPatrimonioBy($idSetor = null, $idInstituicao = null, $idVidaUtil = null,
            $numeroEmpenho = null, $cnpj = null,  $orderby = null) {

        $sql = "SELECT
    -- item patrimonio
   i.iditempatrimonio, i.descricao as itempat_descricao, i.valor as itempat_valor,

   -- setor
   s.siglasetor, s.idsetor,

   -- instituicao
   inst.idinstituicao, inst.instituicao,

   -- vida util
   v.idvidautil, v.descricao as vidautil_descricao,

   -- nota fiscal
   i.notafiscal,

   -- cnpj
   n.cnpj,

   -- datas
   TO_CHAR(n.dataateste,'DD/MM/YYYY') AS dataAteste,
   TO_CHAR(i.dataaquisicao, 'DD/MM/YYYY') AS dataAquisicao,
   TO_CHAR(i.datainiciouso, 'DD/MM/YYYY') AS dataIniciouso,

   -- empenho
   i.numeroempenho ";

        $sql .= " FROM
   ad_itempatrimonio i
   INNER JOIN ad_vidautil v ON i.idvidautil = v.idvidautil
   INNER JOIN cm_setor s ON i.idsetor = s.idsetor
   INNER JOIN cm_instituicao inst ON s.idinstituicao = inst.idinstituicao
   LEFT JOIN ad_notafiscal n ON i.idnotafiscal = n.idnotafiscal ";

        $sql .= " WHERE i.ativo = 'S' ";

        if($idSetor || $idInstituicao || $idVidaUtil || $numeroEmpenho || $cnpj) {

            if($idSetor) $sql .= " AND cast(i.idsetor as text) = :idsetor ";
            if($idInstituicao) $sql .= " AND cast(inst.idinstituicao as text) = :idinstituicao ";
            if($idVidaUtil) $sql .= " AND cast(v.idvidautil as text) = :idvidautil";
            if($numeroEmpenho) $sql .= " AND cast(i.numeroempenho as text) = :numeroempenho";
            if($cnpj) $sql .= " AND n.cnpj = :cnpj";
        }

        if($orderby)
            $sql .= " ORDER BY $orderby ASC";

        try {
            $preparedStatment = $this->db->prepare($sql);

            if($idSetor) $preparedStatment->bindParam(':idsetor', $idSetor);
            if($idInstituicao) $preparedStatment->bindParam(':idinstituicao', $idInstituicao);
            if($idVidaUtil) $preparedStatment->bindParam(':idvidautil', $idVidaUtil);
            if($numeroEmpenho) $preparedStatment->bindParam(':numeroempenho', $numeroEmpenho);
            if($cnpj) $preparedStatment->bindParam(':cnpj', $cnpj);

            $preparedStatment->execute();

            $rows = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);

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