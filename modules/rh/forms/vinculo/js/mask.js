function makeMask(_RefObjeto, _Modelo)
{
	var valorAtual = _RefObjeto.value;        
	var valorNumerico = '';
	var nIndexModelo = 0;
	var nIndexString = 0;
	var valorFinal = '';
	var adicionarValor = true;

	for ( i=0; i<_Modelo.length; i++ )
	{
		if ( _Modelo.substr(i,1) != '#' )
		{
			valorAtual = valorAtual.replace( _Modelo.substr(i,1), '' );
		}
	}

	for ( i=0; i<valorAtual.length; i++)
	{
		if ( !isNaN( parseFloat( valorAtual.substr(i,1) ) ) )
		{
			valorNumerico = valorNumerico + valorAtual.substr(i,1);
		}
	}

	for (i=0; i<_Modelo.length; i++)
	{
		if ( _Modelo.substr(i,1) == '#' )
		{
			if ( valorNumerico.substr(nIndexModelo,1) != '' )
			{
				valorFinal = valorFinal + valorNumerico.substr(nIndexModelo,1);
				nIndexModelo++;nIndexString++;
			} 
			else
			{
				adicionarValor = false;
			}
		} 
		else
		{
			if ( adicionarValor && valorNumerico.substr(nIndexModelo,1) != '' )
			{
				valorFinal = valorFinal + _Modelo.substr(nIndexString,1)
				nIndexString++;
			}
		}
	}
	_RefObjeto.value = valorFinal 
} // fecha a função makeMask(_RefObjeto, _Modelo);


function lastField(atual, anterior, teclapres)
{
		var tecla = teclapres.keyCode;
		conteudo = document.form[atual].value;
		tamanho = conteudo.length;
		if (!(tecla == 38 || tecla == 39 || tecla == 40 || tecla == 9 ))
		{
			if( (tecla == 37 || tecla == 8) && tamanho == 0)
			{
				document.form[anterior].focus();
			}
		}
}

function nextField(atual, proximo, tamMax, teclapres)
{
		var tecla = teclapres.keyCode;
		conteudo = document.form[atual].value;
		tamanho = conteudo.length;
		if (!( tecla == 37 || tecla == 38 || tecla == 40 || tecla == 9))
		{
			if( tamanho==tamMax && tecla != 39)
			{
				document.form[proximo].focus();
			}
		}
}