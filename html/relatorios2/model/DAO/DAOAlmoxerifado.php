<?php
require_once 'Conexao.php';

class DAOAlmoxerifado {

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

    private function SqlRMA_subElemento($campo, $IdUoAlmoxerifado, $mes, $ano, $notaFiscal = null) {
        if($campo != 'valortotal' && $campo != 'quantidade')
            throw new Exception("campo inválido");

        $dataReferencia = "$ano-$mes-01";
        // SE MES = 12, NOVO ANO. SE NAO ADD 1 MES
        $dataReferencia_add1mes = ($mes == 12) ? ($ano+1)."-01-01" : "$ano-".($mes+1)."-01";

            $sql = "
                    SELECT sub_mov.idsubelemento,
               sub_mov.descricao,

        COALESCE((SELECT SUM(ad_movimento.$campo)
                        FROM ad_movimento
                        INNER JOIN ad_material
                                ON ad_movimento.idmaterial=ad_material.idmaterial
                        INNER JOIN ad_subelemento sub_mov_ant
                                ON ((ad_material.idelemento=sub_mov_ant.idelemento) AND (ad_material.idsubelemento=sub_mov_ant.idsubelemento))

                        WHERE ad_movimento.tipomovimento = '1'
                        AND ad_movimento.idmovimentoref IS NULL
                        AND ad_movimento.datamov < '$dataReferencia'
                        AND ad_movimento.iduoalmox = '$IdUoAlmoxerifado'
                        AND sub_mov_ant.idsubelemento = sub_mov.idsubelemento

                        GROUP BY sub_mov_ant.idsubelemento), 0)
                -
        COALESCE((SELECT SUM(ad_movimento.$campo)
                        FROM ad_movimento
                        INNER JOIN ad_material
                                ON ad_movimento.idmaterial=ad_material.idmaterial
                        INNER JOIN ad_subelemento sub_mov_ant
                                ON ((ad_material.idelemento=sub_mov_ant.idelemento) AND (ad_material.idsubelemento=sub_mov_ant.idsubelemento))

                        WHERE ad_movimento.tipomovimento = '3'
                        AND ad_movimento.idmovimentoref IS NULL
                        AND ad_movimento.datamov < '$dataReferencia'
                        AND ad_movimento.iduoalmox = '$IdUoAlmoxerifado'
                        AND sub_mov_ant.idsubelemento = sub_mov.idsubelemento

                        GROUP BY sub_mov_ant.idsubelemento), 0) as saldo_anterior,

        COALESCE((SELECT SUM(ad_movimento.$campo)
                        FROM ad_movimento
                        INNER JOIN ad_material
                                ON ad_movimento.idmaterial=ad_material.idmaterial
                        INNER JOIN ad_subelemento sub_mov_ant
                                ON ((ad_material.idelemento=sub_mov_ant.idelemento) AND (ad_material.idsubelemento=sub_mov_ant.idsubelemento))

                        WHERE ad_movimento.tipomovimento = '1'
                        AND ad_movimento.idmovimentoref IS NULL
                        AND ad_movimento.datamov >= '$dataReferencia'
                        AND ad_movimento.datamov < '$dataReferencia_add1mes'
                        AND ad_movimento.extraorcamentario = 'N'
                        AND ad_movimento.iduoalmox = '$IdUoAlmoxerifado'
                        AND sub_mov_ant.idsubelemento = sub_mov.idsubelemento

                        GROUP BY sub_mov_ant.idsubelemento), 0) as entrada,

        COALESCE((SELECT SUM(ad_movimento.$campo)
                        FROM ad_movimento
                        INNER JOIN ad_material
                                ON ad_movimento.idmaterial=ad_material.idmaterial
                        INNER JOIN ad_subelemento sub_mov_ant
                                ON ((ad_material.idelemento=sub_mov_ant.idelemento) AND (ad_material.idsubelemento=sub_mov_ant.idsubelemento))

                        WHERE ad_movimento.tipomovimento = '1'
                        AND ad_movimento.idmovimentoref IS NULL
                        AND ad_movimento.datamov >= '$dataReferencia'
                        AND ad_movimento.datamov < '$dataReferencia_add1mes'
                        AND ad_movimento.extraorcamentario = 'S'
                        AND ad_movimento.iduoalmox = '$IdUoAlmoxerifado'
                        AND sub_mov_ant.idsubelemento = sub_mov.idsubelemento

                        GROUP BY sub_mov_ant.idsubelemento), 0) as entrada_extra,

        COALESCE((SELECT SUM(ad_movimento.$campo)
                        FROM ad_movimento
                        INNER JOIN ad_material
                                ON ad_movimento.idmaterial=ad_material.idmaterial
                        INNER JOIN ad_subelemento sub_mov_ant
                                ON ((ad_material.idelemento=sub_mov_ant.idelemento) AND (ad_material.idsubelemento=sub_mov_ant.idsubelemento))

                        WHERE ad_movimento.tipomovimento = '3'
                        AND ad_movimento.idmovimentoref IS NULL
                        AND ad_movimento.datamov >= '$dataReferencia'
                        AND ad_movimento.datamov < '$dataReferencia_add1mes'
                        AND ad_movimento.iduoalmox = '$IdUoAlmoxerifado'
                        AND sub_mov_ant.idsubelemento = sub_mov.idsubelemento

                        GROUP BY sub_mov_ant.idsubelemento), 0) as saida

        FROM ad_movimento
        INNER JOIN ad_material
                ON ad_movimento.idmaterial=ad_material.idmaterial
        INNER JOIN ad_subelemento sub_mov
                ON ((ad_material.idelemento=sub_mov.idelemento) AND (ad_material.idsubelemento=sub_mov.idsubelemento))
        WHERE ad_movimento.iduoalmox = '$IdUoAlmoxerifado' ";

        if($notaFiscal) {
            $sql .= " AND ad_movimento.notafiscal = '$notaFiscal'";
        }

        $sql .= " GROUP BY sub_mov.idsubelemento,
                 sub_mov.descricao

        ORDER BY sub_mov.idsubelemento;";

            //die($sql);
            return $sql;

    }

