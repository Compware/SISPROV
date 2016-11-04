<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
			<meta content="MSHTML 6.00.2900.2180" name="GENERATOR"/>
			<link rel="Stylesheet" href="stylesheet.css"/>		
		</head>
	<body link="blue" vlink="purple">    
    <table border="0" cellpadding="0" cellspacing="0" width="665" style='border-collapse: collapse;
        table-layout: fixed; width: 665pt'>
        <col class="xl65" width="90%" style='mso-width-source: userset; mso-width-alt: 4973;
            width: 60pt'/>
        <col class="xl66" width="90%" style='mso-width-source: userset; mso-width-alt: 2523;
            width: 100pt'/>
        <col class="xl65" width="90%" style='mso-width-source: userset; mso-width-alt: 5449;
            width: 100pt'/>
        <col class="xl65" width="90%" style='mso-width-source: userset; mso-width-alt: 4059;
            width: 70pt'/>
        <col class="xl65" width="90%" span="2" style='mso-width-source: userset; mso-width-alt: 3657;
            width: 70pt'/>			
        <col class="xl65" width="90%" span="2" style='mso-width-source: userset; mso-width-alt: 3657;
            width: 70pt'/>			
		<tr>
			<td><img height="100" width="100" src="image001.png" style=""/></td>
			<td colspan="5">
				<table>
					<tr height="17" style='height: 12.75pt'>
						<td height="17" width="136" style='height: 12.75pt; width: 102pt' align="left" valign="top">
							<span style='mso-ignore: vglayout2'>
								<table cellpadding="0" cellspacing="0">
									<tr>
										<td height="17" class="xl65" width="136" style='height: 12.75pt; width: 102pt'>
										</td>
									</tr>
								</table>
							</span>
						</td>
						<td class="xl66" width="69" style='width: 52pt'>
						</td>
						<td class="xl65" width="149" style='width: 112pt'>
						</td>
						<td class="xl65" width="111" style='width: 83pt'>
						</td>
						<td class="xl65" width="100" style='width: 75pt'>
						</td>
						<td class="xl65" width="100" style='width: 75pt'>
						</td>
					</tr>
					<tr height="17" style='height: 12.75pt'>
						<td height="17" class="xl65" style='height: 12.75pt'>
						</td>
						<td class="xl66">
						</td>
						<td colspan="4" class="xl65" style='mso-ignore: colspan'>
						</td>
					</tr>
					<tr height="17" style='height: 12.75pt'>
						<td height="17" class="xl65" style='height: 12.75pt'>
						</td>
						<td class="xl66">
						</td>
						<td colspan="4" class="xl65" style='mso-ignore: colspan'>
						</td>
					</tr>	
					<tr height="17" style='height: 12.75pt'>
						<td height="17" class="xl65" style='height: 12.75pt'>			  
						</td>
						<td colspan="3" class="xl67">
							MINISTÉRIO DA SAÚDE
						</td>
						<td colspan="2" class="xl65" style='mso-ignore: colspan'>
						</td>
					</tr>		
					<tr height="17" style='height: 12.75pt'>
						<td height="17" class="xl65" style='height: 12.75pt'>
						</td>
						<td colspan="3" class="xl67">
							INSTITUTO NACIONAL DE LUTA CONTRA A SIDA
						</td>
						<td colspan="2" class="xl65" style='mso-ignore: colspan'>
						</td>
					</tr>
					<tr height="17" style='height: 12.75pt'>
						<td height="17" class="xl65" style='height: 12.75pt'>
						</td>
						<td colspan="3" class="xl67" style='mso-ignore: colspan'>
						</td>
						<td colspan="2" class="xl65" style='mso-ignore: colspan'>
						</td>
					</tr>
					<tr height="17" style='height: 12.75pt'>
						<td height="17" class="xl65" style='height: 12.75pt'>
						</td>
						<td colspan="3" class="xl67">
							<span style='mso-spacerun: yes'> </span>Relatório - Número de Crianças Expostas com seu diagnóstico 
						</td>
						<td colspan="2" class="xl65" style='mso-ignore: colspan'>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr height="17" style='height: 12.75pt'>
			<td height="17" class="xl65" style='height: 12.75pt'>
			</td>
			<td class="xl66">
			</td>
			<td colspan="4" class="xl65" style='mso-ignore: colspan'>
			</td>
		</tr>				
        <tr height="17" style='height: 12.75pt'>
            <td height="17" class="xl65" colspan="3" style='height: 12.75pt; mso-ignore: colspan'>
                MUNICÍPIO:  <xsl:value-of select="Programa/Parametros/MUNICIPIO"/>
            </td>
            <td class="xl65" colspan="3" style='mso-ignore: colspan'>
                PROVÍNCIA:  <xsl:value-of select="Programa/Parametros/PROVINCIA"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td height="17" class="xl65" colspan="3" style='height: 12.75pt; mso-ignore: colspan'>
                UNIDADE:  <xsl:value-of select="Programa/Parametros/UNIDADE"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td height="17" class="xl65" style='height: 12.75pt'>
            </td>
            <td class="xl66">
            </td>
            <td colspan="4" class="xl65" style='mso-ignore: colspan'>
            </td>
        </tr>
        <tr height="9" style='mso-height-source: userset; height: 6.75pt'>
            <td height="9" class="xl65" style='height: 6.75pt'>
            </td>
            <td class="xl66">
            </td>
            <td colspan="4" class="xl65" style='mso-ignore: colspan'>
            </td>
        </tr>
        <tr height="18" style='height: 13.5pt'>
            <td colspan="1" rowspan="3" height="53" class="xl336" width="90%" style='border-right: .5pt solid black;
                border-bottom: 1.0pt solid black; height: 39.75pt; width: 100pt'>
                ANO
            </td>
            <td rowspan="3" class="xl342" width="90%" style='border-bottom: 1.0pt solid black;
                width: 200pt'>
                Nr. de Grávidas que fizeram PTV
            </td>
            <td colspan="6" class="xl350" width="311" style='border-right: 2.0pt double black;
                width: 233pt'>
                <span style='mso-spacerun: yes'></span><font class="font7">Nr. de Diagnóstico Definitivo de Crianças Exposta</font>
            </td>
        </tr>
      <tr height="17" style='height: 12.75pt'>
            <td colspan="2" rowspan="2" height="53" class="xl353" width="90%" style='border-bottom: 1.0pt solid black;
                height: 26.25pt; border-top: none; width: 110pt'>
                Criancas expostas result +
            </td>
            <td colspan="2" rowspan="2" height="53" class="xl353" width="90%" style='border-bottom: 1.0pt solid black;
                height: 26.25pt; border-top: none; width: 110pt'>
                Criancas expostas result -
            </td>
            <td colspan="2" rowspan="2" height="53" class="xl353" width="90%" style='border-bottom: 1.0pt solid black;
                height: 26.25pt; border-top: none; width: 110pt;border-right: 2.0pt double black'>
                Criancas expostas sem informação
            </td>
        </tr>
        <tr height="18" style='height: 13.5pt'>
        </tr>		
		<!-- linha 2 -->
        <tr height="21" style='height: 15.75pt'>
            <td colspan="1" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L2C0"/>
            </td>
            <td colspan="1" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L2C1"/>
            </td>
            <td colspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L2C2"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L2C3"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L2C4"/>
            </td>
        </tr>
		<!-- linha 3 -->
        <tr height="21" style='height: 15.75pt'>
            <td colspan="1" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L3C0"/>
            </td>
            <td colspan="1" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L3C1"/>
            </td>
            <td colspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L3C2"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L3C3"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L3C4"/>
            </td>
        </tr>
		<!-- linha 4 -->
        <tr height="21" style='height: 15.75pt'>
            <td colspan="1" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L4C0"/>
            </td>
            <td colspan="1" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L4C1"/>
            </td>
            <td colspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L4C2"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L4C3"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L4C4"/>
            </td>
        </tr>
		<!-- linha 5 -->
        <tr height="21" style='height: 15.75pt'>
            <td colspan="1" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L5C0"/>
            </td>
            <td colspan="1" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L5C1"/>
            </td>
            <td colspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L5C2"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L5C3"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L5C4"/>
            </td>
        </tr>
		<!-- linha 6 -->
        <tr height="21" style='height: 15.75pt'>
            <td colspan="1" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L6C0"/>
            </td>
            <td colspan="1" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L6C1"/>
            </td>
            <td colspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L6C2"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L6C3"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L6C4"/>
            </td>
        </tr>
		<!-- linha 7 -->
        <tr height="21" style='height: 15.75pt'>
            <td colspan="1" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L7C0"/>
            </td>
            <td colspan="1" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L7C1"/>
            </td>
            <td colspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L7C2"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L7C3"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L7C4"/>
            </td>
        </tr>
		<!-- linha 8 -->
        <tr height="21" style='height: 15.75pt'>
            <td colspan="1" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L8C0"/>
            </td>
            <td colspan="1" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L8C1"/>
            </td>
            <td colspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L8C2"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L8C3"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L8C4"/>
            </td>
        </tr>
		<!-- linha 9 -->
        <tr height="21" style='height: 15.75pt'>
            <td colspan="1" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L9C0"/>
            </td>
            <td colspan="1" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L9C1"/>
            </td>
            <td colspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L9C2"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L9C3"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L9C4"/>
            </td>
        </tr>
		<!-- linha 10 -->
        <tr height="21" style='height: 15.75pt'>
            <td colspan="1" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L10C0"/>
            </td>
            <td colspan="1" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L10C1"/>
            </td>
            <td colspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L10C2"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L10C3"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L10C4"/>
            </td>
        </tr>
		<!-- linha 11-->
        <tr height="21" style='height: 15.75pt'>
            <td colspan="1" height="21" class="xl304" width="205" style='border-right: .5pt solid black;
                height: 15.75pt; width: 154pt'>
                <span style='mso-spacerun: yes'> </span>Total
            </td>
            <td colspan="1" class="xl171" width="149" style='border-bottom: 2.0pt double black;
                 width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L11C2"/>
            </td>
            <td colspan="2" class="xl171" width="149" style='border-bottom: 2.0pt double black;
                 width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L11C2"/>
            </td>
            <td colspan="2" class="xl171" width="149" style='border-bottom: 2.0pt double black;
                 width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L11C2"/>
            </td>
            <td colspan="2" class="xl171" width="111" style='border-bottom: 2.0pt double black;border-right: 2.0pt double black;
                 width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgCriancaExposta_L11C3"/>
            </td>
        </tr>
        <tr height="11" style='mso-height-source: userset; height: 8.25pt'>
            <td height="11" class="xl73" style='height: 8.25pt'>
            </td>
            <td class="xl74">
            </td>
            <td colspan="4" class="xl75" style='mso-ignore: colspan'>
            </td>
        </tr>
        <tr height="21" style='height: 15.75pt'>
            <td height="21" class="xl109" style='height: 15.75pt'>
            </td>
            <td colspan="2" class="xl147" style='mso-ignore: colspan'>
            </td>
            <td colspan="3" class="xl148" style='mso-ignore: colspan'>
            </td>
        </tr>       
    </table>
	<table>		
		<tr height="17" style='height: 12.75pt'>
			<td height="17" class="xl65" style='height: 12.75pt'>
			</td>
			<td class="xl67">
				SIS:  <xsl:value-of select="Programa/Parametros/VERSAO"/>  
			</td>
			<td class="xl67">
			    Gerado por:  <xsl:value-of select="Programa/Parametros/USU"/>
			</td>
		</tr>
	</table>	
</body>
</html>
  </xsl:template>
</xsl:stylesheet>