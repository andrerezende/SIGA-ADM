/* Copyright 2006, 2007, 2008, 2009, 2010 do SETEC/MEC
 *
 * Este arquivo é parte do programa SigaEPT
 *
 * O SigaEPT é um software livre;  você pode redistribuí-lo e/ou modificá-lo dentro dos
 * termos da Licença Pública Geral GNU como publicada pela fundação do software livre (FSF);
 * na versÃ£o 2 da Licença.
 *
 * Este programa é distribuí­do na esperança que possa ser útil, mas SEM NENHUMA GARANTIA; sem
 * uma garantia implícita de ADEQUAÇÃO a qualquer MERCADO ou APLICAÇÃO EM PARTICULAR. Veja Licença
 * Pública Geral GNU/GPL em português para maiores detalhes.
 *
 * Você deve ter recebido uma cópia da Licença Pública Geral GNU, sob o título "LICENCA.txt",
 * junto com este programa, se não, acesse o portal do Software Público Brasileiro no endereço
 * www.softwarepublico.gov.br ou escreva para Fundação do Software Livre (FSF) Inc.,51 Franklin
 * St, Fifth Floor, Boston, MA 02110-1301, USA
 */

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
