var ajaxCurso = new Miolo.Ajax({
	updateElement: 'divCurso',
	response_type: 'TEXT',
	remote_method: "onSelectCargo",
	parameters: function(){
	   return miolo.getElementById("idcargoconfianca").value;
	}
});