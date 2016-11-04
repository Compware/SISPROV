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
            width: 122pt'/>
        <col class="xl66" width="30" style='mso-width-source: userset; mso-width-alt: 2523;
            width: 62pt'/>
        <col class="xl65" width="30" style='mso-width-source: userset; mso-width-alt: 5449;
            width: 62pt'/>
        <col class="xl65" width="30" style='mso-width-source: userset; mso-width-alt: 4059;
            width: 92pt'/>
        <col class="xl65" width="30" span="2" style='mso-width-source: userset; mso-width-alt: 3657;
            width: 62pt'/>			
		<col class="xl65" width="30" style='mso-width-source: userset; mso-width-alt: 4973;
            width: 92pt'/>
        <col class="xl65" width="30" style='mso-width-source: userset; mso-width-alt: 2523;
            width: 62pt'/>
        <col class="xl65" width="30" style='mso-width-source: userset; mso-width-alt: 5449;
            width: 62pt'/>
        <col class="xl65" width="30" style='mso-width-source: userset; mso-width-alt: 4059;
            width: 92pt'/>
        <col class="xl65" width="30" span="2" style='mso-width-source: userset; mso-width-alt: 3657;
            width: 92pt'/>			
			
		<tr>
			<td><img height="100" width="100" src="image001.png" style=""/></td>
			<td colspan="9">
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
							<span style='mso-spacerun: yes'> </span>RELATÓRIO DE TRATAMENTO ANTIRRETROVIRAL (TARV)
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
        <tr height="9" style='mso-height-source: userset; height: 6.75pt'>
            <td height="9" class="xl65" style='height: 6.75pt'>
            </td>
            <td class="xl66">
            </td>
            <td colspan="4" class="xl65" style='mso-ignore: colspan'>
            </td>
        </tr>
        <tr height="17" style='height: 13.5pt'>
            <td height="53" class="xl350" width="205" style='border-right: .5pt solid black;
                border-bottom: 1.0pt solid black; height: 39.75pt; width: 154pt;border-left: 2.0pt double black;'>
                <span style='mso-spacerun: yes'></span><font class="font10">Pacientes em TARV por esquema</font>
            </td>
            <td colspan="3" height="53" class="xl350" width="205" style='border-right: .5pt solid black;
                border-bottom: 1.0pt solid black; height: 39.75pt; width: 154pt;border-right: 2.0pt double black'>
                <span style='mso-spacerun: yes'></span><font class="font10">Nº de casos acumulados até ao mês anterior</font>
            </td>
            <td colspan="3" height="53" class="xl350" width="205" style='border-right: .5pt solid black;
                border-bottom: 1.0pt solid black; height: 39.75pt; width: 154pt;border-right: 2.0pt double black'>
                <span style='mso-spacerun: yes'></span><font class="font10">Nº de novos casos no mês corrente</font>
            </td>
            <td colspan="3" height="53" class="xl350" width="205" style='border-right: .5pt solid black;
                border-bottom: 1.0pt solid black; height: 39.75pt; width: 154pt;border-right: 2.0pt double black; '>
                <span style='mso-spacerun: yes'></span><font class="font10">Total</font>
            </td>
        </tr>

        <tr height="17" style='height: 12.75pt'>
            <td height="53" class="xl353" width="205" style='border-right: .5pt solid black;
                border-bottom: 1.0pt solid black; height: 39.75pt; width: 154pt;border-left: 2.0pt double black;'>
                Tipo de esquemas
            </td>
            <td height="53" class="xl353" width="205" style='border-right: .5pt solid black;
                border-bottom: 1.0pt solid black; height: 39.75pt; width: 154pt'>
                Crianças
            </td>
            <td height="53" class="xl353" width="205" style='border-right: .5pt solid black;
                border-bottom: 1.0pt solid black; height: 39.75pt; width: 154pt'>
                Adultos
            </td>
            <td height="53" class="xl353" width="205" style='border-right: .5pt solid black;
                border-bottom: 1.0pt solid black; height: 39.75pt; width: 154pt; border-right: 2.0pt double black'>
                Total
            </td>
            <td height="53" class="xl353" width="205" style='border-right: .5pt solid black;
                border-bottom: 1.0pt solid black; height: 39.75pt; width: 154pt'>
                Crianças
            </td>
            <td height="53" class="xl353" width="205" style='border-right: .5pt solid black;
                border-bottom: 1.0pt solid black; height: 39.75pt; width: 154pt'>
                Adultos
            </td>
            <td height="53" class="xl353" width="205" style='border-right: .5pt solid black;
                border-bottom: 1.0pt solid black; height: 39.75pt; width: 154pt; border-right: 2.0pt double black'>
                Total
            </td>
            <td height="53" class="xl353" width="205" style='border-right: .5pt solid black;
                border-bottom: 1.0pt solid black; height: 39.75pt; width: 154pt'>
                Crianças
            </td>
            <td height="53" class="xl353" width="205" style='border-right: .5pt solid black;
                border-bottom: 1.0pt solid black; height: 39.75pt; width: 154pt'>
                Adultos
            </td>
            <td height="53" class="xl353" width="205" style='border-right: .5pt solid black;
                border-bottom: 1.0pt solid black; height: 39.75pt; width: 154pt;border-right: 2.0pt double black;'>
                Total
            </td>
			</tr>

        <tr height="21" style='height: 15.75pt'>
            <td colspan="4" class="xl353" width="149" style='border-bottom: .5pt solid black;border-left: 2.0pt double black;
                width: 112pt;border-right: 2.0pt double black'>
                REGIME DA 1º LINHA
            </td>
            <td colspan="3" class="xl353" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                
            </td>
            <td colspan="3" class="xl353" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                
            </td>
        </tr>
			
			
        <tr height="21" style='height: 15.75pt'>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-left: 2.0pt double black;;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L3C0"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L3C1"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L3C2"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L3C3"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L3C5"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L3C6"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L3C7"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L3C9"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L3C10"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L3C11"/>
            </td>
        </tr>
       
	   <tr height="21" style='height: 15.75pt'>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-left: 2.0pt double black;;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L4C0"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L4C1"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L4C2"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L4C3"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L4C5"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L4C6"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L4C7"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L4C9"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L4C10"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L4C11"/>
            </td>
        </tr>
       
	   <tr height="21" style='height: 15.75pt'>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-left: 2.0pt double black;;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L5C0"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L5C1"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L5C2"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L5C3"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L5C5"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L5C6"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L5C7"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L5C9"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L5C10"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L5C11"/>
            </td>
        </tr>
       
	   <tr height="21" style='height: 15.75pt'>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-left: 2.0pt double black;;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L6C0"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L6C1"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L6C2"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L6C3"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L6C5"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L6C6"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L6C7"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L6C9"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L6C10"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L6C11"/>
            </td>
        </tr>
       
	   <tr height="21" style='height: 15.75pt'>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-left: 2.0pt double black;;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L7C0"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L7C1"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L7C2"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L7C3"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L7C5"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L7C6"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L7C7"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L7C9"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L7C10"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L7C11"/>
            </td>
        </tr>
       
	   <tr height="21" style='height: 15.75pt'>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-left: 2.0pt double black;;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L8C0"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L8C1"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L8C2"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L8C3"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L8C5"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L8C6"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L8C7"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L8C9"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L8C10"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L8C11"/>
            </td>
        </tr>
       
	   <tr height="21" style='height: 15.75pt'>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-left: 2.0pt double black;;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L9C0"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L9C1"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L9C2"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L9C3"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L9C5"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L9C6"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L9C7"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L9C9"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L9C10"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L9C11"/>
            </td>
        </tr>
       
 <tr height="21" style='height: 15.75pt'>
            <td colspan="4" class="xl353" width="149" style='border-bottom: .5pt solid black;border-left: 2.0pt double black;
                width: 112pt;border-right: 2.0pt double black'>
                REGIME DA 2º LINHA
            </td>
            <td colspan="3" class="xl353" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                
            </td>
            <td colspan="3" class="xl353" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                
            </td>
        </tr>

	   <tr height="21" style='height: 15.75pt'>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-left: 2.0pt double black;;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L11C0"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L11C1"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L11C2"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L11C3"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L11C5"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L11C6"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L11C7"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L11C9"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L11C10"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L11C11"/>
            </td>
        </tr>
    
	   <tr height="21" style='height: 15.75pt'>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-left: 2.0pt double black;;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L12C0"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L12C1"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L12C2"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L12C3"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L12C5"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L12C6"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L12C7"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L12C9"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L12C10"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L12C11"/>
            </td>
        </tr>
    
	   <tr height="21" style='height: 15.75pt'>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-left: 2.0pt double black;;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L13C0"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L13C1"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L13C2"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L13C3"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L13C5"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L13C6"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L13C7"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L13C9"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L13C10"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L13C11"/>
            </td>
        </tr>
    
	   <tr height="21" style='height: 15.75pt'>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-left: 2.0pt double black;;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L14C0"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L14C1"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L14C2"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L14C3"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L14C5"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L14C6"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L14C7"/>
            </td>
            <td  class="xl322" width="111" style='border-bottom: .5pt solid black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L14C9"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L14C10"/>
            </td>
            <td  class="xl322" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L14C11"/>
            </td>
        </tr>
    
	   <tr height="21" style='height: 15.75pt'>
            <td  class="xl304" width="149" style='border-bottom: .5pt solid black;border-bottom: 2.0pt double black;;
                width: 112pt;border-left: 2.0pt double black'>
                TOTAL
            </td>
            <td  class="xl171" width="111" style='border-bottom: .5pt solid black;border-bottom: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L15C1"/>
            </td>
            <td  class="xl171" width="149" style='border-bottom: .5pt solid black;border-bottom: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L15C2"/>
            </td>
            <td  class="xl171" width="111" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;border-bottom: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L15C3"/>
            </td>
            <td  class="xl171" width="149" style='border-bottom: .5pt solid black;border-bottom: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L15C5"/>
            </td>
            <td  class="xl171" width="111" style='border-bottom: .5pt solid black;border-bottom: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L15C6"/>
            </td>
            <td  class="xl171" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;border-bottom: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L15C7"/>
            </td>
            <td  class="xl171" width="111" style='border-bottom: .5pt solid black;border-bottom: 2.0pt double black;
                width: 83pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L15C9"/>
            </td>
            <td  class="xl171" width="149" style='border-bottom: .5pt solid black;border-bottom: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L15C10"/>
            </td>
            <td  class="xl171" width="149" style='border-bottom: .5pt solid black;border-right: 2.0pt double black;border-bottom: 2.0pt double black;
                width: 112pt'>
                <xsl:value-of select="Programa/Dados/sgTARVESQUEMA_L15C11"/>
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