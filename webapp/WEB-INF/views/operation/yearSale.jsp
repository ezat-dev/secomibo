<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>년간매출현황</title>
    <link rel="stylesheet" href="/tkheat/css/management/productInsert.css">
    <link rel="stylesheet" href="/tkheat/css/tabBar/tabBar.css">
    <script type="text/javascript" src="https://oss.sheetjs.com/sheetjs/xlsx.full.min.js"></script>
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
    
    
    </style>
    
    
    <body>
    
    <div class="tab">
     <div class="box1">
         <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
        
        
		<label class="daylabel">년도 : </label>
		<input type="date" class="sdate" id="sdate" style="font-size: 16px;" autocomplete="off">
		
			
	</div>
    <div class="button-container">
        <button class="select-button" onclick="getYearSaleList();">
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
		//전체 거래처목록 조회
		getYearSaleList();
	});

	//이벤트
	//함수
	function getYearSaleList(){
		
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
		    ajaxURL:"/tkheat/operation/yearSale/getYearSaleList",
		    ajaxProgressiveLoad:"scroll",
		    ajaxParams:{"sdate": $("#sdate").val(),},
		    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
		    ajaxResponse:function(url, params, response){
				$("#tab1 .tabulator-col.tabulator-sortable").css("height","29px");
		        return response; //return the response data to tabulator
		    },
		    columns:[
		        {title:"NO", field:"idx", sorter:"int", width:80,
		        	hozAlign:"center"},
		        {title:"업체명", field:"corp_name", sorter:"string", width:120,
			        hozAlign:"center"},	
			    {title:"1월", field:"mm1", sorter:"int", width:120,
				    hozAlign:"center"},     
				{title:"2월", field:"mm2", sorter:"int", width:120,
				    hozAlign:"center"}, 
				{title:"3월", field:"mm3", sorter:"int", width:150,
				    hozAlign:"center"}, 
		        {title:"4월", field:"mm4", sorter:"int", width:120,
		        	hozAlign:"center"},		        
		        {title:"5월", field:"mm5", sorter:"int", width:100,
		        	hozAlign:"center"},
		        {title:"6월", field:"mm6", sorter:"int", width:100,
		        	hozAlign:"center"},
		        {title:"7월", field:"mm7", sorter:"int", width:100,
			        hozAlign:"center"},	
		        {title:"8월", field:"mm8", sorter:"int", width:100,
		        	hozAlign:"center"},  	
		        {title:"9월", field:"mm9", sorter:"int", width:100,
			        hozAlign:"center"},	
			    {title:"10월", field:"mm10", sorter:"int", width:100,
				    hozAlign:"center"},	
				{title:"11월", field:"mm11", sorter:"int", width:100,
				    hozAlign:"center"},
				{title:"12월", field:"mm12", sorter:"int", width:100,
					hozAlign:"center"},
			    {title:"합계", field:"och_mon_sum", sorter:"int", width:100,
					hozAlign:"center"},
				    
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
    //엑셀 다운로드
	$(".excel-button").click(function () {
	    const today = new Date().toISOString().slice(0, 10).replace(/-/g, "");
	    const filename = "연간매출현황_" + today + ".xlsx";
	    userTable.download("xlsx", filename, { sheetName: "연간매출현황" });
	});
	

    </script>

	</body>
</html>
