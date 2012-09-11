<!DOCTYPE html>
<!--		Phillip Pena Parente
		    29/06/2012
-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
				<link type="text/css" href="css/custom-theme/jquery-ui-1.8.21.custom.css" rel="Stylesheet" />
		<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js"></script>
		<script type="text/javascript" src="js/jquery.ui.datepicker-pt-BR.js"></script>
		<script>
	(function( $ ) {
		$.widget( "ui.combobox", {
			_create: function() {
				var input,
					self = this,
					select = this.element.hide(),
					selected = select.children( ":selected" ),
					value = selected.val() ? selected.text() : "",
					wrapper = this.wrapper = $( "<span>" )
						.addClass( "ui-combobox" )
						.insertAfter( select );

				input = $( "<input>" )
					.appendTo( wrapper )
					.val( value )
					.addClass( "ui-state-default ui-combobox-input" )
					.autocomplete({
						delay: 0,
						minLength: 0,
						source: function( request, response ) {
							var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
							response( select.children( "option" ).map(function() {
								var text = $( this ).text();
								if ( this.value && ( !request.term || matcher.test(text) ) )
									return {
										label: text.replace(
											new RegExp(
												"(?![^&;]+;)(?!<[^<>]*)(" +
												$.ui.autocomplete.escapeRegex(request.term) +
												")(?![^<>]*>)(?![^&;]+;)", "gi"
											), "<strong>$1</strong>" ),
										value: text,
										option: this
									};
							}) );
						},
						select: function( event, ui ) {
							ui.item.option.selected = true;
							self._trigger( "selected", event, {
								item: ui.item.option
							});
						},
						change: function( event, ui ) {
							if ( !ui.item ) {
								var matcher = new RegExp( "^" + $.ui.autocomplete.escapeRegex( $(this).val() ) + "$", "i" ),
									valid = false;
								select.children( "option" ).each(function() {
									if ( $( this ).text().match( matcher ) ) {
										this.selected = valid = true;
										return false;
									}
								});
								if ( !valid ) {
									// remove invalid value, as it didn't match anything
									$( this ).val( "" );
									select.val( "" );
									input.data( "autocomplete" ).term = "";
									return false;
								}
							}
						}
					})
					.addClass( "ui-widget ui-widget-content ui-corner-left" );

				input.data( "autocomplete" )._renderItem = function( ul, item ) {
					return $( "<li></li>" )
						.data( "item.autocomplete", item )
						.append( "<a>" + item.label + "</a>" )
						.appendTo( ul );
				};

				$( "<a>" )
					.attr( "tabIndex", -1 )
					.attr( "title", "Show All Items" )
					.appendTo( wrapper )
					.button({
						icons: {
							primary: "ui-icon-triangle-1-s"
						},
						text: false
					})
					.removeClass( "ui-corner-all" )
					.addClass( "ui-corner-right ui-combobox-toggle" )
					.click(function() {
						// close if already visible
						if ( input.autocomplete( "widget" ).is( ":visible" ) ) {
							input.autocomplete( "close" );
							return;
						}

						// work around a bug (likely same cause as #5265)
						$( this ).blur();

						// pass empty string as value to search for, displaying all results
						input.autocomplete( "search", "" );
						input.focus();
					});
			},

			destroy: function() {
				this.wrapper.remove();
				this.element.show();
				$.Widget.prototype.destroy.call( this );
			}
		});
	})( jQuery );

	$(function() {
		$( "#combobox" ).combobox();
		$( "#toggle" ).click(function() {
			$( "#combobox" ).toggle();
		});
	});
	</script>
	<script>
	$(function() {
		$( "#carro" ).selectable();
	});
	</script>
	<script>
	$(function() {
		$( "#carro2" ).selectable();
	});
	</script>
	<script>
	$(function() {
		$( "#selectable" ).selectable({
			stop: function() {
				var result = $( "#select-result" ).empty();
				$( ".ui-selected", this ).each(function() {
					var index = $( "#selectable li" ).index( this );
					result.append( " #" + ( index + 1 ) );
				});
			}
		});
	});
	</script>
	<script>
	$(function() {
		$( "#slider-vertical" ).slider({
			orientation: "vertical",
			range: "min",
			min: 0,
			max: 100,
			value: 50,
			step: 25,
			slide: function( event, ui ) {
				if(ui.value==25){
						$( "#amount" ).val( "1/4" );
				}else if(ui.value==50){
						$( "#amount" ).val( "1/2" );
				}else if(ui.value==75){
						$( "#amount" ).val( "3/4" );
				}else if(ui.value==100){
						$( "#amount" ).val( "Cheio." );
				}else if(ui.value==0){
						$( "#amount" ).val( "Vazio." );
				}


			}
		});
		$( "#amount" ).val( "1/2" );
	});
	</script>
	<script>
	// increase the default animation speed to exaggerate the effect
	$.fx.speeds._default = 1000;
	$(function() {
		$( "#dialog" ).dialog({
			autoOpen: false,
			show: "fade",
			hide: "drop"
		});

		$( "#opener" ).click(function() {
			$( "#dialog" ).dialog( "open" );
			return false;
		});
	});
	</script>
	<script>
	$(function() {
		$( "input:submit, a, opener", ".botaoAjuda" ).button();
		$( "a", ".botaoAjuda" ).click(function() { return false; });
	});
	</script>
	<script>
		$(function() {
				$( "#tabs" ).tabs();
		});
	</script>
	<script>
	$(function() {
		$( "#inspecao1" ).buttonset();
	});
	</script>
	<script>
	$(function() {
		$( "#inspecao2" ).buttonset();
	});
	</script>
	<script>
	$(function() {
		$( "input:submit, a, button", ".partesInspecionadas" ).buttonset();
	});
	</script>


		<style>
				body{
						font-size:  62.5%;

/*						font-family: sans-serif;*/
/*						font: caption;*/
						margin: 0;
						padding: 0;
						background-color: #6E8D62;
/*						text-align:center;*/
				}
				#topo-geral {
						background: url("../relatorios2/view/statics/img/fundo_topo.jpg");
						}
				#topo {
						width: 100%;
						height: 92px;
						background: url("../relatorios2/view/statics/img/topo1.jpg") no-repeat scroll 0 0 transparent;
				}
				#topo-mec{
						padding: 5px;
						height: 21px;
						background: none repeat scroll 0 0 #FFCC00;
				}
				#conteudoGeral{

						position: relative;
						left: 20%;
						width: 960px;
						height: 2200px;
						border-radius: 10px;
						border-left: 10px green groove;
						border-right: 10px green groove;
						float: top;
						background-color: white;
						text-align: left;


				}
				.ui-combobox {
						position: relative;
						display: inline-block;
				}
				.ui-combobox-toggle {
						position: absolute;
						top: 0;
						bottom: 0;
						margin-left: -1px;
						padding: 0;
						/* adjust styles for IE 6/7 */
						*height: 1.7em;
						*top: 0.1em;
				}
				.ui-combobox-input {
						margin: 0;
						padding: 0.3em;
				}
				h2{
						text-align: center;
				}
				h1{
						text-align: center;
				}
				#cabecalho{
