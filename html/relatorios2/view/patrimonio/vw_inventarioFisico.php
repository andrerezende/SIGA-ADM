<?php
ini_set('memory_limit', '128M');
ob_start();
require_once '../../model/DAO/Conexao.php';
require_once '../../controller/DataHelper.php';

$idUO = $_GET['idUoAlmoxerifado'];
$mesReferencia = $_GET['mes'];
$anoReferencia = $_GET['ano'];
$subelemento = $_GET['subelemento'];
$uo			=$_GET['uo'];

$anoFim = $anoReferencia;
If ($mesReferencia == 12) {
	$mesFim = 1;
	$anoFim = $anoReferencia + 1;
} else {
	$mesFim = $mesReferencia + 1;
}

if ($mesFim < 10) {
	$mesFim = "0" . $mesFim;
}

if ($mesReferencia < 10) {
	$mesReferencia = "0" . $mesReferencia;
}

$dataInicio = $anoReferencia . "-" . $mesReferencia . "-01";
$dataFim = $anoFim . "-" . $mesFim . "-01";

//if($subelemento!=""){
//
//$qsubelemento=" AND ad_material.idelemento=$subelemento ";
//
//$qsubelementoAnteriorEntrada=" AND movto_sdl_ant_ENT_qtd.idsubelemento = $subelemento  ";
//$qsubelementoAnteriorSaida=" AND movto_sdl_ant_SAI_qtd.idsubelemento = $subelemento  ";
//$qsubelementoAnteriorEntradaVal=" AND movto_sdl_ant_ENT_val.idsubelemento = $subelemento  ";
//$qsubelementoAnteriorSaidaVal=" AND movto_sdl_ant_SAI_val.idsubelemento = $subelemento  ";
//$qsubelementoAnteriorEntradaQtd=" AND movto_ENT_qtd.idsubelemento = $subelemento  ";
//$qsubelementoAnteriorSaidaQtd=" AND movto_SAI_qtd.idsubelemento = $subelemento  ";
//
//$qsubelementoEntradaVal=" AND movto_ENT_val.idsubelemento = $subelemento  ";
//$qsubelementoSaidaQtd=" AND movto_SAI_qtd.idsubelemento = $subelemento  ";
//$qsubelementoSaidaVal=" AND movto_SAI_val.idsubelemento = $subelemento  ";
//
//
//}

$sql = "
SELECT DISTINCT
ad_subelemento.idsubelemento as idsubelemento,
ad_subelemento.descricao as descricaosub,
ad_material.codmaterial,
ad_material.descricao as descricaomat,
ad_material.unidade as unidade,



COALESCE((SELECT SUM(movto_sdl_ant_ENT_qtd.quantidade)
          FROM ad_movimento movto_sdl_ant_ENT_qtd
          WHERE movto_sdl_ant_ENT_qtd.idmovimentoref IS NULL
            AND movto_sdl_ant_ENT_qtd.iduoalmox = ad_movimento.iduoalmox
            AND movto_sdl_ant_ENT_qtd.idmaterial = ad_movimento.idmaterial
            AND movto_sdl_ant_ENT_qtd.tipomovimento = '1'
            AND movto_sdl_ant_ENT_qtd.datamov < '$dataInicio'

          ), 0) -

COALESCE((SELECT SUM(movto_sdl_ant_SAI_qtd.quantidade)
          FROM ad_movimento movto_sdl_ant_SAI_qtd
          WHERE movto_sdl_ant_SAI_qtd.idmovimentoref IS NULL
            AND movto_sdl_ant_SAI_qtd.iduoalmox = ad_movimento.iduoalmox
            AND movto_sdl_ant_SAI_qtd.idmaterial = ad_movimento.idmaterial
            AND movto_sdl_ant_SAI_qtd.tipomovimento = '3'
            AND movto_sdl_ant_SAI_qtd.datamov < '$dataInicio'

          ), 0) as qtd_sld_ant,

