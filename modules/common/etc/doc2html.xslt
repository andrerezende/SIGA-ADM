<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:html="http://www.w3.org/1999/xhtml">

<xsl:param name="language">en</xsl:param>

<xsl:output method="html" />

<!--
 ! Global Variables
 !-->

<!--
 ! Main Template: The Source File
 !-->
<xsl:template match="/source">
  <html>
    <head>
      <xsl:choose>
          <xsl:when test="count(title)>0">
            <title>Source: <xsl:value-of select="title"/></title>
          </xsl:when>
          <xsl:otherwise>
            <title>Source: <xsl:value-of select="@name"/></title>
          </xsl:otherwise>
      </xsl:choose>
      <link rel="stylesheet" type="text/css" href="doc.css"/>
    </head>
    <body>
      <!-- the page header -->
      <h1>Documentação MIOLO</h1>
      
      <!-- the page title -->
      <h2>
      <xsl:choose>
          <xsl:when test="count(title)>0">
            <xsl:value-of select="title"/>
          </xsl:when>
          <xsl:otherwise>
            Source: <a href="?module=common&amp;action=main:doc:index:source&amp;item={@path}"><span class="sourceName"><xsl:value-of select="@name"/></span></a>
          </xsl:otherwise>
      </xsl:choose>
      <br/><font size="2">(<xsl:value-of select="@lines"/> linhas)</font>
      </h2>
      <xsl:call-template name="description">
        <xsl:with-param name="todo">
          Descrição do arquivo <em><xsl:value-of select="@name"/></em>.
        </xsl:with-param>
      </xsl:call-template>
      
      <!-- class diagram -->
      <div class="relations" align="right">
         [<a href="?module=common&amp;action=main:doc:index:source&amp;item={@path}">Codigo Fonte</a>]
         [<a href="/miolo/doc/dia/{@base}.dia">Diagrama UML</a>]
      </div>
    
      <!-- relations of source -->
      <xsl:apply-templates select="relations"/>
      
      <!-- arguments of source -->
      <xsl:call-template name="param"/>

      <!-- index of classes -->
      <xsl:if test="count(class) > 1">
        <h3>Classes:</h3>
        <blockquote>
          <xsl:for-each select="class">
              <xsl:sort select="@name"/>
              <xsl:if test="position()>1">, </xsl:if>
              <a href="#{@name}"><xsl:value-of select="@name"/></a>
          </xsl:for-each>
        </blockquote>
      </xsl:if>
      
      <!-- classes -->
      <xsl:apply-templates select="class"/>

      <hr/>
      
      <!-- path -->
      <xsl:if test="@created != ''">
        <p><b>Caminho:</b><br/>
        <blockquote>
            <xsl:value-of select="@path"/>
        </blockquote>
        </p>   
      </xsl:if>
  
      <!-- created -->
      <xsl:if test="@created != ''">
        <p><b>Criado:</b><br/>
        <blockquote>
            <xsl:value-of select="@created"/>
        </blockquote>
        </p>   
      </xsl:if>
  
      <!-- the contributors statement -->
      <xsl:if test="count(contributors) > 0">
        <p><b>Autor(es):</b><br/>
        <blockquote>
        <table>
        <xsl:for-each select="contributors/author">
            <tr>
                <td><xsl:value-of select="@name"/></td>
                <td><xsl:value-of select="@type"/></td>
                <td><a href="malto:{@email}"><xsl:value-of select="@email"/></a></td>
                <td><xsl:value-of select="@login"/></td>
            </tr>
        </xsl:for-each>
        </table>
        </blockquote>
        </p>
      </xsl:if>
      
      <!-- the maintainers statement -->
      <xsl:if test="count(maintainers) > 0">
        <p><b>Mantido por:</b><br/>
        <blockquote>
        <table>
        <xsl:for-each select="maintainers/author">
            <tr>
                <td><xsl:value-of select="@name"/></td>
                <td><xsl:value-of select="@type"/></td>
                <td><a href="malto:{@email}"><xsl:value-of select="@email"/></a></td>
                <td><xsl:value-of select="@login"/></td>
            </tr>
        </xsl:for-each>
        </table>
        </blockquote>
        </p>
      </xsl:if>
      
      <!-- the history statement -->
      <xsl:if test="count(history) > 0">
        <p><b>Histórico:</b><br/>
        <blockquote style="text-align: preformatted">
        <xsl:value-of select="history" disable-output-escaping="yes"/>
        </blockquote>
        </p>
      </xsl:if>
      
      <!-- the legal statement -->
      <xsl:if test="count(legal) > 0">
        <div align="center" style="margin:10; border: solid 1 black;"><cite></cite></div>
      </xsl:if>
      
      <!-- the page footer -->
      <div style="width: 95%; font-size: 9pt; text-align:right; background:#efefef; margin-top: 20px; border-top: #0000ff 1px solid; padding: 2px 20px 2px 20px;">
      <xsl:choose>
      <xsl:when test="legal != ''">
        <xsl:value-of select="legal"/>
        </xsl:when>
        <xsl:otherwise>
            CopyLeft (L) 2002 Development Team <i>MIOLO</i> - Univates - Lajeado - Rio Grande do Sul - Brasil
        </xsl:otherwise>
      </xsl:choose>
      </div>    
    </body>
  </html>
