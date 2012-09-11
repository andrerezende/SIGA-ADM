<?
MIOLO::Import('extensions::cpaint2.inc.php','cpaint'); 
$cp = new cpaint();
$page->addScript('x/x_core.js');
$page->addScript('x/x_dom.js');
$page->addScript('cpaint/cpaint2.inc.js');
$page->addScript('m_ajax.js');
$cp->register('ajax_sample');
$cp->register('ajax_frmProcessoNovo_TextOrigem');
$cp->register('ajax_frmProcessoNovo_TextDestino');
$cp->register('ajax_frmProcessoNovo_TextTipo');
$cp->register('ajax_frmProcessoNovo_TextInstituicao');
$cp->register('ajax_frmProcessoSaida_Text');
$cp->register('ajax_frmProcessoDecisao_TextDestino');
if (($page->request('cpaint_function')) != "") 
{
    $theme->clearContent();
    $page->generateMethod = 'generateAJAX';
    $page->cpaint = $cp;
    $cp->start('UTF-8');
}

function ajax_sample($arg)
{
    global $theme; 
    $sample = new MRawText("<br>i've received the argument: $arg");    
    $theme->setAjaxContent($sample);
}
    
function ajax_frmProcessoNovo_TextOrigem($value,$selValue)
{
    global $MIOLO,$theme; 
    if ($value == 'true')
    {
        $setorOrigem = new MTextField('setorOrigem','*'.$selValue,'Setor:',15);
        $setorOrigem->addAttribute('maxlength','15');
    }
    else
    {
        $setor = $MIOLO->getBusiness('protocolo','setor');
        $setores = $setor->selAll();
        $selValue = str_replace('*','',$selValue);
        $setorOrigem = new MComboBox('setorOrigem',$selValue,'Setor:',$setores,'','',15);
        $setorOrigem->addAttribute('maxlength','15');
        $setorOrigem->addAttribute("onkeyup","toUpperCase('setorOrigem')");
        $setorOrigem->addAttribute('style','text-transform:uppercase');
    }
    $setorOrigem->formMode = MControl::FORM_MODE_SHOW_ABOVE;
    $theme->setAjaxContent($setorOrigem);
}
function ajax_frmProcessoNovo_TextInstituicao($value)
{
    global $MIOLO,$theme; 
    if ($value == 'true')
    {
        $numProcesso = new MTextField('numProcessoExterno','','N. Processo:',15);
        $numProcesso->addAttribute('maxlength','14');
        $numProcesso->formMode = MControl::FORM_MODE_SHOW_ABOVE;
    }
    $theme->setAjaxContent($numProcesso);
}
function ajax_frmProcessoNovo_TextDestino($value,$selValue)
{
    global $MIOLO,$theme; 
    if ($value == 'true')
    {
        $setorDestino = new MTextField('setorDestino','*'.$selValue,'Setor:',15);
        $setorDestino->addAttribute('maxlength','15');
    }
    else
    {
        $setor = $MIOLO->getBusiness('protocolo','setor');
        $setores = $setor->selAll();
        $selValue = str_replace('*','',$selValue);
        $setorDestino = new MComboBox('setorDestino',$selValue,'Setor:',$setores,'','',15);
        $setorDestino->addAttribute('maxlength','15');
        $setorDestino->addAttribute("onkeyup","toUpperCase('setorDestino')");
        $setorDestino->addAttribute('style','text-transform:uppercase');
    }
    $setorDestino->formMode = MControl::FORM_MODE_SHOW_ABOVE;
    $theme->setAjaxContent($setorDestino);
}
function ajax_frmProcessoSaida_Text($value,$selValue)
{
    global $MIOLO,$theme; 
    if ($value == 'true')
    {
        $setorDestino = new MTextField('setorDestino','*'.$selValue,'Setor:',15);
        $setorDestino->addAttribute('maxlength','15');
    }
    else
    {
        $setor = $MIOLO->getBusiness('protocolo','setor');
        $setores = $setor->selAll();
        $selValue = str_replace('*','',$selValue);
        $setorDestino = new MComboBox('setorDestino',$selValue,'Setor:',$setores,'','',15);
        $setorDestino->addAttribute('maxlength','15');
        $setorDestino->addAttribute("onkeyup","toUpperCase('setorDestino')");
        $setorDestino->addAttribute('style','text-transform:uppercase');
    }
    $setorDestino->formMode = MControl::FORM_MODE_SHOW_ABOVE;
    $theme->setAjaxContent($setorDestino);
}
function ajax_frmProcessoDecisao_TextDestino($value,$selValue)
{
    global $MIOLO,$theme; 
    if ($value == 'true')
    {
        $setorDestino = new MTextField('setorDestino','*'.$selValue,'Setor:',15);
        $setorDestino->addAttribute('maxlength','15');
    }
    else
    {
        $setor = $MIOLO->getBusiness('protocolo','setor');
        $setores = $setor->selAll();
        $selValue = str_replace('*','',$selValue);
        $setorDestino = new MComboBox('setorDestino',$selValue,'Setor:',$setores,'','',15);
        $setorDestino->addAttribute('maxlength','15');
        $setorDestino->addAttribute("onkeyup","toUpperCase('setorDestino')");
        $setorDestino->addAttribute('style','text-transform:uppercase');
    }
    $setorDestino->formMode = MControl::FORM_MODE_SHOW_ABOVE;
    $theme->setAjaxContent($setorDestino);
}

function ajax_frmProcessoNovo_TextTipo($value,$selValue)
{
    global $MIOLO,$theme; 
    if ($value == 'A')
    {
	$obj=$MIOLO->GetBusiness('protocolo','processo');
	if ($selValue == 'dir') 
	{
		$queryTeste=$obj->listTipoDir();
	}elseif ($selValue == 'ger')
	{
		$queryTeste=$obj->listTipoGer();
	}elseif  ($selValue == 'coord')
    {
		$queryTeste=$obj->listTipoCoord();
	}elseif  ($selValue == 'false')
    {
		$queryTeste=$obj->listTiposComuns();
	}

	$selecao1=$queryTeste->result;

	$titulo = new MSelection('titulo','','Titulo:',$selecao1,$showValues=false);
	$titulo->addAttribute('maxlength','75');
	}
    elseif ($value == 'P')
    {
        $titulo = new MTextField('titulo','','Titulo:',75);
        $titulo->addAttribute('maxlength','75');
    }
    $titulo->formMode = MControl::FORM_MODE_SHOW_ABOVE;
    $theme->setAjaxContent($titulo);
    
}
?>
