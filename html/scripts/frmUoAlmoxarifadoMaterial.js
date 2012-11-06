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
	$j("input[name='radio']:radio").change(function() {
		if ($j("input[name='radio']:checked").val() == 2) {
			$j("#cnpj").parent(".field").parent(".m-form-row").fadeOut();
			$j("#notaFiscal").parent(".field").parent(".m-form-row").fadeOut();
			$j("#numeroEmpenho").parent(".field").parent(".m-form-row").fadeOut();
		} else {
			$j("#cnpj").parent(".field").parent(".m-form-row").fadeIn();
			$j("#notaFiscal").parent(".field").parent(".m-form-row").fadeIn();
			$j("#numeroEmpenho").parent(".field").parent(".m-form-row").fadeIn();
		}
	});

	$j("#edtEstoqueMin").click(function(e) {
		var dislpayLink = $j("#edtEstoqueMin").css("display");
		$j.ajax({
			type: 'POST',
			url: 'index.php?module=adm&action=main:uoalmoxarifado&item='+$j.getUrlVar('item')+'&form=entrada2006&id='+$j.getUrlVar('id'),
			data: {'updateEstoqueMinimo': true, 'estoqueMin': $j("#estoqueMin").val()},
			statusCode: {
				404: function() {
					console.log($j.getUrlVars());
				}
			},
			beforeSend: function() {
				$j("#edtEstoqueMin").css("display", "none");
				$j("#loading").css("display", "block");
			},
			complete: function() {
				$j("#edtEstoqueMin").css("display", dislpayLink);
				$j("#loading").css("display", "none");
			}
		});
		e.preventDefault();
	});
});