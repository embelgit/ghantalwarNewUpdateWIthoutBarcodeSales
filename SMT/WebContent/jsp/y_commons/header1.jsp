<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@page import="com.smt.hibernate.UserDetail"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.smt.utility.HibernateUtility"%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="description" content="" />
<script src="/SMT/staticContent/js/logout.js"></script>
<%
	String user = (String) session.getAttribute("user");
	String type1 = "";
	String name1 = "";
	String shopName = "";
	String shopId = "";
	
	if (session != null)
	{
		if (session.getAttribute("user") != null)
		{
			name1 = (String) session.getAttribute("user");
			System.out.println("Login " + name1);
			HibernateUtility hbu1 = HibernateUtility.getInstance();
			Session session2 = hbu1.getHibernateSession();

			org.hibernate.Query query1 = session2.createQuery("from UserDetail where userName =:usr");
			query1.setParameter("usr", name1);
			UserDetail userDetail1 = (UserDetail) query1.uniqueResult();
			type1 = userDetail1.getTypeId();
			//isHome = true;
			shopId = (String) session.getAttribute("shopId");
			shopName = (String) session.getAttribute("shopName");
		}
		else
		{
			response.sendRedirect("/SMT/jsp/login.jsp");
			out.println("Please Login ");
		}
	} else {
		response.sendRedirect("/SMT/jsp/login.jsp");
		out.println("Please Login ");
	}
%>
<%
	String contextPath = request.getContextPath();
%>
<%
	String path = "";
	if (isHome)
		path = "jsp\\";
%>

<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="/SMT/staticContent/guru/js/jquery.min.js">
	
</script>
<script type="text/javascript"
	src="/SMT/staticContent/y_js/jquery-1.12.3.min.js"></script>
<link rel="stylesheet" href="/SMT/staticContent/y_css/bootstrap.min.css">
<title>Embel Technology</title>
<!-- <link rel="stylesheet" href="/SMT/staticContent/y_css/bootstrap.min.css"> -->
<%-- <%
	if (isHome) {
%> --%>
<!-- <link rel="stylesheet" href="staticContent/y_css/style.css" /> -->
<%-- <%
	} else {
%> --%>
<!-- <link rel="stylesheet" href="../staticContent/y_css/style.css" /> -->
<%-- <%
	}
%> --%>
<script src="/SMT/staticContent/y_js/bootstrap.min.js"></script>
<%-- <%
	if (isHome) {
%> --%>
<link rel="stylesheet" href="/SMT/staticContent/y_css/style.css" />
<%-- <%
	} else {
%> --%>
<!-- <link rel="stylesheet" href="../staticContent/y_css/style.css" /> -->
<%-- <%
	}
%> --%>
<meta name="viewport" content="width=device-width,initial-scale=1">
<!--  Guru fonts-->
<script type="text/javascript"
	src="/SMT/staticContent/y_js/jquery-1.12.3.min.js"></script>
<script type="text/javascript"
	src="/SMT/staticContent/guru/js/jquery.min.js"></script>
<script type="text/javascript"
	src="/SMT/staticContent/guru/js/bootstrap.js"></script>
<script type="text/javascript"
	src="/SMT/staticContent/guru/js/bootstrap.min.js"></script>
<!-- <script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script> -->
<link href="/SMT/staticContent/guru/css/bootstrap.css" rel="stylesheet" />
<link href="/SMT/staticContent/guru/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="/SMT/staticContent/guru/css/bootstrap-theme.css"
	rel="stylesheet" />
<link href="/SMT/staticContent/guru/css/bootstrap-theme.min.css"
	rel="stylesheet" />
<!-- Font awesome (social icon) -->
<link href="/SMT/staticContent/guru/css/font-awesome.css"
	rel="stylesheet" />
<link href="/SMT/staticContent/guru/css/font-awesome.min.css"
	rel="stylesheet" />
<script type="text/javascript" src="/SMT/staticContent/guru/js/npm.js"></script>
<script type="text/javascript"
	src="/SMT/staticContent/guru/js/tooltip.js"></script>
<script type="text/javascript" src="/SMT/staticContent/js/shortcut.js"></script>
<!-- Fonts -->
<link rel="stylesheet"
	href="/SMT/staticContent/guru/fonts/fontawesome-webfont.eot" />
