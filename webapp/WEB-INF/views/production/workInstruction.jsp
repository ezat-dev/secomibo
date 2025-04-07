<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>거래처등록</title>
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
	margin-left: -620px;
}

.box1 input{
	width : 5%;
}
.box1 select{
	width: 5%
}  
    
    
    </style>
    
    
    <body>
    
    <div class="tab">
    <div class="box1">
         <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
        
        
		<label class="daylabel">지시일 :</label>
		<input type="date" class="plnp_date" id="plnp_date" style="font-size: 16px;" autocomplete="off">
			
		<label class="daylabel">거래처명 :</label>
		<input type="text" class="corp_name" id="corp_name" style="font-size: 16px;" autocomplete="off">
			
		<label class="daylabel">품명 :</label>
		<input type="text" class="prod_name" id="prod_name" style="font-size: 16px;" autocomplete="off">
			
		<label class="daylabel">품번 :</label>
		<input type="text" class="prod_no" id="prod_no" style="font-size: 16px; autocomplete="off">
		
		<label class="daylabel">제품구분 :</label>
		<input type="text" class="prod_gubn" id="prod_gubn" style="font-size: 16px; autocomplete="off">
		
		<label class="daylabel">설비선택 :</label>
		<input type="text" class="fac_name" id="fac_name" style="font-size: 16px; autocomplete="off">
			
	</div>
    <div class="button-container">
        <button class="select-button" onclick="getWorkInstructionList();">
            <img src="/tkheat/css/image/search-icon.png" alt="select" class="button-image">
           
        </button>
        <button class="insert-button">
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
		getWorkInstructionList();
	});

	//이벤트
	//함수
	function getWorkInstructionList(){
		
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
		    ajaxURL:"/tkheat/production/workInstruction/getWorkInstructionList",
		    ajaxProgressiveLoad:"scroll",
		    ajaxParams:{
		    	"plnp_date": $("#plnp_date").val(),
                "corp_name": $("#corp_name").val(),
                "prod_name": $("#prod_name").val(),
                "prod_no": $("#prod_no").val(),
                "prod_gubn": $("#prod_gubn").val(),
                "fac_name": $("#fac_name").val(),
			    },
		    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
		    ajaxResponse:function(url, params, response){
				$("#tab1 .tabulator-col.tabulator-sortable").css("height","55px");
		        return response; //return the response data to tabulator
		    },
		    columns:[
		        {title:"NO", field:"plnp_no", sorter:"int", width:80,
		        	hozAlign:"center", visible:false},
		        {title:"지시일", field:"plnp_date", sorter:"string", width:120,
			        hozAlign:"center"},	
			    {title:"제품사진", field:"prod_date", sorter:"string", width:120,
				    hozAlign:"center"},     
				{title:"설비", field:"fac_name", sorter:"string", width:120,
				    hozAlign:"center", headerFilter:"input"}, 
				{title:"순번", field:"plnp_seq", sorter:"string", width:150,
				    hozAlign:"center", headerFilter:"input"}, 
		        {title:"거래처", field:"corp_name", sorter:"string", width:120,
		        	hozAlign:"center", headerFilter:"input"},		        
		        {title:"품명", field:"prod_name", sorter:"string", width:100,
		        	hozAlign:"center", headerFilter:"input"},
		        {title:"품번", field:"prod_no", sorter:"string", width:100,
		        	hozAlign:"center", headerFilter:"input"},
		        {title:"규격", field:"prod_gyu", sorter:"string", width:100,
			        hozAlign:"center", headerFilter:"input"},	
		        {title:"재질", field:"prod_jai", sorter:"int", width:100,
		        	hozAlign:"center", headerFilter:"input"},  	
		        {title:"수량", field:"plnp_dsu", sorter:"int", width:100,
			        hozAlign:"center", headerFilter:"input"},	
			    {title:"온도(침탄)", field:"plnp_tmp1", sorter:"int", width:100,
				    hozAlign:"center", visible:false, headerFilter:"input"},	
				{title:"시간(침탄)", field:"plnp_time1", sorter:"int", width:100,
				    hozAlign:"center", visible:false, headerFilter:"input"},
				{title:"온도(확산)", field:"plnp_tmp2", sorter:"int", width:100,
					hozAlign:"center", visible:false, headerFilter:"input"},
			    {title:"시간(확산)", field:"plnp_time2", sorter:"int", width:100,
					hozAlign:"center", visible:false, headerFilter:"input"},
 			    {title:"소려온도", field:"plnp_ttmp", sorter:"int", width:100,
					hozAlign:"center", visible:false, headerFilter:"input"},
 			    {title:"소려시간", field:"plnp_ttime", sorter:"int", width:100,
					hozAlign:"center", visible:false, headerFilter:"input"},
		        {title:"비고", field:"plnp_note", sorter:"int", width:100,
			        hozAlign:"center", headerFilter:"input"},	
		        {title:"경화깊이", field:"prod_cd", sorter:"int", width:100,
			        hozAlign:"center", headerFilter:"input"},	
		        {title:"표면경도", field:"prod_pg", sorter:"int", width:100,
			        hozAlign:"center", headerFilter:"input"},	
		        {title:"심부경도", field:"prod_sg", sorter:"int", width:100,
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
