//
// Javascript code for frmAjax.class
//

// receives a HTML code as result and updates a element automatically
ajaxBtnModulo = new Miolo.Ajax({
	updateElement: 'dadosmodulo',
	response_type: 'TEXT',
	remote_method: "ajaxBtnModulo",
	parameters: function(){
       sel = miolo.getElementById("idmodulo");
	   return {value: sel.value};
	}
});
