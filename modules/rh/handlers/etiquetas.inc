<?php
/* Copyright 2006, 2007, 2008, 2009, 2010 do SETEC/MEC
 *
 * Este arquivo é parte do programa SigaEPT
 *
 * O SigaEPT é um software livre;  você pode redistribuí-lo e/ou modificá-lo dentro dos
 * termos da Licença Pública Geral GNU como publicada pela fundação do software livre (FSF);
 * na versão 2 da Licença.
 *
 * Este programa é distribuído na esperança que possa ser útil, mas SEM NENHUMA GARANTIA; sem
 * uma garantia implícita de ADEQUAÇÃO a qualquer MERCADO ou APLICAÇÃO EM PARTICULAR. Veja Licença
 * Pública Geral GNU/GPL em português para maiores detalhes.
 *
 * Você deve ter recebido uma cópia da Licença Pública Geral GNU, sob o título “LICENCA.txt”,
 * junto com este programa, se não, acesse o portal do Software Público Brasileiro no endereço
 * www.softwarepublico.gov.br ou escreva para Fundação do Software Livre (FSF) Inc.,51 Franklin
 * St, Fifth Floor, Boston, MA 02110-1301, USA
 */
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Relatórios','rh','main:relatorio');
    $navbar->AddOption('Etiquetas','rh','main:etiquetas');
    $action = $context->ShiftAction();
    switch($action)
    {
        case 'internas':
        	$MIOLO->InvokeHandler('rh','etiquetas/internas');
        break;      		

        case 'externas':
        	$MIOLO->InvokeHandler('rh','etiquetas/externas');
        break;        

        case 'comoimprimir':
        	$MIOLO->InvokeHandler('rh','etiquetas/comoimprimir');
        break;   

        case 'prontas':
        	$MIOLO->InvokeHandler('rh','etiquetas/prontas');
        break;  

        case 'sql':
        	$MIOLO->InvokeHandler('rh','etiquetas/sql');
        break;  

		default:
            $close = $MIOLO->GetActionURL('rh','main');
            $panel = new ActionPanel('pnlRHEtiquetas','SIGA-RH - Etiquetas','',$close);
            $panel->setIconType('small');
            $panel->AddUserAction('rh_etiquetasinternas',A_ACCESS,'Internas (Malote)',$ui->GetImage('rh','etqinternas_mini.png'),'rh','main:etiquetas:internas');
            $panel->AddUserAction('rh_etiquetasexternas',A_ACCESS,'Externas (Correios)',$ui->GetImage('rh','etqexternas_mini.png'),'rh','main:etiquetas:externas');
			$panel->AddUserAction('rh_etiquetascomoimprimir',A_ACCESS,'Como Imprimir',$ui->GetImage('rh','etqexternas_mini.png'),'rh','main:etiquetas:comoimprimir');
            $panel->AddBreak();
			$panel->AddUserAction('rh_etiquetasprontas',A_ACCESS,'Etiquetas Prontas',$ui->GetImage('rh','admin_mini.png'),'rh','main:etiquetas:prontas');
			$panel->AddUserAction('rh_etiquetassql',A_ACCESS,'SQL',$ui->GetImage('rh','admin_mini.png'),'rh','main:etiquetas:sql');
            $panel->AddBreak();
            $theme->AppendContent($panel);
    }   
?>
