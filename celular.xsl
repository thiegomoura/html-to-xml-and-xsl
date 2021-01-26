<?xml version="1.0"  encoding ="UTF-8" ?>
<xsl:stylesheet version="1.0 " xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>

        <head>
            <title>Galeria de Produtos - Celular</title>
            <style>
                * {
                    box-sizing: border-box;
                }

                ul {
                    list-style-type: none;
                    margin: 0;
                    padding: 0;
                    overflow: hidden;
                    background-color: #333;
                }

                li {
                    float: left;
                }

                li a {
                    display: block;
                    color: white;
                    text-align: center;
                    padding: 14px 16px;
                    text-decoration: none;
                }

                li a:hover:not(.active) {
                    background-color: #111;
                }

                .active {
                    background-color: #4CAF50;
                }

                body {
                    background-color: #f1f1f1;
                    padding: 20px;
                    font-family: Arial;
                }

                /* Center website */
                .main {
                    max-width: 1000px;
                    margin: auto;
                }

                img {
                    width: 100%;
                }

                h1 {
                    font-size: 50px;
                    word-break: break-all;
                }

                .row {
                    margin: 8px -16px;
                }

                /* Add padding BETWEEN each column */
                .row,
                .row>.column {
                    padding: 8px;
                }

                /* Create four equal columns that floats next to each other */
                .column {
                    float: left;
                    width: 25%;
                }

                /* Clear floats after rows */
                .row:after {
                    content: "";
                    display: table;
                    clear: both;
                }

                /* Content */
                .content {
                    background-color: white;
                    padding: 10px;
                }

                /* Responsive layout - makes a two column-layout instead of four columns */
                @media screen and (max-width: 900px) {
                    .column {
                        width: 50%;
                    }
                }

                /* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
                @media screen and (max-width: 600px) {
                    .column {
                        width: 100%;
                    }
                }

                .btn {
                    border: none;
                    /* Remove borders */
                    color: white;
                    /* Add a text color */
                    padding: 14px 28px;
                    /* Add some padding */
                    cursor: pointer;
                    /* Add a pointer cursor on mouse-over */
                }

                .danger {
                    background-color: #f44336;
                }

                /* Red */
                .danger:hover {
                    background: #da190b;
                }
            </style>
        </head>

        <body>
            <ul>
                <li><a class="active" href="celular.xml">Celular</a></li>
                <li><a href="notebook.xml">Notebook</a></li>
                <li><a href="tablet.xml">Tablet</a></li>
            </ul>
            <div class="row">
                <xsl:for-each select="produtos/produto">
                    <xsl:sort select="nome"/>
                    <xsl:if test="tipo &#61; &apos;celular&apos;">
                    <div class="column">
                        <div class="content">
                            <img>
                            <xsl:attribute name="src">
                                img/<xsl:value-of select="imagem" />
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                img/<xsl:value-of select="imagem" />
                            </xsl:attribute>
                            </img>
                            <div>
                                <h3>
                                    <xsl:value-of select="nome" />
                                </h3>
                                <p><b>Marca:</b>
                                    <xsl:value-of select="marca" />
                                </p>
                                <p><b>Preço:</b>R$ <xsl:value-of select="preco" />
                                    <xsl:choose>
                                        <xsl:when test="preco &lt; 501">
                                            <button class="btn danger">Promoção</button>
                                        </xsl:when>
                                        <xsl:otherwise />
                                    </xsl:choose>
                                </p>
                                <p>
                                    <xsl:value-of select="descricao" />
                                </p>
                            </div>
                        </div>
                    </div>
                    </xsl:if>
                </xsl:for-each>
            </div>
        </body>

        </html>
    </xsl:template>
</xsl:stylesheet>