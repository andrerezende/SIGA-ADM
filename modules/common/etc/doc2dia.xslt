<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" 
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:dia="http://www.lysator.liu.se/~alla/dia/">

<!--
 ! Main Template: The Source File
 !-->
<xsl:template match="/source">
    <!-- DIA HEADER -->
    <dia:diagram>
      <dia:diagramdata>
        <dia:attribute name="background">
          <dia:color val="#ffffff"/>
        </dia:attribute>
        <dia:attribute name="paper">
          <dia:composite type="paper">
            <dia:attribute name="name">
              <dia:string>#A4#</dia:string>
            </dia:attribute>
            <dia:attribute name="tmargin">
              <dia:real val="2.82"/>
            </dia:attribute>
            <dia:attribute name="bmargin">
              <dia:real val="2.82"/>
            </dia:attribute>
            <dia:attribute name="lmargin">
              <dia:real val="2.82"/>
            </dia:attribute>
            <dia:attribute name="rmargin">
              <dia:real val="2.82"/>
            </dia:attribute>
            <dia:attribute name="is_portrait">
              <dia:boolean val="true"/>
            </dia:attribute>
            <dia:attribute name="scaling">
              <dia:real val="1"/>
            </dia:attribute>
            <dia:attribute name="fitto">
              <dia:boolean val="false"/>
            </dia:attribute>
          </dia:composite>
        </dia:attribute>
        <dia:attribute name="grid">
          <dia:composite type="grid">
            <dia:attribute name="width_x">
              <dia:real val="1"/>
            </dia:attribute>
            <dia:attribute name="width_y">
              <dia:real val="1"/>
            </dia:attribute>
            <dia:attribute name="visible_x">
              <dia:int val="1"/>
            </dia:attribute>
            <dia:attribute name="visible_y">
              <dia:int val="1"/>
            </dia:attribute>
          </dia:composite>
        </dia:attribute>
        <dia:attribute name="guides">
          <dia:composite type="guides">
            <dia:attribute name="hguides"/>
            <dia:attribute name="vguides"/>
          </dia:composite>
        </dia:attribute>
      </dia:diagramdata>

      <!-- classes objects -->
      <xsl:if test="count(class) > 0">
        <dia:layer name="Background" visible="true">
            <xsl:apply-templates select="class"/>
        </dia:layer>
      </xsl:if>

    <!-- DIA FOOTER -->
    </dia:diagram>
    
</xsl:template>

<!--
 ! Template: The Class Definition
 !-->
<xsl:template match="class">

    <xsl:variable name="id" select="position() - 1"/>
    <xsl:variable name="h"  select="3 + count(var) + count(function)"/>
    
    <xsl:variable name="x" select="floor($id div 5) * 20"/>
    <xsl:variable name="y" select="($id mod 5) * 10 + floor($id div 5) * 2"/>
    
    <dia:object type="UML - Class" version="0" id="0{$id}">
	    <dia:attribute name="name">
		    <dia:string>#<xsl:value-of select="@name"/>#</dia:string>
		</dia:attribute>
        <dia:attribute name="elem_corner">
            <dia:point val="{$x},{$y}"/>
        </dia:attribute>
        <!-- some flags -->
        <dia:attribute name="suppress_attributes">
            <dia:boolean val="false"/>
        </dia:attribute>
        <dia:attribute name="suppress_operations">
            <dia:boolean val="false"/>
        </dia:attribute>
		<dia:attribute name="visible_attributes">
		    <dia:boolean val="true"/>
		</dia:attribute>
		<dia:attribute name="visible_operations">
		    <dia:boolean val="true"/>
		</dia:attribute>
        
        <!-- class fields -->
        <xsl:if test="count(var) > 0">
            <dia:attribute name="attributes">
                <xsl:apply-templates select="var"/>
            </dia:attribute>
        </xsl:if>
        
        <!-- class methods -->
        <xsl:if test="count(function) > 0">
            <dia:attribute name="operations">
                <xsl:apply-templates select="function"/>
            </dia:attribute>
        </xsl:if>
        
	</dia:object>
           
</xsl:template>

<!--
 ! Template: The Function List
 !-->
<xsl:template match="function">
        <dia:composite type="umloperation">
          <!-- function name -->
          <dia:attribute name="name">
            <dia:string>#<xsl:value-of select="@name"/>#</dia:string>
          </dia:attribute>
          <dia:attribute name="stereotype">
            <dia:string/>
          </dia:attribute>
          <dia:attribute name="type">
            <dia:string/>
          </dia:attribute>
          <dia:attribute name="visibility">
            <dia:enum val="0"/>
          </dia:attribute>
          <dia:attribute name="abstract">
            <dia:boolean val="false"/>
          </dia:attribute>
          <dia:attribute name="inheritance_type">
            <dia:enum val="1"/>
          </dia:attribute>
          <dia:attribute name="query">
            <dia:boolean val="false"/>
          </dia:attribute>
          <dia:attribute name="class_scope">
            <dia:boolean val="false"/>
          </dia:attribute>
          <!-- list parameters -->
          <xsl:if test="count(param) > 0">
              <dia:attribute name="parameters">
                <xsl:for-each select="param">
                    <dia:composite type="umlparameter">
                      <dia:attribute name="name">
                        <dia:string>#<xsl:value-of select="@name"/>#</dia:string>
                      </dia:attribute>
                      <dia:attribute name="type">
                        <dia:string>##</dia:string>
                      </dia:attribute>
                      <dia:attribute name="value">
                        <dia:string/>
                      </dia:attribute>
                      <dia:attribute name="kind">
                        <dia:enum val="0"/>
                      </dia:attribute>
                    </dia:composite>
                </xsl:for-each>
              </dia:attribute>
          </xsl:if>
        </dia:composite>
</xsl:template>

<!--
 ! Template: The Member List
 !-->
<xsl:template match="var">
    <dia:composite type="umlattribute">
      <dia:attribute name="name">
        <dia:string>#<xsl:value-of select="@name"/>#</dia:string>
      </dia:attribute>
      <dia:attribute name="type">
        <dia:string>##</dia:string>
      </dia:attribute>
      <dia:attribute name="value">
        <dia:string/>
      </dia:attribute>
      <dia:attribute name="visibility">
        <dia:enum val="0"/>
      </dia:attribute>
      <dia:attribute name="abstract">
        <dia:boolean val="false"/>
      </dia:attribute>
      <dia:attribute name="class_scope">
        <dia:boolean val="false"/>
      </dia:attribute>
    </dia:composite>
</xsl:template>

</xsl:stylesheet>
