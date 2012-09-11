<?
MIOLO::Import('extensions::cpaint2.inc.php','cpaint'); 
$cp = new cpaint();
$page->addScript('x/x_core.js');
$page->addScript('x/x_dom.js');
$page->addScript('cpaint/cpaint2.inc.js');
$page->addScript('m_ajax.js');
$cp->register('ajax_selMunicipio');
$cp->register('ajax_selMunicipioNasc');
$cp->register('ajax_selUF');

if (($page->request('cpaint_function')) != "") 
{
    $theme->clearContent();
    $page->generateMethod = 'generateAJAX';
    $page->cpaint = $cp;
    $cp->start('UTF-8');
}

function ajax_selMunicipio($arg)
{   
    global $MIOLO, $theme;
    $opcao = $arg;
    $uf = $MIOLO->GetBusiness('common','uf');
    $uf->getById($arg);
    $municipios = $uf->listMunicipios();
    $sel = new MSelection("idMunicipio","","Municipio",$municipios->chunkResult());
    $sel->formMode = MControl::FORM_MODE_SHOW_ABOVE;
    $theme->setAjaxContent($sel);
}

function ajax_selMunicipioNasc($arg)
{   
    global $MIOLO, $theme;
    $opcao = $arg;
    $uf = $MIOLO->GetBusiness('common','uf');
    $uf->getById($arg);
    $municipios = $uf->listMunicipios();
    $sel = new MSelection("idMunicipioNasc","","Municipio Nascimento",$municipios->chunkResult());
    $sel->formMode = MControl::FORM_MODE_SHOW_ABOVE;
    $theme->setAjaxContent($sel);
}

function ajax_selUF($arg)
{
    global $MIOLO, $theme;
    $opcao = $arg;

    if($opcao==24){
	$uf = $MIOLO->GetBusiness('common','uf');
	$estados = $uf->listEstadosBrasileiros();
	$sel = new MSelection("idUF","","Estado",$estados->chunkResult());
    }else{
	$estados = array('FB'=>'FORA DO BRASIL');
	$sel = new MSelection("idUF","","Estado", $estados);
	
    }

    $sel->formMode = MControl::FORM_MODE_SHOW_ABOVE;
    $theme->setAjaxContent($sel);
}


?>
