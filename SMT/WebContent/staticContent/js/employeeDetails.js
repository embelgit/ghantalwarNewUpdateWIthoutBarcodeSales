function myAlert(msg)
{
	var dialog = bootbox.dialog({
    message: '<p class="text-center">'+msg.fontcolor("red").fontsize(5)+'</p>',
    closeButton: false
   });

   setTimeout(function() {
	dialog.modal('hide');
   }, 1500);
}

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

function employeedetails()
{
	if(document.empd.firstName.value == "")
	{
		myAlert("Enter Employee First Name.");
		document.empd.btn.disabled = false;
		return false;
	}	
	var letterNumber = /^[a-zA-Z]+$/;
	if(document.empd.firstName.value.match(letterNumber))
	{
		if(document.empd.middleName.value == "")
		{
			myAlert("Enter Employee Middle Name.");
			document.empd.btn.disabled = false;
			return false;
		}	
		var letterNumber = /^[a-zA-Z]+$/;
		if(document.empd.middleName.value.match(letterNumber))
		{
			if(document.empd.lastName.value == "")
			{
				myAlert("Enter Employee Last Name.");
				document.empd.btn.disabled = false;
				return false;
			}	
			var letterNumber = /^[a-zA-Z]+$/;
			if(document.empd.lastName.value.match(letterNumber))
			{
				if ( document.empd.joiningDate.value == "" )
				{
					myAlert("Please Select Date of Joining");
					document.empd.btn.disabled = false;
					return false;
				}
				if ( document.empd.emailId.value != "" )
				{
					var checkEmail = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
					if(document.empd.emailId.value.match(checkEmail))
					{}
					else
					{
						myAlert("Please Enter Correct Email Id");
						document.empd.btn.disabled = false;
						return false;
					}					
				}
				
				if ( document.empd.salary.value == "" )
				{
					myAlert("Please Enter Salary.");
					document.empd.btn.disabled = false;
					return false;
				}
				var letterNumber = /^[0-9]+$/;
				if(document.empd.salary.value.match(letterNumber))
				{
					if ( document.empd.contactNo.value == "" )
					{
						myAlert("Please Enter Contact Number");
						document.empd.btn.disabled = false;
						return false;
					}
					var letterNumber = /^[0-9]{10}$/;
					if(document.empd.contactNo.value.match(letterNumber))
					{
						if(document.empd.address.value == "")
						{
							myAlert("Please Enter Employee Address.");
							document.empd.btn.disabled = false;
							return false;
						}	
						var letterNumber = /^[a-zA-Z0-9, ]+$/;
						if(document.empd.address.value.match(letterNumber))
						{
							if ( document.empd.zipCode.value == "" )
							{
								myAlert("Please Enter Pin Code");
								document.empd.btn.disabled = false;
								return false;
							}
							var letterNumber = /^[0-9]{6}$/;
							if(document.empd.zipCode.value.match(letterNumber))
							{
								empDetails();
							}
							else
							{
								myAlert("Enter 6 digit Numbers Only in Pin code..!!");
								document.empd.btn.disabled = false;
								return false;
							}
						}
						else
						{
							myAlert("Enter Alphabates Only in address..!!");
							document.empd.btn.disabled = false;
							return false;
						}	
					}
					else
					{
						myAlert("Enter 10 digit Numbers Only in contact number..!!");
						document.empd.btn.disabled = false;
						return false;
					}	
				}
				else
				{
					myAlert("Enter Numbers Only in salary..!!");
					document.empd.btn.disabled = false;
					return false;
				}
			}
			else
			{
				myAlert("Enter Alphabets Only in last name..!!");
				document.empd.btn.disabled = false;
				return false;
			}
		}
		else
		{
			myAlert("Enter Alphabets Only in middle name..!!");
			document.empd.btn.disabled = false;
			return false;
		}
	}
	else
	{
		myAlert("Enter Alphabets Only in first name..!!");
		document.empd.btn.disabled = false;
		return false;
	}
}	

function empDetails(){

	document.empd.btn.disabled = true;
	var shopId = $('#shopId').val();
	var firstName = $('#firstName').val();
	var middleName = $('#middleName').val();
	var lastName = $('#lastName').val();
	var joiningDate = $('#joiningDate').val();
	var salary = $('#salary').val();
	var address = $('#address').val();
	var contactNo  = $('#contactNo').val();
	var emailId = $('#emailId').val();
	var zipCode = $('#zipCode').val();

	var params = {};

	params ["shopId"] = shopId;
	params["firstName"] = firstName;
	params["middleName"] =middleName;
	params["lastName"] =lastName;
	params["joiningDate"] =joiningDate;
	params["salary"] =salary;
	params["address"] = address;
	params["contactNo"] =contactNo;
	params["emailId"] = emailId;
	params["zipCode"] = zipCode;

	params["methodName"] = "regDetails";
	$.post('/SMT/jsp/utility/controller.jsp',params,function(data)
	{
		successAlert(data);
		location.reload();
	}
	).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}

function reset()
{
	document.empd.reset();	
}

