/**
 * FORM
 */

Miolo.form = Class.create();

Miolo.form.prototype = {
    initialize: function(id) {
		this.id = id; 
	},
    setFocus: function (fieldName) {
		if (fieldName == '') {
			var element = null;
			var f = miolo.getElementById(this.id);
    	    var children = f.getElementsByTagName('input');
			if (children.length == 0) {
        	    var children = f.getElementsByTagName('select');
    			if (children.length > 0) {
					element = children[0];
				}
			} else {
				element = children[0];
			}
		} else {
			var element = miolo.getElementById(fieldName);
		}
        if (element != null) {
           element.focus();
        }
    }
}