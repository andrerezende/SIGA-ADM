
ajaxSelection = new Miolo.Ajax({
	updateElement: 'm_idmunicipionascimento',
	response_type: 'TEXT',
	remote_method: "ajax_MunicipioNascimento",
	parameters: function(){
       sel = miolo.getElementById("idUfNascimento");
	   return {value: sel.value, option: sel.options[sel.selectedIndex].text};
	}
});

ajaxSelection2 = new Miolo.Ajax({
	updateElement: 'm_idmunicipio',
	response_type: 'TEXT',
	remote_method: "ajax_Municipio",
	parameters: function(){
       sel = miolo.getElementById("idUf");
	   return {value: sel.value, option: sel.options[sel.selectedIndex].text};
	}
});