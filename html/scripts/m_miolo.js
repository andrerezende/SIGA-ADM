Miolo = Class.create();

Miolo.prototype = {
    Version: 'Miolo2.beta2',
	webForm: null,
    initialize: function() {
	},
    iFrame: {
		object: null,
		dialogs: new Array(),
		sufix: 0,
		dragElement: null,
		base: window,
		parent: null,
		getById: function(id) {
            return this.parent.miolo.iFrame.dialogs[id];
		}
	},
    windows: {
		handle: new Array(),
		sufix: 0,
		base: window
	},
    getWindow: function(windowId) {
    	var m = this.windows.base.miolo;
        return m.windows.handle[windowId];
	},
	setWindow: function(oWindow) {
    	var m = this.windows.base.miolo;
        m.windows.handle[oWindow.id] = oWindow;
	},
	setForm: function (formId) {
		this.webForm = this.getElementById(formId);
	},
	getForm: function () {
		return this.webForm;
	},
	getCurrentURL: function () {
		return this.webForm.action;
	},
    getElementById: function (e) {
        if(typeof(e)!='string') return e;
        if(document.getElementById) {e = $(e);}
        else if(document.all) {e=document.all[e];}
        else {e=null;}
        return e;
    },
	setElementValueById: function (e, value) {
        ele = this.getElementById(e);
        if (ele != null)
	    {
		    ele.value = value;
	    } 
    },
    gotoURL: function (url) {
        var prefix = 'javascript:';
        url = url.replace(/&amp;/g,"&");
        if ( url.indexOf(prefix) == 0 )
        {
            eval(url.substring(11) + ';');
        }
        else
        {
            window.location = url;
        }
    },
	window: function (url, target)
    {
        var mioloWindow = new xWindow(
            target,                // target name
            0, 0,                   // size: width, height
            0, 0,                   // position: left, top
            0,                      // location field
            1,                      // menubar
            1,                      // resizable
            1,                      // scrollbars
            0,                      // statusbar
            1);                     // toolbar
        return mioloWindow.load(url);
    },
    setTitle: function setTitle(title)
    {
        try
        {
    	    window.top.document.title = title;    	
        }
        catch (e)
        {
        }
    },
	associateObjWithEvent: function (obj, methodName){
    /* The returned inner function is intended to act as an event
       handler for a DOM element:-
    */
        return (function(e){return obj[methodName](e, this);});
    },
    submit: function() {
       var action = this.getElementById(this.getElementById('__FORMSUBMIT').value + '_action');
       this.webForm.action = action ? action.value : this.webForm.action;
       this.setElementValueById('__ISPOSTBACK','yes');
	},
    doPostBack: function (eventTarget, eventArgument, formSubmit) {
        this.setElementValueById('__ISPOSTBACK', 'yes');
        this.setElementValueById('__EVENTTARGETVALUE', eventTarget);
        this.setElementValueById('__EVENTARGUMENT', eventArgument); 
        this.setElementValueById('__FORMSUBMIT', formSubmit); 
    },
    doDisableButton: function (buttonId) {
        this.getElementById(buttonId).disabled = true;
    },
    doPrintForm: function (url) {
        var w = screen.width * 0.75;
        var h = screen.height * 0.60;
        var print = window.open(url,'print',
        'toolbar=no,width='+w+',height='+h+',scrollbars=yes,' +
        'top=0,left=0,statusbar=yes,resizeable=yes');
    },
	doPrintFile: function () {
        var ok = confirm("Aguarde a geração do relatório.\nO resultado será exibido em uma nova janela.");
        if (ok)
        {
            var tg = window.name;
            var form = document.forms[0];
            var w = screen.width * 0.95;
            var h = screen.height * 0.80;
            var print = window.open('','print', 
            'toolbar=no,width='+w+',height='+h+',scrollbars=yes,' +
            'top=0,left=0,statusbar=yes,resizeable=yes');
            form.target='print'; 
            form.submit(); 
            print.focus();
            form.target=tg;
        }
    },
    doShowPDF: function () {
        var ok = confirm("Aguarde a geração do arquivo PDF.\nO resultado será exibido em uma nova janela.");
        if (ok)
        {
            var tg = window.name;
            var form = document.forms[0];
            var w = screen.width * 0.95;
            var h = screen.height * 0.80;
            var print = window.open('','print', 
            'toolbar=no,width='+w+',height='+h+',scrollbars=yes,' +
            'top=0,left=0,statusbar=yes,resizeable=yes');
            form.target='print'; 
            form.submit(); 
            print.focus();
            form.target=tg;
        }
    },
    doPrintURL: function (url) {
        var ok = confirm('Clique Ok para imprimir.');
        if (ok)
        {
            var tg = window.name;
            var form = document.forms[0];
            var w = screen.width * 0.95;
            var h = screen.height * 0.80;
            var print = window.open(url,'print', 
            'toolbar=no,width='+w+',height='+h+',scrollbars=yes,' +
            'top=0,left=0,statusbar=yes,resizeable=yes');
            print.focus();
            window.print();
            form.target=tg;
        }
    }
}

var miolo = new Miolo;
if (window.parent && window.parent.miolo)
{
    miolo.windows.base = window.parent.miolo.windows.base;
}

