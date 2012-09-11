Miolo.dragdrop = Class.create();

Miolo.dragdrop.prototype = {
    initialize: function(id) {
		this.id = id; 
		this.dropped = {};
	},
	onDrop: function(element, drop) {
		var ei = element.id;
		var di = drop.id;
		this.dropped[ei] = di;
		Droppables.dropped = true;
	},
	onSubmit: function() {
		var s = '';
		for (i in this.dropped)
		{
			s = s + ((s == '') ? '' : '&') + i + '=' + this.dropped[i];
		}
		$(this.id).value = s;
	}
}