    private function SqlRMA_Material($campo, $IdUoAlmoxerifado, $mes, $ano, $notaFiscal = null) {
        if($campo != 'valortotal' && $campo != 'quantidade')
            throw new Exception("campo inválido");

        $dataReferencia = "$ano-$mes-01";
        // SE MES = 12, NOVO ANO. SE NAO ADD 1 MES
        $dataReferencia_add1mes = ($mes == 12) ? ($ano+1)."-01-01" : "$ano-".($mes+1)."-01";

            $sql = "
                    SELECT mat.idmaterial,
               mat.descricao,

        COALESCE((SELECT SUM(ad_movimento.$campo)
                        FROM ad_movimento
                        INNER JOIN ad_material mat_in
                                ON ad_movimento.idmaterial=mat_in.idmaterial


                        WHERE ad_movimento.tipomovimento = '1'
                        AND ad_movimento.idmovimentoref IS NULL
                        AND ad_movimento.datamov < '$dataReferencia'
                        AND ad_movimento.iduoalmox = '$IdUoAlmoxerifado'
                        AND mat.idmaterial = mat_in.idmaterial

                        GROUP BY mat_in.idmaterial), 0)
                -
        COALESCE((SELECT SUM(ad_movimento.$campo)
                        FROM ad_movimento
                        INNER JOIN ad_material mat_in
                                ON ad_movimento.idmaterial=mat_in.idmaterial


                        WHERE ad_movimento.tipomovimento = '3'
                        AND ad_movimento.idmovimentoref IS NULL
                        AND ad_movimento.datamov < '$dataReferencia'
                        AND ad_movimento.iduoalmox = '$IdUoAlmoxerifado'
                        AND mat.idmaterial = mat_in.idmaterial

                        GROUP BY mat_in.idmaterial), 0) as saldo_anterior,

        COALESCE((SELECT SUM(ad_movimento.$campo)
                        FROM ad_movimento
                        INNER JOIN ad_material mat_in
                                ON ad_movimento.idmaterial=mat_in.idmaterial


                        WHERE ad_movimento.tipomovimento = '1'
                        AND ad_movimento.idmovimentoref IS NULL
                        AND ad_movimento.datamov >= '$dataReferencia'
                        AND ad_movimento.datamov < '$dataReferencia_add1mes'
                        AND ad_movimento.extraorcamentario = 'N'
                        AND ad_movimento.iduoalmox = '$IdUoAlmoxerifado'
                        AND mat.idmaterial = mat_in.idmaterial

                        GROUP BY mat_in.idmaterial), 0) as entrada,

        COALESCE((SELECT SUM(ad_movimento.$campo)
                        FROM ad_movimento
                        INNER JOIN ad_material mat_in
                                ON ad_movimento.idmaterial=mat_in.idmaterial


                        WHERE ad_movimento.tipomovimento = '1'
                        AND ad_movimento.idmovimentoref IS NULL
                        AND ad_movimento.datamov >= '$dataReferencia'
                        AND ad_movimento.datamov < '$dataReferencia_add1mes'
                        AND ad_movimento.extraorcamentario = 'S'
                        AND ad_movimento.iduoalmox = '$IdUoAlmoxerifado'
                        AND mat.idmaterial = mat_in.idmaterial

                        GROUP BY mat_in.idmaterial), 0) as entrada_extra,

        COALESCE((SELECT SUM(ad_movimento.$campo)
                        FROM ad_movimento
                        INNER JOIN ad_material mat_in
                                ON ad_movimento.idmaterial=mat_in.idmaterial


                        WHERE ad_movimento.tipomovimento = '3'
                        AND ad_movimento.idmovimentoref IS NULL
                        AND ad_movimento.datamov >= '$dataReferencia'
                        AND ad_movimento.datamov < '$dataReferencia_add1mes'
                        AND ad_movimento.iduoalmox = '$IdUoAlmoxerifado'
                        AND mat.idmaterial = mat_in.idmaterial

                        GROUP BY mat_in.idmaterial), 0) as saida

        FROM ad_movimento
        INNER JOIN ad_material mat
                ON ad_movimento.idmaterial=mat.idmaterial


        WHERE ad_movimento.iduoalmox = '$IdUoAlmoxerifado' ";

        if($notaFiscal) {
            $sql .= " AND ad_movimento.notafiscal = '$notaFiscal'";
        }

        $sql .= " GROUP BY mat.idmaterial,
             mat.descricao

        ORDER BY mat.descricao;";

            //die($sql);
            return $sql;

    }

