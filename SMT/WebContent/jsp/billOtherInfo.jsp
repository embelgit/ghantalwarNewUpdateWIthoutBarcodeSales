<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% boolean isHome=false;%>
<%@include file="y_commons/header1.jsp"%>
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
<script src="/SMT/staticContent/js/currentStock.js"></script>
 <script>
	function abc()
	{
		billSaleWiseForPopUpReport(billNo);
		alert(billNo);
	}; 	
</script>
<body id="dt_example" class="vColor">
	<div class="container-fluid">
		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading">Live Inventory</h2>
			</div>
		</div>
		<div class="row">
			<div class="form-group" align="right">
				<div class="col-sm-offset-8 col-md-4 control-label">
					<div id="date">
						<label id="demo"></label>
						<script>
							   var date = new Date();
							   document.getElementById("demo").innerHTML = date.toDateString();
							</script>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>

		<div class="row" align="center">
			<div class="table-responsive">
											<table
												class="table table-bordered table-striped table-condensed cf"
												id="saleBillWise" class="display"
												style="border: 2px solid black; border-collapse: collapse;">
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
														<th>Sale Price</th>
														<th>GST<br>%</th>
														<th>Sale Price<br>Without Tax</th>
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
		</div>
		<div class="row footer_margin_top" align="center">
			<%@include file="y_commons/footer.jsp"%>
		</div>
	</div>
</body>
</html>