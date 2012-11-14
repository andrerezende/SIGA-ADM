<?php
ob_start();
//ini_set('memory_limit', '128M');
require_once '../../model/DAO/Conexao.php';
require_once '../../controller/DataHelper.php';

//define('WP_MEMORY_LIMIT','100M');



$tombo = $_GET['tombo'];
$setorOrigem = $_GET['setororigem'];
$setorDestino = $_GET['setordestino'];

$datainicio = $_GET['datainicio'];
$datafim = $_GET['datafim'];

$instOrigem = $_GET['instOrigem'];
$instDestino = $_GET['instDestino'];

$sql = "
	
	select TO_CHAR(m.data,'DD/MM/YYYY') as data,
	m.data as i,
	i.iditempatrimonio as tombo,
	i.descricao as descricao,
	s1.siglasetor as origem,
	s2.siglasetor as destino,
	u.login as login
	from ad_movimentopat m inner join ad_itempatrimonio i ON m.iditempatrimonio=i.iditempatrimonio
	LEFT JOIN cm_setor s1 on m.idsetororigem=s1.idsetor
	LEFT JOIN cm_setor s2 on m.idsetordestino=s2.idsetor
	LEFT JOIN cm_usuario u on m.idusuario=u.idusuario

	where m.tipomovimento='2'
	AND i.ativo='S' 

 ";


if ($tombo || $setorOrigem || $setorDestino || $datainicio || $datafim || $instOrigem || $instDestino) {
    if ($tombo) {
        $sql.=" AND i.iditempatrimonio=$tombo";
    }
    if ($setorOrigem) {
        $sql.=" AND m.idsetororigem=$setorOrigem";
    }
    if ($setorDestino) {
        $sql.=" AND m.idsetordestino=$setorDestino";
    }
    if ($datainicio) {
        $sql.=" AND m.data >=" . "'" . $datainicio . "'";
    }
    if ($datafim) {
        $sql.=" AND m.data <=" . "'" . $datafim . "'";
    }
    if ($instOrigem) {
        $sql.=" AND s1.idinstituicao =" . "'" . $instOrigem . "       '";
    }
    if ($instDestino) {
        $sql.=" AND s2.idinstituicao =" . "'" . $instDestino . "       '";
    }
}

$sql.=" order by 2 DESC ,3 ";


try {
    $db = Conexao::getInstance()->getDB();

    $preparedStatment = $db->prepare($sql);


    $preparedStatment->execute();


    $rows = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);
    //var_dump($rows);exit;
    //--------------------------------------------------setor Origem-------------------

    $db = Conexao::getInstance()->getDB();

    $sql2 = "select siglasetor from cm_setor where idsetor=$setorOrigem";



    $preparedStatment = $db->prepare($sql2);

    $preparedStatment->execute();


    $setorOrigem = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);


    $db = Conexao::getInstance()->getDB();

    $sql3 = "select instituicao from cm_instituicao where idinstituicao=$instOrigem";



    $preparedStatment = $db->prepare($sql3);


    $preparedStatment->execute();


    $instOrigem = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);

    //------------------------------------------Setor Destino -------------------------------------------------


    $db = Conexao::getInstance()->getDB();

    $sql4 = "select siglasetor from cm_setor where idsetor=$setorDestino";

    $preparedStatment = $db->prepare($sql4);



    $preparedStatment->execute();


    $setorDestino = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);


    $db = Conexao::getInstance()->getDB();


    $sql5 = "select instituicao from cm_instituicao where idinstituicao=$instDestino";

    $preparedStatment = $db->prepare($sql5);


    $preparedStatment->execute();



    $instDestino = $preparedStatment->fetchAll(PDO::FETCH_ASSOC);

    //-------------------------------------------------------------------------------------------------------------
    Conexao::getInstance()->disconnect();
} catch (Exception $e) {
    $e->getMessage();
}



$dataHelper = new DataHelper();

