function toUpperCase(control)
{
    xGetElementById(control).value = xGetElementById(control).value.toUpperCase();
}
function clearDecisao() 
{
    xGetElementById('decisao').value = '';
    xGetElementById('autor').value = '';
}
function clearSetor() 
{
    xGetElementById('setorDestino').value = '';
}
function setValue(field,event) {
    var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
    if (keyCode == 13)
    {
       _MIOLO_MultiTextField3_add(field.form, 'numProcessos','numProcesso'); 
       field.value = '';
       return false;
    }
    else
    {
        return true;
    }
}
