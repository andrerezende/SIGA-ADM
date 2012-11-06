jQuery.noConflict();

var $j = jQuery;

// Read a page's GET URL variables and return them as an associative array.
$j.extend({
	getUrlVars: function(){
		var vars = [], hash;
		var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
		for (var i = 0; i < hashes.length; i++) {
			hash = hashes[i].split('=');
			vars.push(hash[0]);
			vars[hash[0]] = hash[1];
		}
		return vars;
	},
	getUrlVar: function(name){
		return $j.getUrlVars()[name];
	}
});

$j(document).ready(function() {
	$j("#edtDataHora").click(function(e) {
		var dislpayLink = $j("#edtDataHora").css("display");
		$j.ajax({
			type: 'POST',
			url: 'index.php?module=adm&action=main:uoalmoxarifado&item='+$j.getUrlVar('item')+'&form='+$j.getUrlVar('form')+'&idRequisicao='+$j.getUrlVar('idRequisicao'),
			data: {'updateDataHora': true, 'dataHora': $j("#dataHora").val()},
			statusCode: {
				404: function() {
					console.log($j.getUrlVars());
				}
			},
			beforeSend: function() {
				$j("#edtDataHora").css("display", "none");
				$j("#loading").css("display", "block");
			},
			complete: function() {
				$j("#edtDataHora").css("display", dislpayLink);
				$j("#loading").css("display", "none");
			}
		});
		e.preventDefault();
	});
});