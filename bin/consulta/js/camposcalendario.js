$(document).ready(function(){
	
	/* ACORDDION  
		$('h2.accordion').click(function(){
			$(this).next().slideToggle("slow");
			$('.calendario').remove();
		});
	 */
	
	
//	$('#txdtdiagnostico').focus(function(){    /* AVALIACAOINICIAL1    */
//		$(this).calendario({ 
//			target:'#txdtdiagnostico'
//		});
//	});
	
        
        $(function() {
                    $( "#txdtdiagnostico" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txdttarv" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txDTPA1" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txDTPA2" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txDTPA3" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txDTPA4" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txDTPA5" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txDTPA6" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txdtretorno" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txdtinicio" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txdtvalidacao" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txdtarv" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txdtinicio" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    
                    $( "#txdtparto" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    
                    $( "#txddefinitivo" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txdttarv" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txdtPA1" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txdtPA2" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txdtPA3" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txdtPA4" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txdtPA5" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txdtPA6" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txdtPA7" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    $( "#txdtPA8" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    
                    
                    
                    
                });
	$('#MODELO').focus(function() {    /* Funcao Padrao */
                    $(this).datepicker({
						taget:'#txdtPA2'
		});
	});
	$('#MODELO').focus(function() {    /* Funcao Padrao */
                    $(this).datepicker({
						taget:'#txdtPA3'
		});
	});
	$('#MODELO').focus(function() {    /* Funcao Padrao */
                    $(this).datepicker({
						taget:'#txdtPA4'
		});
	});
	$('#MODELO').focus(function() {    /* Funcao Padrao */
                    $(this).datepicker({
						taget:'#txdtPA5'
		});
	});
	$('#MODELO').focus(function() {    /* Funcao Padrao */
                    $(this).datepicker({
						taget:'#txdtPA6'
		});
	});
	$('#MODELO').focus(function() {    /* Funcao Padrao */
                    $(this).datepicker({
						taget:'#txdtPA7'
		});
	});
	$('#MODELO').focus(function() {    /* Funcao Padrao */
                    $(this).datepicker({
						taget:'#txdtPA8'
		});
	});
	$('#MODELO').focus(function() {    /* Funcao Padrao */
                    $(this).datepicker({
						taget:'#MODELO'
		});
	});
	$('#MODELO').focus(function() {    /* Funcao Padrao */
                    $(this).datepicker({
						taget:'#MODELO'
		});
	});
	$('#MODELO').focus(function() {    /* Funcao Padrao */
                    $(this).datepicker({
						taget:'#MODELO'
		});
	});

	



	
	
	
	
	/* ABAIXO APENAS OUTRAS OPERACOES */
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	$('#data_2').focus(function(){			/* Funcao Setando posicao*/
		$(this).calendario({ 
			target:'#data_2',
			top:0,
			left:130
		});
	});
	
	
	$('#data_3').focus(function(){			/* Funcao Calendario nao Fecha escolhendo data*/
		$(this).calendario({ 
			target:'#data_3',
			closeClick:false
		});
	});
	
	$('#data_4').focus(function(){			
		$(this).calendario({ 
			target :'#data_4',
			dateDefault:$(this).val()
		});
	});
	
	
	$('#data_5_dia, #data_5_mes, #data_5_ano').focus(function(){
		$(this).calendario({ 
			targetDay :'#data_5_dia',
			targetMonth :'#data_5_mes',
			targetYear :'#data_5_ano',
			dateDefault: $('#data_5_dia').val()+"/"+$('#data_5_mes').val()+"/"+$('#data_5_ano').val(),
			referencePosition : '#data_5_dia'
		});
	});	
	
	$('#data_6').focus(function(){
		$(this).calendario({ 
			target :'#data_6',
			dateDefault:$(this).val(),
			minDate:'10/11/2008',
			maxDate:'25/01/2009'
		});
	});
});

