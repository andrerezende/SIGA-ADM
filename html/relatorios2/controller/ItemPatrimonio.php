<?php
//ini_set('display_errors', 1);

require_once 'UtilitariosSiga.php';
require_once '../../model/DAO/DAOItemPatrimonio.php';
require_once '../../controller/Setor.php';

class ItemPatrimonio {

    // relatorio de itens patrimoniais
    public static function ItemPatrimonioBy($idSetor = null, $idInstituicao = null, $idVidautil = null,
            $idEmpenho = null, $cnpj = null,  $tomboanterior = null, $numeroserie = null, $orderby = null) {

        $DAOItemPatrimonio = new DAOItemPatrimonio();
        $itensPatrimoniais = $DAOItemPatrimonio->getItensPatrimonioBy($idSetor, $idInstituicao, $idVidautil,
            $idEmpenho, $cnpj,  $tomboanterior, $numeroserie, $orderby);

        return $itensPatrimoniais;
    }
	public static function itemPatrimonioBy2($idSetor = null, $idInstituicao = null, $idVidautil = null,
            $idEmpenho = null, $cnpj = null, $orderby = null){

		 $DAOItemPatrimonio = new DAOItemPatrimonio();
        $itensPatrimoniais = $DAOItemPatrimonio->getItensPatrimonioBy($idSetor, $idInstituicao, $idVidautil,
            $idEmpenho, $cnpj, $orderby);

        return $itensPatrimoniais;
	}

    // relatorio de depreciacao por item
    public static function DepreciacaoPorItem($mesRelatorio, $idInstituicao = null, $idVidaUtil = null, $situacao) {
        $DAOItemPatrimonio = new DAOItemPatrimonio();
        $itensPatrimoniais = $DAOItemPatrimonio->getDepreciacaoPorItem($mesRelatorio, $idInstituicao, $idVidaUtil, $situacao);

        return $itensPatrimoniais;
    }


}

?>
