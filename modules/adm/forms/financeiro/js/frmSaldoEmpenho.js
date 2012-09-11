
function doSelRequisicaoNova(url, aguarde) 
{

    MIOLO_GetElementById('m_lkpUO').innerHTML = '<div style="margin-top:10px"><img src=" ' + aguarde + '" alt="" border="0"></div>';
	MIOLO_GetElementById('m_localEntrega').innerHTML = '<div style="margin-top:10px"><img src=" ' + aguarde + '" alt="" border="0"></div>';
	cp.set_response_type("TEXT");
    cp.call(url, "ajax_lkpUo", dolkpUo_result, xGetElementById("requisicaoNova").value);
	cp.call(url, "ajax_idUo", doidUo_result, xGetElementById("requisicaoNova").value);
    cp.call(url, "ajax_localEntrega", doLocalEntrega_result, xGetElementById("requisicaoNova").value);
}	

function dolkpUo_result(result) 
{
    MIOLO_GetElementById('m_lkpUO').innerHTML = result;
}

function doidUo_result(result) 
{
    MIOLO_GetElementById('m_idUO').innerHTML = result;
}

function doLocalEntrega_result(result) 
{
    MIOLO_GetElementById('m_localEntrega').innerHTML = result;
}

var ajaxBtnFindLicitacao = new Miolo.Ajax({
	response_type: 'OBJECT',
	remote_method: "ajax_btnFindLicitacao",
	parameters: function(){
       sel = miolo.getElementById("numeroLicitacao");
	   return sel.value;
	},
	updateElement: 'waiting',
	callback_function: function(result,text) {
		this.update(''); 
		var values = result.ajaxResponse[0].values[0]; 
		var error = values.error[0].data;
		if (error != '') {
			alert(error);
            miolo.getElementById('idLicitacao').value = '';
		}
		else {
            miolo.getElementById('dataAbertura').value = values.dataAbertura[0].data;
            miolo.getElementById('modalidadeLicitacao').value = values.idModalidadeLicitacao[0].data
            miolo.getElementById('imediata').value = values.imediato[0].data;
            miolo.getElementById('idTipoLicitacao').value = values.idTipoLicitacao[0].data;
            miolo.getElementById('idLicitacao').value = values.idLicitacao[0].data;
        }
	}
});

var ajaxFindFornecedor = new Miolo.Ajax({
	response_type: 'OBJECT',
	remote_method: "ajax_findFornecedor",
	parameters: function(){
       sel = miolo.getElementById("CNPJFornecedor");
	   return 'CNPJ'+sel.value;
	},
	updateElement: 'waiting1',
	callback_function: function(result) {
		this.update(''); 
		var values = result.ajaxResponse[0].values[0]; 
		var error = values.error[0].data;
		if (error != '') {
			alert(error);
            miolo.getElementById('nomeFornecedor').value = error;
		}
		else {
            miolo.getElementById('idFornecedor').value = values.idFornecedor[0].data;
            miolo.getElementById('nomeFornecedor').value = values.nomeFornecedor[0].data;
        }
	}
});


function doSelRequisicaoNova(url, aguarde) 
{

    MIOLO_GetElementById('m_lkpUO').innerHTML = '<div style="margin-top:10px"><img src=" ' + aguarde + '" alt="" border="0"></div>';
	MIOLO_GetElementById('m_localEntrega').innerHTML = '<div style="margin-top:10px"><img src=" ' + aguarde + '" alt="" border="0"></div>';
	cp.set_response_type("TEXT");
    cp.call(url, "ajax_lkpUo", dolkpUo_result, xGetElementById("requisicaoNova").value);
	cp.call(url, "ajax_idUo", doidUo_result, xGetElementById("requisicaoNova").value);
    cp.call(url, "ajax_localEntrega", doLocalEntrega_result, xGetElementById("requisicaoNova").value);
}	

var ajaxGetRequisicao = new Miolo.Ajax({
	response_type: 'OBJECT',
	remote_method: "ajax_getRequisicao",
	parameters: function(){
       sel = miolo.getElementById("requisicaoNova");
	   return 'REQ'+sel.value;
	},
	updateElement: 'waiting3',
	callback_function: function(result) {
		this.update(''); 
		var values = result.ajaxResponse[0].values[0]; 
		var error = values.error[0].data;
		if (error != '') {
			miolo.getElementById("idUO").value = '';
			miolo.getElementById("nomeUO").value = '';
			miolo.getElementById("localEntrega").value = '';
		}
		else {
			miolo.getElementById("idUO").value = values.idUO[0].data;
			miolo.getElementById("nomeUO").value = values.nomeUO[0].data;
			miolo.getElementById("localEntrega").value = values.localEntrega[0].data;
        }
	}
});

var ajaxFindUO = new Miolo.Ajax({
	response_type: 'OBJECT',
	remote_method: "ajax_findUO",
	parameters: function(){
       sel = miolo.getElementById("idUO");
	   return 'UO'+sel.value;
	},
	updateElement: 'waiting2',
	callback_function: function(result) {
		this.update(''); 
		var values = result.ajaxResponse[0].values[0]; 
		var error = values.error[0].data;
		if (error != '') {
			alert(error);
            miolo.getElementById('nomeUO').value = error;
		}
		else {
            miolo.getElementById('nomeUO').value = values.nomeUO[0].data;
        }
	}
});
