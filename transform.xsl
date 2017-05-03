<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:wkdoc="http://www.wkpublisher.com/xml-namespaces/document"
                xmlns:xhtml="http://www.w3.org/1999/xhtml">

    <xsl:template match = "/">
        <html>
            <head>
                <link href="style.css" rel="stylesheet"/>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

   <xsl:template match="heading">
       <div>
           <xsl:attribute name="class">heading</xsl:attribute>
           <xsl:choose>
               <xsl:when test="@flow-type='paragraph'">
                   <p>
                       <xsl:apply-templates/>
                   </p>
               </xsl:when>
               <xsl:otherwise>
                   <xsl:apply-templates/>
               </xsl:otherwise>
           </xsl:choose>
       </div>
   </xsl:template>

    <xsl:template match="wkdoc:level" >
        <div>
            <xsl:attribute name="id" select="@id"/>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="para">
        <p>
            <xsl:attribute name="class" select="@align"/>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="italic">
        <span>
            <xsl:attribute name="class" select="'italic'"/>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="bold">
        <span>
            <xsl:attribute name="class" select="'bold'"/>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="cite-ref">
        <a href="">
            <xsl:apply-templates/>
        </a>
    </xsl:template>

    <xsl:template match="xhtml:table">
        <table>
            <xsl:attribute name="cellspacing" select="@cellspacing"/>
            <xsl:attribute name="cellpadding" select="@cellpadding"/>
            <xsl:attribute name="width" select="@width"/>
            <xsl:if test="@border">
                <xsl:attribute name="border" select="@border"/>
            </xsl:if>
            <xsl:apply-templates/>
        </table>
    </xsl:template>

    <xsl:template match="xhtml:tr">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>

    <xsl:template match="xhtml:td">
        <td>
            <xsl:attribute name="class" select="@class"/>
            <xsl:attribute name="valign" select="@valign"/>
            <xsl:attribute name="align" select="@align"/>
            <xsl:attribute name="style" select="@style"/>
            <xsl:apply-templates/>
        </td>
    </xsl:template>

    <xsl:template match="note">
        <div>
            <xsl:attribute name="class" select="@type"/>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="xhtml:colgroup">
        <colgroup>
            <xsl:apply-templates/>
        </colgroup>
    </xsl:template>

    <xsl:template match="xhtml:col">
        <col>
            <xsl:attribute name="span" select="@span"/>
            <xsl:attribute name="width" select="@width"/>
            <xsl:apply-templates/>
        </col>
    </xsl:template>

    <xsl:template match="h1">
        <h1>
            <xsl:choose>
                <xsl:when test="@flow-type='paragraph'">
                    <p>
                        <xsl:apply-templates/>
                    </p>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </h1>
    </xsl:template>

    <xsl:template match="unordered-list">
        <ul>
            <xsl:attribute name="type" select="@token"/>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>

    <xsl:template match="list-item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>

    <xsl:template match="footnote">
        <xsl:variable name="title" select="."/>
        <sup>
            <a href="">
                <xsl:attribute name="title" select="$title"/>
                <xsl:value-of select="@num"/>
            </a>
        </sup>
    </xsl:template>
</xsl:stylesheet>