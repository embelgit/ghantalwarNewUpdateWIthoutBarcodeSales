<%@page import="com.smt.hibernate.ExpenditureTypeBeanH"%>
<%@page import="java.util.List"%>
<%@page import="com.smt.hibernate.ExpenditureDetailsBean"%>
<%@page import="com.smt.dao.ExpenditureDetailsDao"%>
<%boolean isHome = false;
%>
<%@include file="y_commons/header1.jsp"%>
<head>
<meta charset="utf-8">
<script type="text/javascript" src="/SMT/staticContent/y_js/bootstrap.min.js"></script>
<script type="text/javascript" src="/SMT/staticContent/y_js/bootbox.min.js"></script>
<script type="text/javascript" src="/SMT/staticContent/js/expenditureDetails.js"></script>
<link rel="stylesheet" type="text/css" href="/SMT/staticContent/css/expenditure.css">	
	
<script type="text/javascript">	
		function cheakForExpenditureType()
		{
			<%
				ExpenditureDetailsDao expT = new ExpenditureDetailsDao();
				List cList1 = expT.getAllExpenseType();
			%>
			var expenditureType = $('#expTypeName').val();
    		var upExpenditureType = expenditureType.toUpperCase();
    		var duplicate;
			<%
			for(int i=0;i< cList1.size();i++)
			{
				ExpenditureTypeBeanH expTh = (ExpenditureTypeBeanH)cList1.get(i);
			%>
			var dbExpdName = "<%=expTh.getExpenseTypeName()%>";
			var UpDbExpdName = dbExpdName.toUpperCase();
			if(upExpenditureType == UpDbExpdName)
			{
					duplicate = "found";
			}
			<%
			}
			%>
			if(duplicate == "found"){
    			document.expenseDetails.btn.disabled = true;	
				alert("Expenditure Type Name Already Exist..!!!");
				location.reload();
				return false;
    		}
		}
	</script>
	
	
<script type="text/javascript">
	function getAllExpenditure()
	{	
		window.location = "expenditureList.jsp";
	}
</script>	
	<style>
	.col-md-2 {
    margin-left: 40px;
}
	@media only screen and (max-width: 991px) {
.col-md-2 {
    margin-left: 58px;
    margin-right: -86px;
}
}
	@media only screen and (max-width: 767px) {
.col-md-2 {
    margin-left: 58px;
    margin-right: -86px;
}
}
	</style>
</head>
<body class="vColor">
 <div class="expenditure">
	
<h2>Expenditure Type</h2>

<div class="row">
	<div class="col-sm-offset-1 col-md-10">
		<hr style="border-top-color: #c1b1b1;">
	</div>
</div>
<!-- <div class="expenditure"> -->
<form class="" method="post" action="" name="expenseDetails">
<div class="container">
	
		<!-- Value of 'name' attribute is used in customerDetails.js  -->
		
			<div class="row">
			
<!-- 			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-xl-2"></div> -->
			<!-- <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 col-xl-1"></div> -->
				<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4" id="expenditurecol" style="margin-top: 42px;">
						
						<%
							ExpenditureDetailsDao cdd = new ExpenditureDetailsDao();
           					List cList =cdd.getAllExpenseType();
						%>
						<input list="expType_drop" id="expTypeName" class="" onchange="cheakForExpenditureType()" required>
						<datalist id="expType_drop">
							<%
					           for(int i=0;i<cList.size();i++)
					           {
					        	   ExpenditureTypeBeanH cat=(ExpenditureTypeBeanH)cList.get(i);
							%>
							<option data-value="<%=cat.getPk_expenseType_Id()%>"
								value="<%=cat.getExpenseTypeName()%>">
								<%
				      			}
				    		%>
							
						</datalist>
						<!-- <span>Expenditure Type</span> -->
						<span>Expenditure Type <sup style="color: red">*</sup></span>
						</div>
			</div>
			
			<div class="expenditurebutton ">
			<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-12 col-sm-offset-1">
				<div class="col-md-2" style="display: inline-block;">
					<input type="button" id="save" name="btn" class="btn btn-large btn-success" onclick="addExpenseType()" value="Submit" style="width:124px;padding-bottom: 10px;">
				</div>	
				<div class="col-md-2" style="display: inline-block;">
					<input id="save" name="btn" class="btn btn-large btn-danger" type="reset" onclick="reset()" value="Cancel" style="width:124px;padding-bottom: 10px;">
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
</body>