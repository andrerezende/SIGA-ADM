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
MIOLO::Import('extensions::cpaint2.inc.php','cpaint'); 
$cp = new cpaint();
$page->addScript('x/x_core.js');
$page->addScript('x/x_dom.js');
$page->addScript('cpaint/cpaint2.inc.js');
$page->addScript('m_ajax.js');
$cp->register('ajax_sample');
$cp->register('ajax_selReferencia');
$cp->register('ajax_selCargo');
if (($page->request('cpaint_function')) != "") 
{
    $theme->clearContent();
    $page->generateMethod = 'generateAJAX';
    $page->cpaint = $cp;
    $cp->start('ISO-8859-1');
}

function ajax_sample($arg)
{
	if ($arg=='Outro')
	{
		global $theme; 
		//$sample = new MTextField('edtTipoTrabalhoFinal','','Tipo de Trabalho Final',21);
		$sample = new MTextField('selTipoTrabalhoFinal','','Tipo');
		$theme->setAjaxContent($sample);
	}
}

function ajax_selReferencia($arg)
{   
    global $MIOLO, $theme;
    $opcao = $arg;
    $referencia = $MIOLO->GetBusiness('rh','referencia');
    $referencias = $referencia->listReferenciaByClasse($opcao);
    $sel = new MSelection("selReferencia","","Referência",$referencias->chunkResult());
    $sel->formMode = MControl::FORM_MODE_SHOW_ABOVE;
    $theme->setAjaxContent($sel);
}

function ajax_selCargo($arg)
{   
    global $MIOLO, $theme;
    $opcao = $arg;
    $grupoCargo = $MIOLO->GetBusiness('rh','grupocargo',$arg);
    $cargos = $grupoCargo->listCargos();
    $sel = new MSelection("idCargo","","Cargo",$cargos->chunkResult());
    $sel->formMode = MControl::FORM_MODE_SHOW_ABOVE;
    $theme->setAjaxContent($sel);
}
?>
