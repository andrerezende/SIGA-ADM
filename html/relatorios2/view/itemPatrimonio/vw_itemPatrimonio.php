<?php
ini_set('memory_limit', '1024M');
ob_start();

ini_set('display_errors', 1);
require_once '../../controller/ItemPatrimonio.php';
require_once '../../controller/DataHelper.php';
require_once '../../model/DAO/DAOItemPatrimonio.php';
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
$siglaSetor = $_GET['siglasetor'];
$filtradoPor = $_GET['filtradoPor'];
$idSetor = $_GET['idSetor'];
$idInstituicao = $_GET['idInstituicao'];
$idVidautil = $_GET['idVidaUtil'];
$numeroEmpenho = $_GET['numeroEmpenho'];
$cnpj = $_GET['cnpj'];
$orderby = $_GET['orderby'];
$itemPatrimonio = new DAOItemPatrimonio();
//var_dump($idSetor,$idInstituicao,$idVidautil, $numeroEmpenho, $cnpj, $orderby);exit;
$nomesInstituicoes = $itemPatrimonio->getNomesInstituicoes(array('idInstituicao' => $idInstituicao));
$rows = ItemPatrimonio::ItemPatrimonioBy($idSetor, $idInstituicao, $idVidautil, $numeroEmpenho, $cnpj, $orderby);

//var_dump($nomesInstituicoes);exit;
$nomes = 0;

//if ($filtradoPor == "instituicao")
//    $filtro = "Instituição: " . $rows[0]['instituicao'];
//else if ($filtradoPor == "setor")
//    $filtro = "Setor: " . $rows[0]['siglasetor'];
//else if ($filtradoPor == "vidautil")
//    $filtro = "Conta contábil: " . $rows[0]['idvidautil'];
//else if ($filtradoPor == "empenho")
//    $filtro = "Número Empenho: " . $rows[0]['numeroempenho'];
//else if ($filtradoPor == "cnpj")
//    $filtro = "CNPJ: " . $rows[0]['cnpj'];
//else
//    $filtro = "nao definido";
//echo $rows[0]['idInstituicao'];
//if (!$rows) {
//    
?>
<!--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script>
        alert("Não encontrado.");
        history.go(-1);
    </script>-->
<?
//} else 
//{
//$saldoTotal = 0;
for ($i = 0;
$i < count($rows);
$i++) {
$ccontabil = $rows[$i]['idvidautil'];
$siglasetor = $rows[$i]['siglasetor'];
}
for ($i = 0;$i < count($nomesInstituicoes);$i++) {
$nomes .= $nomesInstituicoes[$i]['nome'] . " | ";
}
//var_dump($nomes);exit;

$arraySize = count($rows);
$titulo = "RELATÓRIO DE ITENS PATRIMONIAIS";
$titulo1 = "RELATÓRIO DE ITENS PATRIMONIAIS";

if ($nomes == '') {
$titulo1;
} else {
$titulo1 .= '<br>INSTITUIÇÕES: ' . $nomes;
}
if ($siglaSetor == '') {
$titulo1;
} else {
$titulo1 .= '<br>SETOR: ' . $siglaSetor;
}
if ($idVidautil == '') {
$titulo1;
} else {
$titulo1 .= '<br>C. CONTÁBIL: ' . $idVidautil;
}
if ($numeroEmpenho == '') {
$titulo1;
} else {
$titulo1 .= '<br>NUMERO EMPENHO: ' . $numeroEmpenho;
}
if ($cnpj == '') {
$titulo1;
} else {
$titulo1 .= '<br>CNPJ: ' . $cnpj;
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
                    "iDisplayLength": 10,
                    "sPaginationType": "full_numbers",
                    "aaSorting": [],                                        
                    "aoColumnDefs": [  //{ "bSortable": false, "aTargets": [ 4 ] } ,
                        {  "sType": "date-uk", "aTargets": [ 8 ]},
                        {  "sType": "date-uk", "aTargets": [ 9 ]},
                        {  "sType": "date-uk", "aTargets": [ 10 ]},
                        {  "sType": "currency", "aTargets": [ 4 ]},
                        {  "sType": "currency", "aTargets": [ 7 ]},
                        {  "sType": "formatted-num", "aTargets": [ 2 ]},
                        //                     {  "sType": "formatted-num", "aTargets": [  ]}                                                         
                    ]
                         
                } );
            } );
        </script>
        </script>
        <title><?php echo $titulo; ?></title>                    
    </head>
    <body align="center">

<?php //ob_start();       ?>
        <div id="conteudo">      