/********* Edit Employee Details ************/
function getEmployeeDetails(){
	var params= {};

	var input = document.getElementById('employee'),
	list = document.getElementById('emp_drop'),
	i,fkRootEmpId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootEmpId = list.options[i].getAttribute('data-value');
		}
	}

	$("#firstName").append($("<input/>").attr("value","").text());
	$("#middleName").append($("<input/>").attr("value","").text());
	$("#lastName").append($("<input/>").attr("value","").text());
	$("#joiningDate").append($("<input/>").attr("value","").text());
	$("#emailId").append($("<input/>").attr("value","").text());
	$("#salary").append($("<input/>").attr("value","").text());
	$("#contactNo").append($("<input/>").attr("value","").text());
	$("#address").append($("<input/>").attr("value","").text());
	$("#zipCode").append($("<input/>").attr("value","").text());

	params["EmpId"]= fkRootEmpId;

	params["methodName"] = "getEmployeeDetailsToEdit";

	$.post('/SMT/jsp/utility/controller.jsp',params,function(data){

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{
			document.getElementById("firstName").value = v.firstName;
			document.getElementById("middleName").value = v.middleName;
			document.getElementById("lastName").value = v.lastName;
			document.getElementById("joiningDate").value = v.joiningDate;
			document.getElementById("emailId").value = v.email;
			document.getElementById("salary").value = v.salary;
			document.getElementById("contactNo").value = v.contactNo;
			document.getElementById("address").value = v.addresst;
			document.getElementById("zipCode").value = v.zipCode;
				});
	}).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
		}
	});
}

/*============= Update employee detail ========*/
function editEmployee()
{
	if(document.empd1.firstName.value == "")
	{
		myAlert("Enter Employee First Name.");
		return false;
	}	
	var letterNumber = /^[a-zA-Z]+$/;
	if(document.empd1.firstName.value.match(letterNumber))
	{
		if(document.empd1.middleName.value == "")
		{
			myAlert("Enter Employee Middle Name.");
			return false;
		}	
		var letterNumber = /^[a-zA-Z]+$/;
		if(document.empd1.middleName.value.match(letterNumber))
		{
			if(document.empd1.lastName.value == "")
			{
				myAlert("Enter Employee Last Name.");
				return false;
			}	
			var letterNumber = /^[a-zA-Z]+$/;
			if(document.empd1.lastName.value.match(letterNumber))
			{
				if ( document.empd1.salary.value == "" )
				{
					myAlert("Please Enter Salary.");
					return false;
				}
				var letterNumber = /^[0-9]+$/;
				if(document.empd1.salary.value.match(letterNumber))
				{
					if ( document.empd1.contactNo.value == "" )
					{
						myAlert("Please Enter Contact Number");
						return false;
					}
					var letterNumber = /^[0-9]{10}$/;
					if(document.empd1.contactNo.value.match(letterNumber))
					{
						if(document.empd1.address.value == "")
						{
							myAlert("Please Enter Employee Address.");
							return false;
						}	
						var letterNumber = /^[a-zA-Z0-9, ]+$/;
						if(document.empd1.address.value.match(letterNumber))
						{
							if ( document.empd1.zipCode.value == "" )
							{
								myAlert("Please Enter Zip Code");
								return false;
							}
							var letterNumber = /^[0-9]{6}$/;
							if(document.empd1.zipCode.value.match(letterNumber))
							{
								updateEmployeeDetails();
							}
							else
							{
								myAlert("Enter 6 digit Numbers Only in zip code..!!");
								return false;
							}
						}
						else
						{
							myAlert("Enter Alphabates Only in address..!!");
							return false;
						}	
					}
					else
					{
						myAlert("Enter 10 digit Numbers Only in contact number..!!");
						return false;
					}	
				}
				else
				{
					myAlert("Enter Numbers Only in salary..!!");
					return false;
				}
			}
			else
			{
				myAlert("Enter Alphabets Only in last name..!!");
				return false;
			}
		}
		else
		{
			myAlert("Enter Alphabets Only in middle name..!!");
			return false;
		}
	}
	else
	{
		myAlert("Enter Alphabets Only in first name..!!");
		return false;
	}
}
function updateEmployeeDetails(){

	document.empd1.btn.disabled = true;

	var input = document.getElementById('employee'),
	list = document.getElementById('emp_drop'),
	i,fkRootEmpId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootEmpId = list.options[i].getAttribute('data-value');
		}
	}
	var firstName = $('#firstName').val();
	var middleName = $('#middleName').val();
	var lastName = $('#lastName').val();				
	var joiningDate = $('#newJoiningDate').val();
	var emailId = $('#emailId').val();
	var salary = $('#salary').val();
	var contactNo = $('#contactNo').val();
	var address = $('#address').val();
	var zipCode = $('#zipCode').val();
	var oldJoiningDate = $('#joiningDate').val();
	var resignDate = $('#resignDate').val();
	var params = {};

	params["EmployeeId"] = fkRootEmpId;
	params["firstName"] = firstName;	
	params["middleName"] = middleName;
	params["lastName"] = lastName;
	params["joiningDate"] = joiningDate;
	params["emailId"] =emailId;
	params["salary"] = salary;
	params["contactNo"] = contactNo;
	params["address"] = address;
	params["zipCode"] = zipCode;
	params["oldJoiningDate"] = oldJoiningDate;
	params["resignDate"] = resignDate;

	params["methodName"] = "updateEmployeeDetails";

	$.post('/SMT/jsp/utility/controller.jsp',params,function(data){
		successAlert(data);
		location.reload();
	}
	).error(function(jqXHR, textStatus, errorThrown){

		if(textStatus==="timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}	