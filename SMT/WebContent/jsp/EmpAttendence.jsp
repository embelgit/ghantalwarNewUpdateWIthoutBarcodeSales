<%@page import="java.util.List"%>
<%@page import="com.smt.bean.GetEmployeeDetails"%>
<%@page import="com.smt.dao.EmployeeDetailsDao"%>
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
	
	<script type="text/javascript"	src="/SMT/staticContent/js/employeeDetails.js"></script>
<html>
<head>
<title>Credit Customer List</title>
<script type="text/javascript">
	function Back() {
		window.location = "employee_detail.jsp";
	}
</script>
</head>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var table = $("#list").dataTable();
						var tableTools = new $.fn.dataTable.TableTools(
								table,
								{
									'sSwfPath' : '//cdn.datatables.net/tabletools/2.2.4/swf/copy_csv_xls_pdf.swf',
									'aButtons' : [ 'copy', 'print', 'csv', {
										'sExtends' : 'xls',
										'sFileName' : 'Data.xls',
										'sButtonText' : 'Save to Excel'
									} ],
									dom : 'Bfrtip',
									buttons : [ 'copy', 'csv', 'excel', 'pdf',
											'print' ],
								});
						$(tableTools.fnContainer()).insertBefore(
								'#list_wrapper');
					});
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
		top: 19;
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
<body id="dt_example" style="min-height: 300px;" class="vColor">
	<div class="row">
		<div class="form-group" align="left">
			<div class="col-md-2 control-label"
				style="padding-top: 3%; position: absolute; width: auto;"
				id="billheading">
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


		<div align="center" id="employeelisth2">
			<h2 class="form-name style_heading">Employee List</h2>
		</div>
		<div class="row">
			<div class="col-sm-offset-1 col-md-10">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>
	</div>
	<%
		EmployeeDetailsDao dao = new EmployeeDetailsDao();
		List list12 = dao.getEmployeeList1();
	%>

	<div id="demo_jui">
		<table id="list" class="display" border="1">
			<thead>
				<tr>
					<th>First Name</th>
					<th>Middle Name</th>
					<th>Last Name</th>
					<th>present</th>
					<th>Absent</th>
					<th>HalfDay</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < list12.size(); i++) {
						GetEmployeeDetails sr = (GetEmployeeDetails) list12.get(i);
				%>
				<tr>
					<td class="align" id="name"><%=sr.getFirstName()%></td>
					<td class="align"><%=sr.getMiddleName()%></td>
					<td class="align"><%=sr.getLastName()%></td>
					<td class="align"><input type="button" value="Present" id="<%=sr.getEmpPkId()%>,present" onclick="ok(this)" style="color: blue" ></td>
					<td class="align"><input type="button" value="Apsent"id="<%=sr.getEmpPkId()%>,absent"onclick="ok(this)" style="color: blue"></td>
					<td class="align"><input type="button" value="HalfDay"id="<%=sr.getEmpPkId()%>,halfday" onclick="ok(this)"style="color: blue"></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>

		<div class="wrapper" align="center" style="margin-top: 5%;">
			<input type="button" value="Back" id="listBtn"
				class="btn btn-primary"
				style="border-radius: 10px; padding: 10px; margin-bottom: 4%;"
				onclick="Back()" />
		</div>
	</div>

</body>
</html>
