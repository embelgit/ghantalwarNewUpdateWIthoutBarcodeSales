<%@page import="com.smt.dao.ShopDetailsDao"%>
<%@page import="com.smt.helper.ShopDetailsHelper"%>
<%@page import="com.smt.dao.AccessControlDao"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.smt.utility.HibernateUtility"%>
<%@page import="java.util.List"%>
<%@page import="com.smt.helper.UserDetailHelper"%>
<%@page import="com.smt.hibernate.UserDetail"%>
<%@page import="com.smt.hibernate.EmployeeDetailsBean"%>
<%@page import="com.smt.hibernate.ShopDetailsBeanH"%>
<!DOCTYPE html>
<%
	String name = "";
	if (session != null) {
		if (session.getAttribute("user") != null) {
			name = (String) session.getAttribute("user");
			//out.print("Hello, " + name );
		} else {
			response.sendRedirect("/SMT/jsp/login.jsp");
			out.println("Please Login ");
		}
	}
%>
<%
	HibernateUtility hbu = HibernateUtility.getInstance();
	Session session1 = hbu.getHibernateSession();
	org.hibernate.Query query = session1.createQuery("from UserDetail where userName =:name");
	query.setParameter("name", name);
	UserDetail userDetail = (UserDetail) query.uniqueResult();
	String type = userDetail.getTypeId();
%>
<%
	if (type.equals("admin")) {
%>
<html lang="en">

<%
	boolean isHome = false;
%>
<%@include file="y_commons/header1.jsp"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="/SMT/staticContent/js/jquery.min.js"></script>
<script type="text/javascript" src="/SMT/staticContent/y_js/bootstrap.min.js"></script>
<script type="text/javascript" src="/SMT/staticContent/y_js/bootbox.min.js"></script>
<script src="/SMT/staticContent/js/userlogin.js"></script>
<script src="/SMT/staticContent/js/accessControl.js"></script>

<style>
@media only screen and (max-width: 600px)
{
	.leftright
	{
		width: 55%;
	}
}
</style>
<link rel="stylesheet" href="/SMT/staticContent/css/invoice.css">

<script type="text/javascript">
	   <%--  function checkUser()
	    {
	    	<%UserDetailHelper usrHelper = new UserDetailHelper();
				List usrList = usrHelper.getAlluserName();%>
			
    		var userName = document.getElementById("userName123").value;
			var userType = document.getElementById("typeId").value;
			
			if(userType == null || userType == "")
    		{
    			myAlert("Please Select User Type");
    			return false;
    		}
    		else if(userName == null || userName == "")
    		{
    			myAlert("Please Enter User Name");
    			return false;
    		}
    		else
    		{
    			var UpUserName = userName.toUpperCase();
    			var UpUserType = userType.toUpperCase();    			
    			var duplicate;
    			<%for (int i = 0; i < usrList.size(); i++)
    			{
					UserDetail ud = (UserDetail) usrList.get(i);%>		
    			    var typeIdDb ="<%=ud.getTypeId()%>";
    			    var userNameDb ="<%=ud.getUserName()%>";

					var UpTypeIdDb = typeIdDb.toUpperCase();
					var UpUserNameDb = userNameDb.toUpperCase();

					if (UpUserName == UpUserNameDb)
					{
						duplicate = "found";
					}
		<%}%>
	if (duplicate == "found")
	{
		alert(userName + " UserName Is Taken");
		return false;
	}
	else
	{
		validataionUserLogin();
	}}
} --%>

	function getUserlist() {
		window.location = "allUserList.jsp";
	}

	function gpToEditUserDetails() {
		window.location = "editUserDetails.jsp";
	}
</script>
<style>
#logoutButton {
	height: 35px;
	width: 80px;
	background: #353535;
	border: 2px solid #353535;
	color: white;
	font-weight: bolder;
	font-size: 12px;
	position: fixed;
	top: 3%;
	right: 2%;
}

#currentUser {
	color: orange;
	font-weight: 600;
	font-size: 17px;
	position: fixed;
	top: 1%;
	right: 2%;
}

