<%@page import="com.smt.hibernate.SupplierDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.smt.dao.SupplierDetailDao"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% boolean isHome=false;%>
<%@include file="y_commons/header1.jsp"%>
<script src="/SMT/staticContent/js/jquery-1.12.3.min.js"></script>
<script src="/SMT/staticContent/shree/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="/SMT/staticContent/shree/dataTables.buttons.min.js" type="text/javascript"></script>
<script src="/SMT/staticContent/shree/buttons.flash.min.js" type="text/javascript"></script>
<script src="/SMT/staticContent/shree/jszip.min.js" type="text/javascript"></script>
<script src="/SMT/staticContent/shree/pdfmake.min.js" type="text/javascript"></script>
<script src="/SMT/staticContent/shree/vfs_fonts.js" type="text/javascript"></script>
<script src="/SMT/staticContent/shree/buttons.html5.min.js" type="text/javascript"></script>
<script src="/SMT/staticContent/shree/buttons.print.min.js" type="text/javascript"></script>
<link href="/SMT/staticContent/y_css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="/SMT/staticContent/y_css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="/SMT/staticContent/css/invoice.css">	
<!--<link href="/SMT/staticContent/css/fields.css" rel="stylesheet" type="text/css" media="all"> -->
<script data-main="scripts/main" src="/SMT/staticContent/js/r.js"></script>
<script src="/SMT/staticContent/js/allGSTReports.js"></script>

<style>
.left-tab-new
{
    width: 192px;
    background: #ba0707;
    color:  white;
    border-radius: 0px;
}
</style>
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
    right: 2%;
    opacity: 0.6;
    z-index:-1;
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
    z-index: -1;
    right: 2%;
    opacity: 0.6;
}
}
</style>
<body style="height: 863px; margin-top: 50px" class="vColor">
<div class="row" style="min-height: 300px;">
		<div class="col-md-12">
			<!-- <h3>Left Tabs</h3> -->
			<hr />
			<div class="col-md-2">
				<ul class="nav nav-tabs tabs-left" style="width:22%;">
					<li class="active" id="li"><a href="#gSTWisePurchaseReports" data-toggle="tab" class="left-tab-new">GST Wise Purchase Reports</a></li>
					<li id="li"><a href="#gstWiseSaleReports" data-toggle="tab" class="left-tab-new">Gst Wise Sale Reports</a></li>
					<li id="li"><a href="#nonGstWisePurchase" data-toggle="tab" class="left-tab-new">NON GST Wise Purchase Reports</a></li>
					<li id="li"><a href="#gstReportsAll" data-toggle="tab" class="left-tab-new">B2C And B2B Gst Report</a></li>
				</ul>
			</div>

	<div class="container-fluid">
	
		<div class="col-xs-9" id="gsttabcol">
				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane fade in active" id="gSTWisePurchaseReports">
	
		<div class="row">
					<div align="center">
