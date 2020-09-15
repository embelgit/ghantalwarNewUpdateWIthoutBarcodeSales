<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	boolean isHome = false;
%>
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
<script src="/SMT/staticContent/js/allReport.js"></script>
<script>
	$(document).ready(function() {
		allWayReport();
	});
</script>
<body id="dt_example" class="vColor">
	<div class="container-fluid">
		<div class="row">
			<div class="form-group" align="left">
				<div class=" col-md-3 control-label" id="billheading"
					style="padding-top: 3%; position: absolute; width: auto;">
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

			<div align="center" id="allwayreporth2">
				<h2 class="form-name style_heading">All Way Report</h2>
			</div>
		</div>


		<div id="allWayReport" class="tab-pane">
			<div class="row">
				<div class="col-sm-offset-1 col-md-10">
					<hr style="border-top-color: #c1b1b1;">
				</div>
			</div>
			<form class="form-horizontal" method="post" action=""
				name="allWayReportForm" id="allWayReportForm">
				<fieldset>
					<div class="row" align="center">
						<div class="table table-responsive"
							style="overflow: hidden; width: 1315px; margin-left: 7px;">
							<table
								class="table table-bordered table-striped table-condensed cf"
								id="currStock1" class="display" style="border: 2px solid black; border-collapse: collapse;">

								<thead style="background-color: orange;">
									<tr>
										<th>Barcode No</th>
										<th>Item Name</th>
										<th>Category</th>
										<th>Quantity</th>
										<th>Rollsize</th>
										<th>Quantity<br>In<br>Meter
										</th>
										<th>Size</th>
										<th>Color</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
		<div class="row footer_margin_top" align="center">
			<%@include file="y_commons/footer.jsp"%>
		</div>
	</div>
</body>
</html>