miolo.linkButton = function(url, event, param)
//function _MIOLO_LinkButton(frmName, url, event, param)
{
    var form = miolo.getForm();
    
    if ( form != null )
    {
  	  if ( eval('miolo.onSubmit()') )
      {
   	     form.action = url;
		 miolo.doPostBack(event, param);
         form.submit();
      }
    }
    else
    {
        alert('MIOLO INTERNAL ERROR: LinkButton\n\nForm ' + form.name + ' not found!');
    }
}