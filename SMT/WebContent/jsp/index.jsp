<!-- PAGE AFTER LOGIN -->
<!DOCTYPE html>
<%@page import="java.util.Calendar"%>
<%@page import="com.smt.hibernate.UserDetail"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.smt.utility.HibernateUtility"%>
<%@page import="com.smt.hibernate.Stock"%>
<%@page import="java.util.List"%>
<%@page import="com.smt.dao.StockDao"%>
<%@page import="java.util.List"%>
<%
	boolean isHome = false;
%>
<%@include file="y_commons/header1.jsp"%>
<html lang="en">
<%-- <% String type1= "";
                     String name1 = "";
		             if (session != null) {
			         if (session.getAttribute("user") != null) {
				     name1 = (String) session.getAttribute("user");
		              HibernateUtility hbu1=HibernateUtility.getInstance();
		              Session session2=hbu1.getHibernateSession();
		   
		              org.hibernate.Query query1 = session2.createQuery("from UserDetail where userName =:usr");
		              query1.setParameter("usr", name1);
		              UserDetail userDetail1 = (UserDetail) query1.uniqueResult();
		              type1 = userDetail1.getTypeId();
			         } 
			         else {
					     response.sendRedirect("/SMT/jsp/login.jsp");
					     out.println("Please Login ");
				        }
		           }
		             else {
					     response.sendRedirect("/SMT/jsp/login.jsp");
					     out.println("Please Login...");
				        }
	           %>
<% String  contextPath=request.getContextPath(); %> --%>


<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Comoatible" content="IE=edge">
<title>Embel Technologies Pvt Ltd</title>
<link rel="stylesheet" type="text/css"
	href="/SMT/staticContent/dashbaordcss/style.css">
<link rel="stylesheet" type="text/css"
	href="/SMT/staticContent/dashbaordcss/base.css">
<link rel="stylesheet" type="text/css"
	href="/SMT/staticContent/dashbaordcss/fonts.css">
<link rel="stylesheet" type="text/css"
	href="/SMT/staticContent/dashbaordcss/bootstrap.css">
<script src="/SMT/staticContent/dashboardjs/bootstrap.js"
	type="text/javascript"></script>
<script src="/SMT/staticContent/dashboardjs/jquery.js"
	type="text/javascript"></script>
<link
	href="https://www.cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/SMT/staticContent/dashbaordcss/style.css">
<link rel="stylesheet" type="text/css"
	href="/SMT/staticContent/dashbaordcss/base.css">
<link rel="stylesheet" type="text/css"
	href="/SMT/staticContent/dashbaordcss/fonts.css">
<link rel="stylesheet" type="text/css"
	href="/SMT/staticContent/dashbaordcss/bootstrap.css">
<script src="/SMT/staticContent/dashboardjs/bootstrap.js"
	type="text/javascript"></script>
<script src="/SMT/staticContent/dashboardjs/jquery.js"
	type="text/javascript"></script>
<link
	href="https://www.cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="https://code.jquery.com/jquery-1.8.2.min.js"></script>
<script src="/SMT/staticContent/js/jquery-1.12.3.min.js"></script>
<script src="/SMT/staticContent/shree/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script src="/SMT/staticContent/shree/dataTables.buttons.min.js"
	type="text/javascript"></script>
<script src="/SMT/staticContent/shree/buttons.flash.min.js"
	type="text/javascript"></script>
<script src="/SMT/staticContent/shree/jszip.min.js"
	type="text/javascript"></script>
<script src="/SMT/staticContent/shree/pdfmake.min.js"
	type="text/javascript"></script>
<script src="/SMT/staticContent/shree/vfs_fonts.js"
	type="text/javascript"></script>
<script src="/SMT/staticContent/shree/buttons.html5.min.js"
	type="text/javascript"></script>
<script src="/SMT/staticContent/shree/buttons.print.min.js"
	type="text/javascript"></script>