<!-- <div align="center" style="margin-top: 75px"> -->
				<h2 class="form-name style_heading">GST Wise Purchase Reports</h2>
			</div>
			<div class="row">
				<div class="col-sm-offset-1 col-md-10">
					<hr style="border-top-color: #c1b1b1;">
				</div>
			</div>
		</div>
		
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home"><h4 style="color: blue">Single Date</h4></a></li>
			<li><a data-toggle="tab" href="#twoDates"><h4 style="color: blue">Between Two Dates</h4></a></li>
			<li><a data-toggle="tab" href="#suppGstReportBetweenTwoDates"><h4 style="color: blue">Supplier Wise</h4></a></li>
			<!-- <li><a data-toggle="tab" href="#caReports"><h4	style="color: blue">CA Report</h4></a></li> -->
		</ul>

		<div class="tab-content" id="tabname">
		
			<!-------- Single Date ---------->
			
			<div id="home" class="tab-pane fade in active">
				<div class="row"></div>
				 <div class="miscellaneous">	
				<form class="form-horizontal" method="post" action="" name="abc">
				<div class="container">
						<div class="row">
						<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="graphcolumnwidth">	
						<input type="date" id="fDate" type="text">
							<label for=""> Enter Date:<sup>*</sup></label>
						</div>
				
						
					<div class="col-md-2" id="btnsub">			
			<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md" onclick="return singleDatePurchase();" value="Search" style="padding-bottom: 30px;"/>
				    </div>				
					</div>		
						</div>
						
					</form>	
				</div>		
					
                 <div class="container">
						<div class="table-responsive" id="tables">
							<table
								class="table table-bordered table-striped table-condensed cf"
								id="example" class="display"
								style="border: 2px solid black; border-collapse: collapse;">
								<thead>
									<tr>
										<th>Sr No</th>
										<th>Date</th>
										<th>Supplier Name</th>
										<th>Bill No</th>
										<th>Item Name</th>
										<th>HSN/SAC No</th>
										<th>Item Rate</th>
										<th>Quantity</th>
										<th>Roll Size</th>
										<th>Amount</th>
										<th>Discount<br>Amount</th>
										<th>GST (%)</th>
										<th>IGST (%)</th>
										<!-- <th>GST& SGST 12% Amount</th>
										<th>GST& SGST 18% Amount</th>
										<th>GST& SGST 28% Amount</th> -->
										<!-- <th>IGST 12% Amount</th>
										<th>IGST 18% Amount</th>
										<th>IGST 28% Amount</th> -->
										<!-- <th>Discount Amount</th> -->
										<th>Total Tax Amount</th>
										<th>Total Amount</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th colspan="7" style="text-align: right">Total:</th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<!-- <th></th> -->
									</tr>
								</tfoot>
							</table>
							</div>
						</div>
					
				
			</div>

			<!-- ---	Between Two Dates	---- -->
			
			
			<div id="twoDates" class="tab-pane ">
				<div class="row"></div>
			
				 <div class="miscellaneous">
				 <div class="container">
				
				<form class="form-horizontal" method="post" action=""
					name="fertiBill">
				
						<div class="row">
							<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="graphcolumnwidth">	
							<input type="date" id="fisDate" type="text">
							<label  for="">From<sup>*</sup></label>
							</div>	
							

						<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="graphcolumnwidth">	
						 <input type="date" id="endDate" type="text">
						 	<label  for="">To<sup>*</sup></label>
							</div>
						
							
						<div class="col-md-2" id="btnsub">

								<input type="button" id="btn" name="save" style="padding-bottom: 30px;"
									class="btn btn-lg btn-success btn-md button_hw"
									onclick="purchaseReportBetweenTwoDates()" value="Search" />

						</div>	
						</div>
						
			      </form>
                   </div>
                    </div>
					
					
					<div class="container">
						<div class="table-responsive" id="tables">
							<table
								class="table table-bordered table-striped table-condensed cf"
								id="example1" class="display"
								style="border: 2px solid black; border-collapse: collapse;">
								<thead>
									<tr>
										<th>Sr No</th>
										<th>Date</th>
										<th>Supplier Name</th>
										<th>Bill No</th>
										<th>Item Name</th>
										<th>Hsn/Sac No</th>
										<th>Item Rate</th>
										<th>Quantity</th>
										<th>Roll Size</th>
										<th>Discount<br>Amount</th>
										<th>GST (%)</th>
										<th>IGST (%)</th>
										<th>Amount</th>
										<!-- <th>Discount Amount</th> -->
										<th>Total Tax Amount</th>
										<th>Total Amount</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th colspan="7" style="text-align: right">Total:</th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<!-- <th></th> -->
									</tr>
								</tfoot>
							</table>
							</div>
						</div>
				
				
			</div>
			
			
			<!--------------------------------------------------------------- / BETWEEN TWO DATES -------------------------------------------------------->
			
			
			<!----------------------------------------------------------- SUPPLIER GST BETWEEN 2 DATES --------------------------------------------------->
			
			<div id="suppGstReportBetweenTwoDates" class="tab-pane ">
				<!-- <div class="row"></div> -->
				
					
					<div class="miscellaneous">
					
					<form class="form-horizontal" method="post" action="" name="suppGstReportBetweenTwoDatesForm">
					<div class="container">
						<div class="row">						
							<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="graphcolumnwidth">								
								<%
									SupplierDetailDao sdd88 = new SupplierDetailDao();
									List sList88 = sdd88.getAllSupplier();
								%>
								<input list="sup_drop7" id="supplier7">
								<datalist id="sup_drop7">
									<%
										for (int i = 0; i < sList88.size(); i++)
										{
											SupplierDetail sup88 = (SupplierDetail) sList88.get(i);
									%>
									<option data-value="<%=sup88.getSupplierId()%>" value="<%=sup88.getSupplierName()%>">
									<%
										}
									%>											
								</datalist>
								<label  for="supplier">Supplier Name<sup>*</sup></label>
							</div>	
							
							<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="graphcolumnwidth">
										<input type="date" id="fisDateSupp" placeholder="Start Date" type="text">
										<label  for="" >From<sup>*</sup></label>
							</div>
						</div>	
					
					 	
                         <div class="row">
							
							<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="graphcolumnwidth">
								<input type="date" id="endDateSupp" type="text">
								<label for="">To<sup>*</sup></label>
								</div>
							
							<div class=""></div>
							
							
                           <div class="col-md-2" id="btnsub">
								<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw" onclick="suppGstReportBetweenTwoDates()" value="Search" style="padding-bottom: 30px;"/>
                           </div>
							
					      </div>
					      </div>
				     	</form>
				     	
				</div>
				

						<fieldset>
						<div class="table-responsive" id="tables">
							<table
								class="table table-bordered table-striped table-condensed cf"
								id="suppGstReportBetweenTwoDatesDataTable" class="display"
								style="border: 2px solid black; border-collapse: collapse;">
								<thead>
									<tr>
										<th>Sr No</th>
										<th>Date</th>
										<th>Supplier Name</th>
										<th>Bill No</th>
										<th>Item Name</th>
										<th>Hsn/Sac No</th>
										<th>Item Rate</th>
										<th>Quantity</th>
										<th>Roll Size</th>
										<th>Discount<br>Amount</th>
										<th>GST (%)</th>
										<th>IGST (%)</th>
										<th>Amount</th>
										<!-- <th>Discount Amount</th> -->
										<th>Total Tax Amount</th>
										<th>Total Amount</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th colspan="7" style="text-align: right">Total:</th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<!-- <th></th> -->
									</tr>
								</tfoot>
							</table>
						</div>
					
			
			</fieldset>	
		</div>
			
			<!----------------------------------------------------------- / SUPPLIER GST BETWEEN 2 DATES --------------------------------------------------->
			
			<!------------------------------------------------------------------	CA Reports	------------------------------------------------------------>
			<div id="caReports" class="tab-pane ">
				<div class="row"></div>
				<form class="form-horizontal" method="post" action=""
					name="fertiBill">
					<fieldset>
						<div class="row form-group" style="margin-top: 20px">
							<label class="col-md-2 control-label" for=""> Start
								Purchase Date:<sup>*</sup>
							</label>
							<div class="col-md-2">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="glyphicon glyphicon-calendar"></i>
									</span> <input type="date" id="fisDate1" placeholder="Start Date"
										class="form-control input-md" type="text">
								</div>
							</div>

							<label class="col-md-2 control-label" for="">End Purchase
								Date:<sup>*</sup>
							</label>
							<div class="col-md-2">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="glyphicon glyphicon-calendar"></i>
									</span> <input type="date" id="endDate1" placeholder="End Date"
										class="form-control input-md ac_district" type="text">
								</div>
							</div>
							<div align="center">
								<input type="button" id="btn" name="save" style="margin-right: 206px;"
									class="btn btn-lg btn-success btn-md button_hw button_margin_right"
									onclick="caReportBetweenTwoDates()" value="Search" />
							</div>
						</div>
						
						<p id="demo12"></p>
						<div class="table-responsive" id="tables">
							<table
								class="table table-bordered table-striped table-condensed cf"
								id="careport" class="display"
								style="border: 2px solid black; border-collapse: collapse;">
								<thead>
									<tr>
										<th>Sr No</th>
										<th>Category Name</th>
										<th>Item Name</th>
										<th>Hsn/Sac No</th>
										<th>Quantity</th>
										<th>Gst</th>
										<th>Igst</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
									</tr>
								</tfoot>
							</table>
						</div>
					</fieldset>
				</form>
			</div>
	
		</div>
				</div>
					
	
	
	<!-------------------------------------------------------------- Gst Wise Sale Reports ------------------------------------------------------->
	
	
		<div id="gstWiseSaleReports" class="tab-pane ">
		<div class="row">
			<div align="center" >
				<h2 class="form-name style_heading">Gst Wise Sale Reports</h2>
			</div>
			<div class="row">
				<div class="col-sm-offset-1 col-md-10">
					<hr style="border-top-color: #c1b1b1;">
				</div>
			</div>
		</div>

 		<div class="miscellaneous">	
		<form class="form-horizontal" method="post" action="" name="fertiBill">
		     <div class="container">
				<div class="row">
					  <div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="graphcolumnwidth">	
					 <input type="date" id="firstDate" placeholder="Start Date" type="text">
					 <label> Start Sale Date<sup>*</sup></label>
					</div>

					 <div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="graphcolumnwidth">	
					<input type="date" id="secondDate" placeholder="End Date" type="text">
					<label>End Sale Date:<sup>*</sup></label>
					</div>
					
				<div class="col-md-2" id="btnsub">		
			<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw" onclick="gstsaleReportBetweenTwoDates()" value="Search" style="padding-bottom: 30px;" />
					</div>
				</div>
            </div>
		</form>
