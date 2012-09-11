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
$perms->checkAccess('rh_ocupacaofuncao',A_ACCESS,TRUE);
$action = $context->ShiftAction();

$obj = $MIOLO->GetBusiness($module,'ocupacaofuncao',$item);
$login = $MIOLO->GetLogin()->id;

$navbar->AddOption('Servidores','rh','main:funcionario:find');
////////??????????????????????? ¿¿¿¿¿¿¿¿¿¿                 $login ou NULL

IF ( (! $perms->isMemberOf(NULL,'ADMIN')) and (! $perms->isMemberOf(NULL,'RH_CADASTRO')) ) //para admin ou cadastro não há restrição
{
    if ($perms->isMemberOf(NULL,'RH_SECRETARIA'))     //previne acesso direto via url
    {
        $objprovimento = $this->manager->GetBusiness($module,'provimento');
        if (! $objprovimento->seVinculosobSetorLogin($obj->idvinculo, $login) )
        {
            echo 'Ocupação, erro: servidor não vinculado a esta secretaria';
            return;
        }
    }
    else
    {
        if ($obj->idvinculo <> $login)
        {
            echo 'Ocupação, erro: vínculo não correspondente ao usuário';
            return;
        }
    }
} // nem admin e nem cadastro

$navbar->AddOption('Recursos Humanos' ,'rh','main');
$navbar->AddOption('Ocupação de Função','rh','main:vinculo',$obj->idvinculo,array('form'=>'funcao'));
$navbar->AddOption($obj->idvinculo);

$form = $MIOLO->GetUI()->GetForm($module,'frmOcupacaoFuncao', $item, 'funcao');
$theme->InsertContent($form);
$a = $context ? $context->ShiftAction() : 'main';
$handled = $MIOLO->InvokeHandler($module,$a);
?>
