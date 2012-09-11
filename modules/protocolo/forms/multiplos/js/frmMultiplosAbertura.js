function doTextTipo(url) 
{
	xWalkTree(xGetElementById('m-container'), function(e){e.style.cursor = 'wait'});
    tipo = xGetElementById("tipo");
    titulo = xGetElementById("titulo");
    user = xGetElementById("user");
    cp.set_response_type("TEXT");
    cp.call(url, "ajax_frmProcessoNovo_TextTipo", doTextTipo_result, tipo.value, user.value);
}	

function doTextTipo_result(result) 
{
    xGetElementById('m_titulo').innerHTML = result;
    xGetElementById('titulo').focus();
    xWalkTree(xGetElementById('m-container'), function(e){e.style.cursor = 'auto'});
}

function doTextOrigem(url) 
{
	xWalkTree(xGetElementById('m-container'), function(e){e.style.cursor = 'wait'});
    origemExterna = xGetElementById("origemExterna");
    setorOrigem = xGetElementById("setorOrigem");
    cp.set_response_type("TEXT");
    cp.call(url, "ajax_frmProcessoNovo_TextOrigem", doTextOrigem_result, origemExterna.checked, setorOrigem.value);
}	
function doTextDestino(url) 
{
	xWalkTree(xGetElementById('m-container'), function(e){e.style.cursor = 'wait'});
    destinoExterno = xGetElementById("destinoExterno");
    setorDestino = xGetElementById("setorDestino");
    cp.set_response_type("TEXT");
    cp.call(url, "ajax_frmProcessoNovo_TextDestino", doTextDestino_result, destinoExterno.checked, setorDestino.value);
}	

function doTextOrigem_result(result) 
{
    xGetElementById('m_setorOrigem').innerHTML = result;
    xGetElementById('setorOrigem').focus();
	xWalkTree(xGetElementById('m-container'), function(e){e.style.cursor = 'auto'});
}
function doTextDestino_result(result) 
{
    xGetElementById('m_setorDestino').innerHTML = result;
    xGetElementById('setorDestino').focus();
	xWalkTree(xGetElementById('m-container'), function(e){e.style.cursor = 'auto'});
}
function doSaida(url) 
{
	xWalkTree(xGetElementById('m-container'), function(e){e.style.cursor = 'wait'});
    saida = xGetElementById("saida");
    cp.set_response_type("TEXT");
    if (saida.checked == true)
    {
        cp.call(url,"ajax_frmProcessoNovo_Saida",doSaida_result);
    }
    else
    {
        cp.call(url,"ajax_frmProcessoNovo_SemSaida",doSaida_result);
    }
}	

function doLimparDadosProcesso() 
{
    xGetElementById('titulo').value = '';
    xGetElementById('titulo_sel').value = '';
    xGetElementById('solicitante').value = '';
    xGetElementById('assunto').value = '';
    xGetElementById('tipo').value = 'P';
}

function doLimparOrigem() 
{
    xGetElementById('instituicao').value = '23059';
    xGetElementById('setorOrigem').value = '';
    xGetElementById('setorOrigem_sel').value = '';
}

function doLimparArquivo() 
{
    xGetElementById('arquivo').value = '';
}

function doLimparSaida() 
{
    xGetElementById('setorDestino').value = '';
    xGetElementById('setorDestino_sel').value = '';
    xGetElementById('decisao').value = '';
    xGetElementById('autor').value = '';
}

function in_setorDestino(matriz)
{
    var er = new RegExp ("¬" + xGetElementById('setorDestino').value + "¬", "gim");
    if (!matriz.match (er))
    {
        var text = xGetElementById('setorDestino').value;
        alert('Setor Inválido');
        xGetElementById('setorDestino').focus();
        xGetElementById('setorDestino').value = '';
        xGetElementById('setorDestino').value = text;
    }
    else
    {
        xGetElementById('decisao').focus();
    }

}

function in_titulo(matriz)
{
    var er = new RegExp ("¬" + xGetElementById('titulo').value + "¬", "gim");
    if (!matriz.match (er))
    {
        var text = xGetElementById('titulo').value;
        alert('Título Inválido');
        xGetElementById('titulo').focus();
        xGetElementById('titulo').value = '';
        xGetElementById('titulo').value = text;
    }
    else
    {
        xGetElementById('solicitante').focus();
    }
}

function toUpperCase(control)
{
    xGetElementById(control).value = xGetElementById(control).value.toUpperCase();
}

function setValue(field,event) {
    var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
    if (keyCode == 13)
    {
       _MIOLO_MultiTextField3_add(field.form,'solicitantes','solicitante'); 
       field.value = '';
       return false;
    }
    else
    {
        return true;
    }
}