#logo {
	width: 110px;
	height: auto;
	position: fixed;
	top: 9%;
	right: 1%;
	z-index: -1;
	opacity: 0.6;
}

.col-md-offset-4 {
	margin-left: 23.66667%;
}
#custdetal {
    margin-left: 20%;
    margin-bottom: 10%;
}
.col-lg-2 {
    margin-right: 3%;
}
#notifycol{
width: 85%;
    margin-left: -4%;
}
@media ( min-width : 980px) and (max-width:1180px) {
	.mainWrap {
		width: 768px;
	}
	.menu ul {
		top: 37px;
	}
	.menu li a {
		font-size: 11px;
	}
	a.homer {
		background: #E95546;
	}
	li a {
		padding: 15px 11px;
	}
	#logoutButton {
		width: 70px;
		position: fixed;
		top: 3%;
		right: 2%;
		font-size: 12px
	}
	#currentUser {
		color: orange;
		font-weight: 600;
		font-size: 14px;
		position: fixed;
		top: 1%;
		right: 2%;
	}
	#logo {
		width: 110px;
		height: auto;
		position: fixed;
		top: 10%;
		right: 2%;
		z-index: -1;
		opacity: 0.6;
	}
#custdetal {
    margin-left: 16%;
}
#notifycol {
    width: 86%;
    margin-left: -2%;
}
}

@media only screen and (max-width: 991px) {
.col-md-offset-4 {
    margin-left: 4.66667%;
}
#custdetal {
    margin-left: 19%;
}
.col-lg-2 {
    margin-right: -5%;
}
#notifycol {
    width: 78%;
    margin-left: -2%;
}
}
@media ( min-width : 768px) and (max-width: 979px) {
	.mainWrap {
		width: 768px;
	}
	.menu ul {
		top: 37px;
	}
	.menu li a {
		font-size: 9px;
	}
	a.homer {
		background: #E95546;
	}
	li a {
		padding: 15px 8px;
	}
	#logoutButton {
		width: 70px;
		font-size: 11px;
		position: fixed;
		top: 12px;
		right: 44px;
	}
	#currentUser {
		color: orange;
		font-weight: 600;
		font-size: 13px;
		position: fixed;
		top: 4px;
		right: 45px;
	}
	#logo {
		width: 110px;
		height: auto;
		position: fixed;
		top: 9%;
		right: 2%;
		z-index: -1;
		opacity: 0.6;
	}
}

