<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>재고현황(상세정보)</title>
    <link rel="stylesheet" href="/tkheat/css/management/productInsert.css">
    <link rel="stylesheet" href="/tkheat/css/tabBar/tabBar.css">
<%@include file="../include/pluginpage.jsp" %> 
    <style>
    
.main{
	width:98%;
}
.container {
	display: flex;
	justify-content: space-between;
}
.tabulator {
	width: 100%;
	max-width: 100%;
	max-height: 900px;
	overflow-x: hidden !important;  
}
        
.tabulator .tabulator-cell {
	white-space: normal !important;
	word-break: break-word; 
	text-align: center;
}
        
.row_select{
	background-color:#9ABCEA !important;
}
.box1 {
	display: flex;
	justify-content: right;
	align-items: center;
	width: 1500px;
	margin-left: -1050px;
}

.box1 select{
	width: 5%
}  
.box1 input[type="date"] {
	width: 150px;
	padding: 5px 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 6px;
	background-color: #f9f9f9;
	color: #333;
	outline: none;
	transition: border 0.3s ease;
}

.box1 input[type="date"]:focus {
	border: 1px solid #007bff;
	background-color: #fff;
}  
.box1 label,
.box1 input {
	margin-right: 10px; /* 요소 사이 간격 */
}  
    
    </style>
    
    
    <body>
    
    <div class="tab">
    <div class="box1">
         <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
        
        
		<label class="daylabel">일자 : </label>
		<input type="date" class="sdate" id="sdate" style="font-size: 16px;" autocomplete="off"> ~ 
		<input type="date" class="edate" id="edate" style="font-size: 16px;" autocomplete="off">
		
			
	</div>
    
    <div class="button-container">
        <button class="select-button" onclick="getJaegoStatusList();">
            <img src="/tkheat/css/image/search-icon.png" alt="select" class="button-image">
           
        </button>
        <button class="insert-button" style="pointer-events: none; opacity: 0.5; cursor: not-allowed; filter: grayscale(100%); ">
            <img src="/tkheat/css/image/insert-icon.png" alt="insert" class="button-image">
          
        </button>
        <button class="excel-button">
            <img src="/tkheat/css/image/excel-icon.png" alt="excel" class="button-image">
            
        </button>
        <button class="printer-button">
            <img src="/tkheat/css/image/printer-icon.png" alt="printer" class="button-image">
            
        </button>
    </div>
</div>
    <main class="main">
		<div class="container">
			<div id="tab1" class="tabulator"></div>
		</div>
	</main>
	    
	    
<script>
	//전역변수
    var cutumTable;	

	//로드
	$(function(){
		var tdate = todayDate();
		var ydate = yesterDate();
		
		$("#sdate").val(ydate);
		$("#edate").val(tdate);
		getJaegoStatusList();
	});

	//이벤트
	//함수
	function getJaegoStatusList(){
		
		userTable = new Tabulator("#tab1", {
		    height:"750px",
		    layout:"fitColumns",
		    selectable:true,	//로우 선택설정
		    tooltips:true,
		    selectableRangeMode:"click",
		    reactiveData:true,
		    headerHozAlign:"center",
		    ajaxConfig:"POST",
		    ajaxLoader:false,
		    ajaxURL:"/tkheat/product/jaegoStatus/getJaegoStatusList",
		    ajaxProgressiveLoad:"scroll",
		    ajaxParams:{
		    	"sdate": $("#sdate").val(),
		    	"edate": $("#edate").val(),
			    },
     	    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
		    ajaxResponse:function(url, params, response){
				$("#tab1 .tabulator-col.tabulator-sortable").css("height","55px");
		        return response; //return the response data to tabulator
		    },
		    columns:[
		        {title:"NO", field:"idx", sorter:"int", width:50,
		        	hozAlign:"center"},
		        {title:"수주NO", field:"ord_code", sorter:"string", width:120,
			        hozAlign:"center", headerFilter:"input"},	
			    {title:"입고일", field:"ord_date", sorter:"string", width:120,
				    hozAlign:"center", headerFilter:"input"},     
				{title:"거래처", field:"corp_name", sorter:"string", width:150,
				    hozAlign:"center", headerFilter:"input"}, 
				{title:"품명", field:"prod_name", sorter:"string", width:200,
				    hozAlign:"center", headerFilter:"input"}, 
		        {title:"품번", field:"prod_no", sorter:"string", width:150,
		        	hozAlign:"center", headerFilter:"input"},		        
		        {title:"재질", field:"prod_jai", sorter:"string", width:140,
		        	hozAlign:"center", headerFilter:"input"},
		        {title:"규격", field:"prod_gyu", sorter:"string", width:200,
		        	hozAlign:"center", headerFilter:"input"},
		        {title:"공정", field:"tech_te", sorter:"string", width:100,
			        hozAlign:"center", headerFilter:"input"},	
		        {title:"입고/타각LOT", field:"ord_lot", sorter:"int", width:100,
		        	hozAlign:"center", headerFilter:"input"},  	
		        {title:"단가", field:"ord_dang", sorter:"int", width:100,
			        hozAlign:"center", headerFilter:"input"},	
			    {title:"단중", field:"ord_danj", sorter:"int", width:100,
				    hozAlign:"center", headerFilter:"input"},	
				{title:"입고수", field:"ord_su", sorter:"int", width:100,
				    hozAlign:"center", headerFilter:"input"},
				{title:"입고중량", field:"ord_amnt", sorter:"int", width:100,
					hozAlign:"center", headerFilter:"input"},
			    {title:"재고수", field:"jaigo_su", sorter:"int", width:100,
					hozAlign:"center", headerFilter:"input"},
 			    {title:"재고중량", field:"jaigo_amnt", sorter:"int", width:100,
					hozAlign:"center", headerFilter:"input"},
				{title:"입고비고", field:"ord_bigo", sorter:"int", width:100,
					hozAlign:"center", headerFilter:"input"},
				{title:"입고담당자", field:"ord_name", sorter:"int", width:100,
					hozAlign:"center", headerFilter:"input"},
				{title:"단위", field:"ord_danw", sorter:"int", width:100,
					hozAlign:"center", headerFilter:"input"},
				{title:"금액", field:"och_mon", sorter:"int", width:100,
					hozAlign:"center", headerFilter:"input"},
				{title:"출고비고", field:"och_bigo", sorter:"int", width:100,
					hozAlign:"center", headerFilter:"input"},
				    
		    ],
		    rowFormatter:function(row){
			    var data = row.getData();
			    
			    row.getElement().style.fontWeight = "700";
				row.getElement().style.backgroundColor = "#FFFFFF";
			},
			rowClick:function(e, row){

				$("#tab1 .tabulator-tableHolder > .tabulator-table > .tabulator-row").each(function(index, item){
						
					if($(this).hasClass("row_select")){							
						$(this).removeClass('row_select');
						row.getElement().className += " row_select";
					}else{
						$("#tab1 div.row_select").removeClass("row_select");
						row.getElement().className += " row_select";	
					}
				});

				var rowData = row.getData();
				
			},
		});		
	}
	

    </script>

	</body>
</html>