<link rel="stylesheet"
	href="/SMT/staticContent/guru/fonts/fontawesome-webfont.svg" />
<link rel="stylesheet"
	href="/SMT/staticContent/guru/fonts/fontawesome-webfont.ttf" />
<link rel="stylesheet"
	href="/SMT/staticContent/guru/fonts/fontawesome-webfont.woff" />
<link rel="stylesheet"
	href="/SMT/staticContent/guru/fonts/fontawesome-webfont.woff2" />
<link rel="stylesheet"
	href="/SMT/staticContent/guru/fonts/FontAwesome.otf" />
<link rel="stylesheet"
	href="/SMT/staticContent/guru/fonts/glyphicons-halflings-regular.eot" />
<link rel="stylesheet"
	href="/SMT/staticContent/guru/fonts/glyphicons-halflings-regular.svg" />
<link rel="stylesheet"
	href="/SMT/staticContent/guru/fonts/glyphicons-halflings-regular.ttf" />
<link rel="stylesheet"
	href="/SMT/staticContent/guru/fonts/glyphicons-halflings-regular.woff" />
<link rel="stylesheet"
	href="/SMT/staticContent/guru/fonts/glyphicons-halflings-regular.woff2" />
<link rel="stylesheet" href="/SMT/staticContent/y_css/jquery-ui.min.css">
<link rel="stylesheet" href="/SMT/staticContent/y_css/ui.jqgrid.min.css">
<link rel="stylesheet" type="text/css" href="/SMT/staticContent/css/loader.css">
<!--y_temporaryStockReport.jsp-->
<script type="text/javascript"
	src="/SMT/staticContent/y_js/bootstrap.js">
	
</script>
<script type="text/javascript"
	src="/SMT/staticContent/js/bootstrap.min.js"></script>
<!-- <script type="text/javascript" src="/SMT/staticContent/js/bootbox.min.js"></script> -->
<link href="/SMT/staticContent/css/bootstrap.css" rel="stylesheet">
<link href="/SMT/staticContent/css/bootstrap.min.css" rel="stylesheet">
<link href="/SMT/staticContent/y_css/bootstrap-theme.css"
	rel="stylesheet">
<link href="/SMT/staticContent/y_css/bgChange.css" rel="stylesheet">
<link href="/SMT/staticContent/css/bootstrap-theme.min.css"
	rel="stylesheet">

<!-- All shortcut key's code here -->

<script type="text/javascript">
	/* Master Moudule keys */
	//Add Category
	shortcut.add("alt+c", function() {
		window.location.href = "y_category_subcategory.jsp";
	});
	
	//product Management
	shortcut.add("alt+p", function() {
		window.location.href = "y_product_detail.jsp";
	});
	
	//Supplier Management
	shortcut.add("alt+s", function() {
		window.location.href = "s_supplier_detail.jsp";
	});
	
	//Purchase
	shortcut.add("alt+g", function() {
		window.location.href = "goodReceive.jsp";
	});
	
	//Advance Booking
	shortcut.add("alt+a", function() {
		window.location.href = "advanceBooking.jsp";
	});
	
	//Purchade Return
	shortcut.add("alt+r", function() {
		window.location.href = "s_purchase_return.jsp";
	});
	
	//Sale Invoice
	shortcut.add("ctrl+s", function() {
		window.location.href = "Miscellaneous.jsp";
	});
	
	//Sale Return
	shortcut.add("ctrl+alt+r", function() {
		window.location.href = "testSaleReturn.jsp";
	});
	
	//All Way Report Inventory
	shortcut.add("ctrl+m", function() {
		window.location.href = "allWayReport.jsp";
	});

