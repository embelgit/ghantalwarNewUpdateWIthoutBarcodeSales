function getUserDetails(){
	
	var params= {};
	var name= $('#EmpName').val();
	
	var userId=name.split(",")[0];
	var empname=name.split(",")[1];

	$("#userName1").append($("<input/>").attr("value","").text());
	$("#password").append($("<input/>").attr("value","").text());
		
	params["userId"]= userId;
	params["empname"]= empname;
	
	params["methodName"] = "getUserDetailsToAccessControl";

	$.post('/SMT/jsp/utility/controller.jsp',params,function(data){

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{
			document.getElementById("userName1").value = v.userName;
			document.getElementById("password").value = v.password;
				});
	}).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {

		}
	});
}

function ValAccessControlDetails(){
	
	if(document.acescont.EmpName.value == "")
	{
		alert("Please Select Employee Name.");
		return false;
	}	
	
	if(document.acescont.typeId.value == "")
	{
		alert("Please Select Type");
		return false;
	}
	
	if(document.acescont.shopName1.value == "")
	{
		alert("Please Select Shop Name.");
		return false;
	}
	
	var shopname  = $('#shopName1').val();
	//alert(shopname);
	AddAccessControlDetails();
}

function AddAccessControlDetails(){
	
	document.acescont.btn.disabled = true;
	
	var EmpName = $('#EmpName').val();
	var userid= EmpName.split(",")[0];
	var employeeName = EmpName.split(",")[1];
	
	var userName = $('#userName1').val();
	var password = $('#password').val();
	var type = $('#typeId').val();
	
	var shopname  = $('#shopName1').val();
	alert
	var shopid= shopname.split(",")[0];
	var shop= shopname.split(",")[1];

	var params = {};
	
	params["userid"] =userid;
	params["EmpName"] =employeeName;
	params["userName"] =userName;
	params["password"] =password;
	params["type"] = type;
	params["shopid"] =shopid;
	params["shop"] =shop;
	params["methodName"] = "AddAccessControl";
	$.post('/SMT/jsp/utility/controller.jsp',params,function(data)
	{
		alert(data);
		if(document.acescont)
		{
			document.acescont.reset();
		}	
		document.acescont.btn.disabled =false;
			}
	).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
	
}