COALESCE((SELECT SUM(movto_sdl_ant_ENT_val.valortotal)
          FROM ad_movimento movto_sdl_ant_ENT_val
          WHERE movto_sdl_ant_ENT_val.idmovimentoref IS NULL
            AND movto_sdl_ant_ENT_val.iduoalmox = ad_movimento.iduoalmox
            AND movto_sdl_ant_ENT_val.idmaterial = ad_movimento.idmaterial
            AND movto_sdl_ant_ENT_val.tipomovimento = '1'
            AND movto_sdl_ant_ENT_val.datamov < '$dataInicio'

          ), 0) -

COALESCE((SELECT SUM(movto_sdl_ant_SAI_val.valortotal)
          FROM ad_movimento movto_sdl_ant_SAI_val
          WHERE movto_sdl_ant_SAI_val.idmovimentoref IS NULL
            AND movto_sdl_ant_SAI_val.iduoalmox = ad_movimento.iduoalmox
            AND movto_sdl_ant_SAI_val.idmaterial = ad_movimento.idmaterial
            AND movto_sdl_ant_SAI_val.tipomovimento = '3'
            AND movto_sdl_ant_SAI_val.datamov < '$dataInicio'

          ), 0) as val_sld_ant,



COALESCE((SELECT SUM(movto_ENT_qtd.quantidade)
          FROM ad_movimento movto_ENT_qtd
          WHERE movto_ENT_qtd.idmovimentoref IS NULL
            AND movto_ENT_qtd.iduoalmox = ad_movimento.iduoalmox
            AND movto_ENT_qtd.idmaterial = ad_movimento.idmaterial
            AND movto_ENT_qtd.tipomovimento = '1'
            AND movto_ENT_qtd.datamov >= '$dataInicio'
            AND movto_ENT_qtd.datamov < '$dataFim'

          ), 0) as qtd_ent,

COALESCE((SELECT SUM(movto_ENT_val.valortotal)
          FROM ad_movimento movto_ENT_val
          WHERE movto_ENT_val.idmovimentoref IS NULL
            AND movto_ENT_val.iduoalmox = ad_movimento.iduoalmox
            AND movto_ENT_val.idmaterial = ad_movimento.idmaterial
            AND movto_ENT_val.tipomovimento = '1'
            AND movto_ENT_val.datamov >= '$dataInicio'
            AND movto_ENT_val.datamov < '$dataFim'

          ), 0) as val_ent,




COALESCE((SELECT SUM(movto_SAI_qtd.quantidade)
          FROM ad_movimento movto_SAI_qtd
          WHERE movto_SAI_qtd.idmovimentoref IS NULL
            AND movto_SAI_qtd.iduoalmox = ad_movimento.iduoalmox
            AND movto_SAI_qtd.idmaterial = ad_movimento.idmaterial
            AND movto_SAI_qtd.tipomovimento = '3'
            AND movto_SAI_qtd.datamov >= '$dataInicio'
            AND movto_SAI_qtd.datamov < '$dataFim'

          ), 0) as qtd_sai,

COALESCE((SELECT SUM(movto_SAI_val.valortotal)
          FROM ad_movimento movto_SAI_val
          WHERE movto_SAI_val.idmovimentoref IS NULL
            AND movto_SAI_val.iduoalmox = ad_movimento.iduoalmox
            AND movto_SAI_val.idmaterial = ad_movimento.idmaterial
            AND movto_SAI_val.tipomovimento = '3'
            AND movto_SAI_val.datamov >= '$dataInicio'
            AND movto_SAI_val.datamov < '$dataFim'

          ), 0) as val_sai

FROM ad_movimento
INNER JOIN ad_material ON ad_movimento.idmaterial = ad_material.idmaterial
INNER JOIN ad_subelemento ON ad_material.idelemento = ad_subelemento.idelemento AND ad_material.idsubelemento = ad_subelemento.idsubelemento

WHERE ad_movimento.idmovimentoref IS NULL
  AND ad_movimento.iduoalmox = $idUO

GROUP BY
ad_movimento.iduoalmox,
ad_movimento.idmaterial,
ad_subelemento.idsubelemento,
ad_subelemento.descricao,
ad_material.codmaterial,
ad_material.descricao,
ad_material.unidade


