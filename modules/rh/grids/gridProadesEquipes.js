//
// Javascript code for gridCapacitacaoInsc.class
//
var row = 0;

var ajaxDetail = {
	call: function(currentRow,id, on) {
       row = currentRow;
       if (on == 1)
       { 
           var ajaxDetailObject = new Miolo.Ajax({
			   url: miolo.getCurrentURL()+'&idequipe='+miolo.getElementById('idequipe'),
	           updateElement: 'detail' + row,
	           response_type: 'TEXT',
	           remote_method: "ajax_detail",
	           parameters: function(){
                   return id;
 	           }
           });
		   ajaxDetailObject.call();
       }
       else
       {
          miolo.getElementById('detail' + row).innerHTML = '';
       }
    }
}