/*						border: 1px #3f7506 groove;*/
						font-size: 150%;

				}
				#conteudo{
						float: left;
						left: 200px;
						text-align: center;

						width: 700px;
						float: left;
				}
				#ladoEsquerdo{

						width: 300px;
						float: left;
				}
				#ladoDireito{

						position: relative;
						float: right;
						width: 300px;
				}
				.ui-autocomplete{
						font-size: 170%;

						padding: 0;
						margin: 0;
				}
				table{
/*						border: 1px #3f7506 double;*/
						width: 450px;
				}
				td{
/*						border: 1px #3f7506 double;*/
						padding: 5px;
						margin: 0;
				}

				span.ui-combobox{
						width: 100%;
				}
				.ui-corner-all{
						border-radius: 10px;
				}
	</style>
	<style>
	#feedback { font-size: 1.4em; }
	#carro .ui-selecting { background: transparent;  }
	#carro .ui-selected { background: url("img/selected.png"); }
	#carro { list-style-type: none; margin: 0; padding: 0; }
	#carro li { margin: 3px; padding: 1px; float: left; width: 60px; height: 50px; font-size: 2em; text-align: center; background: transparent;}

	#carro2 .ui-selecting { background: transparent;  }
	#carro2 .ui-selected { background: url("img/selected.png"); }
	#carro2 { list-style-type: none; margin: 0; padding: 0; }
	#carro2 li { margin: 3px; padding: 1px; float: left; width: 60px; height: 50px; font-size: 2em; text-align: center; background: transparent;}

	#gradeCarro{
			border: 2px #3f7506 groove;
			width: 660px;
			height: 193px;
			cursor: pointer;
			background-image: url("img/side.png");
			background-repeat: no-repeat;

	}
	#gradeCarro2{
			border: 2px #3f7506 groove;
			width: 660px;
			height: 193px;
			cursor: pointer;
			background-image: url("img/side2.png");
			background-repeat: no-repeat;


	}
	.ui-selected{
			background-color: transparent;
			color: transparent;
	}
	li.ui-state-default.ui-selectee.ui-selected{
			background-color: transparent;
			color: transparent;
	}
	</style>
	<style>
		#combustivel-frame > div.combustivel{

				padding: 10px !important;

				left:200px;
		}
		#combustivel{
				 margin: 10px auto 0 auto;
				  float: left;

				margin-left: 30px; /*Set margin to that of -(MainContainerWidth)*/

				height: auto;


		}
		#combustivel2{
				 margin: 10px auto 0 auto;
				float: next;
				position: relative;
				width: 100%; /*Width of right column*/
				margin-right: auto; /*Set left margin to -(RightColumnWidth)*/