HAVING

(COALESCE((SELECT SUM(movto_sdl_ant_ENT_qtd.quantidade)
          FROM ad_movimento movto_sdl_ant_ENT_qtd
          WHERE movto_sdl_ant_ENT_qtd.idmovimentoref IS NULL
            AND movto_sdl_ant_ENT_qtd.iduoalmox = ad_movimento.iduoalmox
            AND movto_sdl_ant_ENT_qtd.idmaterial = ad_movimento.idmaterial
            AND movto_sdl_ant_ENT_qtd.tipomovimento = '1'
            AND movto_sdl_ant_ENT_qtd.datamov < '$dataInicio'
          ), 0)

-

COALESCE((SELECT SUM(movto_sdl_ant_SAI_qtd.quantidade)
          FROM ad_movimento movto_sdl_ant_SAI_qtd
          WHERE movto_sdl_ant_SAI_qtd.idmovimentoref IS NULL
            AND movto_sdl_ant_SAI_qtd.iduoalmox = ad_movimento.iduoalmox
            AND movto_sdl_ant_SAI_qtd.idmaterial = ad_movimento.idmaterial
            AND movto_sdl_ant_SAI_qtd.tipomovimento = '3'
            AND movto_sdl_ant_SAI_qtd.datamov < '$dataInicio'
          ), 0))

+

((COALESCE((SELECT SUM(movto_sdl_ant_ENT_val.valortotal)
          FROM ad_movimento movto_sdl_ant_ENT_val
          WHERE movto_sdl_ant_ENT_val.idmovimentoref IS NULL
            AND movto_sdl_ant_ENT_val.iduoalmox = ad_movimento.iduoalmox
            AND movto_sdl_ant_ENT_val.idmaterial = ad_movimento.idmaterial
            AND movto_sdl_ant_ENT_val.tipomovimento = '1'
            AND movto_sdl_ant_ENT_val.datamov < '$dataInicio'
          ), 0)

-

COALESCE((SELECT SUM(movto_sdl_ant_SAI_val.valortotal)
          FROM ad_movimento movto_sdl_ant_SAI_val
          WHERE movto_sdl_ant_SAI_val.idmovimentoref IS NULL
            AND movto_sdl_ant_SAI_val.iduoalmox = ad_movimento.iduoalmox
            AND movto_sdl_ant_SAI_val.idmaterial = ad_movimento.idmaterial
            AND movto_sdl_ant_SAI_val.tipomovimento = '3'
            AND movto_sdl_ant_SAI_val.datamov < '$dataInicio'
          ), 0)))

+

COALESCE((SELECT SUM(movto_ENT_qtd.quantidade)
          FROM ad_movimento movto_ENT_qtd
          WHERE movto_ENT_qtd.idmovimentoref IS NULL
            AND movto_ENT_qtd.iduoalmox = ad_movimento.iduoalmox
            AND movto_ENT_qtd.idmaterial = ad_movimento.idmaterial
            AND movto_ENT_qtd.tipomovimento = '1'
            AND movto_ENT_qtd.datamov >= '$dataInicio'
            AND movto_ENT_qtd.datamov < '$dataFim'
          ), 0)

+

COALESCE((SELECT SUM(movto_ENT_val.valortotal)
          FROM ad_movimento movto_ENT_val
          WHERE movto_ENT_val.idmovimentoref IS NULL
            AND movto_ENT_val.iduoalmox = ad_movimento.iduoalmox
            AND movto_ENT_val.idmaterial = ad_movimento.idmaterial
            AND movto_ENT_val.tipomovimento = '1'
            AND movto_ENT_val.datamov >= '$dataInicio'
            AND movto_ENT_val.datamov < '$dataFim'
          ), 0)

+