<link href="/SMT/staticContent/y_css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="/SMT/staticContent/y_css/buttons.dataTables.min.css"
	rel="stylesheet" type="text/css" media="all">
<!-- Bootstrap Core CSS -->
<link href="/SMT/staticContent/css/bootstrap.min.css" rel="stylesheet">
<link href="/SMT/staticContent/css/dashboard.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/SMT/staticContent/css/sb-admin-2.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="/SMT/staticContent/css/morris.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="/SMT/staticContent/css/metisMenu.min.css" rel="stylesheet">
<!-- Timeline CSS -->
<link href="/SMT/staticContent/css/timeline.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/SMT/staticContent/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="/SMT/staticContent/css/css/style.css" rel="stylesheet"
	type="text/css">
<link rel="shortcut icon"
	href="/SMT/staticContent/images/images/favicon.png" />
<link rel="stylesheet"
	href="/SMT/staticContent/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="/SMT/staticContent/vendors/css/vendor.bundle.base.css">
<!-- jQuery -->
<script src="/SMT/staticContent/js/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/SMT/staticContent/js/bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="/SMT/staticContent/js/sb-admin-2.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="/SMT/staticContent/js/metisMenu.min.js"></script>
<!-- Morris Charts JavaScript -->
<script src="/SMT/staticContent/js/raphael-min.js"></script>
<script src="/SMT/staticContent/js/morris.min.js"></script>
<script src="/SMT/staticContent/js/morris-data.js"></script>
<!-- Custom Theme JavaScript -->
<script src="/SMT/staticContent/js/sb-admin-2.js"></script>
<script src="/SMT/staticContent/js/logout.js"></script>
<script src="/SMT/staticContent/js/graph.js"></script>
<script src="/SMT/staticContent/js/jquery-1.12.3.min.js"></script>
<script src="/SMT/staticContent/js/highcharts.js"></script>
<script src="/SMT/staticContent/js/exporting.js"></script>
<script src="/SMT/staticContent/js/cashbankbook.js"></script>
</head>
<!-- <body onload="getTodaySaleTotalAmountInDashboard(); getTodayPurchaseTotalAmountInDashboard(); salesGraph(); purchaseGraph(); salesGraph1(); purchaseGraph1();"> -->
<!-- <body onload="salesGraph(); purchaseGraph(); salesGraph1(); purchaseGraph1();" style="overflow-x: hidden;"> -->
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
    top: 10%;
    right: 1%;
    z-index:-1;
    opacity: 0.6;
 }

@media ( min-width : 980px) and (max-width:1180px)
{
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
#logoutButton{
width: 70px;
position: fixed;
top: 3%;
right: 2%;
font-size: 12px
}
#currentUser{
 color: orange; 
 font-weight: 600;
 font-size: 14px;
position: fixed;
    top:1%;
    right: 2%;
}
#logo{
width: 110px;
    height: auto;
    position: fixed;
    top: 10%;
    right: 2%;
    z-index: -1;
    opacity: 0.6;
}
}

@media ( min-width : 768px) and (max-width: 979px)
{
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
#logoutButton{
width: 70px;
font-size:11px;
position: fixed;
top: 12px;
right: 44px;
}
#currentUser{
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
    right: 2%;
    opacity: 0.6;
    z-index: -1;
}
}
</style>
<body style="overflow-x: hidden;">
	<div class="container-fluid display-table" style="margin-top: 102px;">
		<div class="row display-table-row">
			<!-- Side menu -->
			<%--  <div
				class="col-md-2 col-sm-2 hidden-xs display-table-cell valign-top border-bottom"
				id="side-menu">
				<h1 class="hidden-xs hidden-sm">Admin</h1>
				<ul>
				<%
    			  if(type1.equals("admin") || type1.equals("salesman") || type1.equals("cashier")){
            %>
				
					<li class="link"><a href="Miscellaneous.jsp"> <span
							class="glyphicon glyphicon-user" aria-hidden="true"></span> <span
							class="hidden-sm hidden-xs"> Profile</span>
					</a></li>
					<%} %>
					
					<%
    			  if(type1.equals("admin")){
            %>
					<li class="link"><a href="goodReceive.jsp"> <span
							class="glyphicon glyphicon-th" aria-hidden="true"></span> <span
							class="hidden-sm hidden-xs"> Purchase</span>
					</a></li>
<%} %>

