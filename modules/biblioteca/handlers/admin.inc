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
$perms->CheckAccess('BIB_ADMINISTRACAO',A_ACCESS,true);

// obter acesso as classes de Interface de Usu?rio
    $ui = $MIOLO->GetUI();

// adicionando link na barra de navegação, que aponte para o arquivo atual
// a variável $module vem através da URL e aponta para o módulo atual ('tutorial3')
    $navbar->AddOption('Administração', $module, 'main:admin');

$theme->ClearContent();
//$theme->InsertContent(new ContentHeader('Módulo','Biblioteca'));

$close = $MIOLO->GetActionURL('biblioteca','main');

$tutPanel = new ActionPanel('pnlAdministracao','Administração','',$close);
$tutPanel->AddAction('Unidades',$ui->GetImage($module,'unidades.png'),$module,'main:admin:unidade');
$tutPanel->AddAction('Grupos',$ui->GetImage($module,'grupos.png'),$module,'main:admin:grupo');
$tutPanel->AddAction('Estados',$ui->GetImage($module,'estados.png'),$module,'main:admin:estado');
$tutPanel->AddAction('Políticas',$ui->GetImage($module,'politicas.png'),$module,'main:admin:politica');
$tutPanel->AddAction('Operações',$ui->GetImage($module,'operacoes.png'),$module,'main:admin:operacao');
$tutPanel->AddAction('Gêneros',$ui->GetImage($module,'generos.png'),$module,'main:admin:genero');
$tutPanel->AddAction('Editoras',$ui->GetImage($module,'editoras.png'),$module,'main:admin:editora');

/*
$tutPanel->AddAction('Transições',$ui->GetImage('','button_edit.png'),$module,'main:admin:transicao');
*/

$tutPanel->AddAction('Direitos',$ui->GetImage($module,'direitos.png'),$module,'main:admin:direito');
$tutPanel->AddAction('Coleções',$ui->GetImage($module,'colecoes.png'),$module,'main:admin:colecao');
$tutPanel->AddAction('Infrações',$ui->GetImage($module,'infracoes.png'),$module,'main:admin:infracao');
$tutPanel->AddAction('Regras de Circulação',$ui->GetImage($module,'regras_de_circulacao.png'),$module,'main:admin:regracirculacao');
$tutPanel->AddAction('Situações da Reserva',$ui->GetImage($module,'situacao_da_reserva.png'),$module,'main:admin:reserva');
$tutPanel->AddAction('Assuntos',$ui->GetImage($module,'assuntos.png'),$module,'main:admin:assunto');
$tutPanel->AddAction('Autor',$ui->GetImage($module,'autor.png'),$module,'main:admin:autor');
$tutPanel->AddAction('Etiqueta',$ui->GetImage($module,'etiqueta.png'),$module,'main:admin:etiqueta');

/*Configura o uso de multa*/
$tutPanel->AddAction('Permitir Multa',$ui->GetImage($module,'permitir_multa.png'),$module,'main:admin:permitemulta');

$theme->AppendContent($tutPanel);
$handled = $MIOLO->InvokeHandler($module, 'admin/' . $context->ShiftAction());

?>
