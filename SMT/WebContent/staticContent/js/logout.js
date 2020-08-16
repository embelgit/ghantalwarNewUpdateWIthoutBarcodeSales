function Logout()
{	
	document.getElementById("logoutButton").disabled = true;
	var params = {};
	params["methodName"] = "logout";
	
	$.post('/SMT/jsp/utility/controller.jsp',params,function(data)
	{   
		window.location.replace("/SMT/jsp/login.jsp");
		alert("You Are Log Out Successfully !!!");
	}
	).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout")
		{
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}

function userLogin()
{
	var uname = $("#uname").val();
	var pass = $("#pass").val();
	var e = document.getElementById("allShopList");
	var shopName = e.options[e.selectedIndex].text;
	var allShopListName = document.getElementById('allShopList');
	var allShopListId = allShopListName.value;
	
	if(uname == "" || uname == null || uname == undefined || uname == " ")
	{
		alert("Please Enter User Name");
		return false;
	}
	if(pass == "" || pass == null || pass == undefined || pass == " ")
	{
		alert("Please Enter Password");
		return false;
	}
	
	if(allShopListId == "select")
	{
		alert("Please Select Shop Name");
		return false;
	}
	
	var params = {};

	params["uname"] = uname;
	params["pass"] = pass;
	params["shopName"] = shopName;
	params["allShopListId"] = allShopListId;
	params["methodName"] = "login";
	$.post('/SMT/jsp/utility/controller.jsp',params,function(data)
	{   
		window.location.replace("/SMT/jsp/index.jsp");
	}
	).error(function(jqXHR, textStatus, errorThrown)
	{
		if(textStatus==="timeout")
		{
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}

function sendPassToMail()
{
	var uname = $("#userNameFP").val();

	if(userNameFP == "" || userNameFP == null || userNameFP == undefined || userNameFP == " ")
	{
		alert("Please Enter User Name");
		return false;
	}
	
	var params = {};
	
	params["uname"] = uname;
	params["methodName"] = "sendPassToMailController";
	$.post('/SMT/jsp/utility/controller.jsp',params,function(data)
	{   
		alert(data);
		window.location.replace("/SMT/jsp/login.jsp");
	}
	).error(function(jqXHR, textStatus, errorThrown)
	{
		if(textStatus==="timeout")
		{
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}

//try to allow chrome popup at login time
function allowPopup()
{
	var popup = window.open(winPath,winName,winFeature,true);
	 setTimeout( function() {
	    if(!popup || popup.outerHeight === 0)
	    {
	        //First Checking Condition Works For IE & Firefox
	        //Second Checking Condition Works For Chrome
	        alert("Popup Blocker is enabled! Please add this site to your exception list.");
	         
	    } else {
	        //Popup Blocker Is Disabled
	        window.open('','_self');
	        window.close();
	    } 
	}, 25);
}


function getAllShopName()
{
	$("#expenseTypeId").empty();
	
	var params = {};
	params["methodName"] = "getAllShopsNameC";
	
	$("#allShopList").append($("<option></option>").attr("value","select").text("Select Shop Name"));
	
	$.post('/SMT/jsp/utility/controller.jsp',params,function(data)
	{
		var jsonData = $.parseJSON(data);
		$.each(jsonData,function(i,v)
		{
			$("#allShopList").append($("<option></option>").attr("value",v.pkShopId).text(v.shopName));
		});
	}).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
		}
	});
}