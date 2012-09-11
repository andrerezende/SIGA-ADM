<?
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# @title
#   PHP Source Parser and XML Generator
#
# @description
#   Basically you call the CodeToXML function with the path of the
#   source you wish to parse. The function generates the 
#   corresponding XML output using echos, so that providing a
#   suitable XSLT stylesheet, the document will be rendered
#   properly.
#   <br><br>
#   A sample XSLT stylesheet is provided with 'doc2html.xslt'
#   <br><br>
#   Todo: Create an interface to merge a skeleton with already
#   existing documentation XML file.
#
# @contributors
#   Thomas Spriestersbach    [author] [ts@interact2000.com.br]
#
# @created 2002-08-05
#
# $Id: code2xml.php,v 1.4 2002/10/07 18:02:11 vgartner Exp $
#----------------------------------------------------------------------

# allowed HTML tags in comment documentation blocks
global $ALLOWED_HTML_TAGS, $ALLOWED_HTML_ENTITIES;

$ALLOWED_HTML_TAGS = array('<code>','</code>','<blockquote>','</blockquote>',
                           '<center>','</center>',
                           '<b>','</b>','<i>','</i>','<ul>','</ul>',
                           '<li>','<hr>','<br>' );
                           
$ALLOWED_HTML_ENTITIES = array('&lt;','&gt;');

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#   Transforms a PHP source file into an XML schema which may be
#   used as base for documentation
#----------------------------------------------------------------------
function CodeToXML($path,$base='')
{   global $SOURCE_PATH, $MIOLOCONF;
    
    $rootNode = ParseSource($path,$totalLines);
    
    ereg("([^\/]+)$",$path,$regs);
    
    $name = $regs[1];
    
    echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?" . ">\n";
    
    # obtain creation date from comment section
    $created = trim($rootNode['comment']['created']);
    
    $SOURCE_PATH = $path;
    
    # get home directory of MIOLO
    $home = $MIOLOCONF['home']['html'];
    
    # make directory relative to the home of MIOLO
    if ( strpos($path,$home) == 0 )
    {
        $SOURCE_PATH = substr($SOURCE_PATH,strlen($home)+1);
    }
    
    SqlSourceTree($rootNode);
    
    echo "<source name=\"$name\" path=\"$path\" base=\"$base\"".
         " created=\"$created\" lines=\"$totalLines\">\n";
    XmlSourceTree('source',$rootNode);
    echo "</source>\n";
}

/* Class Documentation Comment Block */
##++[+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++]
## [@description]
## 
## @example
##--[-------------------------------------------------------------------]