COALESCE((SELECT SUM(movto_SAI_qtd.quantidade)
          FROM ad_movimento movto_SAI_qtd
          WHERE movto_SAI_qtd.idmovimentoref IS NULL
            AND movto_SAI_qtd.iduoalmox = ad_movimento.iduoalmox
            AND movto_SAI_qtd.idmaterial = ad_movimento.idmaterial
            AND movto_SAI_qtd.tipomovimento = '3'
            AND movto_SAI_qtd.datamov >= '$dataInicio'
            AND movto_SAI_qtd.datamov < '$dataFim'
          ), 0)

+

COALESCE((SELECT SUM(movto_SAI_val.valortotal)
          FROM ad_movimento movto_SAI_val
          WHERE movto_SAI_val.idmovimentoref IS NULL
            AND movto_SAI_val.iduoalmox = ad_movimento.iduoalmox
            AND movto_SAI_val.idmaterial = ad_movimento.idmaterial
            AND movto_SAI_val.tipomovimento = '3'
            AND movto_SAI_val.datamov >= '$dataInicio'
            AND movto_SAI_val.datamov < '$dataFim'
          ), 0) <> 0


ORDER BY ad_subelemento.idsubelemento,
ad_subelemento.descricao,
ad_material.codmaterial,
ad_material.descricao,
ad_material.unidade

";



try {
	$db = Conexao::getInstance()->getDB();

	$preparedStatment = $db->prepare($sql);


	$preparedStatment->execute();


	$rows = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);

	Conexao::getInstance()->disconnect();
} catch (Exception $e) {
	$e->getMessage();
}


$dataHelper = new DataHelper();

$baseURL = 'http://' . $_SERVER['HTTP_HOST'];
$css0 = $baseURL . '/relatorios2/view/statics/css/estilo2.css';
$css3 = $baseURL . '/relatorios2/view/statics/css/demo_table_jui.css';
$css4 = $baseURL . '/relatorios2/view/statics/css/jquery-ui-1.8.21.custom.css';

$js1 = $baseURL . '/relatorios2/view/statics/js/jquery.js';
$js2 = $baseURL . '/relatorios2/view/statics/js/jquery.dataTables.js';
$js3 = $baseURL . '/relatorios2/view/statics/js/jquery.dataTables.js';

$tmpFile = tempnam('/tmp', 'pdf_');

// Url utilizada no link de impressão do relatório. ( mandando o html )
$url = $baseURL . '/relatorios2/PRINT_PDF/print_pdf.php?input_file=' . rawurlencode($tmpFile);

$arraySize = count($rows);

$titulo = "INVENTÁRIO FÍSICO DA $uo";

$mesDescricao="";

switch($mesReferencia){
	case 1: {	$mesDescricao="JANEIRO"; break;}
	case 2: {	$mesDescricao="FEVEREIRO"; break;}
	case 3: {	$mesDescricao="MARÇO"; break;}
	case 4: {	$mesDescricao="ABRIL"; break;}
	case 5: {	$mesDescricao="MAIO"; break;}
	case 6: {	$mesDescricao="JUNHO"; break;}
	case 7: {	$mesDescricao="JULHO"; break;}
	case 8: {	$mesDescricao="AGOSTO"; break;}
	case 9: {	$mesDescricao="SETEMBRO"; break;}
	case 10: {	$mesDescricao="OUTUBRO"; break;}
	case 11: {	$mesDescricao="NOVEMBRO"; break;}
	case 12: {	$mesDescricao="DEZEMBRO"; break;}
}

$periodo = "PERÍODO DE REFERÊNCIA: $mesDescricao/$anoReferencia";

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
	<head>
		<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

		<link rel="stylesheet" type="text/css" href="<?php echo $css0; ?>" />
		<link rel="stylesheet" type="text/css" href="<?php echo $css1; ?>" />
		<link rel="stylesheet" type="text/css" href="<?php echo $css2; ?>" />
		<link rel="stylesheet" type="text/css" href="<?php echo $css3; ?>" />
		<link rel="stylesheet" type="text/css" href="<?php echo $css4; ?>" />
