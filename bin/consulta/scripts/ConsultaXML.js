function ExportHTMLTableToExcel()
		{		   
		   //var thisTable = document.getElementById("dv").innerHTML;		  
		   //window.clipboardData.setData("Text", thisTable);
		   var objExcel = new ActiveXObject ("Excel.Application");
		   objExcel.visible = true;

		   var objWorkbook = objExcel.Workbooks.Add;
		   var objWorksheet = objWorkbook.Worksheets(1);
		   objWorksheet.Paste;
}

function openClose(obj){
    
	srcObj = new String(obj.src)
	tr = obj
	while(tr.nodeName != "TR"){
		tr = tr.parentNode		
	}

	trNext = tr.nextSibling
	if(trNext.nodeName == "#text"){
		trNext = trNext.nextSibling
	}
	  
	display = trNext.style.display
	
	if(display == "none"){
		trNext.style.display = ""
		obj.src = srcObj.replace(".gif", "-o.gif")		
	}else{
		trNext.style.display = "none"
		obj.src = srcObj.replace("-o.gif",".gif")
	}
	
	return false

}

function showHidden(obj, id, id2){
	target = document.getElementById(id)
	target2 = document.getElementById(id2)
	text = obj.childNodes[0]
	if(target.style.display == "none"){
		target.style.display = ""
		text.nodeValue = "Mostrar principais"
		if(target2 != null){
			target2.style.display = "none"
		}
	}else{
		target.style.display = "none"
		text.nodeValue = "Mostrar todos"
		if(target2 != null){
			target2.style.display = ""
		}
	}
	return false
}

function AbreFecha(target){
   if(target.style.display == "none"){
        target.style.display = "block"
   }else{
	target.style.display = "none"
   }

 }