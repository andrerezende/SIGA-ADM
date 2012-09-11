/**
 * MULTITEXTFIELD3
 */

Miolo.multiTextField3 = Class.create();

Miolo.multiTextField3.prototype = Object.extend(new Miolo.multiTextField2(), {
    onSelect: function (frmObj, mtfName, sFields) {
       var list = miolo.getElementById(mtfName + this.emptyField);
       var aFields = sFields.split(',');
       var i = list.selectedIndex;
       if (i != -1) {
          var a = this.split(list.options[i].text);
          for (var i = 0; i < aFields.length; i++) {
             var field = miolo.getElementById(aFields[i]);
             if (field.options != null) { // selection
                for (var n = 0; n < field.options.length; n++) {
                   if (field.options[n].text == a[i]) {
                      field.selectedIndex = n;
                      break;
                   }
                }
             }
             else { // text
                field.value = a[i];
             }
          }
       }
       else {
          for (var i = 0; i < aFields.length; i++) {
             var field = miolo.getElementById(aFields[i]);
             if (field.options != null) { // selection
                field.selectedIndex = -1;
             }
             else { // text
                field.value = '';
             }
          }
       }
    },
    getInput: function (frmObj, mtfName, sFields) {
       var list = miolo.getElementById(mtfName + this.emptyField);
       var value = '';
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
       return this.join(fields);
    },
    modify: function (frmObj, mtfName, sFields)
    {
	   var list = miolo.getElementById(mtfName + this.emptyField);
       var i = list.selectedIndex;
       if (i != -1) {
          list.options[i].text = this.getInput(frmObj, mtfName, sFields);
       }
       else {
          alert('É preciso selecionar o item a ser modificado!');
       }
    },
    add: function (frmObj, mtfName, sFields) {
       var list = miolo.getElementById(mtfName + this.emptyField);
       var i = list.length;
       list.options[i] = new Option(this.getInput(frmObj, mtfName, sFields));
       list.selectedIndex = i;
    }
});

miolo.multiTextField3 = new Miolo.multiTextField3();