/**
 * MULTISELECTION
 */
Miolo.multiSelection = Class.create();

Miolo.multiSelection.prototype = Object.extend(new Miolo.multiTextField2(), {
    add: function (frmObj, msfName, n) {
       var list = miolo.getElementById(msfName + this.emptyField);
       var selection = frmObj[msfName + '_options' + n];
       var n = list.length;
       var i = 0;
       var achou = false;
       var atext = selection.options[selection.selectedIndex].text;
       for (i = 0; i < n; i++) {
          if (list.options[i].text == atext)
             achou = true;
       }
       if (achou) {
          alert('Item já está na lista!');
       }
       else {
          list.options[n] = new Option(atext);
          list.selectedIndex = n;
       }
    }
});

miolo.multiSelection = new Miolo.multiSelection();