<%
    			  /* if(type1.equals("admin") || type1.equals("cashier")){ */
    				  if(type1.equals("admin")){
            %>
            <!-- Purchase Report Tab -->
					<li class="link"><a href="#collapse-post"
						data-toggle="collapse" aria-controls="collapse-post"
						aria-expanded="false"> <span class="glyphicon glyphicon-file"
							aria-hidden="true"></span> <span class="hidden-sm hidden-xs">Purchase Reports</span> <span
							class="label label-success pull-right hidden-sm hidden-xs"></span>
					</a>
						<ul id="collapse-post" class="collapse collapseable">
							<li><a href="purchaseReports.jsp"> GST Wise Purchase Reports </a></li>
							<li><a href="NonGstWisePurchaseReport.jsp"> Non GST Wise Purchase Reports </a></li>
							<li><a href="CreditNote.jsp">Credit Note</a></li>
							<li><a href="UnPaidAmountReport.jsp">Supplier Balance Report</a></li>	
						</ul>
					</li>
		<!-- Sale Report Tab -->
					<li class="link"><a href="#collapse-sales"
						data-toggle="collapse" aria-controls="collapse-sales"
						aria-expanded="false"> <span class="glyphicon glyphicon-file"
							aria-hidden="true"></span> <span class="hidden-sm hidden-xs">Sales Reports</span> <span
							class="label label-success pull-right hidden-sm hidden-xs"></span>
					</a>
						<ul id="collapse-sales" class="collapse collapseable">
							<li><a href="gstSaleReport.jsp"> GST Wise Sales Reports	</a></li>
							<li><a href="DayClosingReport.jsp">Day Closure	Report</a></li>
							<li><a href="cashBookReports.jsp">Cash Book	Report</a></li>
							<li><a href="creditcustomerpaymentbalancelist.jsp">Customer	Balance Report</a></li>
							<li><a href="employeeWiseReport.jsp">Employe Report</a></li>
							<li><a href="allReports.jsp">ALL Reports</a></li>
							<li><a href="DebitNote.jsp">Debit Note</a></li>
							<li><a href="MostSellingProductReport.jsp">Most	Selling Product Report</a></li>
						</ul>
					</li>
					
		<!-- Billing Tab -->
		
		<li class="link"><a href="#collapse-bill"
						data-toggle="collapse" aria-controls="collapse-bill" aria-expanded="false"> <span class="glyphicon glyphicon-file"	aria-hidden="true"></span> 
						<span class="hidden-sm hidden-xs">Billing</span> 
						<span class="label label-success pull-right hidden-sm hidden-xs"></span>
					</a>
						<ul id="collapse-bill" class="collapse collapseable">
							<li><a href="Miscellaneous.jsp">Tax Invoice</a></li>
							<li><a href="Credit_Customer_Bill.jsp">Credit Customer Bill</a></li>
							<li><a href="y_sale_return.jsp">Sale Return</a></li>
		     			</ul>
					</li>
		
		
					
		<!-- Bill Copy Tab -->
					<li class="link"><a href="#collapse-billcopy"
						data-toggle="collapse" aria-controls="collapse-billcopy" aria-expanded="false"> <span class="glyphicon glyphicon-file"	aria-hidden="true"></span> 
						<span class="hidden-sm hidden-xs">Bill Copy</span> 
						<span class="label label-success pull-right hidden-sm hidden-xs"></span>
					</a>
						<ul id="collapse-billcopy" class="collapse collapseable">
							<li><a href="Other_Bill_Copy.jsp"> Tax Invoice Copy	</a></li>
							<li><a href="CreditCustCopy.jsp">Credit Customer Copy</a></li>
		     			</ul>
					</li>
		
						<%} %>
				</ul>
			</div> 
			
