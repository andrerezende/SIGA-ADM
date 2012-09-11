// receives a HTML code as result and updates a element automatically
var ajaxHandlerSample = new Miolo.Ajax({
	updateElement: 'divSample',
	response_type: 'TEXT',
	remote_method: "ajax_sample",
	parameters: function(){
       sel = miolo.getElementById("selTipoTrabalhoFinal");
	   return sel.options[sel.selectedIndex].text;
	}
});