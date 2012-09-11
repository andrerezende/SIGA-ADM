function doTextDestino(url) 
{
	xWalkTree(xGetElementById('m-container'), function(e){e.style.cursor = 'wait'});
    destinoExterno = xGetElementById("destinoExterno");
    setorDestino = xGetElementById("setorDestino");
    cp.set_response_type("TEXT");
    cp.call(url, "ajax_frmProcessoDecisao_TextDestino", doTextDestino_result, destinoExterno.checked, setorDestino.value);
}	

function doTextDestino_result(result) 
{
    xGetElementById('m_setorDestino').innerHTML = result;
    xGetElementById('setorDestino').focus();
	xWalkTree(xGetElementById('m-container'), function(e){e.style.cursor = 'auto'});
}

function doLimparSaida() 
{
    xGetElementById('setorDestino').value = '';
    xGetElementById('setorDestino_sel').value = '';
    xGetElementById('decisao').value = '';
    xGetElementById('autor').value = '';
}