<!--new content  -->
			 <!-- <div class="container-scroller">
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item nav-profile">
              <a href="#" class="nav-link">
                <div class="nav-profile-image">
                  <img src="/SMT/staticContent/images/images/faces/face1.jpg" alt="profile">
                  <span class="login-status online"></span>
                  change to offline or busy as needed
                </div>
                <div class="nav-profile-text d-flex flex-column">
                  <span class="font-weight-bold mb-2">David Grey. H</span>
                  <span class="text-secondary text-small">Project Manager</span>
                </div>
                <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="index.html">
                <span class="menu-title">Dashboard</span>
                <i class="mdi mdi-home menu-icon"></i>
              </a>
            </li>
            
              <li class="nav-item">
              <a class="nav-link" href="#">
                <span class="menu-title">Profile</span>
                <i class="mdi mdi-home menu-icon"></i>
              </a>
            </li>

            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <span class="menu-title">Basic UI Elements</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-crosshairs-gps menu-icon"></i>
              </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="/SMT/staticContent/pages/ui-features/buttons.html">Buttons</a></li>
                  <li class="nav-item"> <a class="nav-link" href="/SMT/staticContent/pages/ui-features/typography.html">Typography</a></li>
                </ul>
              </div>
            </li>

                  
              <li class="nav-item">

              <a class="nav-link" data-toggle="collapse" href="#ui-basic1" aria-expanded="false" aria-controls="ui-basic1">
                <span class="menu-title">Sales Reports</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-crosshairs-gps menu-icon"></i>
              </a>


              <div class="collapse" id="ui-basic1">

                  <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="/SMT/staticContent/pages/ui-features/buttons.html">GST WISE SALES REPORT</a></li>
                  <li class="nav-item"> <a class="nav-link" href="/SMT/staticContent/pages/ui-features/typography.html">DAY CLOUSER REPORT</a></li>

                  <li class="nav-item"> <a class="nav-link" href="/SMT/staticContent/pages/ui-features/buttons.html">CASH BOOK REPORT</a></li>

                  <li class="nav-item"> <a class="nav-link" href="/SMT/staticContent/pages/ui-features/buttons.html">CUSTOMER BALANCE REPORT</a></li>

                  <li class="nav-item"> <a class="nav-link" href="/SMT/staticContent/pages/ui-features/buttons.html">EMPLOYEE REPORT</a></li>

                  <li class="nav-item"> <a class="nav-link" href="/SMT/staticContent/pages/ui-features/buttons.html">ALL REPORT</a></li>

                  <li class="nav-item"> <a class="nav-link" href="/SMT/staticContent/pages/ui-features/buttons.html">DEBIT NOTE</a></li>

                  <li class="nav-item"> <a class="nav-link" href="/SMT/staticContent/pages/ui-features/buttons.html">MOST SELLING PRODUCT REPORT</a></li>
                </ul>

              </div>
            </li>


             <li class="nav-item">
                
              <a class="nav-link" data-toggle="collapse" href="#ui-basic2" aria-expanded="false" aria-controls="ui-basic2">
                <span class="menu-title">BILLING</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-crosshairs-gps menu-icon"></i>
              </a>


              <div class="collapse" id="ui-basic2">

                  <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="#">TAX INVOICE</a></li>
                  <li class="nav-item"> <a class="nav-link" href="#">CREDIT CUSTOMERBILL</a></li>

                  <li class="nav-item"> <a class="nav-link" href="#">SALE RETURN</a></li>

                </ul>

              </div>
            </li>
        

            <li class="nav-item">
              <a class="nav-link" href="/SMT/staticContent/pages/icons/mdi.html">
                <span class="menu-title">Icons</span>
                <i class="mdi mdi-contacts menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/SMT/staticContent/pages/forms/basic_elements.html">
                <span class="menu-title">Forms</span>
                <i class="mdi mdi-format-list-bulleted menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/SMT/staticContent/pages/charts/chartjs.html">
                <span class="menu-title">Charts</span>
                <i class="mdi mdi-chart-bar menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/SMT/staticContent/pages/tables/basic-table.html">
                <span class="menu-title">Tables</span>
                <i class="mdi mdi-table-large menu-icon"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#general-pages" aria-expanded="false" aria-controls="general-pages">
                <span class="menu-title">Sample Pages</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-medical-bag menu-icon"></i>
              </a>
              <div class="collapse" id="general-pages">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="/SMT/staticContent/pages/samples/blank-page.html"> Blank Page </a></li>
                  <li class="nav-item"> <a class="nav-link" href="/SMT/staticContent/pages/samples/login.html"> Login </a></li>
                  <li class="nav-item"> <a class="nav-link" href="/SMT/staticContent/pages/samples/register.html"> Register </a></li>
                  <li class="nav-item"> <a class="nav-link" href="/SMT/staticContent/pages/samples/error-404.html"> 404 </a></li>
                  <li class="nav-item"> <a class="nav-link" href="/SMT/staticContent/pages/samples/error-500.html"> 500 </a></li>
                </ul>
              </div>
            </li>
            <li class="nav-item sidebar-actions">
              <span class="nav-link">
                <div class="border-bottom">
                  <h6 class="font-weight-normal mb-3">Projects</h6>
                </div>
                <button class="btn btn-block btn-lg btn-gradient-primary mt-4">+ Add a project</button>
                <div class="mt-4">
                  <div class="border-bottom">
                    <p class="text-secondary">Categories</p>
                  </div>
                  <ul class="gradient-bullet-list mt-4">
                    <li>Free</li>
                    <li>Pro</li>
                  </ul>
                </div>
              </span>
            </li>
          </ul>
        </nav>
        </div> -->