</script>
<!-- header start-->
<script src="/SMT/staticContent/y_js/prefixfree.min.js"></script>
<style>
@import
	url(http://fonts.googleapis.com/css?family=roboto:400,400italic,600,700,800)
	;

*, html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre,
	form, label, fieldset, input, p, blockquote, th, td {
	margin: 0;
	padding: 0;
}

article, aside, figure, footer, header, hgroup, nav, section {
	display: block;
}

* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

html {
	-webkit-font-smoothing: antialiased;
}

a {
	color: #BA0707;
	text-decoration: none;
}

a:hover {
	color: #BA0707;
}

body {
	color: #000000;
	font: 14px "roboto", Helvetica, Arial, sans-serif;
	-webkit-font-smoothing: antialiased;
	line-height: 1;
	width: 100%;
}

nav {
	display: block;
	    width: 100%;
	/* background: #8c7674 */
}

.menu {
	display: block;
	    width: 100%;
}

.menu li {
	display: inline-block;
	position: relative;
	z-index: 100;
}

.menu li:first-child {
	margin-left: 0;
}

.menu {
	background: #353535;
}

li a {
	font-weight: 600;
	text-decoration: none;
	padding: 15px 14px;
	display: block;
	color: #fff;
	transition: all 0.2s ease-in-out 0s;
	font-size: 13px;
}

.menu li a:hover, .menu li:hover>a {
	color: #fff;
	background: #BA0707;
	text-decoration: none;
}

.menu ul {
	visibility: hidden;
	opacity: 0;
	margin: 0;
	padding: 0;
	width: 210px;
	position: absolute;
	left: 0px;
	background: #fff;
	z-index: 99;
	transform: translate(0, 20px);
	transition: all 0.2s ease-out;
}

.menu .ul {
	visibility: hidden;
	opacity: 0;
	margin: 0;
	padding: 0;
	width: 150px;
	position: absolute;
	left: 0px;
	background: #fff;
	z-index: 99;
	transform: translate(0, 20px);
	transition: all 0.2s ease-out;
}

.menu ul:after {
	bottom: 100%;
	left: 20%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-color: rgba(255, 255, 255, 0);
	border-bottom-color: #fff;
	border-width: 6px;
	margin-left: -6px;
}

.menu ul li {
	display: block;
	float: none;
	background: none;
	margin: 0;
	padding: 0;
}

.menu ul li a {
	font-size: 12px;
	font-weight: bold;
	display: block;
	color: #797979;
	text-decoration: none;
	background: #fff;
}

.menu ul li a:hover, .menu ul li:hover>a {
	background: #BA0707;
	color: #fff;
}

.dropdown-height {
	overflow-y: scroll;
	height: 80vh;
}

.menu li:hover>ul {
	visibility: visible;
	opacity: 1;
	transform: translate(0, 0);
}

.menu ul ul {
	left: 210px;
	top: 0px;
	visibility: hidden;
	opacity: 0;
	transform: translate(20px, 20px);
	transition: all 0.2s ease-out;
}

.menu ul ul:after {
	left: -6px;
	top: 10%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-color: rgba(255, 255, 255, 0);
	border-right-color: #fff;
	border-width: 6px;
	margin-top: -6px;
}

.menu li>ul ul:hover {
	visibility: visible;
	opacity: 1;
	transform: translate(0, 0);
}

.responsive-menu {
	display: none;
	width: 100%;
	padding: 10px 8px;
	background: #E95546;
	color: #fff;
	text-transform: uppercase;
	font-weight: 600;
}

.responsive-menu:hover {
	background: #E95546;
	color: #fff;
	text-decoration: none;
}

a.homer {
	background: #BA0707;
}

#logoutButton {
	height: 35px;
	width: 80px;
	background: #353535;
	border: 2px solid #353535;
	color: white;
	font-weight: bolder;
	font-size: 12px;
	position: revert;
	top: 19px;
}

#currentUser {
	color: orange;
	font-weight: 600;
	font-size: 17px;
	position: absolute;
	top: 8px;
	right: 10px;
}
 
#shopName {
    color: orange;
    font-weight: 600;
    font-size: 17px;
    position: absolute;
    top: 5px;
    right: 150px;
}

#logo {
	width: 110px;
	height: auto;
	z-index: -1;
   	position: fixed;
	top: 11%;
	right: 1%;
	opacity: 0.6;
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
		top: 5%;
		right: 5%;
		font-size: 12px
	}
	#currentUser {
		color: orange;
		font-weight: 600;
		font-size: 14px;
		position: fixed;
		top: 2%;
		right: 4%;
	}
	#logo {
    width: 110px;
    height: auto;
    position: fixed;
    top: 10%;
    right: 2%;
    z-index:-1;
    opacity: 0.6;
    	}
