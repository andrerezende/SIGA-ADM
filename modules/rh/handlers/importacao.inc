<?PHP
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
$perms->CheckAccess('rh', A_ACCESS, true);
$ui = $MIOLO->GetUI();
$navbar->AddOption('Importação', 'rh', 'main:integracaosiape:importacao');
$action = $context->ShiftAction();
switch ($action)
{
  case 'servidores_pensionistas';
    $MIOLO->InvokeHandler('rh', 'integracaosiape/importacao/fileupload');
    break;

  case 'servidoresimportacao';
    $MIOLO->InvokeHandler('rh', 'integracaosiape/importacao/servidoresimportacao');
    break;

    case 'executar';
        $MIOLO->InvokeHandler('rh','integracaosiape/importacao/executar');
    break;
 
  case 'winhistproc';
    $theme->ClearContent();
    $ui = $MIOLO->GetUI();
    $navbar->AddOption('Conferência de processamento de arquivos', 'rh', 'main:integracaosiape:importacao');
    $form = $ui->GetForm('rh', 'frmWinImportacao', null, 'integracaosiape/importacao');
    $theme->InsertContent($form);
    break;

  default:
    $close = $MIOLO->GetActionURL('rh', 'main:integracaosiape');
    $panel = new ActionPanel('pnlRHImportacao', 'Importação', '', $close);
    $panel->setIconType('small');
    $panel->AddAction("Upload do arquivo 'Fita Espelho'", $ui->GetImage('rh', 'servidor_mini.png'), 'rh',
      'main:integracaosiape:importacao:servidores_pensionistas');
    $panel->AddAction('Servidores: Consistência e Importação', $ui->GetImage('rh',
      'servidor_mini.png'), 'rh',
      'main:integracaosiape:importacao:servidoresimportacao');
    if ($MIOLO->getPerms()->isAdmin())
    {
	    $panel->AddAction('Executar importação', $ui->GetImage('rh','servidor_mini.png'), 'rh', 'main:integracaosiape:importacao:executar');
    }
    $theme->AppendContent($panel);
    $panel->AddAction('Conferência de processamento', $ui->GetImage('rh',
      'classe_mini.png'), 'rh', 'main:integracaosiape:importacao:winhistproc');
}

?>
