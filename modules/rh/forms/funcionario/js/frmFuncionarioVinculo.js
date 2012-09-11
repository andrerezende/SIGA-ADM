
function doSelCargo(url, aguarde) 
{
    MIOLO_GetElementById('divSelCargo').innerHTML = '<div style="margin-top:10px"><img src=" ' + aguarde + '" alt="" border="0"></div>';
	cp.set_response_type("TEXT");
    cp.call(url, "ajax_selCargo", doSelCargo_result, xGetElementById("idGrupoCargo").value);
}	
function doSelCargo_result(result) 
{
    MIOLO_GetElementById('divSelCargo').innerHTML = result;
}
