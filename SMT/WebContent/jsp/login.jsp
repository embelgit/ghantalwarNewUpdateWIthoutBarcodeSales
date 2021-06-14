<!DOCTYPE html>
<%@page import="com.smt.hibernate.UserDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.smt.dao.LoginDetailsDao"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Login Page</title>
<script src="/SMT/staticContent/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="/SMT/staticContent/y_js/bootstrap.min.js"></script>
<script type="text/javascript" src="/SMT/staticContent/y_js/bootbox.min.js"></script>
<link href="/SMT/staticContent/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/SMT/staticContent/css/login.css">
<link href="/SMT/staticContent/css/metisMenu.min.css" rel="stylesheet">
<link href="/SMT/staticContent/css/sb-admin-2.css" rel="stylesheet">
<link href="/SMT/staticContent/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="/SMT/staticContent/js/jquery.min.js"></script>
<script src="/SMT/staticContent/js/bootstrap.min.js"></script>
<script src="/SMT/staticContent/js/metisMenu.min.js"></script>
<script src="/SMT/staticContent/js/sb-admin-2.js"></script>
<script src="/SMT/staticContent/js/logout.js"></script>

<script type="text/javascript">
<%-- function checkUser()
{
	var loginFlag = 0;
	<%
		LoginDetailsDao loginUser = new LoginDetailsDao();
		List cList1 =loginUser.getAllUsersNames();
	
	for(int i=0;i< cList1.size();i++)
	{
		UserDetail user=(UserDetail)cList1.get(i);
	%>
	var uName = "<%=user.getUserName()%>";
	var dBuName = uName.toUpperCase();
	
	var userName=document.getElementById("uname").value;
	var upUserName = userName.toUpperCase();
	
	var uPassword = "<%=user.getPassword()%>";
	var dBuPassword = uPassword.toUpperCase();
	
	var userName=document.getElementById("pass").value;
	var upPassword = userName.toUpperCase();

	if(dBuName == upUserName && dBuPassword == upPassword)
	{
		loginFlag++;
	}
	<%
	}
	%>
	
	if(loginFlag > 0)
	{
		userLogin();
		loginFlag = 0;
	}
	else
	{
		alert("Please Enter Valid Credentials");
		flag = 0;
		return false;
	}
}
 --%>
function getForgotPassword()
{
	window.location = "passwordToMail.jsp";
}
</script>

</head>

<body background="/SMT/staticContent/images/68773232-clothes-wallpapers.jpg" >
	<div class="container">
	<div class="logincontent">
					<h2>Please Sign In</h2>
					<div>
					
						<form action="login" method="post">
						<div align="center">
								<div>
								    <input name="uname"id="uname" type="text" class="mui-textfield mui-textfield--float-label" required onchange="getAllShopName()">
								    <label>User Name</label>
								</div>
								
								<div>
								    <input name="pass" id="pass" type="password" class="mui-textfield mui-textfield--float-label" required>
								    <label>Password</label>
								</div>
								
							<!-- 	<div>
								
								
									<input id="allShopList" list="shopname_drop"class="mui-textfield mui-textfield--float-label" >
								<datalist id="shopname_drop"></datalist>
									<label >Shop Name<sup>*</sup></label>
								</div> -->
								
								<div>
									<select id="allShopList" class="mui-textfield mui-textfield--float-label" required></select>
									<label for="allShopList" id="shoplabel">Shop Name<sup>*</sup></label>
								</div>
								
						</div>
								<!-- Change this to a button or input when using this as a form -->
								
								<div class="row" align="center">
						            <div class="col-md-4 col-sm-4 col-xs-4 col-lg-4 col-md-offset-2">
										<button type="button" onclick="userLogin();" class="btn btn-md btn-lg btn-success" style="width:124px;">Login</button>
									</div>
									
									
									<div class="col-md-4 col-sm-4 col-xs-4 col-lg-4 col-md-offset-2"  id="forgotpassword" align="right" >
								<a onclick="location.href='/SMT/jsp/passwordToMail.jsp';">
									    		Forgot Password ?
								</a>
							</div>
									
									
							<!-- <div class="col-md-4 col-sm-4 col-xs-4 col-lg-4">
								<button type="reset" class="btn btn-md btn-lg btn-danger">Reset</button>
							</div> -->
							  </div>
							<br/>						  
					</form>		
				</div>
	        </div>
        </div>
</body>
</html>