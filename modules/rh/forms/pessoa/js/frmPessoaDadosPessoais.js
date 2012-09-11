/*var ajaxSelection = new Miolo.Ajax({
	updateElement: 'idpaisnacionalidade',
	response_type: 'TEXT',
	remote_method: "ajax_selPaisNascimento",
	parameters: function(){
       sel = miolo.getElementById("idpaisnascimento");
	   return {value: sel.value, option: sel.options[sel.selectedIndex].text};
	}
});*/

var ajaxSelection = new Miolo.Ajax({
	response_type: 'JSON',
	//remote_method: "ajax_selPaisNascimento",
	parameters: function(){
       sel = miolo.getElementById("idpaisnascimento");
       miolo.getElementById('idpaisnacionalidade').value = sel.value;
	   //return {value: sel.value, option: sel.options[sel.selectedIndex].text};
	   return sel.value;
	}
});