<!--		<link rel="stylesheet" type="text/css" href="<?php echo $css0; ?>" />-->
		<script type="text/javascript" src="<?php echo $js1 ?>"></script>
		<style type="text/css" media="screen">

			.dataTables_info { padding-top: 0; }
			.dataTables_paginate { padding-top: 0; }
			.css_right { float: right; }
			#tabela_wrapper .fg-toolbar { font-size: 0.8em }
			#theme_links span { float: left; padding: 2px 10px; }

		</style>

		<script type="text/javascript" src="<?php echo $js2 ?>"></script>
		<script type="text/javascript" charset="utf-8">
			$(document).ready( function() {
				$('#tabela').dataTable( {
					"fnDrawCallback": function ( oSettings ) {
						if ( oSettings.aiDisplay.length == 0 )
						{
							return;
						}

						var nTrs = $('#tabela tbody tr');
						var iColspan = nTrs[0].getElementsByTagName('td').length;
						var sLastGroup = "";
						for ( var i=0 ; i<nTrs.length ; i++ )
						{
							var iDisplayIndex = oSettings._iDisplayStart + i;
							var sGroup = oSettings.aoData[ oSettings.aiDisplay[iDisplayIndex] ]._aData[0];
							if ( sGroup != sLastGroup )
							{
								var nGroup = document.createElement( 'tr' );
								var nCell = document.createElement( 'td' );
								nCell.colSpan = iColspan;
								nCell.className = "group";
								nCell.innerHTML = sGroup;
								nGroup.appendChild( nCell );
								nTrs[i].parentNode.insertBefore( nGroup, nTrs[i] );
								sLastGroup = sGroup;
							}
						}
					},
					"aoColumnDefs": [
						{ "bVisible": false, "aTargets": [ 0 ] }
					],
					"oLanguage": {

						"sSearch": "Procurar",
						"sLengthMenu": "Mostrar _MENU_ registros por página",
						"sZeroRecords": "Nada encontrado - 0",
						"sInfo": "Mostrando _START_ até _END_ de _TOTAL_ Registros",
						"sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
						"sInfoFiltered": "(Filtrado de _MAX_ registros no total)"
					},
					"bJQueryUI": true,
					"aLengthMenu": [[-1, 10, 25, 50,100,200,500,1000,5000], ['Todos', 10, 25, 50,100,200,500,1000,5000]],
					"iDisplayLength": -1,
					"sPaginationType": "full_numbers",
					"aaSorting": [[ 1, "asc" ]],
                                        "aoColumns": [ 
                                            null,
                                            null,
                                            null,
                                            null,
                                            null,
//                                            { "bSortable": false },
//                                            { "bSortable": false },
                                            { "sType": "currency" },
                                            { "sType": "currency" },                                            
                                            null,
//                                            { "bSortable": false },
//                                            { "bSortable": false },
                                            { "sType": "currency" },
                                            { "sType": "currency" },
                                            null,
//                                            { "bSortable": false },
//                                            { "bSortable": false },
                                            { "sType": "currency" },
                                            { "sType": "currency" },
                                            null,
//                                            { "bSortable": false },
//                                            { "bSortable": false },
                                            { "sType": "currency" },
                                            { "sType": "currency" },
                                            
                                        ]
				} );
			} );
		</script>

		<title><?php
				echo $titulo;

		?></title>
	</head>
	<body>

		<?php include_once '../statics/cabecalho.php'; ?>

		<div id="menu">
				<a onclick="javascript:history.go(-1);">Voltar&nbsp&nbsp&nbsp&nbsp&nbsp</a><br/>

			</div>
		<div id="conteudo">





			<table cellpadding="0" cellspacing="0" border="0" class="display" id="tabela" style="width: 100%;">
				<thead>
					<tr>
						<th rowspan="2" >SubItem</th>
						<th rowspan="2" >SubElemento</th>
						<th rowspan="2" >Material</th>
						<th rowspan="2">Unidade</th>
						<th colspan="3" style="color: white;background-color: darkgreen ;border: 1px darkslategray double"  >Saldo Anterior</th>
						<th colspan="3" style="color: white;background-color: darkgreen ;border: 1px darkslategray double">Entrada Atual</th>
						<th colspan="3" style="color: white;background-color: darkgreen ;border: 1px darkslategray double">Saída Atual</th>
						<th colspan="3" style="color: white;background-color: darkgreen ;border: 1px darkslategray double">Saldo Total</th>

					</tr>
					<tr>
						<th>Quantidade</th>
						<th>Preço Médio(R$)</th>
						<th>Valor</th>
						<th>Quantidade</th>
						<th>Preço Médio(R$)</th>
						<th>Valor</th>
						<th>Quantidade</th>
						<th>Preço Médio(R$)</th>
						<th>Valor</th>
						<th>Quantidade</th>
						<th>Preço Médio(R$)</th>
						<th>Valor</th>
					</tr>
				</thead>
				<tbody>
					<?php
					$arraySize = count($rows);
					$flagSub =  $rows[0]['idsubelemento'];

					$qtTotalAnterior=0;

					for ($i = 0; $i < $arraySize; $i++) {

						$idsubelemento	= $rows[$i]['idsubelemento'];
						$idsubelementoProx	= $rows[$i+1]['idsubelemento'];
						$descricaosub	= $rows[$i]['descricaosub'];
						$descricaomat	= $rows[$i]['descricaomat'];
						$unidade		= $rows[$i]['unidade'];
						$qtd_sld_ant	= $rows[$i]['qtd_sld_ant'];
						$val_sld_ant	= $rows[$i]['val_sld_ant'];
						$qtd_ent		= $rows[$i]['qtd_ent'];
						$val_ent		= $rows[$i]['val_ent'];
						$qtd_sai		= $rows[$i]['qtd_sai'];
						$val_sai		= $rows[$i]['val_sai'];



						if ($qtd_sld_ant != 0) {
							$precoAnterior = $val_sld_ant / $qtd_sld_ant;
							$precoAnterior = number_format($precoAnterior, 2, ',', '.');
						} else {
							$precoAnterior = "0,00";
						}
						if ($qtd_ent != 0) {
							$precoAtualEn = $val_ent / $qtd_ent;
							$precoAtualEn = number_format($precoAtualEn, 2, ',', '.');
						} else {
							$precoAtualEn = "0,00";
						}
						if ($qtd_sai != 0) {
							$precoAtualSai = $val_sai / $qtd_sai;
							$precoAtualSai = number_format($precoAtualSai, 2, ',', '.');
						} else {
							$precoAtualSai = "0,00";
						}
						/*-------------------SUBTOTAIS--------------------------------*/
						$qtTotalAnterior=$qtTotalAnterior+$qtd_sld_ant;
						$precoTotalAnterior=$precoTotalAnterior+$val_sld_ant;

						$qtTotalEntrada=$qtTotalEntrada+$qtd_ent;
						$precoTotalEntrada=$precoTotalEntrada+$val_ent;

						$qtTotalSaida=$qtTotalSaida+$qtd_sai;
						$precoTotalSaida=$precoTotalSaida+$val_sai;



						/*----------------- Saldo Total (saldo para ano)--------------------*/

						$qtSaldoTotal=$qtd_sld_ant+$qtd_ent-$qtd_sai;
						$precoSaldoTotal=$val_sld_ant+$val_ent-$val_sai;

						if($qtSaldoTotal != 0){
							$precoMedioSaldoTotal=$precoSaldoTotal/$qtSaldoTotal;
						}else{
							$precoMedioSaldoTotal="0,00";
						}

						/*-------------------- SUBTOTAL DO SALDO  TOTAL-----------------*/

						$qtSubtotal=$qtSubtotal+$qtSaldoTotal;
						$precoSubtotal=$precoSubtotal+$precoSaldoTotal;

						if($qtSubtotal != 0){

							$precoMedioSubtotal=$precoSubtotal/$qtSubtotal;
						}else{
							$precoMedioSubtotal="0,00";
						}
						/*--------------------------  TOTAL GERAL  ---------------------------*/

						$totalGeralQtAnterior=$totalGeralQtAnterior+$qtd_sld_ant;
						$totalGeralPrecoAnterior=$totalGeralPrecoAnterior+$val_sld_ant;
						$totalGeralQtEntrada=$totalGeralQtEntrada+$qtd_ent;
						$totalGeralPrecoEntrada=$totalGeralPrecoEntrada+$val_ent;
						$totalGeralQtSaida=$totalGeralQtSaida+$qtd_sai;
						$totalGeralPrecoSaida=$totalGeralPrecoSaida+$val_sai;

						$totalGeralSubQt=$totalGeralQtAnterior+$totalGeralQtEntrada-$totalGeralQtSaida;
						$totalGeralSubPreco=$totalGeralPrecoAnterior+$totalGeralPrecoEntrada-$totalGeralPrecoSaida;

						/*--------------------------------------------------------------------------*/
						if ($flagSub ==  $idsubelementoProx ) {



							$val_sld_ant = number_format($val_sld_ant, 2, ',', '.');
							$val_ent = number_format($val_ent, 2, ',', '.');
							$val_sai = number_format($val_sai, 2, ',', '.');

							$precoMedioSaldoTotal=number_format($precoMedioSaldoTotal, 2, ',', '.');
							$precoSaldoTotal=number_format($precoSaldoTotal, 2, ',', '.') ;
							?>

							<tr>

								<td><?php echo $descricaosub; ?></td>
								<td style="text-align: center;"><?php echo $idsubelemento;
					 ?></td>
								<td ><?php echo $descricaomat; ?></td>
								<td style="text-align: center;"><?php echo $unidade; ?></td>
								<td style="text-align: right;"><?php echo $qtd_sld_ant; ?></td>
								<td style="text-align: right;"><?php echo $precoAnterior; ?></td>
								<td style="text-align: right;"><?php echo $val_sld_ant; ?></td>
								<td style="text-align: right;"><?php echo $qtd_ent; ?></td>
								<td style="text-align: right;"><?php echo $precoAtualEn; ?></td>
								<td style="text-align: right;"><?php echo $val_ent; ?></td>
								<td style="text-align: right;"><?php echo $qtd_sai; ?></td>
								<td style="text-align: right;"><?php echo $precoAtualSai; ?></td>
								<td style="text-align: right;"><?php echo $val_sai; ?></td>
								<td style="text-align: right;"><?php echo $qtSaldoTotal; ?></td>
								<td style="text-align: right;"><?php echo $precoMedioSaldoTotal; ?></td>
								<td style="text-align: right;"><?php echo $precoSaldoTotal; ?></td>

							</tr>




							<?php
						} else {
							$flagSub = $idsubelementoProx;


							$val_sld_ant = number_format($val_sld_ant, 2, ',', '.');
							$val_ent = number_format($val_ent, 2, ',', '.');
							$val_sai = number_format($val_sai, 2, ',', '.');

							$precoMedioSaldoTotal=number_format($precoMedioSaldoTotal, 2, ',', '.');
							$precoSaldoTotal=number_format($precoSaldoTotal, 2, ',', '.') ;

							$precoSubtotal=number_format($precoSubtotal, 2, ',', '.') ;
							$precoMedioSaldoTotal=number_format($precoMedioSaldoTotal, 2, ',', '.') ;
							?>

							<tr>

								<td><?php echo $descricaosub; ?></td>
								<td style="text-align: center;"><?php echo $idsubelemento; ?></td>
								<td ><?php echo $descricaomat; ?></td>
								<td style="text-align: center;"><?php echo $unidade; ?></td>
								<td style="text-align: right;"><?php echo $qtd_sld_ant; ?></td>
								<td style="text-align: right;"><?php echo $precoAnterior; ?></td>
								<td style="text-align: right;"><?php echo $val_sld_ant; ?></td>
								<td style="text-align: right;"><?php echo $qtd_ent; ?></td>
								<td style="text-align: right;"><?php echo $precoAtualEn; ?></td>
								<td style="text-align: right;"><?php echo $val_ent; ?></td>
								<td style="text-align: right;"><?php echo $qtd_sai; ?></td>
								<td style="text-align: right;"><?php echo $precoAtualSai; ?></td>
								<td style="text-align: right;"><?php echo $val_sai; ?></td>
								<td style="text-align: right;"><?php echo $qtSaldoTotal; ?></td>
								<td style="text-align: right;"><?php  echo $precoMedioSaldoTotal; ?></td>
								<td style="text-align: right;"><?php  echo $precoSaldoTotal; ?></td>

							</tr >
							<tr >


								<td><?php echo $descricaosub; ?></td>
								<td style="text-align: center;"><?php echo $idsubelemento; ?></td>
								<td style="text-align: center;" ><?php echo "<b>  SUBTOTAL</b>";?></td>
								<td style="text-align: center;"><?php echo " - "; ?></td>
								<td style="text-align: right;"><?php echo $qtTotalAnterior; $qtTotalAnterior=0; ?></td>
								<td style="text-align: right;"><?php echo " - "; ?></td>
								<td style="text-align: right;"><?php $precoTotalAnterior = number_format($precoTotalAnterior, 2, ',', '.');echo $precoTotalAnterior; $precoTotalAnterior=0; ?></td>
								<td style="text-align: right;"><?php echo $qtTotalEntrada; $qtTotalEntrada=0; ?></td>
								<td style="text-align: center;"><?php echo " - "; ?></td>

								<td style="text-align: right;"><?php $precoTotalEntrada=number_format($precoTotalEntrada, 2, ',', '.');echo $precoTotalEntrada; $precoTotalEntrada=0;?></td>
								<td style="text-align: right;"><?php echo $qtTotalSaida;$qtTotalSaida=0; ?></td>
								<td style="text-align: right;"><?php echo " - "; ?></td>
								<td style="text-align: right;"><?php $precoTotalSaida=number_format($precoTotalSaida, 2, ',', '.');echo $precoTotalSaida;$precoTotalSaida=0; ?></td>
								<td style="text-align: right;"><?php echo $qtSubtotal;$qtSubtotal=0; ?></td>
								<td style="text-align: right;"><?php echo " - " ?></td>
								<td style="text-align: right;"><?php echo $precoSubtotal;$precoSubtotal=0; ?></td>



							</tr>



							<?php
						}
					}unset($rows);
					?>
						<tfoot style="background-color: #D1CFD0;"><?php

								$totalGeralPrecoAnterior=number_format($totalGeralPrecoAnterior, 2, ',', '.');
								$totalGeralPrecoEntrada=number_format($totalGeralPrecoEntrada, 2, ',', '.');
								$totalGeralPrecoSaida=number_format($totalGeralPrecoSaida, 2, ',', '.');
								$totalGeralSubPreco=number_format($totalGeralSubPreco, 2, ',', '.');

							?>
							<td><?php echo "TOTAL"; ?></td>
							<td style="text-align: center;"><?php //echo $idsubelemento; ?></td>
							<td style="text-align: center;" ><?php echo "<b>  TOTAL</b>";?></td>
							<td style="text-align: center;"><?php echo " - "; ?></td>
							<td style="text-align: right;"><?php echo $totalGeralQtAnterior; ?></td>
							<td style="text-align: right;"><?php echo " - "; ?></td>
							<td style="text-align: right;"><?php echo $totalGeralPrecoAnterior; ?></td>
							<td style="text-align: right;"><?php echo $totalGeralQtEntrada;  ?></td>
							<td style="text-align: center;"><?php echo " - "; ?></td>

							<td style="text-align: right;"><?php echo $totalGeralPrecoEntrada; ?></td>
							<td style="text-align: right;"><?php echo $totalGeralQtSaida; ?></td>
							<td style="text-align: right;"><?php echo " - "; ?></td>
							<td style="text-align: right;"><?php echo $totalGeralPrecoSaida; ?></td>
							<td style="text-align: right;"><?php echo $totalGeralSubQt; ?></td>
							<td style="text-align: right;"><?php echo " - " ?></td>
							<td style="text-align: right;"><?php echo $totalGeralSubPreco; ?></td>
						</tfoot>
				</tbody>
			</table>


		</div>


	</body>
</html>

<?php file_put_contents($tmpFile, ob_get_contents()); ?>



<?php