</div>
				<div class="table-responsive" id="tables">
					<table
						class="table table-bordered table-striped table-condensed cf"
						id="example4" class="display"
						style="border: 2px solid black; border-collapse: collapse;">
						<thead>
							<tr>
								<th>Sr No</th>
								<th>Date</th>
								<th>Bill No</th>
								<th>Item Name</th>
								<th>HSN Code</th>
								<th>Item Rate</th>
								<th>Quantity</th>
								<th>Amount</th>
								<th>GST %</th>
								<th>IGST %</th>
								<!-- <th>IGST 5% Amount</th>
								<th>IGST 12% Amount</th>
								<th>IGST 18% Amount</th>
								<th>IGST 28% Amount</th> -->
								<th>Total Tax Amount</th>
								<th>Discount<br>Amount</th>
								<th>Total Amount</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th colspan="5" style="text-align: right">Total:</th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</tfoot>
					</table>
				</div>	
	</div>
	
<!-- </div> -->
	
		<!-------------------------------------------------------------- /Gst Wise Sale Reports ------------------------------------------------------->
		
		
		<!-------------------------------------------------------------- NON GST Wise Purchase Reports ------------------------------------------------------->		
		
		<div id="nonGstWisePurchase" class="tab-pane">
		<div class="row">
			<div align="center">
				<h2 class="form-name style_heading">NON GST Wise Purchase Reports</h2>
			</div>
			<div class="row">
				<div class="col-sm-offset-1 col-md-10">
					<hr style="border-top-color: #c1b1b1;">
				</div>
			</div>
		</div>

		<!-- ---	Between Two Dates	---- -->
		
		<div class="row"></div>
		<div class="miscellaneous">	
		<form class="form-horizontal" method="post" action="" name="fertiBill">
		<div class="container">
			<div class="row">
				 <div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="graphcolumnwidth">	
					 <input type="date" id="fisDateNoGst"  type="text">
					 <label  for="">From<sup>*</sup></label>
				</div>		
				<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="graphcolumnwidth">	
				     <input type="date" id="endDateNoGst" type="text">
				     <label for="">To<sup>*</sup></label>
				</div>
				
				<div class="col-md-2" id="btnsub">
				<input type="button" id="btn" name="save"
					class="btn btn-lg btn-success btn-md button_hw button_margin_right"
					onclick="purchaseReportBetweenTwoDatesNonGst()" value="Search" style="padding-bottom: 31px;" />
				</div>			
			</div>		
		</div>
      </form>
      </div>
      <div class="container">
				<div class="table-responsive" id="tables">
					<table
						class="table table-bordered table-striped table-condensed cf"
						id="purchaseNoGstWise" class="display"
						style="border: 2px solid black; border-collapse: collapse;">
						<thead>
							<tr>
								<th>Sr No</th>
								<th>Date</th>
								<th>Supplier Name</th>
								<th>Bill No</th>
								<th>GSTTIN No</th>
								<th>Item Name</th>
								<th>Hsn/Sac No</th>
								<th>Item Rate</th>
								<th>Quantity</th>
								<th>Roll Size</th>
								<th>Quantity in Meter</th>
								<th>Discount (%)</th>
								<th>Discount Amount</th>
								<th>Amount</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th colspan="9" style="text-align: right">Total:</th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</tfoot>
					</table>
					</div>
				</div>	
				</div>	
				<!-------------------------------------------------------------- /NON GST Wise Purchase Reports ------------------------------------------------------->
				
				
				
				
									<!------------------------------------------- GST REPORTS OF SALE, PURCHASE AND SUMMERY  -------------------------------->
					
					<div class="tab-pane" id="gstReportsAll">
						<div class="row">
							<div align="center">
								<h2 class="form-name style_heading">B2C And B2B Gst Report</h2>
							</div>

							<div class="row">
								<div class="col-sm-offset-1 col-md-10">
									<hr style="border-top-color: #c1b1b1;">
								</div>
							</div>
						</div>

						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#saleB2c"><h4 style="color: blue">Sale GST B2C</h4></a></li>
							<li><a data-toggle="tab" href="#purchaseB2b"><h4 style="color: blue">Purchase GST B2B</h4></a></li>
							<!-- <li><a data-toggle="tab" href="#gstSummery"><h4 style="color: blue">GST Summery</h4></a></li> -->
						</ul>

						<div class="tab-content" id="tabname">

						<!------------------------------------------- SALE GST REPORTS OF SALE PURCHASE AND SUMMERY  -------------------------------->

							<div id="saleB2c" class="tab-pane fade in active">
								<!-- <div class="row">
									<div class="col-sm-offset-1 col-md-10">
										<hr style="border-top-color: #c1b1b1;">
									</div>
								</div> -->
								 <div class="miscellaneous">
								<form class="form-horizontal" method="post" action="">
									<div class="container">
										<div class="row">
											<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="graphcolumnwidth">
											<input type="date" id="fisDateB2CGST" type="text">
											<label  for="startDateB2CGST">From<sup style="color: red;">*</sup></label>
											</div>

										<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="graphcolumnwidth">	
											<input type="date" id="endDateB2CGST" type="text">
											<label  for="endDateB2CGST">To<sup style="color: red;">*</sup></label>
										</div>
											<div class="col-md-2" id="btnsub">												
												<input type="button" id="btn" name="save" 
													class="btn btn-lg btn-success btn-md button_hw button_margin_right"
													onclick="twoDateSaleReportForGSTReport();" value="Search" style="padding-bottom: 31px;"/>
											</div>
										</div>
									</div>
								</form>		
								</div>
								
								<div class="container">								
										<div class="table-responsive" id="tables">
											<table
												class="table table-bordered table-striped table-condensed cf"
												id="saleB2CGSTReport" class="display" style="border: 0.5px solid black;">
												<thead>
													<tr>
														<th>Sr No</th>
														<th>Bill No</th>
														<th>Barcode No</th>
														<th>Item Name</th>
														<th>Category</th>
														<th>Sub Category</th>
														<th>Quantity</th>
														<th>Buy Price<br>Excl. Tax</th>
														<th>SalePrice</th>
														<th>GST<br>%</th>
														<th>Sale Price<br>Excl. Tax</th>
														<th>Discount<br>%</th>
														<th>Discount<br>Amount</th>
														<th>Tax Amount<br>After Discount</th>
														<th>Total Amount</th>
														<th>Date</th>
													</tr>
												</thead>
												<tfoot>
													<tr>
														<th colspan="6" style="text-align: right">Total:</th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
														<th></th>
													</tr>
												</tfoot>
											</table>
											</div>
											
										<div class="input-group">
											<input type="button" id="exportToGstB2cBtn" name="exportToGstB2cBtn" onclick="twoDateExportToGstB2CSaleReport();" 
												class="btn btn-lg btn-success btn-md button_hw button_margin_right" style="height: 27px; padding: 0px; width: 300px;margin-bottom: 31%;"
												value="EXPORT TO B2C GST SALE EXCEL" />
										</div>
									</div>
									
									<!-- 
										<div class="input-group">
											<input type="button" id="exportToGstB2cBtn" name="exportToGstB2cBtn" onclick="twoDateExportToGstB2cReport();" 
												class="btn btn-lg btn-success btn-md button_hw button_margin_right" style="height: 27px; padding: 0px; width: 250px"
												value="EXPORT TO B2C GST EXCEL" />
										</div> -->
								</div>
							
					<!-------------------------------------------/ SALE GST REPORTS ----------------------------------->
						
				    <!------------------------------------------- PURCHASE GST REPORTS -------------------------------->			
			
			<div id="purchaseB2b" class="tab-pane">
				<div class="row"></div>
				<form class="form-horizontal" method="post" action="" name="fertiBill">
				<fieldset>
				 <div class="miscellaneous">
					 <div class="container">
						<div class="row">
							<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="graphcolumnwidth">	
							<input type="date" id="fisDateB2bP" type="text">
							<label  for=""> Start Purchase Date:<sup>*</sup></label>
							</div>	

						<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="graphcolumnwidth">	
						 <input type="date" id="endDateB2bP" type="text">
						 	<label  for="">End Purchase Date<sup>*</sup></label>
							</div>				
							
						<div class="col-md-2" id="btnsub">
								<input type="button" id="btn" name="save" style="padding-bottom: 30px;"
									class="btn btn-lg btn-success btn-md button_hw"
									onclick="purchaseB2BGSTReport()" value="Search" />
						</div>	
						</div>
						</div>
			                         
                    </div>					
						<div class="table-responsive" id="tables">
							<table
								class="table table-bordered table-striped table-condensed cf"
								id="purchaseB2BGSTReport" class="display" style="border: 0.5px solid black;">
								<thead>
									<tr>
										<th>Sr No</th>
										<th>Date</th>
										<th>Supplier Name</th>
										<th>Bill No</th>
										<th>Item Name</th>
										<th>Hsn/Sac No</th>
										<th>Item Rate</th>
										<th>Quantity</th>
										<th>Roll Size</th>
										<th>Discount<br>Amount</th>
										<th>GST (%)</th>
										<th>IGST (%)</th>
										<th>Amount</th>
										<!-- <th>Discount Amount</th> -->
										<th>Total Tax Amount</th>
										<th>Total Amount</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th colspan="7" style="text-align: right">Total:</th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<!-- <th></th> -->
									</tr>
								</tfoot>
							</table>
						</div>
						<div class="input-group">
											<input type="button" id="exportToGstB2cBtn" name="exportToGstB2cBtn" onclick="twoDateExportToGstB2BPurchaseReport();" 
												class="btn btn-lg btn-success btn-md button_hw button_margin_right" style="height: 27px; padding: 0px; width: 330px;margin-bottom:30%;"
												value="EXPORT TO B2B PURCHASE GST EXCEL" />
										</div>
					</fieldset>
					</form>
			</div>
					
			
				<!-------------------------------------------/ PURCHASE GST REPORTS -------------------------------->
				
				
				<!------------------------------------------- GST SUMMERY REPORTS -------------------------------->			
			
			<div id="gstSummery" class="tab-pane">
				<div class="row"></div>
				<form class="form-horizontal" method="post" action="" name="fertiBill">
				<fieldset>
				 <div class="miscellaneous">
					<!--  <div class="container">
						<div class="row">
							<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="graphcolumnwidth">	
							<input type="date" id="fisDateGstS" type="text">
							<label  for="">Start Purchase Date:<sup>*</sup></label>
							</div>	
							

						<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4">
						 <input type="date" id="endDateGstS" type="text">
						 	<label  for="">End Purchase Date<sup>*</sup></label>
							</div>				
							
						<div class="col-lg-2">
								<input type="button" id="btn" name="save" style="padding-bottom: 35px;"
									class="btn btn-lg btn-success btn-md button_hw"
									onclick="" value="Search" />
						</div>	
						</div>
						</div> -->
			                         
                    </div>					
						<div class="table-responsive" id="tables">
							<table
								class="table table-bordered table-striped table-condensed cf"
								id="gstSummeryDtReport" class="display"
								style="border: 2px solid black; border-collapse: collapse;">
								<thead>
									<tr>
										<!-- <th>Sr No</th>
										<th>Date</th>
										<th>Supplier Name</th>
										<th>Bill No</th>
										<th>Item Name</th>
										<th>Hsn/Sac No</th>
										<th>Item Rate</th>
										<th>Quantity</th>
										<th>Roll Size</th>
										<th>Discount<br>Amount</th>
										<th>GST (%)</th>
										<th>IGST (%)</th>
										<th>Amount</th>
										<th>Discount Amount</th>
										<th>Total Tax Amount</th>
										<th>Total Amount</th> -->
									</tr>
								</thead>
								<tfoot>
									<tr>
										<!-- <th colspan="7" style="text-align: right">Total:</th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th> -->
									</tr>
								</tfoot>
							</table>
						</div>
						<!-- <div class="input-group">
											<input type="button" id="exportToGstB2cBtn" name="exportToGstB2cBtn" onclick="twoDateExportToGstB2BPurchaseReport();" 
												class="btn btn-lg btn-success btn-md button_hw button_margin_right" style="height: 27px; padding: 0px; width: 330px"
												value="EXPORT TO B2B PURCHASE GST EXCEL" />
										</div> -->
					</fieldset>
					</form>
			     </div>
			   </div>
			</div>			
			
				<!-------------------------------------------/ GST SUMMERY REPORTS -------------------------------->
				
		</div>
		</div>
		</div>
	</div>	
	</div>
		
		<div class="row footer_margin_top" align="center">
			<%@include file="y_commons/footer.jsp"%>
		</div>
</body>
</html>