$baseURL = 'http://' . $_SERVER['HTTP_HOST'];
//$css = $baseURL.'/relatorios2/view/statics/css/estilo.css';
$css0 = $baseURL . '/relatorios2/view/statics/css/estilo3.css';
$css3 = $baseURL . '/relatorios2/view/statics/css/demo_table_jui.css';
$css4 = $baseURL . '/relatorios2/view/statics/css/jquery-ui-1.8.21.custom.css';

$js1 = $baseURL . '/relatorios2/view/statics/js/jquery.js';
$js2 = $baseURL . '/relatorios2/view/statics/js/jquery.dataTables.js';
$js3 = $baseURL . '/relatorios2/view/statics/js/formatted-currency-asc.js';
// Arquivo temporário que será utilizado para gerar o PDF.
$tmpFile = tempnam('/tmp', 'pdf_');

// Url utilizada no link de impressão do relatório. ( mandando o html )
$url = $baseURL . '/relatorios2/PRINT_PDF/print_pdf.php?input_file=' . rawurlencode($tmpFile);



//echo $dnotafiscal = $_GET['notafiscal'];
//die("$mesRelatorio // $idInstituicao // $instituicao // $idVidaUtil");
//print_r($itens);exit;



/* if(!$itens) {
  ?>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <script>
  alert("Não encontrado.");
  history.go(-1);
  </script>
  <?
  } else { */
$arraySize = count($rows);
// tratar titulo : By Danilo Merçon

$titulo1 = "RELATÓRIO DE TRANSFERÊNCIA DE ITENS PATRIMONIAIS";
$titulo = "RELATÓRIO DE TRANSFERÊNCIA DE ITENS PATRIMONIAIS<br/>";
if ($tombo == "") {
    $titulo;
} else {
    $titulo .= "TOMBO: " . $tombo."<br/>";
}

if ($instOrigem[0]['instituicao'] == "" && $instDestino[0]['instituicao'] == "") {
    $titulo;
} elseif($instDestino[0]['instituicao'] == "") {
    $titulo .= "INSTITUTO DE ORIGEM: " . $instOrigem[0]['instituicao']."<br/>";
}
  elseif ($instOrigem[0]['instituicao'] == "") {
    $titulo .= "INSTITUTO DE DESTINO: " . $instDestino[0]['instituicao']."<br/>";
} else {
    $titulo .= "INSTITUTO DE ORIGEM: " . $instOrigem[0]['instituicao'] . " &nbsp; | &nbsp;" . " DESTINO: " . $instDestino[0]['instituicao']."<br/>";
}

if ($setorOrigem[0]['siglasetor'] == "" && $setorDestino[0]['siglasetor'] == "") {
    $titulo;
} elseif ($setorDestino[0]['siglasetor'] == "") {
    $titulo .= "SETOR DE ORIGEM: " . $setorOrigem[0]['siglasetor']."<br/>";
}
  elseif ($setorOrigem[0]['siglasetor'] == "") {
    $titulo.= "  SETOR DE DESTINO: " . $setorDestino[0]['siglasetor']."<br/>";
} else {
    $titulo .= "SETOR DE ORIGEM: " . $setorOrigem[0]['siglasetor']." &nbsp;| &nbsp;"." DESTINO: " . $setorDestino[0]['siglasetor']."<br/>";
}

if ($datafim === "" && $datainicio === "") {
    $titulo;
} elseif ($datainicio === "") {
    $titulo .= "DATA FINAL: " . $datafim;
} elseif ($datafim === "") {
    $titulo .= "DATA INICIAL: " . $datainicio;
} else {
    $titulo .= "PERÍODO: &nbsp;&nbsp;" . $datainicio . " A " . $datafim;
}






