
function doSelReferencia(url, aguarde) 
{
    MIOLO_GetElementById('divSelReferencia').innerHTML = '<div style="margin-top:10px"><img src=" ' + aguarde + '" alt="" border="0"></div>';
	cp.set_response_type("TEXT");
    cp.call(url, "ajax_selReferencia", doSelReferencia_result, xGetElementById("selClasse").value);
}	
function doSelReferencia_result(result) 
{
    MIOLO_GetElementById('divSelReferencia').innerHTML = result;
}