/*				height: 400px;*/

				height: auto;

		}
		#partesInspecionadas{
				width: 100%;
				float: left;

		}
		#partesInspecionadas table{
				position: relative;

				width: 100%;
		}
		#partesInspecionadas td input{
				cursor: pointer;
				display: block;
		}
	</style>

	</head>

    <body>
				<div id="conteudoGeral" >
				<div id="topo-mec">
						<a href="http://portal.mec.gov.br/" class="img-mec"><img alt="Ministerio da Educação" src="../relatorios2/view/statics/img/h1pq.gif" /></a>
						<a href="http://www.brasil.gov.br/" class="img-selo"><img alt="Portal do Governo" src="../relatorios2/view/statics/img/selo_brasil_pq.gif" /></a>
				</div>
				<div id="topo-geral">
				<div id="topo">
						<span class="titulo">SIGA - Sistema Integrado de Gestão Acadêmica</span>
				</div>
				</div>

						

				<div id="cabecalho" class="ui-corner-all">
						<h2 style="font-size: 140%;" class="ui-widget-header	ui-corner-all">Serviço Público Federal</h2>
						<h2>Ministério Da Educação e Cultura - MEC</h2>

						<hr/>
						<h2 >Instituto Federal De Educação, Ciência e Tecnologia</h2>

				</div>
						<h2 class="ui-widget-header	ui-corner-all" style="font-size: 160%;">Inspeção de Veículos</h2>

		<br/>


		<table >
				<tr>
						<td><span style="font-size: 120%;">Veículo:</span></td><td><input type="text" class=" ui-corner-all"  style="font-size: 120%;" /></td>

						<td><span style="font-size: 120%;">Placa:</span></td><td><input type="text" class=" ui-corner-all"  style="font-size: 120%;" /></td>
				</tr>
				<tr>
						<td><span style="font-size: 120%;">Data Saída:</span></td><td><input type="text" class=" ui-corner-all" style="font-size: 120%;" /></td>

						<td><span style="font-size: 120%;">Condutor:</span></td><td><input type="text" class=" ui-corner-all" style="font-size: 120%;" /></td>
				</tr>
				<tr>
						<td><span style="font-size: 120%;">Setor:</span></td>
						<td>
								<select id="combobox">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
								</select>
						</td>

						<td><span style="font-size: 120%;">Hora:</span></td><td><input type="text" class=" ui-corner-all" style="font-size: 120%;" /></td>
				</tr>
				<tr>
						<td><span style="font-size: 120%;">Itinerário:</span></td><td><input type="text" class=" ui-corner-all" style="font-size: 120%;" /></td>

						<td><span  style="font-size: 120%;">Inspetor:</span></td><td><input type="text" class=" ui-corner-all" style="font-size: 120%;" /></td>
				</tr>
		</table>
		<br/>
		<h2 class="ui-widget-header	ui-corner-all" style="font-size: 180%;">Check List do Veículo</h2>
				Marque os danos existentes no veículo:
		<div id="botaoAjuda">
				<button id="opener">Ajuda</button>
		</div>


		<div id="dialog" title="Ajuda">
				<p>Mantenha a tecla "CTRL" pressionada para selecionar múltiplas partes.</p>
		</div>
		<div id="tabs">
				<ul>
						<li><a href="#gradeCarro">Lado Esquerdo</a></li>
						<li><a href="#gradeCarro2">Lado Direito</a></li>
						<li><a href="#gradeCarro2">Frente</a></li>
						<li><a href="#gradeCarro2">Traseira</a></li>
				</ul>

		<div id="gradeCarro">

		<ol id="carro">

				<li class="ui-state-default ui-corner-all"></li>
				<li class="ui-state-default ui-corner-all">1</li>
				<li class="ui-state-default ui-corner-all">2</li>
				<li class="ui-state-default ui-corner-all">3</li>
				<li class="ui-state-default ui-corner-all">4</li>
				<li class="ui-state-default ui-corner-all">5</li>
				<li class="ui-state-default ui-corner-all">6</li>
				<li class="ui-state-default ui-corner-all"></li>
				<li class="ui-state-default ui-corner-all">7</li>
				<li class="ui-state-default ui-corner-all">8</li>
				<li class="ui-state-default ui-corner-all">9</li>
				<li class="ui-state-default ui-corner-all">10</li>
				<li class="ui-state-default ui-corner-all">11</li>
				<li class="ui-state-default ui-corner-all">12</li>
				<li class="ui-state-default ui-corner-all">13</li>
				<li class="ui-state-default ui-corner-all">14</li>
				<li class="ui-state-default ui-corner-all">15</li>
				<li class="ui-state-default ui-corner-all">16</li>
				<li class="ui-state-default ui-corner-all">17</li>
				<li class="ui-state-default ui-corner-all">18</li>
				<li class="ui-state-default ui-corner-all">19</li>
				<li class="ui-state-default ui-corner-all">20</li>
				<li class="ui-state-default ui-corner-all">21</li>
				<li class="ui-state-default ui-corner-all">22</li>
				<li class="ui-state-default ui-corner-all">23</li>
				<li class="ui-state-default ui-corner-all">24</li>
				<li class="ui-state-default ui-corner-all">24</li>

		</ol>
		</div>
		<div id="gradeCarro2">

		<ol id="carro2">

				<li class="ui-state-default ui-corner-all"></li>
				<li class="ui-state-default ui-corner-all">1</li>
				<li class="ui-state-default ui-corner-all">2</li>
				<li class="ui-state-default ui-corner-all">3</li>
				<li class="ui-state-default ui-corner-all">4</li>
				<li class="ui-state-default ui-corner-all">5</li>
				<li class="ui-state-default ui-corner-all"></li>
				<li class="ui-state-default ui-corner-all"></li>
				<li class="ui-state-default ui-corner-all"></li>
				<li class="ui-state-default ui-corner-all">6</li>
				<li class="ui-state-default ui-corner-all">7</li>
				<li class="ui-state-default ui-corner-all">8</li>
				<li class="ui-state-default ui-corner-all">9</li>
				<li class="ui-state-default ui-corner-all">10</li>
				<li class="ui-state-default ui-corner-all">11</li>
				<li class="ui-state-default ui-corner-all">12</li>
				<li class="ui-state-default ui-corner-all">13</li>
				<li class="ui-state-default ui-corner-all">14</li>
				<li class="ui-state-default ui-corner-all">15</li>
				<li class="ui-state-default ui-corner-all">16</li>
				<li class="ui-state-default ui-corner-all">17</li>
				<li class="ui-state-default ui-corner-all">18</li>
				<li class="ui-state-default ui-corner-all">19</li>
				<li class="ui-state-default ui-corner-all">20</li>
				<li class="ui-state-default ui-corner-all">21</li>
				<li class="ui-state-default ui-corner-all">22</li>
				<li class="ui-state-default ui-corner-all">23</li>