    public function RMASubElementoConsolidadoAcumuladoPorQuantidade($IdUoAlmoxerifado, $mes, $ano, $notaFiscal = null) {
        if(!$IdUoAlmoxerifado)
            throw new Exception("IdUoAlmoxerifado não definido");
        if(!$IdUoAlmoxerifado)
            throw new Exception("Mês não definido");
        if(!$IdUoAlmoxerifado)
            throw new Exception("Ano não definido");

        $sql = $this->SqlRMA_subElemento('quantidade',$IdUoAlmoxerifado, $mes, $ano, $notaFiscal);

        try {
            $consulta = $this->db->query($sql);
            $arr = $consulta->fetchAll(PDO::FETCH_ASSOC);

        } catch (PDOException $e) {
            $e->getMessage();
        }

        return $arr;
    }

    public function RMASubElementoConsolidadoAcumuladoPorValorTotal($IdUoAlmoxerifado, $mes, $ano, $notaFiscal = null) {
        if(!$IdUoAlmoxerifado)
            throw new Exception("IdUoAlmoxerifado não definido");
        if(!$IdUoAlmoxerifado)
            throw new Exception("Mês não definido");
        if(!$IdUoAlmoxerifado)
            throw new Exception("Ano não definido");

        $dataReferencia = "$ano-$mes-01";
        $dataReferencia_add1mes = "$ano-".($mes+1)."-01";

        $sql = $this->SqlRMA_subElemento('valortotal',$IdUoAlmoxerifado, $mes, $ano, $notaFiscal);
        
        try {
            $consulta = $this->db->query($sql);
            $arr = $consulta->fetchAll(PDO::FETCH_ASSOC);

        } catch (PDOException $e) {
            $e->getMessage();
        }

        return $arr;
    }

    // 22-12-2011
    public function RMAMaterialConsolidadoAcumuladoPorQuantidade($IdUoAlmoxerifado, $mes, $ano, $notaFiscal = null) {
        if(!$IdUoAlmoxerifado)
            throw new Exception("IdUoAlmoxerifado não definido");
        if(!$IdUoAlmoxerifado)
            throw new Exception("Mês não definido");
        if(!$IdUoAlmoxerifado)
            throw new Exception("Ano não definido");

        $sql = $this->SqlRMA_Material('quantidade',$IdUoAlmoxerifado, $mes, $ano, $notaFiscal);

        try {
            $consulta = $this->db->query($sql);
            $arr = $consulta->fetchAll(PDO::FETCH_ASSOC);

        } catch (PDOException $e) {
            $e->getMessage();
        }

        return $arr;
    }

    //22-12-2011
    public function RMAMaterialConsolidadoAcumuladoPorValorTotal($IdUoAlmoxerifado, $mes, $ano, $notaFiscal = null) {
        if(!$IdUoAlmoxerifado)
            throw new Exception("IdUoAlmoxerifado não definido");
        if(!$IdUoAlmoxerifado)
            throw new Exception("Mês não definido");
        if(!$IdUoAlmoxerifado)
            throw new Exception("Ano não definido");


        $sql = $this->SqlRMA_Material('valortotal',$IdUoAlmoxerifado, $mes, $ano, $notaFiscal);

        try {
            $consulta = $this->db->query($sql);
            $arr = $consulta->fetchAll(PDO::FETCH_ASSOC);

        } catch (PDOException $e) {
            $e->getMessage();
        }

        return $arr;
    }




}