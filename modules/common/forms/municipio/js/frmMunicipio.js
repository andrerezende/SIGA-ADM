function doSelUF(url, aguarde)
{
	MIOLO_GetElementById('m_idUF').innerHTML = '<div style="margin-top:10px"><img src=" ' + aguarde + '" alt="" border="0"></div>';
	cp.set_response_type("TEXT");
    cp.call(url, "ajax_selUF", doSelUF_result, xGetElementById('idPais').value);
}

function doSelUF_result(result) 
{
    MIOLO_GetElementById('m_idUF').innerHTML = result;
}