\<%@page import="java.util.List"%>
<%@page import="com.smt.dao.SupplierDetailDao"%>
<%@page import="com.smt.hibernate.SupplierDetail"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	boolean isHome = false;
%>
<%@include file="y_commons/header1.jsp"%>
<html lang="en">
<head>
<link rel="stylesheet" href="/SMT/staticContent/css/invoice.css">
<script src="/SMT/staticContent/y_js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="/SMT/staticContent/y_js/bootstrap.min.js"></script>
<script type="text/javascript" src="/SMT/staticContent/y_js/bootbox.min.js"></script>
<script src="/SMT/staticContent/y_js/supplier.js"></script>

<script type="text/javascript">
function Back()
{
	window.location = "s_supplier_detail.jsp" ;
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
    z-index: -1;
    opacity: 0.6;
}
}
</style>
</head>  		

<body class="vColor">
	<div class="container col-md-offset-5" id="supplieredit">
	<div class="row">
	<div align="center">
		<h2 class="form-name style_heading">Edit Supplier</h2>
	</div>
</div>
	<div class="row">
	<div class="col-sm-offset-1 col-md-10">
		<hr style="border-top-color: #c1b1b1;">
	</div>
</div>
		<div class="row" hidden="true">
			<div class="form-group" align="right">
				<div class="col-sm-offset-6 col-md-5 control-label">

				</div>
			</div>
		</div>
<div class="miscellaneous" id="suppliereditcol">
	<form action="supplier" name="supd1" method="post">
		<div class="container col-sm-offset-1">
			<div class="row">
			<div class="invoice_label_up">
			<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="dayreport">
					<%
						SupplierDetailDao dao5 = new SupplierDetailDao();
						List supList = dao5.getAllMainSuppliersShopWise(request, response);
			         %>
					<!-- <div class="col-sm-2 col-sm-offset-1" align="right"> -->
					
					<select  name="supplierName" id="supplierName" onchange="es.getSupp()">
								<option value="selected">Select Supplier</option>
								<%
			            		    for(int i=0;i<supList.size();i++){
				                	SupplierDetail supD=(SupplierDetail)supList.get(i);
								%>
								<option value="<%=supD.getSupplierId()%>"><%=supD.getSupplierName() %>
								</option>
								<%
						          		       }
						        %>
							</select>
						<!-- <span>Supplier Name:</span> -->
				</div>
						
						<div class="col-md-1"></div>
						
			   <div class="invoice_label_up">
			<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="dayreport">
					
					 <input type="text" name="supplierCode" id="supplierCode" required/>
					 <label>Supplier Code</label>
				</div>
				</div>
			</div>
			</div>
			
			
			<div class="row">
			
				<div class="invoice_label_up">
				<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="dayreport">
					 <input type="text" name="supplierName1" id="supplierName1" required />
					 <label>Supplier Name</label>
					 </div>
					 </div>
					 
					 <div class="col-md-1"></div>
					 
			<div class="invoice_label_up">
				<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="dayreport">
					 <input type="text" id="address" name="address" required />
					 <label>Address</label>
					</div>
					</div>
			</div>

			<div class="row">
				<div class="invoice_label_up">
				<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="dayreport">
					<input  type="text" id="city" name="city" required />
						<label>City</label>
						</div>
						</div>
						
					<div class="col-md-1"></div>
					
                  <div class="invoice_label_up">
				<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="dayreport">
					<input type="text" id="pin" name="pin" maxlength="6" required />
						<label>Pin Code</label>
						</div>
						</div>
				
			</div>

			<div class="row">
			<div class="invoice_label_up">
				<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="dayreport">
					 <input type="text" id="contactPerson" name="contactPerson"  required/>
						<label>Person Name</label>
						</div>
						</div>
						
					<div class="col-md-1"></div>
					
				<div class="invoice_label_up">
                     <div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="dayreport">
					     <input type="text" id="email" name="email" required/>
						<label>E-mail</label>
						</div>
						</div>
			
				
			</div>

			<div class="row">
			<div class="invoice_label_up">
		             <div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="dayreport">
					 <input type="text" id="mobileno" name="mobileno"  required/>
						<label>Mobile No</label>
						</div>
						</div>
						
						<div class="col-md-1"></div>
						
					<div class="invoice_label_up">
				<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="dayreport">
					     <input type="text" id="panNo" name="panNo"  required/>
						<label>GSTTIN/UIN No</label>
						</div>
						</div>
			</div>
        </div>
       
			<div class="row">
				
			      <div class="col-md-2" id="suppliereditbutton">
					<input type="button" value="Submit" id="btn" onclick="return editSupplier3();" class="btn btn-large btn-success btn-md" style="width:124px;padding-top: 8px;"/>
					</div>
					<div class="col-md-2" id="suppliereditbutton">
					<input type="reset" value="Cancel" class="btn btn-large btn-danger btn-md" style="width:124px;padding-top: 8px;"/>
					</div>
					<div class="col-md-2" id="suppliereditbutton">
					<input type="button" value="Back" id="listBtn" class="btn btn-large btn-primary btn-md" onclick="Back()" style="width:124px;padding-top: 8px;"/>
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