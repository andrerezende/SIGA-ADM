var url = location.href;
function doAnoChegada() 
{
    cp.set_response_type("TEXT");
    cp.call(url, "ajax_btnAnoChegada", updateAnoChegada, xGetElementById("idpaisnascimento").value);
}	
function updateAnoChegada(result) 
{
    xGetElementById('anochegbrasil').innerHTML = result;
}