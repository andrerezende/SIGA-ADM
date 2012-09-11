<?
/* Copyright 2006, 2007, 2008, 2009, 2010 do SETEC/MEC
 *
 * Este arquivo é parte do programa SigaEPT
 *
 * O SigaEPT é um software livre;  você pode redistribuí-lo e/ou modificá-lo dentro dos
 * termos da Licença Pública Geral GNU como publicada pela fundação do software livre (FSF);
 * na versão 2 da Licença.
 *
 * Este programa é distribuído na esperança que possa ser útil, mas SEM NENHUMA GARANTIA; sem
 * uma garantia implícita de ADEQUAÇÃO a qualquer MERCADO ou APLICAÇÃO EM PARTICULAR. Veja Licença
 * Pública Geral GNU/GPL em português para maiores detalhes.
 *
 * Você deve ter recebido uma cópia da Licença Pública Geral GNU, sob o título “LICENCA.txt”,
 * junto com este programa, se não, acesse o portal do Software Público Brasileiro no endereço
 * www.softwarepublico.gov.br ou escreva para Fundação do Software Livre (FSF) Inc.,51 Franklin
 * St, Fifth Floor, Boston, MA 02110-1301, USA
 */

/**
 * Script lancaPeriodoAquisitivo.php
 * @author: CGCO/UFJF
 * @status: 'em construcao'
*/

ini_set("memory_limit","64M");
PutEnv("ORACLE_SID=UFJF");
PutEnv("ORACLE_HOME=/home/oracle/product/8.1.7");

chdir('/home/kimbow/public_html/miolo/classes');
include_once '/home/kimbow/public_html/miolo/classes/miolo.class';
include_once '/home/kimbow/public_html/miolo/classes/support.inc';

$MIOLO = MIOLO::GetInstance();
$MIOLO->conf = new MConfigLoader();
$MIOLO->conf->LoadConf();

$MIOLO->Init();
$MIOLO->history = new MHistory($MIOLO);

$objPerAq = $MIOLO->GetBusiness('rh','periodoaquisitivo');

$objVinculo = $MIOLO->GetBusiness('rh','vinculo');
$criteria = $objVinculo->getCriteria();
$criteria->addColumnAttribute('count(*)','N');
$query = $criteria->retrieveAsQuery();
$count = $query->fields('N');
$numPages = (int)($count / 500) + 1;
echo "numpages = $numPages \n";
echo "count = $count\n";
$listreport = array();
$n = 0;
for($i=0; $i<$numPages; $i++)
{
    echo " pagina = $i ";
    $criteria = $objVinculo->getCriteria();
    $criteria->addColumnAttribute('idVinculo');
    $criteria->addOrderAttribute('idVinculo');
    //$criteria->addCriteria('idVinculo','LIKE', "'$i%'");
    $range = new MQueryRange($i,500);
    $criteria->SetRange($range);

    $query = $criteria->retrieveAsProxyQuery(); 
    $query->moveFirst();
    echo " [rowcount = " . $query->getRowCount() . "] \n";
    $listreport = array();
    while (!$query->eof())
    {
        try
        {
            $idVinculo = $query->fields('idVinculo');
            $objPerAq->GetById($idVinculo);
            $objPerAq->openPeriodoAquisitivo();
            //echo"$idVinculo\n - {$objPerAq->dataInico}";
            //$objPerAq->runScript();
            //$objPerAq->setPersistent(false);
            //$objPerAq->save();
            
        } 
        catch(Exception $e)
        {
            var_dump($e->getMessage());
            $objVinculo->GetById($idVinculo);
            $objVinculo->retrieveAssociation('funcionario');
            $listreport[] = array($idVinculo, $objVinculo->funcionario->pessoa->nome);
        }
        $n++;
/*
        if($n%100 == 0)
        {
            echo  $query->fields("idVinculo") ." - $n\n";
        }
*/
        $query->moveNext(); 
    }
    $criteria = null;  
}
echo "[[[fim = $n]]]";


$report = new ezPDFReport('2');
$data = array();
$options['textCol'] = array(0,0,0);
$options['shaded'] = 1;
$exercicio = date('d/m/Y');
$report->pdf->ezTable($listreport,array(0=>'Matrícula', 1=>'Nome do Funcionário'),'Funcionários para os quais não foi gerado período aquisitivo em '.$exercicio.'.',$options);
$report->Execute();
echo "Lalalalal";

?>
