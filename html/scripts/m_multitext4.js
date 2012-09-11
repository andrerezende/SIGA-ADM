/**
 * MULTITEXTFIELD4
 */

Miolo.multiTextField4 = Class.create();

Miolo.multiTextField4.prototype = Object.extend(new Miolo.multiTextField3(), {
	getTable : function(mtfName) {
		return eval(mtfName + '_table');
	},
    onSubmit: function (frmName, mtfName) {
       var tbl = this.getTable(mtfName);
       data = tbl.getdata();
       for (var i = 0; i < data.length; i++) {
     	   var list = document.createElement('INPUT');
	       list.id = mtfName + '[]';
	       list.name = mtfName + '[]';
		   list.type = 'hidden';
           list.value = this.join(data[i]);
           miolo.getForm().appendChild(list);
	   }
	   return true;
    },
    onSelect: function (frmObj, mtfName, sFields) {
       var tbl = this.getTable(mtfName);
       tbl.onmouse = false;
//       tbl.unload();
       tbl.customSelect = function() {
           var aFields = sFields.split(',');
           var fields = new Array(aFields.length);
           var text = this.get(tbl.rowSelected);
           for (var i = 0; i < text.length; i++)
           {
               var field = document.getElementById(aFields[i]);
               if (field.options != null) // selection
               {
                   for (var n = 0; n < field.options.length; n++)
                   {
                       if (field.options[n].text == text[i])
                       {
                           field.selectedIndex = n;
                           break;
                       }
                   }
               }
               else // text
               {
                   field.value = text[i];
               }
           }
	   }
    },
    getInput: function (frmObj, mtfName, sFields) {
       var aFields = sFields.split(',');
       var fields = new Array(aFields.length);
       for (var i = 0; i < aFields.length; i++) {
          var field = miolo.getElementById(aFields[i]);
          if (field.options != null) { // selection
             fields[i] = field.options[field.selectedIndex].text;
          }
          else { // text
             fields[i] = field.value;
          }
       }
       return fields; 
    },
    add: function (frmObj, mtfName, sFields) {
       var tbl = this.getTable(mtfName);
       tbl.add(this.getInput(frmObj, mtfName, sFields));  
    },
    remove: function (frmObj, mtfName, sFields) {	   
       var tbl = this.getTable(mtfName);
       tbl.drop(tbl.rowSelected);
    },
    modify: function (frmObj, mtfName, sFields) {
       var tbl = this.getTable(mtfName);
       if (tbl.rowSelected != '')
       {
           tbl.modify(tbl.rowSelected, this.getInput(frmObj, mtfName, sFields));  
       }
       else
       {
           alert('É preciso selecionar o item a ser modificado!');
       }
    }
});

miolo.multiTextField4 = new Miolo.multiTextField4();
