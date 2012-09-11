

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

//
// Javascript code for gridHistEmpr.class
//
var row = 0;

var ajaxDetail = {
	call: function(currentRow,id, on) {
       row = currentRow;
       if (on == 1)
       { 
           var ajaxDetailObject = new Miolo.Ajax({
			   url: miolo.getCurrentURL()+'&idemprestimo='+miolo.getElementById('idemprestimo'),
	           updateElement: 'detail' + row,
	           response_type: 'TEXT',
	           remote_method: "ajax_detail",
	           parameters: function(){
                   return id;
 	           }
           });
		   ajaxDetailObject.call();
       }
       else
       {
          miolo.getElementById('detail' + row).innerHTML = '';
       }
    }
}