#shopName {
    color: orange;
    font-weight: 600;
    font-size: 17px;
    position: fixed;
    top: 2px;
    right: 146px;
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
		right: 6%;
	}
	#currentUser {
		color: orange;
		font-weight: 600;
		font-size: 13px;
		position: fixed;
		top: 4px;
		right: 5%;
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
#shopName {
    color: orange;
    font-weight: 600;
    font-size: 15px;
    position: fixed;
    top: 2px;
    right: 138px;
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
    right: 2%;
    opacity: 0.6;
    z-index: -1;
	}
#shopName {
    color: yellow;
    font-weight: 600;
    font-size: 17px;
    position: fixed;
    top: 5px;
    right: 175px;
}
}
</style>

</head>
<body>
	<input type="text" hidden="true" readonly="readonly" id="userType" name="usrerType" value="<%=type1%>">
	<input type="text" hidden="true" readonly="readonly" id="userName" name="userName" value="<%=name1%>">
	<input type="text" hidden="true" readonly="readonly" id="shopId" name="shopId" value="<%=shopId%>">
	<input type="text" hidden="true" readonly="readonly" id="shopName" name="shopName" value="<%=shopName%>">


	<nav class="navbar navbar-fixed-top" >
	<div id="loading" style="visibility:hidden;"><h4>Sending Mail....</h4>
		<img src="/SMT/staticContent/images/embellogo.png"
											style="width: 100%; height: 100vh;opacity:0.2;" /></div>
		<a id="resp-menu" class="responsive-menu" href=""><i
			class="fa fa-reorder"></i> Menu</a>
		<ul class="menu">
			<li><a class="homer" href="<%=path%>index.jsp"><i
					class="fa fa-home"></i>HOME</a></li>
			<%
				if (type1.equals("admin")) {
			%>
			<li><a href="<%=path%>y_product_detail.jsp"><i
					class="fa fa-sitemap"></i> Master</a>
				<ul class="sub-menu ul" style="width: 210px;">

					<%-- <li><a href="vat_Entry.jsp">Tax Details</a>
						<ul>
							<li><a href="<%=path%>vat_Entry.jsp">Tax Details</a></li>
						</ul>
					</li> --%>

					<li><a href="<%=path%>y_category_subcategory.jsp">Category(alt+C)</a>
						<ul>
							<li><a href="<%=path%>y_category_subcategory.jsp">Add Category</a>
								<ul>
									<li><a href="<%=path%>s_category_list.jsp">Category List</a></li>
									<li><a href="<%=path%>EditCategory.jsp">Edit Category</a></li>
									<li><a href="<%=path%>deleteCategory.jsp">Delete Category</a></li>
								</ul>
							</li>
							<li><a href="<%=path%>subCategory.jsp">Add Sub Category</a>
								<ul>
									<li><a href="<%=path%>subCategoryList.jsp">Sub Category List</a></li>
									<li><a href="<%=path%>EditSubcategory.jsp">Edit Sub Category</a></li>
									<li><a href="<%=path%>deleteSubCategory.jsp">Delete Sub Category</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li><a href="<%=path%>y_product_detail.jsp">Products Management(alt+P)</a>
						<ul>
							<li><a href="<%=path%>y_product_detail.jsp">Product Details</a></li>
							<li><a href="<%=path%>s_item_list.jsp">Product List</a></li>
						</ul>
					</li>
					<li><a href="<%=path%>s_supplier_detail.jsp">Supplier Management(alt+S)</a>
						<ul>
							<li><a href="<%=path%>s_supplier_detail.jsp">Supplier Details</a></li>
							<li><a href="<%=path%>s_supplier_list.jsp">Supplier List</a></li>
							<li><a href="<%=path%>s_SupplierEdit.jsp">Edit Supplier</a></li>
							<li><a href="<%=path%>s_SupplierDelete.jsp">Delete Supplier</a></li>
						</ul></li>
					<li><a href="<%=path%>customer_detail.jsp">Credit Customer Management(clt+alt+C)</a>
						<ul>
							<li><a href="<%=path%>customer_detail.jsp">Credit Customer</a></li>
							<li><a href="<%=path%>creditCustomerList.jsp">Credit Customer List</a></li>
							<li><a href="<%=path%>editCreditCustomerDetails.jsp">Edit Credit Customer</a></li>
						</ul>
					</li>
					<li><a href="<%=path%>employee_detail.jsp">Employee Biodata(clt+alt+B)</a>
						<ul>
							<li><a href="<%=path%>employee_detail.jsp">Employee Details</a></li>
							<li><a href="<%=path%>employeeList.jsp">Employee List</a></li>
							<li><a href="<%=path%>editEmployeeDetails.jsp">Edit Employee</a></li>
						</ul>
					</li>
					<li><a href="<%=path%>expenditureType.jsp">Expenditure Management(alt+E)</a>
						<ul>
							<li><a href="<%=path%>expenditureType.jsp">Expenditure Type</a></li>
							<li><a href="<%=path%>expenditureDetails.jsp">Expenditure Details</a>
								<ul>
									<li><a href="<%=path%>expenditureList.jsp">Expenditure List</a></li>
								</ul>
							</li>							
						</ul>
					</li>
					
					<li><a href="<%=path%>barcodeCopy.jsp">Barcode Reprint</a></li>
					<li><a href="<%=path%>bankDetails.jsp">Bank Details(alt+B)</a></li>
					<li><a href="<%=path%>shopDetails.jsp">Shop Details</a></li>
				</ul></li>
			<%
				}
			%>
			<%
				if (type1.equals("admin")) {
			%>
			<li><a href="<%=path%>goodReceive.jsp"><i
					class="fa fa-shopping-cart"></i>Good Receive</a>
				<ul class="sub-menu">
					<li><a href="<%=path%>goodReceive.jsp">Purchase(alt+G)</a></li>
					<li><a href="<%=path%>s_po_received.jsp">Ready-Made Purchase(alt+R)</a></li>
					<li><a href="<%=path%>advanceBooking.jsp">Advance Booking(alt+A)</a></li>
					<li><a href="<%=path%>s_preGrnReg.jsp">Previous Goods Receive(clt+alt+P)</a></li>
					<li><a href="<%=path%>editGoodRecieve.jsp">Edit Purchase(clt+P)</a></li>
					<li><a href="<%=path%>s_purchase_return.jsp">Purchase
							Return(clt+R)</a></li>
					<%-- <li><a href="<%=path%>pdefect_module.jsp">Defect Module</a></li>  --%>
				</ul></li>
			<%
				}
			%>
			<%
				if (type1.equals("admin")) {
			%>
			<li><a href="<%=path%>Miscellaneous.jsp"><i
					class="fa fa-edit"></i>Sale Invoice</a>
				<ul class="sub-menu">
					<li><a href="<%=path%>Miscellaneous.jsp">Invoice(alt+I)</a></li>
					<li><a href="<%=path%>Credit_Customer_Bill.jsp">Credit Customer Invoice(clt+C)</a></li>
					<li><a href="<%=path%>setOfferDiscount.jsp">Set Offer Discount</a></li>
					<li><a href="<%=path%>editBill.jsp">Edit Bill(clt+E)</a></li>
					<%-- <li><a href="<%=path%>y_sale_return.jsp">Sale Return Invoice</a></li> --%>
					<li><a href="<%=path%>testSaleReturn.jsp">Sale Return Invoice(clt+alt+R)</a></li>
					<%-- <li><a href="<%=path%>sdefect_module.jsp">Defect Module</a></li> --%>
				</ul></li>
			<%
				}
			%>

			<%
				if (type1.equals("admin")) {
			%>
			<li><a href="<%=path%>allPaymentWithLeftTabs.jsp"><i
					class="fa fa-edit"></i>Finance<br>Management</a> <%
 	}
 %></li>
			<%
				if (type1.equals("admin")) {
			%>
			<li><a href="<%=path%>allWayReport.jsp"><i
					class="fa fa-bar-chart"></i>Inventory<br>Management</a>
				<ul class="sub-menu">
					<li><a href="<%=path%>allWayReport.jsp">All Way Report</a></li>
					<li><a href="<%=path%>s_current_stock.jsp">Live Inventory</a></li>
					<li><a href="<%=path%>s_CategoryWiseStock.jsp">Category Based Inventory</a></li>
					<li><a href="<%=path%>s_supplierWiseStock.jsp">Supplier Based Inventory</a></li>
					<li><a href="<%=path%>BarcodeWiseStock.jsp">Barcode Based Inventory</a></li>
					<li><a href="<%=path%>BillNoWiseStock.jsp">Invoice Based Inventory</a></li>
					<li><a href="<%=path%>lowstockalert.jsp">Low Inventory Items</a></li>
					<li><a href="<%=path%>ageWiseProductReport.jsp">Agewise Inventory</a></li>
					<%-- <li><a href="<%=path%>allWayStock.jsp">All Way Stock</a></li> --%>
				</ul></li>
			<%
				}
			%>
			<%
				if (type1.equals("admin")) {
			%>
			<li><a href="<%=path%>DayClosingReport.jsp"><i
					class="fa fa-file-zip-o"></i> Reports</a> <!-- <ul class="dropdown-height"> -->
				<ul class="sub-menu">
					<li><a href="<%=path%>DayClosingReport.jsp">Day Closure Report</a></li>
					<li><a href="<%=path%>allGstReports.jsp">GST Reports</a></li>
					<li><a href="<%=path%>profitAndLoss.jsp">Profit And Loss</a></li>
					<li><a href="<%=path%>profitandlossforexpenses.jsp">Profit And Loss For Expense</a></li>
					<%-- <li><a href="<%=path%>purchaseReports.jsp">GST Wise Purchase Report</a></li>
					<li><a href="<%=path%>gstSaleReport.jsp">GST Wise Sale Report</a></li> --%>
					<li><a href="<%=path%>cashBookReports.jsp">Financial Transaction Report</a></li>
					<li><a href="<%=path%>UnPaidAmountReport.jsp">Supplier Balance Report</a></li>
					<li><a href="<%=path%>creditcustomerpaymentbalancelist.jsp">Customer Balance Report</a></li>
					<li><a href="<%=path%>employeeWiseReport.jsp">Employee Report</a></li>
					<li><a href="<%=path%>allReports.jsp">ALL Reports</a></li>
					<%-- <li><a href="<%=path%>NonGstWisePurchaseReport.jsp">Non GST Wise Purchase Report</a></li>
					<li><a href="<%=path%>CreditNote.jsp">Credit Note</a></li>
					<li><a href="<%=path%>DebitNote.jsp">Debit Note</a></li> --%>
					<li><a href="<%=path%>MostSellingProductReport.jsp">Most Selling Product Report</a></li>
				</ul></li>
			<%
				}
			%>
			<%
				if (type1.equals("salesman")) {
			%>
			<li><a href="<%=path%>Miscellaneous.jsp"><i
					class="fa fa-edit"></i>Sale Invoice</a>
				<ul class="sub-menu">
					<li><a href="<%=path%>Miscellaneous.jsp">Invoice</a></li>
					<%-- <li><a href="<%=path%>Credit_Customer_Bill.jsp">Credit Customer Invoice</a></li> --%>
					<%-- <li><a href="<%=path%>setOfferDiscount.jsp">Set Offer Discount</a></li> --%>
					<li><a href="<%=path%>y_sale_return.jsp">Sale Return Invoice</a></li>
				</ul></li>
			<%
				}
			%>

			<%
				if (type1.equals("cashier")) {
			%>
			<li><a href="<%=path%>Miscellaneous.jsp"><i
					class="fa fa-edit"></i>Sale Invoice</a>
				<ul class="sub-menu">
					<li><a href="<%=path%>Miscellaneous.jsp">Invoice</a></li>
					<li><a href="<%=path%>Credit_Customer_Bill.jsp">Credit Customer Invoice</a></li>
					<%-- <li><a href="<%=path%>setOfferDiscount.jsp">Set Offer Discount</a></li> --%>
					<li><a href="<%=path%>y_sale_return.jsp">Sale Return Invoice</a></li>
				</ul></li>
			<%
				}
			%>

			<%
				if (type1.equals("salesman") || type1.equals("cashier")) {
			%>
			<li><a href="<%=path%>SuppBasedInventoryForEmp.jsp"><i
					class="fa fa-bar-chart"></i>Inventory<br>Management</a>
				<ul class="sub-menu">
					<li><a href="<%=path%>SuppBasedInventoryForEmp.jsp">Supplier
							Based Inventory</a></li>
					<li><a href="<%=path%>BarcodeWiseStockForEmp.jsp">Barcode
							Based Inventory</a></li>
					<li><a href="<%=path%>BillNoWiseStockForEmp.jsp">Invoice
							Based Inventory</a></li>
				</ul></li>
			<%
				}
			%>

			<%
				if (type1.equals("cashier")) {
			%>
			<li><a href="<%=path%>dayClosureForEmp.jsp"><i
					class="fa fa-file-zip-o"></i> Reports</a>
				<ul class="sub-menu">
					<li><a href="<%=path%>dayClosureForEmp.jsp">Day Closure
							Report</a></li>
					<li><a href="<%=path%>saleReportForCashier.jsp">All
							Reports</a></li>
				</ul></li>
			<%
				}
			%>

			<%
				if (type1.equals("admin") || type1.equals("cashier")) {
			%>
			<li><a href="<%=path%>Other_Bill_Copy.jsp"><i
					class="fa fa-file-zip-o"></i>Invoice<br>Reprint</a>
				<ul class="sub-menu">
					<li><a href="<%=path%>Other_Bill_Copy.jsp">Invoice Reprint</a></li>
					<li><a href="<%=path%>CreditCustCopy.jsp">Credit Customer<br>Invoice
							Reprint
					</a></li>
				</ul></li>
			<%
				}
			%>

			<%
				if (type1.equals("admin")) {
			%>
			<li><a href="<%=path%>create_user.jsp"><i
					class="fa fa-file-zip-o"></i>HR</a>
				<ul class="sub-menu">
					<li><a href="<%=path%>create_user.jsp">Create User</a></li>
					<li><a href="<%=path%>accessControl.jsp">Access Control</a></li>
				</ul></li>
			<!-- <li><a href="/SMT/jsp/create_user.jsp"><i
					class="fa fa-user-o"></i> Create User</a></li> -->
			<%
				}
			%>

			<%
			if (type1.equals("admin") || type1.equals("salesman") || type1.equals("cashier")) {
			%>
				<li id="shopName">Shop: <%=shopName.toUpperCase()%></li>
			<%
				}
			%>
				
			<%
				if (type1.equals("admin") || type1.equals("salesman") || type1.equals("cashier")) {
			%>
			<!-- <li><a href="" onclick="Logout()"><i class="fa fa-power-off"></i>Logout</a></li> -->
			<li><button type="button" onclick="Logout();loader()" id="logoutButton"
					name="logoutButton">
					<i class="fa fa-sign-out"></i>LOGOUT
				</button></li>
			<li id="currentUser">User: <%=name1.toUpperCase()%></li>
			<%
				}
			%>
		</ul>
		
		<!-- <div>
				<img src = "/SMT/staticContent/images/e-logo.png" id="logo"/>
			</div> -->

		<!-- <img src = "/SMT/staticContent/images/embellogo.png" style="width:60px; height: 35px " /> -->
	</nav>

<div>
			<img alt="" src="/SMT/staticContent/images/e-logo.png" id="logo">
		</div>
	<script>
		
	</script>




	<script src="/SMT/staticContent/y_js/jquery-2.1.3.min.js"></script>
	<script>
		$(document).ready(function() {
			var touch = $('#resp-menu');
			var menu = $('.menu');
			$(touch).on('click', function(e) {
				e.preventDefault();
				menu.slideToggle();
			});
			$(window).resize(function() {
				var w = $(window).width();
				if (w > 767 && menu.is(':hidden')) {
					menu.removeAttr('style');
				}
			});
		});
	</script>
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
		_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
		_gaq.push([ '_trackPageview' ]);
		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
		<script>
var preloader=document.getElementById("loading");
function loader(){
	preloader.style.visibility = "visible";
}
</script>
	<!-- header end -->