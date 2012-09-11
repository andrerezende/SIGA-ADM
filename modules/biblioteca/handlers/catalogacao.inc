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
?>
<?
$perms->CheckAccess('BIB_PRECATALOGACAO',A_ACCESS,true);

// obter acesso as classes de Interface de Usu?rio
    $ui = $MIOLO->GetUI();

// adicionando link na barra de navegação, que aponte para o arquivo atual
// a variável $module vem através da URL e aponta para o módulo atual ('tutorial3')
    $navbar->AddOption('Catalogação', $module, 'main:catalogacao');

$theme->ClearContent();
//$theme->InsertContent(new ContentHeader('Módulo','Biblioteca'));
$close = $MIOLO->GetActionURL('biblioteca','main');
$Panel = new ActionPanel('pnlCatalogacao','Catalogação','',$close);
$Panel->AddUserAction('BIB_PRECATALOGACAO',A_ACCESS,'Pré - Catalogação',$ui->GetImage($module,'pre_catalogacao.png'),$module,'main:catalogacao:precatalogacao');
$Panel->AddUserAction('BIB_CATALOGACAO',A_ACCESS,'Catalogação',$ui->GetImage($module,'catalogacao.png'),$module,'main:catalogacao:catalogacao');

//testes
//$Panel->AddUserAction('BIB_CATALOGACAO',A_ACCESS,'Catalogação',$ui->GetImage($module,'catalogacao.png'),$module,'main:catalogacao:catalogacaoaltercao');


$Panel->AddUserAction('BIB_CATALOGACAO',A_ACCESS,'Assuntos da Obra',$ui->GetImage($module,'assunto_da_obra.png'),$module,'main:catalogacao:assunto');
$Panel->AddUserAction('BIB_PRECATALOGACAO',A_ACCESS,'Exemplares',$ui->GetImage($module,'exemplares.png'),$module,'main:catalogacao:exemplar');

//ALterado, adicionado
$Panel->AddUserAction('BIB_CATALOGACAOPERIODICOS',A_ACCESS,'Periódicos',$ui->GetImage($module,'periodicos.png'),$module,'main:catalogacao:periodicos');
$Panel->AddUserAction('BIB_PRECATALOGACAO',A_ACCESS,'Importação MARC',$ui->GetImage($module,'importacao_marc.png'),$module,'main:catalogacao:importacaoMARC');
$Panel->AddUserAction('BIB_PRECATALOGACAO',A_ACCESS,'Importacao na Tela',$ui->GetImage($module,'importacao_marc.png'),$module,'main:catalogacao:importacao');
$Panel->AddUserAction('BIB_PRECATALOGACAO',A_ACCESS,'Exportacao MARC',$ui->GetImage($module,'exportacao_marc.png'),$module,'main:catalogacao:exportacaoMARC');


$theme->AppendContent($Panel);
$handled = $MIOLO->InvokeHandler($module, 'catalogacao/' . $context->ShiftAction());

?>