</xsl:template>

<!--
 ! Template: The Class Definition
 !-->
<xsl:template match="class">

  <xsl:variable name="class" select="@name"/>
  
  <div class="classBlock">
      <a name="{@name}"></a>
      <h2>Classe <span class="className"><xsl:value-of select="@name"/></span></h2>
      <xsl:if test="@base != ''">
        <blockquote>
          extends <a href="#"><xsl:value-of select="@base"/></a>
        </blockquote>
      </xsl:if>
      
      <!-- relations of class -->
      <xsl:call-template name="relations"/>
      
      <!-- documentation text of class -->
      <xsl:call-template name="description">
          <xsl:with-param name="todo">
                Escrever documentação da classe <em><xsl:value-of select="@name"/></em>.      
          </xsl:with-param>
      </xsl:call-template>
      
      <!-- deprecation of classe -->
      <xsl:call-template name="deprecated"/>
    
      <!-- vars of class -->
      <xsl:if test="count(var) > 0">
        <h3>Atributos:</h3>
        <dl>
          <xsl:for-each select="var">
          <dt><xsl:value-of select="@declaration"/></dt>
          </xsl:for-each>
        </dl>
      </xsl:if>
      
      <!-- example of class usage -->
      <xsl:call-template name="example"/>
        
      <!-- methods of class -->
      <xsl:if test="count(function) > 0">
        <h3>Métodos:</h3>
        <xsl:if test="count(function) > 1">
        <blockquote>
          <xsl:for-each select="function">
            <xsl:sort select="@name"/>
            <xsl:if test="position() > 1">, </xsl:if>
            <a href="#{$class}::{@name}"><xsl:value-of select="@name"/></a>
          </xsl:for-each>
        </blockquote>
        </xsl:if>
        <xsl:for-each select="function">
            <xsl:call-template name="function">
                <xsl:with-param name="class">
                    <xsl:value-of select="$class"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
      </xsl:if>
  </div>
</xsl:template>


<!--
 ! Template: The Function Definition
 !-->
<xsl:template name="function">

  <xsl:param name="class"/>
  
  <div class="functionBlock">
      <a name="{$class}::{@name}"></a>
      
      <!-- emphasize a private function name -->
      <xsl:choose>
        <xsl:when test="@attribute='private'">
          <dt><span class="privateFunctionName"><xsl:value-of select="@name"/></span> (somente para uso interno)</dt>
        </xsl:when>
        <xsl:otherwise>
          <dt><span class="functionName"><a href="#$class"><xsl:value-of select="@name"/></a></span></dt>
        </xsl:otherwise>
      </xsl:choose>
        
      <blockquote>
        <!-- description of function -->
        <xsl:call-template name="description">
          <xsl:with-param name="todo">
              Descrição da função <em><xsl:value-of select="@name"/></em>      
          </xsl:with-param>
        </xsl:call-template>
    
        <!-- declaration of function -->
        <div class="declaration">
          <xsl:value-of select="@declaration"/>
        </div>
        
        <!-- arguments of function -->
        <xsl:call-template name="param"/>
    
        <!-- return of function -->
        <xsl:call-template name="returns"/>
    
        <!-- deprecation of function -->
        <xsl:call-template name="deprecated"/>
    
        <!-- example of function -->
        <xsl:call-template name="example"/>
    
        <!-- relations of function -->
        <xsl:for-each select="relations">
            <xsl:call-template name="relations"/>
        </xsl:for-each>
      </blockquote>
  </div>
