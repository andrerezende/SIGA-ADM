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

ini_set("memory_limit","64M");
PutEnv("ORACLE_SID=UFJF");
PutEnv("ORACLE_HOME=/home/oracle/product/8.1.7");

chdir('/home/thiago/public_html/miolo/classes');
include_once '/home/thiago/public_html/miolo/classes/miolo.class';
include_once '/home/thiago/public_html/miolo/classes/support.inc';

//chdir('/usr/local/siga2/miolo/classes');
//include_once '/usr/local/siga2/miolo/classes/miolo.class';
//include_once '/usr/local/siga2/miolo/classes/support.inc';

$MIOLO = MIOLO::GetInstance();
$MIOLO->conf = new MConfigLoader();
$MIOLO->conf->LoadConf();

$MIOLO->Init();
$MIOLO->history = new MHistory($MIOLO);

$MIOLO->setConf('logs.port','0');

chdir('/home/thiago/public_html/miolo/modules/biblioteca/offline');
//chdir('/usr/local/siga2/miolo/modules/rh/offline');

include_once 'csv2array.inc';

$csvfile = 'carteira.csv';
$cs = new csv2array();
$array = $cs->getArray($csvfile);
$i = 1;
foreach($array as $row)
{
    $matricula = $row[0];
    $usuario = $MIOLO->getBusiness('common','usuario');
    $usuario->getByLogin($matricula);

    $log = "$matricula";
    if ( $usuario->idUsuario != '' )
    {
        $log .= " - $usuario->nome: ";
        $usuarioBt = $MIOLO->getBusiness('biblioteca','usuario');
        $grupo = $usuarioBt->getGrupoByIdusuario($usuario->idUsuario);
        if ( ! $grupo )
        {
            $usuarioBt->insertVinculo($usuario->idUsuario,1);
            $log .= " Vinculo inserido.";
        }

        $validacao = $MIOLO->getBusiness('biblioteca','usuariovalidacao');
        $cartao = $validacao->getCartao($usuario->idUsuario);

        $data->idusuario = $usuario->idUsuario;
        $data->codigoacesso = "0".$matricula;
        $data->dtvalidacao = date("d/m/Y H:i:s");

        try
        {
            if ( $cartao->result[0][0] )
            {
                $data->idvalidacao = $cartao->result[0][0];
                $validacao->Update($data);
                $log .= " Validacao atualizada - id: $data->idvalidacao.";

            }
            else
            {
                $data->idvalidacao = $validacao->geraSequencia();
                $validacao->Insert($data);
                $log .= " Validacao inserida - id: $data->idvalidacao";
            }
        }
        catch( Exception $e )
        {
            $log .= " Erro no banco de dados: ".$e->getMessage();
        }
    }
    else
    {
        $log .= " - Usuario nao encontrado";
        $usuariosN[] = "$matricula ";
    }
    $log .= "\n";
    echo $i .":". $log;
    $i++;
}

if ( is_array($usuariosN) )
{
    echo "\n\n Usuarios não encontrados no SIGA:";
    foreach($usuariosN as $usuario)
    {
        echo $usuario."\n";
    }
}
?>
