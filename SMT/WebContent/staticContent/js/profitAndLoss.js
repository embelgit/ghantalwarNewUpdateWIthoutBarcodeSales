
function validateProfitAndLoss()
{
	var fisDateExpense = $("#fisDateExpense").val();
	var endDateExpense = $("#endDateExpense").val();
	
	if(fisDateExpense == null || fisDateExpense == "" || fisDateExpense == " " || fisDateExpense == undefined)
	{
		alert("Please Select Start Date");
		return false;
	}else{}
		
	if(endDateExpense == null || endDateExpense == "" || endDateExpense == " " || endDateExpense == undefined)
	{
		alert("Please Select End Date");
		return false;		
	}else{}
	
	allExpensesProfitAndLoss();
	allIncomeProfitAndLoss();
}

/*get taday credit and debit report*/
function allExpensesProfitAndLoss()
{
	var fisDateExpense = $("#fisDateExpense").val();
	var endDateExpense = $("#endDateExpense").val();
	
	var params= {};
	params["fisDateExpense"] = fisDateExpense;
	params["endDateExpense"] = endDateExpense;
	
	params["methodName"] = "allExpensesProfitAndLoss";

	$.post('/SMT/jsp/utility/controller.jsp',params,function(data)
	{
		//To clear Table
		$('#example1').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#example1').DataTable( {

				fnRowCallback : function(nRow, aData, iDisplayIndex){
					$("th:first", nRow).html(iDisplayIndex +1);
					return nRow;
				},

				"footerCallback": function ( row, data, start, end, display ) {
					var api = this.api(), data;

					// Remove the formatting to get integer data for summation
					var intVal = function ( i ) {
						return typeof i === 'string' ?
								i.replace(/[\$,]/g, '')*1 :
									typeof i === 'number' ?
											i : 0;
					};

					// Total over this page
					pageTotal = api
					.column( 1 )
					.data()
					.reduce( function (a, b) {	
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 1 ).footer() ).html(
							'Rs'+' '+parseFloat(pageTotal).toFixed(2)
					);
					console.log( pageTotal);

					var abc = pageTotal;
					
					document.getElementById('totalExpenseAmount').value = abc;
				},

				destroy: true,
				searching: true,				      
				columns: [
				          {"data": "expenseName", "width": "5%" ,"defaultContent": "",},
				          {"data": "expenseAmount", "width": "5%" ,"defaultContent": ""},
				         ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true },
				                     { extend: 'excelHtml5', footer: true },
				                     { extend: 'csvHtml5', footer: true },
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Today's Credit Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );
		var mydata = catmap;
		$('#example1').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}


/*get taday credit and debit report*/
function allIncomeProfitAndLoss()
{
	var fisDateExpense = $("#fisDateExpense").val();
	var endDateExpense = $("#endDateExpense").val();
	
	var params= {};
	params["fisDateExpense"] = fisDateExpense;
	params["endDateExpense"] = endDateExpense;
	
	params["methodName"] = "allIncomeProfitAndLoss";
	
	$.post('/SMT/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear Table
		$('#example2').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$(document).ready(function() {
			$('#example2').DataTable( {

				fnRowCallback : function(nRow, aData, iDisplayIndex){
					$("th:first", nRow).html(iDisplayIndex +1);
					return nRow;
				},

				"footerCallback": function ( row, data, start, end, display ) {
					var api = this.api(), data;

					// Remove the formatting to get integer data for summation
					var intVal = function ( i ) {
						return typeof i === 'string' ?
								i.replace(/[\$,]/g, '')*1 :
									typeof i === 'number' ?
											i : 0;
					};

					// Total over this page
					pageTotal = api
					.column( 1 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 1 ).footer() ).html(
							'Rs'+' '+parseFloat(pageTotal).toFixed(2)
					);
					console.log( pageTotal);
					var xyz = pageTotal;
					document.getElementById('totalIncomeAmount').value = xyz;
				},
				destroy: true,
				searching: true,				      
				columns: [
				          {"data": "incomeName", "width": "5%" ,"defaultContent": ""}, 
				          {"data": "incomeAmount", "width": "5%" ,"defaultContent": ""},
				          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true },
				                     { extend: 'excelHtml5', footer: true },
				                     { extend: 'csvHtml5', footer: true },
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Today's Debit Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );
		var mydata = catmap;
		$('#example2').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});	
}

function totalProfitAndLoss()
{	
	 //gets table
    var oTable = document.getElementById('example1');

    //gets rows of table
    var rowLength = oTable.rows.length;
    alert("rowLength ===> "+rowLength);

    //loops through rows    
    for (i = 0; i < rowLength; i++)
    {
      //gets cells of current row  
       var oCells = oTable.rows.item(i).cells;
       //alert("oCells ===> "+oCells);
       
       //gets amount of cells of current row
       var cellLength = oCells.length;
       //alert("cellLength ===> "+cellLength);
       //loops through each cell in current row
       for(var j = 0; j < cellLength; j++)
       {
              // get your cell info here
              var cellVal = oCells.item(j).innerHTML;
              alert("cellVal ===> "+cellVal);
       }       
    }
	
/*
	var totalExpenseAmount = $("#totalExpenseAmount").val();
	var totalIncomeAmount = $("#totalIncomeAmount").val();
	
	if(totalExpenseAmount > totalIncomeAmount)
	{
		var totalLoss = totalExpenseAmount - totalIncomeAmount;
		document.getElementById('totalLoss').value = totalLoss;
	}
	else if(totalIncomeAmount > totalExpenseAmount)
	{
		var totalProfit = totalExpenseAmount - totalIncomeAmount;
		document.getElementById('totalProfit').value = totalProfit;
	}
*/
}