if ($tombo || $setorOrigem || $setorDestino || $datainicio || $datafim) {
    $filtro = "Filtros: ";
}
if ($tombo) {
    $filtrotombo = "<br/>Tombo:&nbsp " . $tombo . " ";
}
if ($setorOrigem) {
    $filtrosetorOrigem = "<br/>Setor de Origem:&nbsp " . $setorOrigem[0]['siglasetor'] . " ";
}
if ($setorDestino) {
    $filtrosetorDestino = "<br/>Setor de Destino:&nbsp" . $setorDestino[0]['siglasetor'] . " ";
}

if ($datainicio) {
    $filtrodatainicio = "<br/>A partir de :&nbsp" . $datainicio . " ";
}
if ($datafim) {
    $filtrodatafim = "<br/>Até:&nbsp" . $datafim . " ";
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <head>
        <meta http-equiv="content-type" content="text/html;charset=UTF-8" />

        <link rel="stylesheet" type="text/css" href="<?php echo $css0; ?>" />
        <link rel="stylesheet" type="text/css" href="<?php echo $css3; ?>" />
        <link rel="stylesheet" type="text/css" href="<?php echo $css4; ?>" />

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
                    "aaSorting": [],                                        
                    "aoColumnDefs": [  //{ "bSortable": false, "aTargets": [ 4 ] } ,
                        {  "sType": "date-uk", "aTargets": [ 0 ]},
                        {  "sType": "currency", "aTargets": [  ]},
                        {  "sType": "formatted-num", "aTargets": [  ]},
                        //                                                         {  "sType": "formatted-num", "aTargets": [  ]}                                                         
                    ]
                         
                } );
            } );
        </script>
        </script>
        <title><?php echo $titulo1; ?></title>                    
    </head>
    <body align="center">

        <?php //ob_start();       ?>
        <div id="conteudo">

            <?php require_once '../statics/cabecalho.php'; ?>
            <!--            <div id="menu">
                            <a onclick="javascript:history.go(-1);">Voltar&nbsp&nbsp&nbsp&nbsp&nbsp</a><br/>
                            <a href="<?php // echo $url;   ?>">Imprimir Relatório <img src="../statics/img/action_print.gif" alt="Imprimir Relatório" /></a>
                        </div>-->
            <div id="menu"><br/></div>
            <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabela" style="width: 100%">
                <thead> 
                    <tr>                                
                        <td class="data">Data da Transferência</td>
                        <td class="descricao">Tombo</td>
                        <td class="valores">Descrição</td>
                        <td class="descricao">Setor de Origem</td>
                        <td class="valores">Setor de Destino</td>
                        <td class="valores">Usuário</td>
                    </tr>
                </thead> 
                <tbody>
                    <?php
                    $saldoTotal = 0;
                    for ($i = 0; $i < count($rows); $i++) {
                        $saldoTotal += $rows[$i]['valor'];
                        ?>                              
                        <tr>                                     
                            <td class="valores" style="text-align: center;"><?php echo $rows[$i]['data']; ?></td>
                            <td class="valores" style="text-align: center;"><?php echo $rows[$i]['tombo']; ?></td>
                            <td class="valores" style="text-align: left;"><?php echo $rows[$i]['descricao']; ?></td>
                            <td class="valores" style="text-align: center;"><?php echo $rows[$i]['origem']; ?></td>
                            <td class="valores" style="text-align: center;"><?php echo $rows[$i]['destino']; ?></td>
                            <td class="valores" style="text-align: center;"><?php echo $rows[$i]['login']; ?></td>
                        </tr>                            
                        <?php
                    }
                    ?>
                    <tfoot style="background-color: #D1CFD0;">                                    
                        <td class="valores" style="text-align: center;">--</td>
                        <td class="valores" style="text-align: center;">--</td>
                        <td class="valores" style="text-align: center;">--</td>
                        <td class="valores" style="text-align: center;">--</td>
                        <td class="valores" style="text-align: center;">--</td>                                    
                        <td class="valores" style="text-align: center;">--</td>                                    
                    </tfoot>                         
                </tbody>    
            </table>                        
        </div>
    </body>
</html>

<?php file_put_contents($tmpFile, ob_get_contents()); ?>



<?php
