ajaxSelection = new Miolo.Ajax({
	updateElement: 'm_idMunicipioNasc',
	response_type: 'TEXT',
	remote_method: "ajax_MunicipioNascimento",
	parameters: function(){
       sel = miolo.getElementById("idUfNasc");
	   return {value: sel.value, option: sel.options[sel.selectedIndex].text};
	}
});

ajaxSelection2 = new Miolo.Ajax({
	updateElement: 'm_idMunicipio',
	response_type: 'TEXT',
	remote_method: "ajax_Municipio",
	parameters: function(){
       sel = miolo.getElementById("idUf");
	   return {value: sel.value, option: sel.options[sel.selectedIndex].text};
	}
});