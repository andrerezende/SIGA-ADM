<?php
MIOLO::Import('extensions::cpaint2.inc.php', 'cpaint');
$cp = new cpaint();
$page->addScript('x/x_core.js');
$page->addScript('x/x_dom.js');
$page->addScript('cpaint/cpaint2.inc.js');
$page->addScript('m_ajax.js');
$cp->register('ajax_lkpUo');
$cp->register('ajax_idUo');
$cp->register('ajax_localEntrega');
$cp->register('ajax_frmPedido_Material');

if (($page->request('cpaint_function')) != "") {
	$theme->clearContent();
	$page->generateMethod = 'generateAJAX';
	$page->cpaint = $cp;
	$cp->start('UTF-8');
}

function ajax_lkpUo($arg) {
	global $MIOLO, $theme;
	$req = $MIOLO->GetBusiness('adm', 'requisicao', $arg);
	$req->retrieveAssociation('uoRequisitante');
	$lkp = new MTextField('lkpUO', $req->uoRequisitante->nome, '', 60);
	$theme->setAjaxContent($lkp);
}

function ajax_idUo($arg) {
	global $MIOLO, $theme;
	$req = $MIOLO->GetBusiness('adm', 'requisicao', $arg);
	$lkp = new MTextField('idUO', $req->idUoRequisitante, 'Id Uo', 10);
	$lkp->readonly = true;
	$theme->setAjaxContent($lkp);
}

function ajax_localEntrega($arg) {
	global $MIOLO, $theme;
	$req = $MIOLO->GetBusiness('adm', 'requisicao', $arg);
	$lkp = new MTextField('localEntrega', $req->localEntrega, 'Local de Entrega da Requisição', 30);
	$lkp->formMode = MControl::FORM_MODE_SHOW_ABOVE;
	$theme->setAjaxContent($lkp);
}

function ajax_frmPedido_Material($value) {
	global $MIOLO, $theme, $module;
	if ($value == 'material') {
		$field = new MLookupTextField('idMaterial', '', 'Código do Material', 20);
		$field->addAttribute('module', 'adm');
		$field->addAttribute('item', 'materialPermanente');
		$field->addAttribute('related', 'idMaterial,descricao,codMaterial,unidade');
	} else if ($value == 'servico') {
		$field = new MLookupTextField('idServico', '', 'Código do Serviço', 20, null, null, 'idServico,descricao,codMaterial', 'adm', 'servicoExterno');
	}
	$field->formMode = MControl::FORM_MODE_SHOW_ABOVE;
	$theme->setAjaxContent($field);
}

function ajax_frmPedido_Material($value) {
	global $MIOLO, $theme, $module;
	$field = new MMultiLineField('fundamentacaoLegal', $value, 'Fundamentação Legal', 60, 2, 60);
	$field->formMode = MControl::FORM_MODE_SHOW_ABOVE;
	$theme->setAjaxContent($field);
}