</xsl:template>

<!--
 ! Template: The Description block
 !-->
<xsl:template name="description">
    <xsl:param name="todo">TODO: Write the documentation</xsl:param>
    
    <div class="description">
    <h3>Descrição:</h3>
    <blockquote>
    <xsl:choose>
        <xsl:when test="count(description) > 0">
            <xsl:value-of select="description" disable-output-escaping="yes"/>
        </xsl:when>
        <xsl:otherwise>
            TODO: <xsl:value-of select="$todo"/>
        </xsl:otherwise>
    </xsl:choose>
    </blockquote>
    </div>
        
</xsl:template>

<!--
 ! Template: The Returns block
 !-->
<xsl:template name="returns">
    <xsl:if test="count(returns) > 0">
        <div class="returns">
        <h3>Retorna:</h3>
        <blockquote>
            (<tt><xsl:value-of select="returns/@type"/></tt>) <xsl:value-of select="returns/text()" disable-output-escaping="yes"/>
        </blockquote>
        </div>
    </xsl:if>
</xsl:template>

<!--
 ! Template: The Relations block
 !-->
<xsl:template match="relations" name="relations">
    <xsl:if test="count(group) > 0">
        <div class="relations" align="right">
        <xsl:choose>
          <xsl:when test="@type='see-also'">
            Veja também:
            <xsl:for-each select="group">
                    <xsl:if test="position()>1">, </xsl:if><a href="?module=common&amp;action=main:doc:index:file&amp;item=/usr/local/bis/html/{@name}"><xsl:value-of select="@name"/></a>
            </xsl:for-each>
          </xsl:when>
          <xsl:when test="@type='group'">
            Tópicos relacionados:
            <xsl:for-each select="group">
                    <xsl:if test="position()>1">, </xsl:if><a href="?module=common&amp;action=main:doc:topic&amp;item={@name}"><xsl:value-of select="@name"/></a>
            </xsl:for-each>
          </xsl:when>
          <xsl:otherwise>
            Relacionado à:
            <xsl:for-each select="group">
                    <xsl:if test="position()>1">, </xsl:if><a href="#"><xsl:value-of select="@name"/></a>
            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>
        </div>
    </xsl:if>
</xsl:template>

<!--
 ! Template: The Example block
 !-->
<xsl:template name="example">
    <xsl:if test="count(example) > 0">
        <h3>Exemplo:</h3>
        <pre>
        <xsl:for-each select="example">
            <xsl:value-of select="text()" disable-output-escaping="yes"/>
        </xsl:for-each>
        </pre>
    </xsl:if>
</xsl:template>

<!--
 ! Template: The Deprecation block
 !-->
<xsl:template name="deprecated">
    <xsl:if test="count(deprecated) > 0">
        <h3>Obsoleto:</h3>
        <blockquote style="color:red;">
        <xsl:for-each select="deprecated">
            <xsl:value-of select="text()" disable-output-escaping="yes"/>
        </xsl:for-each>
        </blockquote>
    </xsl:if>
</xsl:template>

<!--
 ! Template: The Param block
 !-->
<xsl:template name="param">    
    <xsl:if test="count(param) > 0">
      <h3>Parâmetros:</h3>
      <dl>
        <xsl:for-each select="param">
          <dt>
             <span class="paramName"><xsl:value-of select="@name"/></span>
             <xsl:if test="@type != ''"> (<span class="paramValue"><xsl:value-of select="@type"/></span>)</xsl:if>
             <xsl:if test="@value != ''"> Default <span class="paramValue"><xsl:value-of select="@value"/></span></xsl:if>
          </dt>
          <dd style="padding-top: 5">
          <xsl:choose>
            <xsl:when test="text() != ''">
                <xsl:value-of select="text()" disable-output-escaping="yes"/>
            </xsl:when>
            <xsl:otherwise>
                Descrição do parametro <tt><xsl:value-of select="@name"/></tt>
            </xsl:otherwise>
          </xsl:choose>
          </dd>
        </xsl:for-each>
      </dl>
    </xsl:if>
</xsl:template>

</xsl:stylesheet>
