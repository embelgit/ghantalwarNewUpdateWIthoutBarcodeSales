<%@page import="java.util.List"%>
<%@page import="com.smt.helper.CategoryHelper"%>
<%@page import="com.smt.hibernate.Category"%>
<%
	boolean isHome = false;
%>
<%@include file="y_commons/header1.jsp"%>
<script src="/SMT/staticContent/y_js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="/SMT/staticContent/y_js/bootstrap.min.js"></script>
<script type="text/javascript" src="/SMT/staticContent/y_js/bootbox.min.js"></script>
<link href="/SMT/staticContent/y_js/bootstrap-select.min.css" />
<script src="/SMT/staticContent/y_css/1.11.4-jquery-ui.min.css">
<script src="/SMT/staticContent/y_js/jquery-1.12.3.min.js"></script>
<script src="/SMT/staticContent/y_js/1.12.4-jquery.min.js"></script>
<script src="/SMT/staticContent/y_js/jquery.jqgrid.min.js"></script>
<link href="/SMT/staticContent/y_css/adi.css" rel="stylesheet" />
<link href="/SMT/staticContent/y_css/4.13.3-ui.jqgrid.min.css" />
<script src="/SMT/staticContent/y_js/uppercase.js"></script>
<script src="/SMT/staticContent/y_js/category.js"></script>
<link rel="stylesheet" type="text/css"
	href="/SMT/staticContent/css/addCategory.css">

<script type="text/javascript">

function backToAddCat()
{
	window.location="y_category_subcategory.jsp";
}

   		function isEmplty()
   		{
			var categoryName= $('#reNameCat').val();
			var categoryName1= $('#catId').val();
	    	var patt = /^[a-zA-Z ]+$/;
	    	var t = patt.test(categoryName);
	    	if(categoryName1 != null && categoryName1 != "" && categoryName1 != " ")
    		{	
	    	if(categoryName != null && categoryName != "" && categoryName != " ")
	    		{
	    		 if(categoryName.match(patt))
		    	 {
	    			 ChooseContact();
	    		 }
	    		 else
	    		 {
	    			 myAlert("Enter only Alphabets.");
	    			 //document.getElementById("eoalfa").style.display = "initial";
	    		 }
	    		}
	    	else
	    	{
	    		myAlert("Please Enter ReName Category name");
	    	}
   		}
	    	else
	    	{
	    		myAlert("Please Select Category name");
	    	}
   		}
   		
	    function ChooseContact(){
	        <%CategoryHelper catReName = new CategoryHelper();
			List catName = catReName.getAllMainCategories();%>
			var categoryName= $('#reNameCat').val();
			var UpCaseCategoryName= categoryName.toUpperCase();
			<%for (int i = 0; i < catName.size(); i++) {
				Category categName = (Category) catName.get(i);%>
    		    var value ="<%=categName.getCategoryName()%>";
		var UpValue = value.toUpperCase();
		if (UpCaseCategoryName == UpValue) {
			document.getElementById("btn").disabled = true;
			myAlert("Category Name Already Exist..!!!");
			location.reload();
			return false;
		}
<%}%>
	reNamecategory();
	}
</script>
<body class="vColor">
	<div class="container-fluid">
		<div class="row" id="billheading" style="padding-top: 38px;">
			<div class="form-group">
				<div class="col-md-3 control-label">
					
				</div>
			</div>
		</div>
		<div class="container">
			<div class="box">
				<h2>Edit Category</h2>
	<div class="col-md-12">
				<hr style="border-top-color: #c1b1b1;">
			</div>
				<div class="tab-content margin-t-13">
					<div id="home" class="tab-pane fade in active">
						<form action="cate" method="post" name="cat"
							class="form-horizontal">
							<div class="row">
								<div class="form-group">
									<div class="container">
										<div class="row">
											<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4"
												id="addcatgry" style="margin-top: 42;">
												<%
													CategoryHelper catHelper = new CategoryHelper();
													List catList = catHelper.getAllActiveCategoriesShopWise(request, response);
												%>
												<!-- <div class="input-group"> -->
												<input list="catId_drop" id="catId"
													style="background-color: f0f0f0;" required>
												<datalist id="catId_drop">
													<%
														for (int i = 0; i < catList.size(); i++) {
															Category cat = (Category) catList.get(i);
													%>
													<option data-value="<%=cat.getPkCategoryId()%>"
														value="<%=cat.getCategoryName()%>">
														<%
															}
														%>
													
												</datalist>
												<span>Category</span>
												<!-- </div> -->
											</div>


											<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4"
												style="margin-top: 0;" id="addcatgry">
												<!-- <div class="input-group"> -->
												<input list="catId_drop" name="reNameCat" id="reNameCat"
													style="background-color: f0f0f0;" required>
												<datalist id="catId_drop">
													<%
														for (int i = 0; i < catList.size(); i++) {
															Category cat = (Category) catList.get(i);
													%>
													<option data-value="<%=cat.getPkCategoryId()%>"
														value="<%=cat.getCategoryName()%>">
														<%
															}
														%>
													
												</datalist>
												<span>Rename Category</span>
												<p style="font-size: 15; color: #ff8000; margin-top: -26px;">*Enter
													Alphabets only.</p>
												<!-- </div> -->

											</div>
										</div>
										<div class="row buttons_margin_top col-md-offset-2"
											align="center">

											<div class="col-lg-2" style="display: inline-block;">
												<input type="button" name="btn" id="btn" style="width: 124;"
													onclick="isEmplty();" value="Save"
													class="btn btn-success btn-large button_hw" />
											</div>
											<div class="col-lg-2" style="display: inline-block;">
												<input type="reset" value="Cancel" style="width: 124;"
													class="btn btn-danger btn-large button_hw" />
											</div>
											<div class="col-lg-2" style="display: inline-block;">
												<input type="button" value="Back" id="listBtn"
													style="width: 124;"
													class="btn btn-primary btn-large button_hw button_margin_right"
													onclick="backToAddCat()" />
											</div>

										</div>
									</div>
								</div>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="row footer_margin_top" align="center">
			<%@include file="y_commons/footer.jsp"%>
		</div>
	</div>
</body>
</html>
</body>
</html>