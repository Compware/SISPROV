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
        table-layout: fixed; width: 499pt'>
        <col class="xl65" width="136" style='mso-width-source: userset; mso-width-alt: 4973;
            width: 102pt'/>
        <col class="xl66" width="69" style='mso-width-source: userset; mso-width-alt: 2523;
            width: 52pt'/>
        <col class="xl65" width="149" style='mso-width-source: userset; mso-width-alt: 5449;
            width: 112pt'/>
        <col class="xl65" width="111" style='mso-width-source: userset; mso-width-alt: 4059;
            width: 83pt'/>
        <col class="xl65" width="100" span="2" style='mso-width-source: userset; mso-width-alt: 3657;
            width: 75pt'/>			
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
							<span style='mso-spacerun: yes'> </span>RELATÓRIO DA CO-INFECÇÃO VIH/TUBERCOLOSE
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
            <td class="xl65" colspan="3" style='mso-ignore: colspan'>
                PERÍODO:  <xsl:value-of select="Programa/Parametros/PERIODO"/>
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
            <td colspan="1" rowspan="3" height="53" class="xl336" width="205" style='border-right: .5pt solid black;
                border-bottom: 1.0pt solid black; height: 39.75pt; width: 154pt'>
                GRUPOS ETÁRIOS
            </td>
            <td rowspan="3" class="xl342" width="149" style='border-bottom: 1.0pt solid black;
                width: 112pt'>
                SEXO
            </td>
            <td colspan="4" class="xl350" width="311" style='border-right: 2.0pt double black;
                width: 233pt'>
                <span style='mso-spacerun: yes'></span><font class="font7">Casos de Co-infecção TB/VIH durante o mês corrente
				</font>
            </td>
        </tr>
      <tr height="17" style='height: 12.75pt'>
            <td colspan="2" rowspan="2" height="53" class="xl353" width="111" style='border-bottom: 1.0pt solid black;
                height: 26.25pt; border-top: none; width: 154pt'>
                Nº de pacientes com TB diagnosticados VIH positivos
            </td>
            <td colspan="2" rowspan="2" height="53" class="xl353" width="111" style='border-bottom: 1.0pt solid black;
                height: 26.25pt; border-top: none; width: 154pt;border-right: 2.0pt double black'>
                Nº de pacientes em tratamento para TB que iniciaram tratamento com ARVs
            </td>
        </tr>
        <tr height="18" style='height: 13.5pt'>
        </tr>		
        <tr height="21" style='height: 15.75pt'>
            <td colspan="1" rowspan="3" height="69" class="xl315" width="136" style='border-bottom: 1.0pt solid black;
                height: 51.75pt; width: 102pt'>
                1.1. CRIANÇAS <span style='mso-spacerun: yes'> </span><font class="font14">(0-14 anos)</font>
            </td>
            <td class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Feminino
            </td>
            <td colspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCOINFECCAO_L3C2"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgCOINFECCAO_L3C3"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Masculino
            </td>
            <td colspan="2" class="xl330" width="149" style='border-bottom: 1.0pt solid black;
                border-top: none; width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCOINFECCAO_L4C2"/>
            </td>
            <td colspan="2" class="xl330" width="111" style='border-bottom: 1.0pt solid black;border-right: 2.0pt double black;
                border-top: none; width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgCOINFECCAO_L4C3"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Total
            </td>
            <td colspan="2" class="xl330" width="149" style='border-bottom: 1.0pt solid black;
                border-top: none; width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCOINFECCAO_L5C2"/>
            </td>
            <td colspan="2" class="xl330" width="111" style='border-bottom: 1.0pt solid black;border-right: 2.0pt double black;
                border-top: none; width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgCOINFECCAO_L5C3"/>
            </td>
        </tr>
        <tr height="21" style='height: 15.75pt'>
            <td colspan="1" rowspan="3" height="69" class="xl315" width="136" style='border-bottom: 1.0pt solid black;
                height: 51.75pt; width: 102pt'>
                1.2. ADULTOS <span style='mso-spacerun: yes'> </span><font class="font14">(excluir gestantes, 15 ou mais anos)</font>
            </td>
            <td class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Feminino
            </td>
            <td colspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCOINFECCAO_L7C2"/>
            </td>
            <td colspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgCOINFECCAO_L7C3"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Masculino
            </td>
            <td colspan="2" class="xl330" width="149" style='border-bottom: 1.0pt solid black;
                border-top: none; width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCOINFECCAO_L8C2"/>
            </td>
            <td colspan="2" class="xl330" width="111" style='border-bottom: 1.0pt solid black;border-right: 2.0pt double black;
                border-top: none; width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgCOINFECCAO_L8C3"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Total
            </td>
            <td colspan="2" class="xl330" width="149" style='border-bottom: 1.0pt solid black;
                border-top: none; width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCOINFECCAO_L9C2"/>
            </td>
            <td colspan="2" class="xl330" width="111" style='border-bottom: 1.0pt solid black;border-right: 2.0pt double black;
                border-top: none; width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgCOINFECCAO_L9C3"/>
            </td>
        </tr>
        <tr height="21" style='height: 15.75pt'>
            <td colspan="2" height="21" class="xl359" width="205" style='border-right: .5pt solid black;
                height: 15.75pt; width: 154pt'>
                <span style='mso-spacerun: yes'> </span>Gestantes
            </td>
            <td colspan="2" class="xl330" width="149" style='border-bottom: 1.0pt solid black;
                border-top: none; width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCOINFECCAO_L10C2"/>
            </td>
            <td colspan="2" class="xl330" width="111" style='border-bottom: 1.0pt solid black;border-right: 2.0pt double black;
                border-top: none; width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgCOINFECCAO_L10C3"/>
            </td>
        </tr>
        <tr height="21" style='height: 15.75pt'>
            <td colspan="2" height="21" class="xl304" width="205" style='border-right: .5pt solid black;
                height: 15.75pt; width: 154pt'>
                <span style='mso-spacerun: yes'> </span>Total
            </td>
            <td colspan="2" class="xl171" width="149" style='border-bottom: 2.0pt double black;
                 width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgCOINFECCAO_L11C2"/>
            </td>
            <td colspan="2" class="xl171" width="111" style='border-bottom: 2.0pt double black;border-right: 2.0pt double black;
                 width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgCOINFECCAO_L11C3"/>
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