@media ( max-width : 767px) {
	.mainWrap {
		width: auto;
		padding: 30px 20px;
	}
	.menu {
		display: none;
	}
	.responsive-menu {
		display: block;
	}
	nav {
		margin: 0;
		background: none;
	}
	.menu li {
		display: block;
		margin: 0;
	}
	.menu li a {
		background: #fff;
		color: #797979;
	}
	.menu li a:hover, .menu li:hover>a {
		background: #8c7674;
		color: #fff;
	}
	.menu ul {
		visibility: hidden;
		opacity: 0;
		top: 0;
		left: 0;
		width: 100%;
		transform: initial;
	}
	.menu li:hover>ul {
		visibility: visible;
		opacity: 1;
		position: relative;
		transform: initial;
	}
	.menu ul ul {
		left: 0;
		transform: initial;
	}
	.menu li>ul ul:hover {
		transform: initial;
	}
	#logoutButton {
		width: 94px;
		font-size: 14px;
		position: relative;
		top: 0;
		right: 0;
		height: 15%;
	}
	#currentUser {
		color: yellow;
		font-weight: 600;
		font-size: 16px;
		position: fixed;
		top: 5px;
		right: 7%;
	}
	#logo {
		width: 110px;
		height: auto;
		position: fixed;
		top: 7%;
		right: 1%;
		z-index: -1;
		opacity: 0.6;
	}
	.container {
    width: 80%;
    margin-left: 0%;
}
.col-lg-2 {
    margin-right: -8%;
}
#custdetal {
    margin-left: 12%;
}
#notifycol {
    width: 94%;
    margin-left: -2%;
}
}
</style>
</head>
<body class="vColor" onload="ClearForm()">
	<div class="container-fluid">


		<div class="row">

			<div class="col-md-6 col-md-offset-4" align="center"
				id="categorydetailsh2">
				<h2 style="font-weight: bold;">Access Control</h2>
			</div>
			<div class="row">
				<div class="col-sm-offset-1 col-md-10">
					<hr style="border-top-color: #c1b1b1;">
				</div>
			</div>
		</div>
		
		<div class="miscellaneous">
			<form action="" method="post" name="acescont" id="acescont">

				<div class="container" id="custdetal">
					
					<div class="row" style="margin-top: 3%;">

						<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4"	id="dayreport">
							<%
								AccessControlDao dao5 = new AccessControlDao();
								List usList = dao5.getAllMainUserNameShopWise(request, response);
			        		%>
			        									
							<input list="EmpName_drop" id="EmpName" onchange="getUserDetails()">
							<datalist id="EmpName_drop">
								<%
			            		    for(int i=0;i<usList.size();i++){
			            		    	UserDetail empD=(UserDetail)usList.get(i);
								%>
							<option data-value="<%=empD.getPkUserId()%>" value="<%=empD.getPkUserId()%>,<%=empD.getUserName()%>">
														
								<%
						          }
						        %>
							</datalist>
						<label>Employee Name<sup style="color: red">*</sup></label>
						</div>
					</div>


					<div class="row">
						<div class="invoice_label_up">
							<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4"	id="dayreport">
								<input type="text" id="userName1" required> <label>User Name<sup>*</sup></label>
							</div>
						</div>
						<div class="col-md-1"></div>
						<div class="invoice_label_up">
							<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4"
								id="dayreport">
								<input type="password" id="password" required> <label>Password<sup>*</sup>
								</label>
							</div>
						</div>
					</div>

					<div class="row">
					<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4"
							id="dayreport">
							<select id="typeId" required>
								<option value="">--Select Type--</option>
								<option value="admin">Admin</option>
								<option value="deo">DEO</option>
								<option value="cashier">Accountant</option>
								<option value="salesman">Salesman</option>
							</select> <label>Type<sup>*</sup></label>

						</div>
						
						<div class="col-md-1"></div>
						 <div class="invoice_label_up">
							<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4"	id="dayreport">
								<!-- <input type="text" id="userName123" required> <label>Shop Name<sup>*</sup></label> -->
								<%
								ShopDetailsDao  dao6 = new ShopDetailsDao();
								List usList1 = dao6.getAllMainShop(request, response);
			        		%>
			        									
							<input list="shopName_drop" id="shopName1">
							<datalist id="shopName_drop">
								<%
			            		    for(int i=0;i<usList1.size();i++){
			            		    	ShopDetailsBeanH empD = (ShopDetailsBeanH)usList1.get(i);
								%>
							<option data-value="<%=empD.getPkShopId()%>" value="<%=empD.getPkShopId()%>,<%=empD.getShopName()%>">
														
								<%
						          }
						        %>
							</datalist>
						<label>Shop Name<sup style="color: red">*</sup></label>
							</div>
						</div> 
					</div>
					<div class="row" style="margin-top: 3%;margin-left: 129px;">
						<div class="col-lg-2" style="display: inline-block;">

							<input type="button" name="btn" value="Submit"
								class="btn btn-large btn-success btn-md button_hw button_margin_right"
								style="padding-top: 8px; width: 124px;" onclick="ValAccessControlDetails()" />

						</div>
						<div class="col-lg-2" style="display: inline-block;">

							<input type="reset" value="Reset"
								style="padding-top: 8px; width: 124px;"
								class="btn btn-large btn-danger btn-md button_hw button_margin_right" />

						</div>
						<div class="col-lg-2" style="display: inline-block;">

							<input type="button" name="btn" value="Login" 
								style="padding-top: 8px; width: 124px;"
								class="btn btn-large btn-success btn-md button_hw button_margin_right"
								 />

						</div>
						
					</div>
				</div>

			</form>
		</div>
	</div>

	<div class="row footer_margin_top" align="center">
		<%@include file="y_commons/footer.jsp"%>
	</div>
</body>
</html>
<%
	} else {
		out.println("<span class=\"myspan\">You Can Not view This Page</span>");
	}
%>
