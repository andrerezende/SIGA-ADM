// receives a Javascript object as result and updates a element manually
var ajaxCursoSelectionObject = new Miolo.Ajax({
	response_type: 'JSON',
	remote_method: "ajax_btnGetInstituicao",
	parameters: function(){
       sel = miolo.getElementById("nome");
	   return sel.value;
	},
	callback_function: function(result,text) {
       m = result.data;
       miolo.getElementById('edtEntidade').value = m[1];
       miolo.getElementById('edtDataInicioCapacitacao').value = m[2];

       if(m[0] == 1){
               miolo.getElementById('edtDataFimCapacitacao').value = m[3];
               miolo.getElementById('edtCargaHoraria').value = m[4];
               miolo.getElementById('idsModulos').value = m[5];
               
       } else {
         if (m[0]>1){

           miolo.getElementById('edtDataFimCapacitacao').value = '';
           miolo.getElementById('edtCargaHoraria').value = '';
           }
       }
       

	}
});

var ajaxApareceLink = new Miolo.Ajax({
  updateElement: 'divSample',
  response_type: 'TEXT',
  remote_method: "ajax_mostraModulos",
  parameters: function(){
       sel = miolo.getElementById("divSample");
       id =  miolo.getElementById("nome");
       return id.value;

  }
});

var ajaxEscolha = new Miolo.Ajax({

  updateElement: 'edtCargaHoraria',
  response_type: 'TEXT',
  remote_method: "ajax_mostraModulos",

  parameters: function(){

       var ids = new Array();
       var limite = miolo.getElementById('esc').value;
       miolo.getElementById('idsModulos').value = '';
       var total = 0;
       var nome = '';

       for(i=0;i<limite;i++){
          nome = 'escolha'+i;
          if(miolo.getElementById(nome).checked){
               str = miolo.getElementById(nome).value;
               valores = str.split("&");
               ids[i] = valores[1];
               total = total + parseInt(valores[0]);
               miolo.getElementById('idsModulos').value = miolo.getElementById('idsModulos').value+ids[i]+'*';
          }
       }
       miolo.getElementById('edtCargaHoraria').value = total;

  }
});

var ajaxAtualizaPagina = new Miolo.Ajax({

  response_type: 'TEXT',
  remote_method: "ajax_atualizaPagina",
  parameters: function(){
      idFuncionario = miolo.getElementById("idFuncAjax").value;

       window.location.href = "index.php?module=rh&action=main:funcionario&item="+idFuncionario+"&form=capacitacoes";
      //window.location.href = "index.php?module=rh&action=main:funcionario&item=011486813&form=capacitacoes";


  }

});






