
function successAlert(msg)
{
	var dialog = bootbox.dialog({
    message: '<p class="text-center">'+msg.fontcolor("green").fontsize(5)+'</p>',
    closeButton: false
   });
   setTimeout(function()
   {
	dialog.modal('hide');
	location.reload();
   }, 1500);
}
function printbarcode()
{
	if(document.barcodeCopy.barcodeId.value == "")
	{
		alert("Enter Barcode No.");
		return false;
	}
	if(document.barcodeCopy.quantity.value == "")
	{
		alert("Enter Quantity.");
		return false;
	}
	printBarcode();
}

function printBarcode()
{
	document.barcodeCopy.btn.disabled = true;
	
	var params= {};
	var quantity= $('#quantity').val();
	var input = document.getElementById('barcodeId'),
	list = document.getElementById('barcodeId_drop'),
	i,barcodeId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			barcodeId = list.options[i].getAttribute('data-value');
		}
	}

	params["quantity"] = quantity;
	params["barcodeId"] = barcodeId;
	params["methodName"] = "printBarcode";

	$.post('/SMT/jsp/utility/controller.jsp',params,function(data)
	{
		//successAlert("Barcode Printed Successfully");
		alert(data);
		location.reload();
		document.barcodeCopy.btn.disabled = false;
	}
	).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}

function billcancel() {

	alert("ok");
	var billNo=$('#billno').val;
	
	var billNoo= $('#BillNOOO').val;
	
	if(billNo == "" || billNo ==null || billNo==undefined)
    {
	params["billno"] = billNoo;
    }
    
    else if(billNoo == "" || billNoo ==null || billNoo==undefined)
  //  else
    {
	params["billno"] = billNo;
    }
    
	
    params["methodName"] = "billreturn";
	
    $.post('/SMT/jsp/utility/controller.jsp',params,function(data)
    		{
    			//successAlert("Barcode Printed Successfully");
    			alert(data);
    			location.reload();
    			document.barcodeCopy.btn.disabled = false;
    		}
    		).error(function(jqXHR, textStatus, errorThrown){
    			if(textStatus==="timeout") {
    				$(loaderObj).hide();
    				$(loaderObj).find('#errorDiv').show();
    			}
    		});
    	}

