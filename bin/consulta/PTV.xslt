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
							<span style='mso-spacerun: yes'> </span>RELATÓRIO DE PREVENÇÃO DA TRANSMISSÃO VERTICAL (PTV)
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
                PERÍODO:  <xsl:value-of select="Programa/Parametros/PERIODO"/>  -  <xsl:value-of select="Programa/Parametros/PERIODO2"/>
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
            <td colspan="6" height="17" class="xl357" width="665" style='height: 12.75pt; width: 499pt'>
                <font class="font9"><span style='mso-spacerun: yes'> </span>GESTANTES<span style='mso-spacerun: yes'>
                    </span></font>
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
            <td colspan="2" rowspan="3" height="53" class="xl336" width="205" style='border-right: .5pt solid black;
                border-bottom: 1.0pt solid black; height: 39.75pt; width: 154pt'>
                GESTANTES
            </td>
            <td rowspan="3" class="xl342" width="149" style='border-bottom: 1.0pt solid black;
                width: 112pt'>
                Admitidas no programa do PTV
            </td>
            <td rowspan="3" class="xl342" width="149" style='border-bottom: 1.0pt solid black;
                width: 112pt'>
                Admitidas no momento do parto
            </td>
            <td rowspan="3" class="xl342" width="149" style='border-bottom: 1.0pt solid black;
                width: 112pt'>
                Admitidas no programa de pós-parto
            </td>
            <td rowspan="3" class="xl342" width="149" style='border-bottom: 1.0pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                Total
            </td>			
        </tr>
        <tr height="18" style='height: 13.5pt'>
        </tr>
        <tr height="18" style='height: 13.5pt'>
        </tr>
        <tr height="21" style='height: 15.75pt'>
            <td colspan="2" height="21" class="xl359" width="205" style='border-right: .5pt solid black;
                height: 15.75pt; width: 154pt'>
                <span style='mso-spacerun: yes'> </span>Menor de 15 anos
            </td>
            <td class="xl69" width="149" style='border-top: none; border-left: none; width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L2C1"/>
            </td>
            <td class="xl69" width="111" style='border-top: none; border-left: none; width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L2C2"/>
            </td>
            <td class="xl69" width="100" style='border-top: none; border-left: none; width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L2C3"/>
            </td>
            <td class="xl69" width="100" style='border-top: none; border-left: none; width: 75pt;border-right: 2.0pt double black'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L2C4"/>
            </td>
        </tr>
        <tr height="21" style='height: 15.75pt'>
            <td colspan="2" height="21" class="xl359" width="205" style='border-right: .5pt solid black;
                height: 15.75pt; width: 154pt'>
                <span style='mso-spacerun: yes'> </span>15-24 anos
            </td>
            <td class="xl69" width="149" style='border-top: none; border-left: none; width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L3C1"/>
            </td>
            <td class="xl69" width="111" style='border-top: none; border-left: none; width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L3C2"/>
            </td>
            <td class="xl69" width="100" style='border-top: none; border-left: none; width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L3C3"/>
            </td>
            <td class="xl69" width="100" style='border-top: none; border-left: none; width: 75pt;border-right: 2.0pt double black'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L3C4"/>
            </td>
        </tr>
        <tr height="21" style='height: 15.75pt'>
            <td colspan="2" height="21" class="xl359" width="205" style='border-right: .5pt solid black;
                height: 15.75pt; width: 154pt'>
                <span style='mso-spacerun: yes'> </span>25-49 anos
            </td>
            <td class="xl69" width="149" style='border-top: none; border-left: none; width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L4C1"/>
            </td>
            <td class="xl69" width="111" style='border-top: none; border-left: none; width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L4C2"/>
            </td>
            <td class="xl69" width="100" style='border-top: none; border-left: none; width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L4C3"/>
            </td>
            <td class="xl69" width="100" style='border-top: none; border-left: none; width: 75pt;border-right: 2.0pt double black'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L4C4"/>
            </td>
        </tr>
        <tr height="21" style='height: 15.75pt'>
            <td colspan="2" height="21" class="xl359" width="205" style='border-right: .5pt solid black;
                height: 15.75pt; width: 154pt'>
                <span style='mso-spacerun: yes'> </span>50 ou mais anos
            </td>
            <td class="xl69" width="149" style='border-top: none; border-left: none; width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L5C1"/>
            </td>
            <td class="xl69" width="111" style='border-top: none; border-left: none; width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L5C2"/>
            </td>
            <td class="xl69" width="100" style='border-top: none; border-left: none; width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L5C3"/>
            </td>
            <td class="xl69" width="100" style='border-top: none; border-left: none; width: 75pt;border-right: 2.0pt double black'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L5C4"/>
            </td>
        </tr>
        <tr height="23" style='height: 17.25pt'>
            <td colspan="2" height="23" class="xl304" width="205" style='height: 17.25pt; width: 154pt'>
                Total de gestantes admitidas
            </td>
            <td class="xl171" width="149" style='border-left: none; width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L6C1"/>
            </td>
            <td class="xl171" width="111" style='border-left: none; width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L6C2"/>
            </td>
            <td class="xl171" width="100" style='border-left: none; width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L6C3"/>
            </td>
            <td class="xl171" width="100" style='border-left: none; width: 75pt;border-right: 2.0pt double black'>
                <xsl:value-of select="Programa/Dados/sgGestantes_L6C4"/>
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
        <tr height="17" style='height: 12.75pt'>
            <td colspan="6" height="17" class="xl357" width="665" style='height: 12.75pt; width: 499pt'>
                <font class="font9"><span style='mso-spacerun: yes'> </span>PARTOS<span style='mso-spacerun: yes'>
                    </span></font>
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
            <td colspan="2" rowspan="3" height="53" class="xl336" width="205" style='border-right: .5pt solid black;
                border-bottom: 1.0pt solid black; height: 39.75pt; width: 154pt'>
                PARTOS
            </td>
            <td colspan="3" class="xl350" width="311" style='border-right: 2.0pt double black;
                width: 233pt'>
                <span style='mso-spacerun: yes'></span>Redução da transmissão de mãe para filho
            </td>
        </tr>
      <tr height="17" style='height: 12.75pt'>
            <td rowspan="2" height="35" class="xl353" width="111" style='border-bottom: 1.0pt solid black;
                height: 26.25pt; border-top: none; width: 83pt'>
                Tarapia completa (AZT+3TC+NEP)
            </td>
            <td rowspan="2" height="35" class="xl353" width="111" style='border-bottom: 1.0pt solid black;
                height: 26.25pt; border-top: none; width: 83pt'>
                Outro tipo de terapia
            </td>
            <td rowspan="2" height="35" class="xl353" width="111" style='border-bottom: 1.0pt solid black; border-right: 2.0pt double black;
                height: 26.25pt; border-top: none; width: 83pt'>
                Nenhum tipo de terapia
            </td>
        </tr>
        <tr height="18" style='height: 13.5pt'>
        </tr>
        <tr height="21" style='height: 15.75pt'>
            <td colspan="2" height="21" class="xl359" width="205" style='border-right: .5pt solid black;
                height: 15.75pt; width: 154pt'>
                <span style='mso-spacerun: yes'> </span>Institucionais
            </td>
            <td class="xl69" width="149" style='border-top: none; border-left: none; width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgPartos_L2C1"/>
            </td>
            <td class="xl69" width="111" style='border-top: none; border-left: none; width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgPartos_L2C2"/>
            </td>
            <td class="xl69" width="100" style='border-top: none; border-left: none; width: 75pt;border-right: 2.0pt double black'>
                <xsl:value-of select="Programa/Dados/sgPartos_L2C3"/>
            </td>
        </tr>
        <tr height="21" style='height: 15.75pt'>
            <td colspan="2" height="21" class="xl359" width="205" style='border-right: .5pt solid black;
                height: 15.75pt; width: 154pt'>
                <span style='mso-spacerun: yes'> </span>Domiciliar
            </td>
            <td class="xl69" width="149" style='border-top: none; border-left: none; width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgPartos_L3C1"/>
            </td>
            <td class="xl69" width="111" style='border-top: none; border-left: none; width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgPartos_L3C2"/>
            </td>
            <td class="xl69" width="100" style='border-top: none; border-left: none; width: 75pt;border-right: 2.0pt double black'>
                <xsl:value-of select="Programa/Dados/sgPartos_L3C3"/>
            </td>
        </tr>
        <tr height="21" style='height: 15.75pt'>
            <td colspan="2" height="21" class="xl304" width="205" style='border-right: .5pt solid black;
                height: 15.75pt; width: 154pt'>
                <span style='mso-spacerun: yes'> </span>Total de Partos
            </td>
            <td class="xl171" width="149" style='border-left: none; width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgPartos_L4C1"/>
            </td>
            <td class="xl171" width="149" style='border-left: none; width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgPartos_L4C2"/>
            </td>
            <td class="xl171" width="149" style='border-left: none; width: 112pt;border-right: 2.0pt double black'>
                <xsl:value-of select="Programa/Dados/sgPartos_L4C3"/>
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
        <tr height="17" style='height: 12.75pt'>
            <td colspan="6" height="17" class="xl357" width="665" style='height: 12.75pt; width: 499pt'>
                <font class="font9"><span style='mso-spacerun: yes'> </span>CRIANÇAS EXPOSTAS<span style='mso-spacerun: yes'>
                    </span></font>
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
            <td colspan="4" class="xl350" width="311" style='border-right: nome;
                width: 233pt;border-left: 2.0pt double black'>
                <span style='mso-spacerun: yes'> </span>Nº de Crianças nascidas<span
                    style='mso-spacerun: yes'> </span>
            </td>
            <td colspan="1" class="xl350" width="311" style='border-right: 2.0pt double black;
                width: 233pt'>
                <span style='mso-spacerun: yes'> </span>Total<span
                    style='mso-spacerun: yes'> </span>
            </td>
		</tr>
		
		<tr height="21" style='height: 15.75pt'>
             <td colspan="4"  height="42" class="xl170" width="354" style='border-right: .5pt solid black;
                border-bottom: .5pt solid black; height: 31.5pt; width: 266pt;border-left: 2.0pt double black'>
                <span style='mso-spacerun: yes'> </span>Crianças que receberam AZT oral ou cujas mães soropositivas
				fizeram algum tipo de intervenção para prevenção da transmissão vertical
            </td>
            <td class="xl111" width="100" style='border-left: none; width: 75pt;border-right: 2.0pt double black'>
                 <xsl:value-of select="Programa/Dados/sgCriancas_L2C1"/>
            </td>
        </tr>
		<tr height="21" style='height: 15.75pt'>
             <td colspan="4" height="42" class="xl170" width="354" style='border-right: .5pt solid black;
                border-bottom: .5pt solid black; height: 31.5pt; width: 266pt;border-left: 2.0pt double black'>
                <span style='mso-spacerun: yes'> </span>Crianças que receberam AZT oral ou cujas mães soropositivas
				fizeram algum tipo de intervenção para prevenção da transmissão vertical
            </td>
            <td class="xl111" width="100" style='border-left: none; width: 75pt;border-right: 2.0pt double black'>
                 <xsl:value-of select="Programa/Dados/sgCriancas_L3C1"/>
            </td>
		</tr>	
		<tr height="21" style='height: 15.75pt'>
            <td colspan="4" height="21" class="xl304" width="205" style='border-right: .5pt solid black;
                height: 15.75pt; width: 154pt'>
                <span style='mso-spacerun: yes'> </span>Total
            </td>
            <td class="xl171" width="100" style='border-left: none; width: 75pt;border-right: 2.0pt double black'>
                 <xsl:value-of select="Programa/Dados/sgCriancas_L4C1"/>
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