<!--new content end  --> --%>

			<!-- main content -->
			<div style="margin-top: 20px">
				<div class="col-md-12 col-sm-11 display-table-cell valign-top box">
					<div class="row">
						<header id="nav-header" class="clearfix">
							<div class="col-md-5">
								<nav class="navbar-default pull-left">
									<button type="button" class="navbar-toggle collapsed"
										data-toggle="offcanvas" data-target="#side-menu">
										<span class="sr-only">Toggle Navigation</span> <span
											class="icon-bar"></span> <span class="icon-bar"></span> <span
											class="icon-bar"></span>
									</button>
								</nav>
								<h4 id="main-head" class="col-md-12" style="font-family:"ubantu;">
									<span class="sub-head"></span> <strong>STYLE ME</strong>
									<!-- <strong>Ghantalwar</strong> -->
								</h4>

								<!-- <span class="glyphicon glyphicon-stats" style="font-weight: 1000"> Today Sale Amount: <input type="text" readonly="readonly"
											id="totsaleAmt" ></span> -->
							</div>
							<div class="col-md-7">
								<ul class="pull-left">
									<!-- <ul class="pull-right"> -->
									<!-- <li id="welcome" class="hidden-xs"><input type="text"
										class="hidden-sm hidden-xs" id="header-feild-search"
										placeholder="search for something"></li> -->
									<div>
										<img src="/SMT/staticContent/images/embellogo.png"
											style="width: 100%; height: 375px" />
									</div>
								</ul>
							</div>
						</header>
					</div>
				</div>
				</header>
			</div>
		</div>
	</div>

	<!-- old graph -->
	<div class="col-md-8" hidden="true">
		<div class="row">
			<section id="stats" class="clearfix">
				<div class="tab panel-header">
					<button class="tablinks active" onclick="openCity(event, 'Graph')">Graph</button>
					<button class="tablinks" href="#myChart1"
						onclick="openCity(event, 'Pie-Chart')">Bar-Graph</button>
				</div>

				<div class="panel-content">

					<div id="Graph" class="tabcontent">
						<div id="container"
							style="min-width: 310px; height: 400px; margin: 0 auto"></div>
					</div>

					<div id="Pie-Chart" class="tabcontent">

						<div id="container1"
							style="width: 600; height: 400px; margin: 0 auto"></div>
					</div>
				</div>
			</section>
		</div>
	</div>

	<!--old graph end  -->

	<!--new graph  -->
	<!-- new graph end -->

	<div class="col-md-4" hidden="true">
		<div class="row clearfix">
			<div class="panel list-search">
				<input type="text" id="myInput" onkeyup="myFunction()"
					placeholder="Search for names.." title="Type in a name">
				<ul id="myUL" class="clearfix">
					<li><a href="#">Adele</a></li>
					<li><a href="#">Agnes</a></li>
					<li><a href="#">Billy</a></li>
					<li><a href="#">Bob</a></li>
					<li><a href="#">Calvin</a></li>
					<li><a href="#">Christina</a></li>
					<li><a href="#">Cindy</a></li>
					<li><a href="#">Cavin</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="col-md-12" hidden="true">
		<div class="row">
			<section id="stats1" class="clearfix">
				<div class="tab panel-header">
					<button class="tablinks1" onclick="openCity1(event, 'Graph1')">Graph</button>
					<button class="tablinks1 active" href="#myChart1"
						onclick="openCity1(event, 'Pie-Chart1')">Bar-Graph</button>
				</div>

				<div class="panel-content">

					<div id="Graph1" class="tabcontent1">
						<div id="container2"
							style="min-width: 310px; height: 400px; margin: 0 auto"></div>
					</div>

					<div id="Pie-Chart1" class="tabcontent1">

						<div id="container3"
							style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
					</div>
				</div>
			</section>
		</div>
	</div>

	<%-- <%
		StockDao productForNotification = new StockDao();
		List<Stock> notificationProducts = productForNotification.getAllProductForNotification();
	%> --%>

	<%-- <div class="container-fluid">
					<div class="row header_margin_top">
						<div align="center">
							<h3 class="form-name style_heading">Products Whose Quantity
								Less Than 10</h3>
						</div>
					</div>
					
					<div class="row" align="center">
						<div class="table-responsive" style="width: 900">
							<table
								class="table table-bordered table-striped table-condensed cf"
								id="itemName" class="display"
								style="border: 2px solid black; border-collapse: collapse;">
								<thead>
									<tr>
										<th>Category Name</th>
										<th>Item Name</th>
										<th>Quantity</th>
										<th>Update Date</th>
									</tr>
								</thead>
								<tbody>
									<%
   			   for(int i=0;i<notificationProducts.size();i++){
	        	   Stock goodsForNotification =(Stock)notificationProducts.get(i);
				%>
									<tr>
										<td><%=goodsForNotification.getCatName()%></td>
										<td><%=goodsForNotification.getItemName() %></td>
										<td><%=goodsForNotification.getQty2() %></td>
										<td><%=goodsForNotification.getDate() %></td>
									</tr>
									<%
					}
				%>
								</tbody>
							</table>
						</div>
					</div>
				</div> --%>
	<div class="col-md-6 " hidden="true">
		<div class="row clearfix">
			<aside id="daily-stats">
				<div class="panel panel-left">
					<div class="panel-heading">
						<h4 class="panel-title">Today's Sale</h4>
					</div>
					<div class="panel-body">
						<span class="glyphicon glyphicon-stats"></span> <span><input
							type="text" id="totsaleAmt"></span>
					</div>
				</div>
			</aside>
		</div>
	</div>
	<div class="col-md-6" hidden="true">
		<div class="row clearfix">
			<aside id="daily-stats">
				<div class="panel panel-right">
					<div class="panel-heading">
						<h4 class="panel-title">Today's Purchase</h4>
					</div>
					<div class="panel-body">
						<span class="glyphicon glyphicon-stats"></span> <span><input
							type="text" id="totpurchaseAmt"></span>
					</div>
				</div>
			</aside>
		</div>
	</div>

	<!-- <div class="col-md-6">
					<div class="card ">
						<div class="header">
							<h4 class="title">Tasks</h4>
							<p class="category">Backend development</p>
						</div>
						<div class="content">
							<div class="table-full-width">
								<table class="table">
									<tbody>
										<tr>
											<td>
												<div class="checkbox">
													<input id="checkbox1" type="checkbox"> <label
														for="checkbox1"></label>
												</div>
											</td>
											<td>Sign contract for "What are conference organizers
												afraid of?"</td>
											<td class="td-actions text-right">
												<button type="button" rel="tooltip" title="Edit Task"
													class="btn btn-info btn-simple btn-xs">
													<i class="fa fa-edit"></i>
												</button>
												<button type="button" rel="tooltip" title="Remove"
													class="btn btn-danger btn-simple btn-xs">
													<i class="fa fa-times"></i>
												</button>
											</td>
										</tr>
										<tr>
											<td>
												<div class="checkbox">
													<input id="checkbox2" type="checkbox" checked> <label
														for="checkbox2"></label>
												</div>
											</td>
											<td>Lines From Great Russian Literature? Or E-mails From
												My Boss?</td>
											<td class="td-actions text-right">
												<button type="button" rel="tooltip" title="Edit Task"
													class="btn btn-info btn-simple btn-xs">
													<i class="fa fa-edit"></i>
												</button>
												<button type="button" rel="tooltip" title="Remove"
													class="btn btn-danger btn-simple btn-xs">
													<i class="fa fa-times"></i>
												</button>
											</td>
										</tr>
										<tr>
											<td>
												<div class="checkbox">
													<input id="checkbox3" type="checkbox"> <label
														for="checkbox3"></label>
												</div>
											</td>
											<td>Flooded: One year later, assessing what was lost and
												what was found when a ravaging rain swept through metro
												Detroit</td>
											<td class="td-actions text-right">
												<button type="button" rel="tooltip" title="Edit Task"
													class="btn btn-info btn-simple btn-xs">
													<i class="fa fa-edit"></i>
												</button>
												<button type="button" rel="tooltip" title="Remove"
													class="btn btn-danger btn-simple btn-xs">
													<i class="fa fa-times"></i>
												</button>
											</td>
										</tr>
										<tr>
											<td>
												<div class="checkbox">
													<input id="checkbox4" type="checkbox" checked> <label
														for="checkbox4"></label>
												</div>
											</td>
											<td>Create 4 Invisible User Experiences you Never Knew
												About</td>
											<td class="td-actions text-right">
												<button type="button" rel="tooltip" title="Edit Task"
													class="btn btn-info btn-simple btn-xs">
													<i class="fa fa-edit"></i>
												</button>
												<button type="button" rel="tooltip" title="Remove"
													class="btn btn-danger btn-simple btn-xs">
													<i class="fa fa-times"></i>
												</button>
											</td>
										</tr>
										<tr>
											<td>
												<div class="checkbox">
													<input id="checkbox5" type="checkbox"> <label
														for="checkbox5"></label>
												</div>
											</td>
											<td>Read "Following makes Medium better"</td>
											<td class="td-actions text-right">
												<button type="button" rel="tooltip" title="Edit Task"
													class="btn btn-info btn-simple btn-xs">
													<i class="fa fa-edit"></i>
												</button>
												<button type="button" rel="tooltip" title="Remove"
													class="btn btn-danger btn-simple btn-xs">
													<i class="fa fa-times"></i>
												</button>
											</td>
										</tr>
										<tr>
											<td>
												<div class="checkbox">
													<input id="checkbox6" type="checkbox" checked> <label
														for="checkbox6"></label>
												</div>
											</td>
											<td>Unfollow 5 enemies from twitter</td>
											<td class="td-actions text-right">
												<button type="button" rel="tooltip" title="Edit Task"
													class="btn btn-info btn-simple btn-xs">
													<i class="fa fa-edit"></i>
												</button>
												<button type="button" rel="tooltip" title="Remove"
													class="btn btn-danger btn-simple btn-xs">
													<i class="fa fa-times"></i>
												</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="footer">
								<hr>
								<div class="stats">
									<i class="fa fa-history"></i> Updated 3 minutes ago
								</div>
							</div>
						</div>
					</div>
				</div> -->
								
