function toUpperCase(field)
{
    field.value = field.value.toUpperCase();
}
function setValue(field,event) {
    var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
    if (keyCode == 13)
    {
       _MIOLO_MultiTextField3_add(field.form,'listaProcessos','setoresDestino,numProcesso'); 
       return false;
    }
    else
    {
        return true;
    }
}
