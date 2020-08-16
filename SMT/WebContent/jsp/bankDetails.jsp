<!-- this is product details jsp -->
<%@page import="com.smt.dao.SubCategoryDao"%>
<%@page import="com.smt.hibernate.SubCategory"%>
<%@page import="com.smt.bean.ItemList"%>
<%@page import="com.smt.bean.ProductDetailBean"%>
<%@page import="com.smt.dao.ProductDetailDao"%>
<%@page import="com.smt.hibernate.Category"%>
<%@page import="com.smt.hibernate.SupplierDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.smt.hibernate.ProductRegister"%>
<%@page import="com.smt.helper.CategoryHelper"%>
<%@page import="com.smt.helper.SupplierDetailHelper"%>
<%@page import="com.smt.helper.ProductDetailHelper"%>
<% boolean isHome = false;%>
<%@include file="y_commons/header1.jsp"%>

<head>
<script type="text/javascript" src="/SMT/staticContent/js/jquery.min.js"></script>
<!-- <script type="text/javascript" src="/SMT/staticContent/js/jquery-1.12.3.min.js"></script> -->
<link rel="stylesheet" href="/SMT/staticContent/y_css/ui.jqgrid.min.css">
<link rel="stylesheet" href="/SMT/staticContent/y_css/jquery-ui.css">
<link rel="stylesheet" href="/SMT/staticContent/y_css/ui.jqgrid.css">
<link rel="stylesheet" type="text/css" href="/SMT/staticContent/css/product_detail.css">
<link rel="stylesheet" type="text/css" href="/SMT/staticContent/css/popupwindow.css">
<script type="text/javascript" src="/SMT/staticContent/y_js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/SMT/staticContent/y_js/bootstrap.min.js"></script>
<script type="text/javascript" src="/SMT/staticContent/y_js/bootbox.min.js"></script>
<script type="text/javascript" src="/SMT/staticContent/js/jquery-ui.js"></script>
<script type="text/javascript" src="/SMT/staticContent/js/jqueryUi.js"></script>
<script type="text/javascript" src="/SMT/staticContent/y_js/jquery.jqgrid.min.js"></script>
<script type="text/javascript" src="/SMT/staticContent/y_js/jquery.popupwindow.js"></script>
<link rel="stylesheet" href="/SMT/staticContent/css/bankDetails.css">
<!-- 
	<script src="/SMT/staticContent/js/jquery-1.12.3.min.js"></script>
	<link rel="stylesheet" href="/SMT/staticContent/css/jquery-ui.min.css">
	<link rel="stylesheet" href="/SMT/staticContent/css/ui.jqgrid.min.css">
	<link rel="stylesheet" href="/SMT/staticContent/css/ui.jqgrid.css">
	<script src="/SMT/staticContent/js/jquery.min.js"></script>
	<script src="/SMT/staticContent/js/jquery.jqgrid.min.js"></script>
-->

<script src="/SMT/staticContent/js/bankDetails.js"></script>

<script type="text/javascript">
 function bankList()
 {
 	window.location = "bankDetailsList.jsp";
 }

 function clearField()
 {
	   document.getElementById("catId_dropPD").value = "";
 }
 </script>
</head>
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
}
</style>
<body class="vColor">
	<div class="container-fluid">
		<div class="row">
			<div class="form-group" align="left">
				<div class="col-md-2 control-label" style="padding-top: 3%;">
				</div>
				</div>

			<div class="col-md-2 col-md-offset-3 align" align="center"
				style="padding-top: 11px;">
				<h2 class="form-name style_heading">Bank Details</h2>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-offset-1 col-md-10">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>


	<div class="miscellaneous">
		<form action="pro" method="post" name="prod" class="form-horizontal">
	      <div class="container" id="categoryListOfProductDetails">	
			<div class="row">			
					<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="dayreport">				
					   <input type="text" input-sm" id='bankName' name='bankName'>
							<label>Bank Name<sup style="color: red;">*</sup></label>
					</div>
					
				<div class="col-md-1"></div>				
						<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="subCategoryListOfProductDetails">						
					    <input type="text" input-sm" id='accountNumber' name='accountNumber'>
							<label>Account Number<sup style="color: red;">*</sup></label>
					</div>
			 </div>			 
			
			<div class="row">
				<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="dayreport">
							<input type="text" input-sm" id='bankIfscCode' name='bankIfscCode' >
							<label>IFSC Code<sup style="color: red;">*</sup></label>
				</div>
				<div class="col-md-1"></div>
					<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="dayreport">
						 <input type="text" id='bankBranchName' name='bankBranchName'>
						 <label>Branch Name<sup style="color: red;">*</sup></label>
				    </div>
			</div>
			
			<div class="row">
				<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="dayreport">
							<input type="text" input-sm" id='bankAccountHname' name='bankAccountHname'>
							<label>Account Holder Name<sup style="color: red;">*</sup></label>
				</div>
				<div class="col-md-1"></div>
					<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="dayreport">
						 <input type="text" id='contactNo' name='contactNo' maxlength="10">
						 <label>Contact No<sup style="color: red;">*</sup></label>
				    </div>
			</div>
			
			<div class="row">
				<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="dayreport">
							<input type="text" input-sm" id='address' name='address' >
							<label>Address</label>
				</div>
				<div class="col-md-1"></div>
			</div>
			
			<div class="prd_det_btn">
			<div class="row buttons_margin_top">
				<!-- 	<h3 align="center" style="color: red; font-size: 17px;">Please Give Size 'mtr' for fabric Type of Products</h3> -->
				<div align="center">
					<div class="col-lg-2" style="display: inline-block;">
						<input type="button" onclick="addBank()" name="btn" style="width: 124px;" id="btn" value="Save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" />
						</div>
						<div class="col-lg-2" style="display: inline-block;">
						<input type="button" onclick="bankList()" name="btn" style="width: 124px;" value="List" class="btn btn-lg btn-primary btn-md button_hw button_margin_right" />
						</div>
						<div class="col-lg-2" style="display: inline-block;">
						<input type="reset" value="Cancel" onclick="window.location.reload()" style="width: 124px;" class="btn btn-lg btn-danger btn-md button_hw button_margin_right" />
					</div>
				</div>
			</div>
			</div>
		</div>
		</form>
		
     </div>
     
		<div class="row footer_margin_top" align="center">
			<%@include file="y_commons/footer.jsp"%>
		</div>
	</div>
</body>
</html>