<%
	int year123 = Calendar.getInstance().get(Calendar.YEAR);
%>
				
	<div class="row">
		<footer id="admin-footer" class="clearfix col-md-12">
			<div style="text-align: center;">
				<b>copyright</b> &copy; <%=year123 %>
			</div>
			<div class="pull-right" hidden="true">Admin system</div>
		</footer>
	</div>
	</div>
	</div>

	<script type="text/javascript">
		function openCity(evt, statsType) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(statsType).style.display = "block";
			evt.currentTarget.className += " active";
		}
	</script>
	<script type="text/javascript">
		function openCity1(evt, statsType) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent1");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks1");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(statsType).style.display = "block";
			evt.currentTarget.className += " active";
		}
	</script>
	<script type="text/javascript">
		var $length1 = $('#sales');
		var lengthMax1 = parseInt($length1.attr('data-max'), 10);
		var current1 = 0;
		var updateLength1 = function() {
			current1 += 100;
			$length1.html(current1);
			updateTick1();
		};
		var updateTick1 = function() {
			if (current1 < lengthMax1) {
				requestAnimationFrame(updateLength1);
			} else {
				$length1.html('<i class="fa">&#xf156;</i>' + lengthMax1)
			}
		};
		updateLength1();
	</script>
	<script type="text/javascript">
		var $length = $('#purchase');
		var lengthMax = parseInt($length.attr('data-max'), 10);
		var current = 0;
		var updateLength = function() {
			current += 100;
			$length.html(current);
			updateTick();
		};
		var updateTick = function() {
			if (current < lengthMax) {
				requestAnimationFrame(updateLength);
			} else {
				$length.html('<i class="fa">&#xf156;</i>' + lengthMax)
			}
		};
		updateLength();
	</script>


	<script>
		function myFunction() {
			var input, filter, ul, li, a, i;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			ul = document.getElementById("myUL");
			li = ul.getElementsByTagName("li");
			for (i = 0; i < li.length; i++) {
				a = li[i].getElementsByTagName("a")[0];
				if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
					li[i].style.display = "";
				} else {
					li[i].style.display = "none";

				}
			}
		}
	</script>
	<%
		int ListSize = 0;
	%>
	<script type="text/javascript">
		
	<%-- <%StockDao productForNotificationDao = new StockDao();
			List notificationProductsList = productForNotification.getAllProductForNotification();
			ListSize = notificationProductsList.size();
			System.out.println("notificationProducts ============> " + ListSize);
			if (ListSize > 0)
			{
				System.out.println("notificationProducts ============> " + ListSize);%>
		//alert("notificationProducts.size() === "+ListSize);
		if (Notification.permission !== "granted")
			notification.requestPermission();
		else
		{
			var notification = new Notification('Low Stock', {
				icon : '/SMT/staticContent/images/notification.jpeg',
				body : "Some Product Running on Low Stock!",
			});

			notification.onclick = function() {
				window.open("lowstockalert.jsp");
			};
		}
	<%}%> --%>
		
	</script>

	<script src="/SMT/staticContent/vendors/js/vendor.bundle.base.js"></script>
	<script src="/SMT/staticContent/vendors/chart.js/Chart.min.js"></script>
	<script src="/SMT/staticContent/js/off-canvas.js"></script>
	<script src="/SMT/staticContent/js/hoverable-collapse.js"></script>
	<script src="/SMT/staticContent/js/misc.js"></script>
	<script src="/SMT/staticContent/js/dashboard.js"></script>
	<script src="/SMT/staticContent/js/todolist.js"></script>

</body>
</html>