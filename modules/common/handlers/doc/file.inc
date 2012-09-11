<?
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# @title
#   file.inc
#
# @description
#   Handler for generating the source documentation
#
# @param item (string) the path to the source file
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
# @id $Id: file.inc,v 1.4 2002/09/16 18:06:05 vgartner Exp $
#---------------------------------------------------------------------

$navbar->AddOption('Arquivo','main:doc:index:file');

include_once($MIOLO->GetModulePath('common','etc/documentation.class'));

$source = $HTTP_GET_VARS['item'];

if ( file_exists($source) )
{
    $content = new SourceDocumentation($source);
    
    $theme->AddStyle('/miolo/doc/doc.css');
}

else
{
    $content = Prompt::Error("File '$source' not found!",$MIOLO->GetActionURL('common','main:doc/index'));
}

include_once($MIOLO->GetModulePath('.','main_menu.inc'));
        
$theme->SetContent($content);

?>
