var cp = new cpaint();
cp.set_transfer_mode("POST");
//cp.set_debug(2);

Miolo.Ajax = Class.create();

Miolo.Ajax.prototype = {
    initialize: function(obj) {
		this.obj = obj;
	},
	loading: "<img src=\"images/loading.gif\" border=\"0\" alt=\"\">",
	url: null,
	update: function (result) {
        miolo.getElementById(this.obj.updateElement).innerHTML = result;
	},
	call: function() {
		if (this.obj.updateElement) {
           this.update(this.loading);
		}
		url = this.obj.url ? this.obj.url : this.url ? this.url : miolo.getCurrentURL();
        cp.set_response_type(this.obj.response_type);
		callback_function = this.obj.callback_function ? this.obj.callback_function : this.update;
		cp.set_host_object(this);
		if (this.obj.parameters != null)
		{
            cp.call(url, this.obj.remote_method, callback_function, this.obj.parameters());
		}
		else
		{
            cp.call(url, this.obj.remote_method, callback_function);
		}
	}
}