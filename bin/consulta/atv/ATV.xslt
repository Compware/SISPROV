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
							RELATÓRIO<span style='mso-spacerun: yes'> </span>DO PROGRAMA PTV - VIH/SIDA
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
        <tr height="17" style='height: 12.75pt'>
            <td colspan="6" height="17" class="xl357" width="665" style='height: 12.75pt; width: 499pt'>
                1.<font class="font9"><span style='mso-spacerun: yes'> </span>UTENTES ACONSELHADOS E
                    DISTRIBUIÇÃO DOS TESTADOS CONFORME RESULTADO DO VIH<span style='mso-spacerun: yes'>
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
                TIPO DE POPULAÇÃO
            </td>
            <td rowspan="3" class="xl342" width="149" style='border-bottom: 1.0pt solid black;
                width: 112pt'>
                ACONSELHADOS
            </td>
            <td colspan="3" class="xl350" width="311" style='border-right: 2.0pt double black;
                width: 233pt'>
                <span style='mso-spacerun: yes'></span>TESTADOS (resultados)
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td rowspan="2" height="35" class="xl353" width="111" style='border-bottom: 1.0pt solid black;
                height: 26.25pt; border-top: none; width: 83pt'>
                POSITIVOS
            </td>
            <td rowspan="2" class="xl353" width="100" style='border-bottom: 1.0pt solid black;
                border-top: none; width: 75pt'>
                NEGATIVOS
            </td>
            <td rowspan="2" class="xl355" width="100" style='border-bottom: 1.0pt solid black;
                border-top: none; width: 75pt'>
                INDETERMINADO
            </td>
        </tr>
        <tr height="18" style='height: 13.5pt'>
        </tr>
        <tr height="21" style='height: 15.75pt'>
            <td colspan="2" height="21" class="xl359" width="205" style='border-right: .5pt solid black;
                height: 15.75pt; width: 154pt'>
                1.1.<span style='mso-spacerun: yes'> </span>CRIANÇAS
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L2C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L2C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L2C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L2C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L2C6"/>
            </td>			
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td rowspan="4" height="69" class="xl315" width="136" style='border-bottom: 1.0pt solid black;
                height: 51.75pt; width: 102pt'>
                0-2 ANOS<span style='mso-spacerun: yes'> </span>
            </td>
            <td rowspan="2" class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Feminino
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L3C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L3C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L3C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L3C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L3C6"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td rowspan="2" class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Masculino
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L4C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L4C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L4C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L4C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L4C6"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td rowspan="2" class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Total
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L5C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L5C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L5C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L5C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L5C6"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td rowspan="4" height="69" class="xl315" width="136" style='border-bottom: 1.0pt solid black;
                height: 51.75pt; width: 102pt'>
                3-14 ANOS<span style='mso-spacerun: yes'> </span>
            </td>
            <td rowspan="2" class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Feminino
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L6C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L6C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L6C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L6C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L6C6"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td rowspan="2" class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Masculino
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L7C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L7C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L7C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L7C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L7C6"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td rowspan="2" class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Total
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L8C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L8C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L8C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L8C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L8C6"/>
            </td>
        </tr>
        <tr height="21" style='height: 15.75pt'>
            <td colspan="2" height="21" class="xl359" width="205" style='border-right: .5pt solid black;
                height: 15.75pt; width: 154pt'>
                1.2.<span style='mso-spacerun: yes'> </span>ADULTOS
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                height: 15.75pt; width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L9C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                height: 15.75pt; width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L9C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                height: 15.75pt; width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L9C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                height: 15.75pt; width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L9C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                height: 15.75pt; width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L9C6"/>
            </td>			
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td rowspan="4" height="69" class="xl315" width="136" style='border-bottom: 1.0pt solid black;
                height: 51.75pt; width: 102pt'>
                15-24 ANOS<span style='mso-spacerun: yes'> </span>
            </td>
            <td rowspan="2" class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Feminino
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L10C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L10C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L10C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L10C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L10C6"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td rowspan="2" class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Masculino
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L11C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L11C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L11C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L11C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L11C6"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td rowspan="2" class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Total
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L12C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L12C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L12C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L12C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L12C6"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td rowspan="4" height="69" class="xl315" width="136" style='border-bottom: 1.0pt solid black;
                height: 51.75pt; width: 102pt'>
                25-49 ANOS<span style='mso-spacerun: yes'> </span>
            </td>
            <td rowspan="2" class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Feminino
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L13C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L13C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L13C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L13C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L13C6"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td rowspan="2" class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Masculino
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L14C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L14C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L14C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L14C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L14C6"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td rowspan="2" class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Total
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L15C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L15C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L15C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L15C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L15C6"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td rowspan="4" height="69" class="xl315" width="136" style='border-bottom: 1.0pt solid black;
                height: 51.75pt; width: 102pt'>
                50 OU MAIS<span style='mso-spacerun: yes'> </span>
            </td>
            <td rowspan="2" class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Feminino
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L16C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L16C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L16C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L16C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L16C6"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td rowspan="2" class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Masculino
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L17C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L17C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L17C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L17C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L17C6"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td rowspan="2" class="xl318" width="69" style='border-bottom: .5pt solid black;
                width: 52pt'>
                Total
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L18C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L18C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L18C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L18C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L18C6"/>
            </td>
        </tr>
        <tr height="21" style='height: 15.75pt'>
            <td colspan="2" height="21" class="xl359" width="205" style='border-right: .5pt solid black;
                height: 15.75pt; width: 154pt'>
                1.3.<span style='mso-spacerun: yes'> </span>GESTANTES
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L19C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L19C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L19C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L19C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L19C6"/>
            </td>			
        </tr>
        <tr height="21" style='height: 15.75pt'>
            <td colspan="2" height="20" class="xl359" width="205" style='border-right: .5pt solid black;
                height: 21.0pt; width: 154pt'>
                MENORES DE 15<span style='mso-spacerun: yes'> </span>
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L20C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L20C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L20C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L20C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L20C6"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td colspan="2" height="21" class="xl359" width="205" style='border-right: .5pt solid black;
                width: 154pt'>
                15-24 ANOS<span style='mso-spacerun: yes'> </span>
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L21C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L21C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L21C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L21C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L21C6"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td colspan="2" height="21" class="xl359" width="205" style='border-right: .5pt solid black;
                width: 154pt'>
                25-49 ANOS<span style='mso-spacerun: yes'> </span>
            </td>
            <td rowspan="2" class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L22C2"/>
            </td>
            <td rowspan="2" class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L22C3"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L22C4"/>
            </td>
            <td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L22C5"/>
            </td>
			<td rowspan="2" class="xl322" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L22C6"/>
            </td>
        </tr>
        <tr height="17" style='height: 12.75pt'>
        </tr>
        <tr height="17" style='height: 12.75pt'>
            <td colspan="2" height="21" class="xl359" width="205" style='border-right: .5pt solid black;
                width: 154pt'>
                50 OU MAIS<span style='mso-spacerun: yes'> </span>
            </td>
            <td rowspan="2" class="xl330" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L23C2"/>
            </td>
            <td rowspan="2" class="xl330" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L23C3"/>
            </td>
            <td rowspan="2" class="xl330" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L23C4"/>
            </td>
            <td rowspan="2" class="xl330" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L23C5"/>
            </td>
			<td rowspan="2" class="xl330" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L23C6"/>
            </td>
        </tr>
        <tr height="18" style='height: 13.5pt'>
        </tr>
        <tr height="23" style='height: 17.25pt'>
            <td colspan="2" height="23" class="xl304" width="205" style='height: 17.25pt; width: 154pt'>
                TOTAL
            </td>
            <td rowspan="2" class="xl171" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L24C2"/>
            </td>
            <td rowspan="2" class="xl171" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L24C3"/>
            </td>
            <td rowspan="2" class="xl171" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L24C4"/>
            </td>
            <td rowspan="2" class="xl171" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L24C5"/>
            </td>
			<td rowspan="2" class="xl171" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L24C6"/>
            </td>
        </tr>
        <tr height="18" style='height: 13.5pt'>
        </tr>
        <tr height="23" style='height: 17.25pt'>
            <td colspan="2" height="23" class="xl304" width="205" style='height: 17.25pt; width: 154pt'>
                TOTAL GERAL
            </td>
            <td rowspan="2" class="xl171" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L25C2"/>
            </td>
            <td rowspan="2" class="xl171" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L25C3"/>
            </td>
            <td rowspan="2" class="xl171" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L25C4"/>
            </td>
            <td rowspan="2" class="xl171" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L25C5"/>
            </td>
			<td rowspan="2" class="xl171" width="100" style='border-bottom: .5pt solid black;
                width: 75pt'>
                <xsl:value-of select="Programa/Dados/sgATV_L25C6"/>
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
    </table>
</body>
</html>
  </xsl:template>
</xsl:stylesheet>