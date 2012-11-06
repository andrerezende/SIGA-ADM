function setDisabled() {
	tipo = xGetElementById("tipo");
	xGetElementById('descricao').readOnly = true;
	xGetElementById('unidade').readOnly = true;
	if (tipo.value == "material") {
		xGetElementById('b_idServico').style.display = "none";
		xGetElementById('idServico').disabled = "disabled";
		xGetElementById('fundamentacaoLegal').style.display = "none";
	} else if(tipo.value == "servico") {
		xGetElementById('b_idMaterial').style.display = "none";
		xGetElementById('idMaterial').disabled = "disabled";
		xGetElementById('fundamentacaoLegal').style.display = "none";
	} else {
		xGetElementById('b_idServico').style.display = "none";
		xGetElementById('idServico').disabled = "disabled";
		xGetElementById('b_idMaterial').style.display = "none";
		xGetElementById('idMaterial').disabled = "disabled";
		xGetElementById('fundamentacaoLegal').style.display = "none";
	}
}
function doTextTipo(url) {
	xWalkTree(xGetElementById('m-container'), function(e) {
		e.style.cursor = 'wait'
	});
	tipo = xGetElementById("tipo");
	cp.set_response_type("TEXT");
	if (tipo.value == "material") {
		xGetElementById('idMaterial').disabled = "";
		xGetElementById('b_idMaterial').style.display = "block";
		xGetElementById('b_idServico').style.display = "none";
		xGetElementById('idServico').disabled = "disabled";
		xGetElementById('idMaterial').focus();
	} else if(tipo.value == "servico") {
		xGetElementById('idServico').disabled = "";
		xGetElementById('b_idServico').style.display = "block";
		xGetElementById('b_idMaterial').style.display = "none";
		xGetElementById('idMaterial').disabled = "disabled";
		xGetElementById('idServico').focus();
	} else {
		xGetElementById('b_idServico').style.display = "none";
		xGetElementById('idServico').disabled = "disabled";
		xGetElementById('b_idMaterial').style.display = "none";
		xGetElementById('idMaterial').disabled = "disabled";
	}
	xWalkTree(xGetElementById('m-container'), function(e) {
		e.style.cursor = 'auto'
	});
}
function doTextFundamentacao(url) {
	xWalkTree(xGetElementById('m-container'), function(e){
		e.style.cursor = 'wait'
		});
	fundamentacao = xGetElementById("fundamentacao");
	xGetElementById('fundamentacaoLegal').value = fundamentacao.value;
	xGetElementById('fundamentacaoLegal').style.display = "block";
	xGetElementById('fundamentacaoLegal').readOnly = true;
	xWalkTree(xGetElementById('m-container'), function(e) {
		e.style.cursor = 'auto'
	});
}
