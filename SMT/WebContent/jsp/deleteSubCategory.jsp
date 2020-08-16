<%@page import="com.smt.helper.SubCategoryHelper"%>
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
<script src="/SMT/staticContent/y_js/subcategory.js"></script>
<link rel="stylesheet" type="text/css" href="/SMT/staticContent/css/subcategory.css">
<script type="text/javascript">
	function Back()
	{
		window.location="subCategory.jsp";
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
 .col-lg-2 {
    width: 20%;
    margin-left: 53px;
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
.col-lg-2 {
    width: 20%;
    margin-left: 0;
    margin-right: 49px;
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
    right: 1%;
    z-index: -1;
    opacity: 0.6;
}
.col-lg-2 {
    width: 20%;
    margin-left: 0;
    margin-right: 65px;
}
}
</style>
<body class="vColor">
	<div class="container-fluid">
		<div class="container">
			<div class="subcategory">
				<h2 align="center" class="form-heading"
					style="margin-top: 10px;">Delete Sub Category</h2>
						<div class="col-md-12">
				<hr style="border-top-color: #c1b1b1;">
			</div>
				<div class="tab-content margin-t-13">
					<div id="home" class="tab-pane fade in active">
						<form method="post" name="cat" class="form-horizontal">
							<div class="row">
								<div class="form-group">
									<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4"
										id="addcatgry" style="margin-top: 42;">
										<%
											CategoryHelper catHelper = new CategoryHelper();
											List catList = catHelper.getAllMainCategories();
										%>
										<input list="catId_drop" id="catId"
											onchange="getsubCategory()" style="background: #f0f0f0"
											required>
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

									</div>
								</div>

								<div class="form-group">
									<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4"
										id="addcatgry">
										<select name="subcatId" id="subcatId"
											style="background: #f0f0f0"></select> <label>Sub
											Category</label>
									</div>
								</div>

								<div class="row">
					         	<div class="col-md-6 col-sm-12 col-xs-12 col-xl-4 col-lg-4"
						           	id="addcatgry" align="center">			
										<div class="col-lg-2" style="display: inline-block;">
											<input type="submit" value="Delete" style="width: 124;padding-top: 8px;"
												class="btn btn-danger btn-md button_hw" onclick="deleteSubCatagory()"/>
										</div>
										
										<div class="col-lg-2" style="display: inline-block;">
											<input type="button" value="Back" id="listBtn"
												style="width: 124;padding-top: 8px;" class="btn btn-primary btn-md button_hw"
												onclick="Back()" />
										<!-- <input type="button" value="Back" id="listBtn" class="btn btn-lg btn-primary btn-md button_hw button_margin_right" onclick="Back()" /> -->
										
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