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
?>

<?php
/**
* @package SIGA
* @subpackage Biblioteca
* @author SETEC/MEC
*/

/**
* Script atualizareservas
* Utilizado para a manutenção (offline) da fila de reservas da biblioteca
* @author Ronaldo Gazolla
* @package biblioteca
*/

//Inicialização do Miolo necessária para rodar script offline
ini_set("memory_limit","20M");
PutEnv("ORACLE_SID=UFJF");
PutEnv("ORACLE_HOME=/home/oracle/product/8.1.7");
chdir('/usr/local/siga2/classes');
include_once '/usr/local/siga2/classes/miolo.class';
include_once '/usr/local/siga2/classes/support.inc';

//Nome do modulo
$module = 'biblioteca';

$MIOLO = MIOLO::GetInstance();
$MIOLO->conf = new MConfigLoader();
$MIOLO->conf->LoadConf();
$MIOLO->conf->LoadConf($module);

$MIOLO->Init();
$MIOLO->history = new MHistory($MIOLO);

//Script para atualizar reservas (offline)

// Instancia objetos necessários
$objSitReserva = $MIOLO->GetBusiness($module,'situacaoreserva');
$objEstado = $MIOLO->GetBusiness($module,'estado');
$objReserva = $MIOLO->GetBusiness($module,'reserva');
$objEmprestimo = $MIOLO->GetBusiness($module,'emprestimo');
$objUsuario = $MIOLO->GetBusiness($module,'usuario');
$objPolitica = $MIOLO->GetBusiness($module,'politica');
$objExemplar = $MIOLO->GetBusiness($module,'exemplar');

//Busca Códigos para Situações da Reserva e Estados do Exemplar
$Atendida = $objSitReserva->GetIdByMnemonico('ATENDIDA');
$Vencida = $objSitReserva->GetIdByMnemonico('VENCIDA');
$Disponivel = $objEstado->GetIdByMnemonico('DISPONIVEL');

// Localiza todas reservas vencidas em relação à data de atualização
$DataHoraAtualizacao = date("d/m/Y");
$vencidas = $objReserva->ListReservaAtrasada($DataHoraAtualizacao);

$dataarq = date("Ymd");
$Arq = fopen("/usr/local/siga2/modules/biblioteca/offline/log$dataarq.txt","w+");
fwrite($Arq,"Iniciando log:\n");

fwrite($Arq,"Reservas Vencidas: ".count($vencidas)."\n");
$i=0;

if (count($vencidas) > 0)
{
	foreach ($vencidas as $reserva)
	{
		$i++;
$Atendeu=null;
$Venceu=null;
		$codReserva = $reserva[0];
		$codUsuario = $reserva[1];

		//para cada uma das reservas vencidas localiza o tombo que a atendeu
		$Tombo = $objReserva->GetTomboByIdConfirmada($codReserva);
		
		$Venceu = $objReserva->RetiraReserva($codReserva, $Vencida);
		fwrite($Arq,$i."\nReserva vencida: ".$codReserva." Usuario: ".$codUsuario." Tombo: ".$Tombo."\n");
		$ProximaReserva = $objReserva->GetProximaReserva($codReserva,$Tombo);

		if ($ProximaReserva[0]) //Existe uma reserva na fila
		{
			$Emprestimo = $objEmprestimo->GetIdemprestimoByTombo($Tombo);

			if ($Emprestimo == null) //Exemplar não está emprestado
			{
				//Atende a reserva
				$codProxReserva = $ProximaReserva[0];
				$codProxUsuario = $ProximaReserva[1];

				//Calcula datalimite
				$grupo = $objUsuario->GetGrupoByIdusuario($codProxUsuario);
				$dias = $objPolitica->GetDiasReserva($grupo);
				$DataHoraLimite = $objReserva->CalculaData($dias);

///				$Atendeu = $objReserva->ConfirmaReserva($codProxReserva, $Atendida, $DataHoraLimite);
				$Atendeu = $objReserva->ConfirmarReserva($codProxReserva, $Atendida, $DataHoraLimite);
				
				fwrite($Arq,"Reserva atendida: ".$codProxReserva." Usuario: ".$codProxUsuario." Tombo: ".$Tombo." DataLimite: ".$DataHoraLimite."\n");
			}
		}
		else
		{
			// Se não tem nenhuma reserva o exemplar estará disponivel.
			$objExemplar->AlteraEstado($Tombo, $Disponivel);
			fwrite($Arq,"Exemplar disponivel: ".$Tombo."\n");
		}

if ($Venceu)
{
	fwrite($Arq,$Venceu."\n");
}
else
{
	fwrite($Arq,"Não Venceu \n");
}
if ($Atendeu)
{
	fwrite($Arq,$Atendeu."\n");
}
else
{
	fwrite($Arq,"Não atendeu \n");
}

		unset($Atendeu);
		unset($Venceu);

	}//fim do foreach
}//fim do if
?>