/* Function Documentation Comment Block */
##++
# [@description]
# 
# @param    $title  (String) title of form
# @param    $action (String) URL of destination of the form data
#
# @returns  (int) number of lines
#
# @example  $form = new Form('Test Form');
# ...
#
# @see      TabbedForm::MethodName, Form::IsSubmitted, TabbedForm::,
#           TabbedForm::MethodName@MIOLO, 
#           TabbedForm::MethodName@GNUTECA
#
# @topics   form, ui
#
# @sources  modules/gnuteca/handlers/form.inc,
#           miolo/ui/form.class
##--
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#   Parses a PHP source and collects classes, functions and vars
#   maintaining the hierarchical order
#----------------------------------------------------------------------
function & ParseSource($path,&$totalLines)
{
    $rootNode  = null;
    $classNode = null;
    $funcNode  = null;
    $varsNode  = null;
    
    $rootNode['type'] = 'source';
    $rootNode['path'] = $path;
    
    $lines = file($path);
    
    $totalLines = count($lines);
    
    $is_comment = false;
    
    $sections = array('@title',         # document title (at source level) 
                      '@description',   # description block (at any level)
                      '@param',         # description of return value (function level) 
                      '@returns',       # description of return value (function level) 
                      '@example',       # example usage (class or function level)
                      '@deprecated',    # deprecated informationg (any level?)
                      '@see',           # see to links
                      '@topics',
                      '@organisation',
                      '@created',
                      '@legal',
                      '@contributors',
                      '@maintainers',
                      '@history',
                      '@id');

    foreach ( $lines as $srcline )
    {
        $numLine++;
        
        # echo $line;
        
        $line = trim($srcline);
        
        if ( $is_comment )
        {
            # catch end of comment
            if ( substr($line,0,3) == '#--' )
            {
                # close open param tag
                if ( $section == '_param' )
                {
                    $text = trim($comment['_param']);
                    
                    if ( $text )
                    {
                        $comment['param'][] = $text;
                    }
                    
                    unset($comment['_param']);
                }
                    
                $is_comment = false;
                continue;
            }
            
            $line  = substr($line,2);
            
            $token = trim($line);
            
            foreach ( $sections as $s )
            {
                if ( substr($token,0,strlen($s)) == $s )
                {
                    # close open param tag
                    if ( $section == '_param' )
                    {
                        $text = trim($comment['_param']);
                        
                        if ( $text )
                        {
                            $comment['param'][] = $text;
                        }
                        
                        unset($comment['_param']);
                    }
                    
                    $section = substr($s,1);
                    
                    if ( $section == 'param' )
                    {
                        $section = '_param';
                    }
                    
                    $line = trim(substr($token,strlen($s)));
                    
                    break;
                }
            }

            if ( $comment[$section] )
            {
                $comment[$section] .= "\n";
            }
            
            $comment[$section] .= $line;
        }
        
        else if ( $line != '' )
        {
            # catch start of comment
            if ( substr($line,0,3) == '#++' )
            {
                # if we have a comment block left, attach it to the root node
                if ( $comment )
                {
                    $rootNode['comment'] = $comment;
                }
                unset($comment);
                $is_comment = true;
                $section = 'description';
                continue;
            }
            
            # end of class or function block
            if ( substr($srcline,0,1) == '}' )
            {
                if ( $funcNode )
                {
                    unset($funcNode);
                    unset($varsNode);
                }
                else if ( $classNode )
                {
                    unset($classNode);
                    unset($funcNode);
                    unset($varsNode);
                }
            }
            
            else if ( substr($line,0,6) == 'class ' )
            {
                unset($classNode);
                unset($funcNode);
                unset($varsNode);
                
                # get the class name from the declaration line: this is the first word
                # after the 'class' keyword; try to find the superclass first  
                if ( ! ereg("class +([^ ]*) +extends +([^ ]*)",$line,$regs) )
                {
                    ereg("class +([^ ]*)",$line,$regs);
                }
                
                $classNode['type']    = 'class';
                $classNode['name']    = $regs[1];
                $classNode['base']    = $regs[2];
                $classNode['decl']    = $line;
                $classNode['line']    = $numLine;
                $classNode['comment'] = $comment;
                unset($comment);
                
                $rootNode['classes'][] = & $classNode;
            }
            
            else if ( substr($line,0,9) == 'function ' )
            {
                unset($funcNode);
                unset($varsNode);
                
                # get the function name from the declaration line: this is the word
                # on the left side of the first '(' delmited by space or '&'
                ereg("([^ ,&]+)\(",$line,$regs);
                
                $funcNode['type']   = 'function';
                $funcNode['name']   = $regs[1];
                $funcNode['decl']   = ereg_replace(" +\/\*(.+)\*\/","",$line);
                $funcNode['line']   = $numLine;
                $funcNode['parent'] = $classNode['name'];
                
                # get the function's attribute function /*attr*/ name(args,...)
                $attr = 'default';
                
                if ( ereg("function +\/\*(.+)\*\/ +",$line,$regs) )
                {
                    $attr = strtolower(trim($regs[1]));
                }
                
                $funcNode['attr'] = $attr;
                
                # get the function argument list
                ereg("\((.*)\)",$line,$regs);
                
                $funcNode['args']    = trim($regs[1]);
                $funcNode['comment'] = $comment;
                unset($comment);
                
                if ( $classNode )
                {
                    $classNode['functions'][] = & $funcNode;
                }
                
                else
                {
                    $rootNode['functions'][] = & $funcNode;
                }
            }
            
            else if ( substr($line,0,4) == 'var ' )
            {
                unset($varsNode);
                
                # get the variable name from the declaration line: this is the word
                # on the left side of the first '=' or ';' delmited by space or '$'
                ereg("var +([^ ,=,;]+)",$line,$regs);
                
                $varsNode['type'] = 'var';
                $varsNode['name'] = substr($regs[1],1);
                $varsNode['decl'] = $line;
                $varsNode['line'] = $numLine; 
                
                if ( $funcNode )
                {
                    $funcNode['vars'][] = $varsNode;
                }
                
                else if ( $classNode )
                {
                    $classNode['vars'][] = $varsNode;
                }
                
                else
                {
                    $rootNode['vars'][] = $varsNode;
                }
            }
        }
    }
    
    return $rootNode;
}

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Generates the source tree into the database tables
#----------------------------------------------------------------------
function SqlSourceTree($node)
{   global $MIOLO,$SOURCE_ID,$CLASS_ID;
    
    $type = $node['type'];
    
    $business = $MIOLO->GetBusiness('common','documentation');

    if ( $type == 'source' )
    {
        $SOURCE_ID = $business->RegisterSource($node['path']);
    }
    
    else if ( $type == 'class' )
    {
        $CLASS_ID = $business->RegisterClass($SOURCE_ID,$node['name']);
    }
    
    else if ( $type == 'function' )
    {
        if ( ! $node['parent'] )
        {
            $CLASS_ID = 0;
        }
        
        $business->RegisterFunction($SOURCE_ID,$CLASS_ID,$node['name']);
    }
    
    else
    {
        if ( is_array($node) )
        {
            foreach ( $node as $n )
            {
                SqlSourceTree($n);
            }
        }
    }
    
    if ( is_array($node['classes']) )
    {
        SqlSourceTree($node['classes']);
    }
    
    if ( is_array($node['functions']) )
    {
        SqlSourceTree($node['functions']);
    }
}

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Produces a XML tree from the parsed source tree
#
# @example
# <source path="">
#     <class name="" declaration="" line="">
#         <var name="" declaration="" line=""></var>
#         ...
#         <function name="" declaration="" line=""></function>
#         ....
#         // may be nested classes
#         <class name="" declaration="" line="">
#         </class>
#         ....
#     </class>
# </source>
#----------------------------------------------------------------------
function XmlSourceTree($type,&$node,$indent='')
{
    if ( ! $node )
        return;
    
    if ( $type == 'source' )
    {
        XmlComment($indent,$node,$type);
        
        foreach ( $node as $t => $n )
        {
            XmlSourceTree($t,$n,$indent.'    ');
        }
    }
    
    else if ( $type == 'classes' )
    {
        foreach ( $node as $t => $n )
        {
            $name = htmlspecialchars($n['name']);
            $base = htmlspecialchars($n['base']);
            $decl = htmlspecialchars($n['decl']);
            $line = htmlspecialchars($n['line']);
            
            echo $indent . "<class name=\"$name\" base=\"$base\" declaration=\"$decl\" line=\"$line\">\n";
            XmlComment($indent,$n,$type);
            XmlSourceTree('classes',$n['classes'],$indent.'    ');
            XmlSourceTree('vars',$n['vars'],$indent.'    ');
            XmlSourceTree('functions',$n['functions'],$indent.'    ');
            echo $indent . "</class>\n";
        }
    }
    
    else if ( $type == 'vars' )
    {
        foreach ( $node as $t => $n )
        {
            $name = htmlspecialchars($n['name']);
            $decl = htmlspecialchars($n['decl']);
            
            echo $indent . "<var name=\"$name\" declaration=\"$decl\" line=\"{$n['line']}\">\n";
            XmlComment($indent,$n,$type);
            echo $indent . "</var>\n";
        }
    }
    
    else if ( $type == 'functions' )
    {
        foreach ( $node as $t => $n )
        {
            $name = htmlspecialchars($n['name']);
            $attr = htmlspecialchars($n['attr']);
            $decl = htmlspecialchars($n['decl']);
            $line = htmlspecialchars($n['line']);
            
            echo $indent . "<function name=\"$name\" attribute=\"$attr\" declaration=\"$decl\" line=\"$line\">\n";
            
            $args = $n['args'];
            
            if ( $args )
            {
                $i = 0;
                
                foreach ( explode(',',$args) as $a )
                {
                    list ( $arg_name, $arg_value ) = explode('=',$a);
                    
                    $arg_name  = htmlspecialchars(trim($arg_name));
                    $arg_value = htmlspecialchars(trim($arg_value));
                    
                    unset($arg_type);
                    unset($arg_desc);

                    $param = $n['comment']['param'][$i++];
                    
                    if ( $param )
                    {
                        $param = str_replace("\n",' ',$param);
                        
                        if ( eregi('([^ ]+) +\(([^\)]+)\) +(.*)',$param,$reg) )
                        {
                            $arg_type = $reg[2];
                            $arg_desc = XmlEscape($reg[3]);
                        }
                    }
                    
                    echo $indent . "    <param name=\"$arg_name\" value=\"$arg_value\" type=\"$arg_type\"><![CDATA[$arg_desc]]></param>\n";
                }
            }
            
            XmlComment($indent,$n,$type);
            XmlSourceTree('classes',$n['classes'],$indent.'    ');
            XmlSourceTree('vars',$n['vars'],$indent.'    ');
            XmlSourceTree('functions',$n['functions'],$indent.'    ');
            echo $indent . "</function>\n";
        }
    }
}

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Produces the corresponding XML tags for the comment blocks
#----------------------------------------------------------------------
function XmlComment($indent,$node,$type)
{   global $SOURCE_PATH;
    
    $comment = & $node['comment'];
    
    if ( $comment )
    {
        foreach($comment as $section => $text)
        {
            if ( is_string($text) )
            {
                // escape embedded html tags
                $html = XmlEscape($text);

                // generate title tag
                if ( $section == 'title' )
                {
                    echo $indent . "  <title>$html</title>\n";
                }
                
                // generate description tag
                else if ( $section == 'description' )
                {
                    echo $indent . "  <description>\n";
                    echo $indent . "  <![CDATA[$html]]>\n";
                    echo $indent . "  </description>\n";
                }
                
                // generate the returns tag
                else if ( $section == 'returns' )
                {
                    // set default type to unknown
                    $type = 'unknown';
                    
                    // obtain and strip return type from description
                    if ( substr($html,0,1) == '(' )
                    {
                        $pos  = strpos($html,')');
                        $type = substr($html,1,$pos-1);
                        $html = substr($html,$pos+1);
                    }
                    
                    echo $indent . "  <returns type=\"$type\">\n";
                    echo $indent . "  <![CDATA[$html]]>\n";
                    echo $indent . "  </returns>\n";
                }
                
                // generate the example tag
                else if ( $section == 'example' )
                {
                    echo $indent . "  <example>\n";
                    // !!! no indent for preformatted examples !!!
                    echo "<![CDATA[$html]]>\n";
                    echo $indent . "  </example>\n";
                }
                
                // generate the deprecated tag
                else if ( $section == 'deprecated' )
                {
                    echo $indent . "  <deprecated>\n";
                    echo $indent . "  <![CDATA[$html]]>\n";
                    echo $indent . "  </deprecated>\n";
                }
                
                // generate the related tag based on the see block
                else if ( $section == 'see' )
                {
                    # @see      TabbedForm::, ThemePainter::
                    
                    $html = ereg_replace(' +','',$html);
                    
                    echo $indent . "  <relations type=\"see-also\">\n";
                    foreach( explode(',',$html) as $g )
                    {
                        $g = trim($g);
                        if ( substr($g,0,1) == '#' )
                        {
                            $g = $SOURCE_PATH . $g;
                        }
                        echo $indent . "    <group name=\"$g\"/>\n";
                    }
                    echo $indent . "  </relations>\n";
                }

                // generate the organisation information tag
                else if ( $section == 'organisation' )
                {
                    echo $indent . "  <organisation>\n";
                    echo $indent . "  <![CDATA[$html]]>\n";
                    echo $indent . "  </organisation>\n";
                }
                
                // generate the legal information tag
                else if ( $section == 'legal' )
                {
                    echo $indent . "  <legal>\n";
                    echo $indent . "  <![CDATA[$html]]>\n";
                    echo $indent . "  </legal>\n";
                }
                
                // generate contributors information tags
                else if ( $section == 'contributors' )
                {
                    #   Thomas Spriestersbach    [ts@interact2000.com.br]
                    echo $indent . "  <contributors>\n";
                    foreach(explode("\n",$html) as $a )
                    {
                        XmlAuthor($indent.'    ',$a);
                    }
                    echo $indent . "  </contributors>\n";
                }
                
                // generate maintainers information tag
                else if ( $section == 'maintainers' )
                {
                    #   Thomas Spriestersbach    [ts@interact2000.com.br]
                    echo $indent . "  <maintainers>\n";
                    foreach(explode("\n",$html) as $a )
                    {
                        XmlAuthor($indent.'    ',$a);
                    }
                    echo $indent . "  </maintainers>\n";
                }
                
                // generate history information tag
                else if ( $section == 'history' )
                {
                    echo $indent . "  <history>\n";
                    echo $indent . "  <![CDATA[\n";
                    foreach(explode("\n",trim($html)) as $h)
                    {
                        # !!! no indent for history entries !!!
                        echo $indent . "    $h<br>\n";
                    }
                    echo $indent . "  ]]>\n";
                    echo $indent . "  </history>\n";
                }
                
                // generate the related topic tags
                else if ( $section == 'topics' )
                {
                    # @topics   form, ui
                    
                    $html = ereg_replace(' +','',$html);
                    
                    echo $indent . "  <relations type=\"group\">\n";
                    foreach( explode(',',$html) as $g )
                    {
                        $g = trim($g);
                        echo $indent . "    <group name=\"$g\"/>\n";
                    }
                    echo $indent . "  </relations>\n";
                }
            }
            
            else
            {
                if ( $section == 'param' )
                {
                    if ( $type == 'source' )
                    {
                        foreach($text as $t)
                        {
                            $html = XmlEscape(str_replace("\n",' ',$t));
                            
                            echo $indent . "  <param name=\"\" type=\"\">\n";                            // !!! no indent for preformatted examples !!!
                            echo $indent . "    <![CDATA[$html]]>\n";
                            echo $indent . "  </param>\n";
                        }
                    }
                }
            }
        }
    }
}

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Parses an author tag and generates the corresponding XML tag
#----------------------------------------------------------------------
function XmlAuthor($indent,$author)
{
    $author = trim($author);
    
    if ( $author )
    {
        $name  = trim(strtok($author,'['));
        $type  = trim(strtok('['),' ]');
        $email = trim(strtok('['),' ]');
        $login = trim(strtok('['),' ]');
        $info  = strtok('');
        
        echo $indent . "<author name=\"$name\" type=\"$type\" login=\"$login\" email=\"$email\">$info</author>\n";
    }
}

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Escapes the text to only contain the allowed HTML tags
#----------------------------------------------------------------------
function XmlEscape($text)
{   global $ALLOWED_HTML_TAGS, $ALLOWED_HTML_ENTITIES;
    
    // escape embedded html tags
    $html = trim(htmlentities($text));

    // re-enable allowed html tags
    foreach ( $ALLOWED_HTML_TAGS as $tag )
    {
        $html = str_replace(htmlentities($tag),$tag,$html);
    }
    
    // re-enable allowed html entities
    foreach ( $ALLOWED_HTML_ENTITIES as $ent )
    {
        $html = str_replace(htmlentities($ent),$ent,$html);
    }
    
    return $html;
}

?>
