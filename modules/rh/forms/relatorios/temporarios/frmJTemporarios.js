// receives a HTML code as result and updates a element automatically
var ajaxSelectMonth = new Miolo.Ajax({
	updateElement: 'divSample',
	response_type: 'TEXT',
	remote_method: "ajax_fields",
	parameters: function(){
       sel = miolo.getElementById("abrangencia");
	   return sel.value;
	}
});
