
function doSelMunicipio(url, aguarde) 
{
    MIOLO_GetElementById('m_idMunicipio').innerHTML = '<div style="margin-top:10px"><img src=" ' + aguarde + '" alt="" border="0"></div>';
	cp.set_response_type("TEXT");
    cp.call(url, "ajax_selMunicipio", doSelMunicipio_result, xGetElementById("idUf").value);
}	

function doSelMunicipio_result(result) 
{
    MIOLO_GetElementById('m_idMunicipio').innerHTML = result;
}

function doSelMunicipioNasc(url, aguarde) 
{
    MIOLO_GetElementById('m_idMunicipioNasc').innerHTML = '<div style="margin-top:10px"><img src=" ' + aguarde + '" alt="" border="0"></div>';
	cp.set_response_type("TEXT");
    cp.call(url, "ajax_selMunicipioNasc", doSelMunicipioNasc_result, xGetElementById("idUfNasc").value);
}	

function doSelMunicipio_result(result) 
{
    MIOLO_GetElementById('m_idMunicipio').innerHTML = result;
}

function doSelMunicipioNasc_result(result) 
{
    MIOLO_GetElementById('m_idMunicipioNasc').innerHTML = result;
}
