<%@page import="com.smt.hibernate.GoodReceive"%>
<%@page import="com.smt.helper.GoodReceiveHelper"%>
<%@page import="com.smt.hibernate.SupplierDetail"%>
<%@page import="com.smt.helper.SupplierDetailHelper"%>
<%@page import="java.util.List"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	boolean isHome = false;
%>
<%@include file="y_commons/header1.jsp"%>
<script src="/SMT/staticContent/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="/SMT/staticContent/y_js/bootstrap.min.js"></script>
<script type="text/javascript" src="/SMT/staticContent/y_js/bootbox.min.js"></script>
<script type="text/javascript" src="/SMT/staticContent/y_js/bootbox.min.js"></script>
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
	<link rel="stylesheet" href="/SMT/staticContent/css/invoice.css">	
<script src="/SMT/staticContent/js/currentStock.js"></script>
<body class="stock_form_img vColor">
 
  <div class="invoice_based"> 
	<div class="container-fluid">
		<div class="row">
			<div class="form-group" align="left">
				<div class=" col-md-3 control-label" id="billheading"
					style="padding-top: 6px; position: absolute; width: auto;">
					<div id="date">
						<label id="demo"></label>
						<script>
							var date = new Date();
							document.getElementById("demo").innerHTML = date
									.toDateString();
						</script>
					</div>
				</div>

			</div>

			<div align="center" id="categorydetailsh2">
							<h2 class="form-name style_heading">Invoice Based Inventory</h2>
			</div>
		</div>
     <div class="row">
			<div class="col-md-12">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>
     <div class="miscellaneous" style="left: ;"> 
		<form method="post" class="form-horizontal">
		<div class="container" id="custdetal" style="margin-bottom: 0;">
			<div class="row">
				<div class="form-group">
				
					<%
						GoodReceiveHelper helper = new GoodReceiveHelper();
						List mainCategoryList = helper.getBillNo(request, response);
					%>
							<div class="invoice_label_up ">
			<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="invoicebaseinvent">

						 <input list="catId_drop" id="catId" class="form-control" style="border-radius: 9px;background-color: #f0f0f0;
						 padding: 23px;margin-bottom: 30px;box-sizing: border-box;box-shadow: none;
						 border: 1px solid #21409c;outline: none;line-height: inherit;z-index:-0;">
							<datalist id="catId_drop">
								<%
									for (int i = 0; i < mainCategoryList.size(); i++) {
										GoodReceive category = (GoodReceive) mainCategoryList.get(i);
								%>
								<option data-value="<%=category.getBillNo()%>"
									value="<%=category.getBillNo()%>">
									<%
										}
									%>
								
							</datalist>
<!-- 					<div class="col-sm-2 col-sm-offset-3" align="center"> -->
						<label class="control-label" id="label" style="font-family: Times New Roman;">Select
							Bill No:</label>
<!-- 					</div> -->
						</div>
					</div>
					<div class="col-1"></div>
			<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="invoicebaseinvent">	
						<div align="center">
						<input type="button" value="Search" id="btn"
							onclick="billwisestock();"
							class="btn btn-large btn-success btn-md button_hw button_margin_right"  style="width:124px;    padding-top: 8px;float:left;border-radius:10px;"/>
							</div>
					</div>
				
					
					
				</div>
				</div>
			</div>
			</form>
		</div>
<!-- 			<br> <br> <br> <br>
 -->
			<div class="row">
				<div class="table-responsive">
					<table
						class="table table-bordered table-striped table-condensed cf"
						id="example" class="display"
						style="border: 2px solid black; border-collapse: collapse;">
						<thead>
							<tr>
								<th>Bill No</th>
								<th>Supplier Name</th>
								<th>Category Name</th>
								<th>Item Name</th>
								<th>Available Quantity</th>
								<th>Buy Price</th>
								<th>Tax Percentage</th>
								<th>Barcode No</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th colspan="4" style="text-align: right">Total:</th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		
		<div class="row footer_margin_top" align="center">
			<%@include file="y_commons/footer.jsp"%>
		</div>
	</div>
	</div>
</body>
</html>