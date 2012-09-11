<?
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# @title
#   index.inc
#
# @description
#   Handler for generating the documentation index
#
# @organisation
#   MIOLO - Miolo Development Team - UNIVATES Centro Universitario
#
# @legal
#   CopyLeft (L) 2001-2002 UNIVATES, Lajeado/RS - Brasil
#   Licensed under GPL (see COPYING.TXT or FSF at www.fsf.org for
#   further details)
#
# @contributors
#   Thomas Spriestersbach    [author] [ts@interact2000.com.br]
#
# @id $Id: index.inc,v 1.4 2002/09/16 18:06:05 vgartner Exp $
#---------------------------------------------------------------------

$navbar->AddOption('Index','main:doc:index');

$MIOLO->GetUI();
    
include_once($MIOLO->GetModulePath('.','main_menu.inc'));
include_once($MIOLO->GetModulePath('common','etc/documentation.class'));
        
if ( ! $MIOLO->InvokeHandler($module,'doc/'.$context->ShiftAction()) )
{
    $home = $MIOLOCONF['home']['html'] . '/modules';
    
    $fp = opendir($home);
    
    if ( $fp )
    {
        while ( $ent=readdir($fp) )
        {
            if ( substr($ent,0,1) != '.' && is_dir($home.'/'.$ent) )
            {
                $dirs[] = array($ent,$ent);
            }
        }
        
        closedir($fp);
    }
    
    sort($dirs);
    
    $current = Form::GetFormValue('module','common');
    
    $selection = new Selection('Module','module',$current,$dirs);
    $selection->AddAttribute('onChange','this.form.submit()');
    
    $form = new TabbedForm();
    $form->SetTitle('MIOLO Documentation');
    $form->AddPage('MIOLO',array(new DocumentationIndex('&nbsp;','miolo')));
    $form->AddPage('Modules',array(new Separator(),
                                   $selection,
                                   new DocumentationIndex('&nbsp;','modules/'.$current),
                                   new Separator()));
    $form->AddPage('Functions',array(new FunctionIndex()));
    unset($form->buttons);
    
    $theme->SetContent($form);
}

?>
