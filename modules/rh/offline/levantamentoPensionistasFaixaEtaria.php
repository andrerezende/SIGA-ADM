<?php
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

ini_set("memory_limit","64M");
PutEnv("ORACLE_SID=UFJF");
PutEnv("ORACLE_HOME=/home/oracle/product/8.1.7");

//chdir('/home/kimbow/public_html/miolo/classes');
chdir('/usr/local/siga2/miolo/classes');

//include_once '/home/kimbow/public_html/miolo/classes/miolo.class';
//include_once '/home/kimbow/public_html/miolo/classes/support.inc';
include_once '/usr/local/siga2/miolo/classes/miolo.class';
include_once '/usr/local/siga2/miolo/classes/support.inc';

$MIOLO = MIOLO::GetInstance();
$MIOLO->conf = new MConfigLoader();
$MIOLO->conf->LoadConf();
$MIOLO->Init();
$MIOLO->history = new MHistory($MIOLO);

//chdir('/home/kimbow/public_html/miolo/modules/rh/offline');
chdir('/usr/local/siga2/miolo/modules/rh/offline');

$filename = $argv[1].$argv[2];
$fileNameTxt = "fita.txt";
$arrRegistros = file(trim($fileNameTxt));
echo "\n ------------ " .date("d/m/Y H:i:s") . " Início do processamento" . "\n\n";

$j=0;
$a = 0;
$b = 0;
$c = 0;
$d = 0;
$e = 0;
$f = 0;
$g = 0;
$h = 0;
$k = 0;
$l = 0;

$a1 = 0;
$b1 = 0;
$c1 = 0;
$d1 = 0;
$e1 = 0;
$f1 = 0;
$g1 = 0;
$h1 = 0;
$k1 = 0;
$l1 = 0;

$cta = 0;
$cdc = 0;

$servidor = $MIOLO->GetBusiness('rh','vinculo');
echo("###"." ?"." PENSION"."    INSTITU"."   DT NASC\n");
for ( $i = 1; $i < count($arrRegistros); $i++ ) //-7971 10%    
{
	$registro = $arrRegistros[$i];
	$tipoRegistro = intval(substr($registro,24,1));
	$MATRICULA_PENSIONISTA = substr($registro,16,8);
	$MATRICULA_INSTITUIDOR = substr($registro,9,7);

	switch ($tipoRegistro)
	{
		case 3:
		$vinculoServidor = $MIOLO->GetBusiness('rh','vinculo',$MATRICULA_INSTITUIDOR);
		$ta = $vinculoServidor->isTa();
		$x = substr($registro,76,4).substr($registro,74,2).substr($registro,72,2);

		echo(++$j.") ");
		if ($ta) $ta1 = " T "; else $ta1 = " D ";
		echo($ta1);
		echo($MATRICULA_PENSIONISTA." | ");
		echo($MATRICULA_INSTITUIDOR." | ");
		echo(substr($registro,72,2)."/".substr($registro,74,2)."/".substr($registro,76,4)."\n");

		if ( $ta )
		{
			$cta++;

			if ( $x > 19881126 )
			{
				$a++;
			}
			if (( 19831126 < $x ) and ( $x <= 19881126))
			{
				$b++;
			}
			if (( 19781126 < $x ) and ( $x <= 19831126))
			{
				$c++;
			}
			if (( 19731126 < $x ) and ( $x <= 19781126))
			{
				$d++;
			}
			if (( 19681126 < $x ) and ( $x <= 19731126))
			{
				$e++;
			}
			if (( 19631126 < $x ) and ( $x <= 19681126))
			{
				$f++;
			}
			if (( 19581126 < $x ) and ( $x <= 19631126))
			{
				$g++;
			}
			if (( 19531126 < $x ) and ( $x <= 19581126))
			{
				$h++;
			}
			if (( 19481126 < $x ) and ( $x <= 19531126))
			{
				$k++;
			}
			if ($x <= 19481126)
			{
				$l++;
			}
		}
		else
		{
			$cdc++;

			if ( $x > 19881126 )
			{
				$a1++;
			}
			if (( 19831126 < $x ) and ( $x <= 19881126))
			{
				$b1++;
			}
			if (( 19781126 < $x ) and ( $x <= 19831126))
			{
				$c1++;
			}
			if (( 19731126 < $x ) and ( $x <= 19781126))
			{
				$d1++;
			}
			if (( 19681126 < $x ) and ( $x <= 19731126))
			{
				$e1++;
			}
			if (( 19631126 < $x ) and ( $x <= 19681126))
			{
				$f1++;
			}
			if (( 19581126 < $x ) and ( $x <= 19631126))
			{
				$g1++;
			}
			if (( 19531126 < $x ) and ( $x <= 19581126))
			{
				$h1++;
			}
			if (( 19481126 < $x ) and ( $x <= 19531126))
			{
				$k1++;
			}
			if ($x <= 19481126)
			{
				$l1++;
			}
		}

		break;

		default:
		break;
	}

}
echo "\n". "\n ------------ " . date("d/m/Y H:i:s") . " Término do processamento do arquivo". "\n\n";

echo "\n". " RESULTADO TA \n\n";
echo "A) 00-18 ".$a. " \n";
echo "B) 18-23 ".$b. " \n";
echo "C) 24-28 ".$c. " \n";
echo "D) 29-33 ".$d. " \n";
echo "E) 34-38 ".$e. " \n";
echo "F) 39-43 ".$f. " \n";
echo "G) 44-48 ".$g. " \n";
echo "H) 49-53 ".$h. " \n";
echo "K) 54-58 ".$k. " \n";
echo "L) 59-++ ".$l. " \n";
echo "\n TOTAL TAs: ".($a+$b+$c+$d+$e+$f+$g+$h+$k+$l);

echo "\n\n\n". " RESULTADO DOCENTES \n\n";
echo "A) 00-18 ".$a1. " \n";
echo "B) 18-23 ".$b1. " \n";
echo "C) 24-28 ".$c1. " \n";
echo "D) 29-33 ".$d1. " \n";
echo "E) 34-38 ".$e1. " \n";
echo "F) 39-43 ".$f1. " \n";
echo "G) 44-48 ".$g1. " \n";
echo "H) 49-53 ".$h1. " \n";
echo "K) 54-58 ".$k1. " \n";
echo "L) 59-++ ".$l1. " \n";
echo "\n TOTAL DOCENTES: ".($a1+$b1+$c1+$d1+$e1+$f1+$g1+$h1+$k1+$l1)." \n\n";

echo "Total Geral: $j\n\n";
//echo "Total TAs:   $cta\n\n";
//echo "Total DOC.:  $cdc\n\n";
?>
