function toUpperCase(control)
{
    xGetElementById(control).value = xGetElementById(control).value.toUpperCase();
}

function doText(url) 
{
	xWalkTree(xGetElementById('m-container'), function(e){e.style.cursor = 'wait'});
    externo = xGetElementById("externo");
    setorDestino = xGetElementById("setorDestino");
    cp.set_response_type("TEXT");
    cp.call(url, "ajax_frmProcessoSaida_Text", doText_result, externo.checked, setorDestino.value);
}	

function doText_result(result) 
{
    xGetElementById('m_setorDestino').innerHTML = result;
    xGetElementById('setorDestino').focus();
	xWalkTree(xGetElementById('m-container'), function(e){e.style.cursor = 'auto'});
}