<?php require_once '../statics/cabecalho_1.php'; ?>
            <!--                            <div id="menu">
                                            <a onclick="javascript:history.go(-1);">Voltar&nbsp&nbsp&nbsp&nbsp&nbsp</a><br/>
                                            <a href="<?php // echo $url;      ?>">Imprimir Relatório <img src="../statics/img/action_print.gif" alt="Imprimir Relatório" /></a>
                                        </div>-->
            <div id="menu">
                <!--<a onclick="javascript:history.go(-1);">Voltar&nbsp&nbsp&nbsp&nbsp&nbsp</a><br/>
                <a href="<?php echo $exc; ?>">Gerar Planilha <img src="../statics/img/action_print.gif" alt="Imprimir Relatório" /></a>-->
            </div>
          <form name="" method="post">
               <input type="submit" name="Enviar" id="Enviar" value="Gerar Planilha"/>
           </form>
            <?php
            header ("Last-Modified: " . gmdate("D,d M YH:i:s") . " GMT");
            header ("Cache-Control: no-cache, must-revalidate");
            header ("Pragma: no-cache");
            if(isset($_POST["Enviar"])){
              header ("Content-type: application/x-msexcel");
              header ("Content-Disposition: attachment; filename = \"Relatorio.xls\"" );
            }
                    $saldoTotal = 0;
                    
                    

             echo "
            <table cellpadding = '0' cellspacing = '0' border = '0' class = 'display' id = 'tabela' style = 'width: 30%'>
                <thead>
                    <tr>
                        <th class = 'valores' >Nº Tombo</th>
                        <th class = 'descricao'>Descrição</th>
                        <th class = 'valores'>Valor (R$)</th>
                        <th class = 'valores'>C. Contábil</th>
                        <th class = 'valores'>Setor</th>
                        <th class = 'valores'>Nº Empenho</th>
                        <th class = 'valores'>NF</th>
                        <th class = 'valores'>CNJP</th>
                        <th class = 'data'>Data Ateste</th>
                        <th class = 'data'>Data de Aquisição</th>
                        <th class = 'data'>Data de início de uso</th>
                    </tr>
                </thead>
                <tbody>"; 
                    
             
                for ($i = 0;$i < count($rows);$i++) {
                    
                    $saldoTotal += $rows[$i]['itempat_valor'];
                    $siglasetor = $rows[$i]['siglasetor'];
                    $iditemp = $rows[$i]['iditempatrimonio'];
                    $itempat = $rows[$i]['itempat_descricao'];
                    $itempatv = $rows[$i]['itempat_valor'];
                    $idvida = $rows[$i]['idvidautil'];
                    $siglas = $rows[$i]['siglasetor'];
                    $numeroe = $rows[$i]['numeroempenho'];
                    $notaf = $rows[$i]['notafiscal'];
                    $cnpjtab = $rows[$i]['cnpj']; 
                    $dataat = $rows[$i]['dataateste'];
                    $dataaq = $rows[$i]['dataaquisicao'];
                    $datain = $rows[$i]['datainiciouso'];                                     
                    
                    echo "<tr>                                     
                        <td class='valores' style='text-align: left;'>".$iditemp."</td>
                        <td class='descricao' style='text-align: center;'>".$itempat."</td>
                        <td class='valores' style='text-align: left;'>".$itempatv."</td>
                        <td class='valores' style='text-align: left;'>".$idvida."</td>
                        <td class='valores' style='text-align: center;'>".$siglas."</td>
                        <td class='valores' style='text-align: left;'>".$numeroe."</td>
                        <td class='valores' style='text-align: left;'>".$notaf."</td>
                        <td class='valores' style='text-align: left;'>".$cnpjtab."</td>
                        <td class='data' style='text-align: left;'>".$dataat."</td>
                        <td class='data' style='text-align: left;'>".$dataaq."</td>
                        <td class='data' style='text-align: left;'>".$datain."</td>                                    
                    </tr>   
                    

            ";}
                    echo "<tfoot style='background-color: #D1CFD0;'>                                    
                        <td class='valores' style='text-align: center;'>--</td>
                        <td class='valores' style='text-align: center;'>--</td>
                        <td class='valores' style='text-align: center;'>".$saldoTotal."</td>
                        <td class='valores' style='text-align: center;'>--</td>
                        <td class='valores' style='text-align: center;'>--</td>                                    
                        <td class='valores' style='text-align: center;'>--</td>                                    
                        <td class='valores' style='text-align: center;'>--</td>                                    
                        <td class='valores' style='text-align: center;'>--</td>                                    
                        <td class='valores' style='text-align: center;'>--</td>                                    
                        <td class='valores' style='text-align: center;'>--</td>                                    
                        <td class='valores' style='text-align: center;'>--</td>                                    
                    </tfoot>    ";
            
            ?>         
        </div>
    </body>
</html>
<?php file_put_contents($tmpFile, ob_get_contents()); ?>
