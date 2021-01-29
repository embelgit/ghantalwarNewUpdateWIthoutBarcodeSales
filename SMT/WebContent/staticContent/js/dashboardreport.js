function getsale(){
	//alert("ok");
	
	var params={};
	params["methodName"] = "getsaleamount";

	$.post('/SMT/jsp/utility/controller.jsp',params,function(data)
			{
var jsonData = $.parseJSON(data);
	
	if(data.length < 28){
	
	document.getElementById("saleAmount").value = 0;
	getsalereg();
		//return false;
	}

		var catmap = jsonData.list;

		$.each(jsonData,function(i,v)
				{
			
	
			document.getElementById("saleAmount").value = v.totalAmount;

		getsalereg();
				});

		
	}).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
		}
	});
} 


function getsalereg(){
	//alert("ok");
	
	var params={};
	params["methodName"] = "getsaleamountreg";

	$.post('/SMT/jsp/utility/controller.jsp',params,function(data)
			{
var jsonData = $.parseJSON(data);
	
	if(data.length < 28){
	
	document.getElementById("saleAmountReg").value = 0;
	getpurchase();
	return false;
	}

		var catmap = jsonData.list;
/*		if(catmap==null || catmap==undefined || catmap==""){
			getpurchase();
		}*/
		$.each(jsonData,function(i,v)
				{
			
	
			document.getElementById("saleAmountReg").value = v.Total;

			getpurchase();
				});

		
	}).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
		}
	});
}




function getpurchase (){
	//alert("ok");
	
	var params={};
	params["methodName"] = "getPurchase";

	$.post('/SMT/jsp/utility/controller.jsp',params,function(data)
			{
var jsonData = $.parseJSON(data);
	
	if(data.length < 28){
	
	document.getElementById("purchaseid").value = 0;
	getlowstock();
	getyestsale5();
		return false;
	}

		var catmap = jsonData.list;
/*		if(catmap==null || catmap==undefined || catmap==""){
			getpurchase();
		}*/
		$.each(jsonData,function(i,v)
				{
			
	
			document.getElementById("purchaseid").value = v.PurchaseTotal;

			getlowstock();
			
				});

		
	}).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
		}
	});
}


function getlowstock(){
	var params={};
	params["methodName"] = "getlowStock";

	$.post('/SMT/jsp/utility/controller.jsp',params,function(data)
			{
		var jsonData = $.parseJSON(data);
		if(data.length < 28){
			var ss = "No Low Stock Product Available";
//			document.getElementById("lowstock").value = ss;
			$("#lowstock").append($("<option></option>").attr("value","").text(ss));
			
			getyestsale5();		
		
		}
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
				{
			
	
//			document.getElementById("lowstock").value = v.productName;
			$("#lowstock").append($("<option></option>").attr("value",v.pkStockid).text(v.itemName));
				
				
			getyestsale5();
				
				});

		
	}).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
		}
	});
		
	
}

function getyestsale5(){
//	alert("ok");
	
	var params={};
	params["methodName"] = "getyestsaleamount";

	$.post('/SMT/jsp/utility/controller.jsp',params,function(data)
			{
var jsonData = $.parseJSON(data);
	
	if(data.length < 28){
	
	document.getElementById("yestid").value = 0;
	getyestsale6();
		//return false;
	}

		var catmap = jsonData.list;

		$.each(jsonData,function(i,v)
				{
			
	
			document.getElementById("yestid").value = v.totalAmount1;

		getyestsale6();
				});

		
	}).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
		}
	});
} 


function getyestsale6(){
//	alert("ok");
	
	var params={};
	params["methodName"] = "getyestsaleRegamount";

	$.post('/SMT/jsp/utility/controller.jsp',params,function(data)
			{
var jsonData = $.parseJSON(data);
	
	if(data.length < 28){
	
	document.getElementById("saleAmountReg1").value = 0;
	
	getyestsale7();
	
	//getsalereg();
		//return false;
	}

		var catmap = jsonData.list;

		$.each(jsonData,function(i,v)
				{
			
	
			document.getElementById("saleAmountReg1").value = v.totalAmount2;
			getyestsale7();
		//getsalereg();
				});

		
	}).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
		}
	});
} 
function getyestsale7(){
//	alert("ok");
	
	var params={};
	params["methodName"] = "getyestpurchaseamount";

	$.post('/SMT/jsp/utility/controller.jsp',params,function(data)
			{
var jsonData = $.parseJSON(data);
	
	if(data.length < 28){
	
	document.getElementById("purchaseid1").value = 0;
	
		//return false;
	}

		var catmap = jsonData.list;

		$.each(jsonData,function(i,v)
				{
			
	
			document.getElementById("purchaseid1").value = v.purchasetotal;

		//getyestsale6();
				});

		
	}).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
		}
	});
} 