</ol>
		</div>
		</div>
		<br/>
		<h2 class="ui-widget-header	ui-corner-all" style="font-size: 180%;">Combustível</h2>
		<h3 class="ui-widget-content" align="center">Selecione o nível de combustível atual</h3>

		<div id="combustivel">


				<br/>
				<br/>

				<div id="slider-vertical"></div>

		</div>
		<div id="combustivel2">
				<table>
						<td><span>Tanque de Combustível:</span></td>
						<td><input type="text" id="amount" style="border:0; color: #F6921E; font-weight:bold; width: 60px;"  /></td>
						<td><span  >KM Saída:</span></td><td><input type="text" class=" ui-corner-all"  /></td>
				</table>

		</div>
		<div id="partesInspecionadas">
			<h2 class="ui-widget-header	ui-corner-all" style="font-size: 180%;">Inspeção do Veículo</h2>
			<h3 class="ui-widget-content" align="center">Marque a situação dos Itens Inspecionados</h3>
			<h3 class="ui-widget-content" align="center">OK(Em Conformidade) NA(Não se Aplica) NC(Não Conforme)</h3>


			<table border="1" class="ui-corner-all">
				<tr>
				<th rowspan="2" class="ui-widget-header	ui-corner-all">Itens Inspecionados</th>
				<th colspan="3" class="ui-widget-header	ui-corner-all">Situação</th>
				<th rowspan="2" class="ui-widget-header	ui-corner-all">Observação</th>
				</tr>
				<tr>
						<th class="ui-widget-header	">OK</th>
						<th class="ui-widget-header	">NC</th>
						<th class="ui-widget-header	">NA</th>
				</tr>
				<?php

				$arrayCampos= array(
						"Nível Óleo Motor",
						"Nível Óleo Hidráulico (Freio e Direção)",
						"Nível Agua de Arref. Motor",
						"Nível de Água Limpeza de Pára-brisa",
						"Bancos/Assentos",
						"Assoalhos",
						"Buzina",
						"Cinto de Segurança",
						"Espelho Retrovisor",
						"Extintor de Incêndio",
						"Macaco / Triângulo",
						"Freio de Estacionamento",
						"Pára-Brisas (Vidro)",
						"Portas (Abrir Por Dentro)",
						"Pneus/ Estepe",
						"Farol (Luz Alta, baixa e estacionamento)",
						"Luz de Ré",
						"Luz de Freio",
						"Pisca Alerta",
						"Limpador de Pára Brisa",
						"Setas",
						"Travamento do Capô",
				);
				  for($i=0;$i<22;$i++){


						?>

				<tr>

						<td class="ui-corner-all" style="width: 40%;"><?php echo $arrayCampos[$i] ?></td>

						<td style="width: 7%; text-align: center;" class="ui-corner-all"><input type="radio" id="<?php echo "radio".$i ?>" name="<?php echo "radio".$i ?>" checked="true" /><label for="<?php echo "radio".$i; ?>" >OK</label></td>
								<td style="width: 7%; text-align: center;" class="ui-corner-all"><input type="radio" id="<?php echo "radio".$i ?>" name="<?php echo "radio".$i ?>" /><label for="<?php echo "radio".$i+1; ?>"></label>NC</td>
								<td style="width: 7%; text-align: center;" class="ui-corner-all"><input type="radio" id="<?php echo "radio".$i ?>" name="<?php echo "radio".$i ?>" checked="true" /><label for="<?php echo "radio".$i+2; ?>">NA</label></td>

						<td class="ui-corner-all"></td>

				</tr>

				<?php } ?>

</table>



		</div>
		</div>

		</body>
</html>