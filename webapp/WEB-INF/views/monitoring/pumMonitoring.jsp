<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>통합모니터링</title>
    <link rel="stylesheet" href="/tkheat/css/monitoring/monitoring.css">
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
    
    
    </style>
    
    
    <body>
    
    <div class="tab">
    
    <div class="button-container">
        <button class="select-button">
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
        <div class="rectangle-2"></div>
	    <div class="rectangle-12"></div>
	    <div class="rectangle-3"></div>
	    <div class="rectangle-4"></div>
	    <div class="rectangle-6"></div>
	    <div class="rectangle-7"></div>
	    <div class="chim-1-heat"></div>
	    <div class="chim-1-bon"></div>
	    <div class="rectangle-35"></div>
	    <div class="rectangle-36"></div>
	    <div class="rectangle-37"></div>
	    <div class="chim-2-heat"></div>
	    <div class="chim-2-bon"></div>
	    <div class="rectangle-40"></div>
	    <div class="rectangle-41"></div>
	    <div class="rectangle-42"></div>
	    <div class="chim-3-heat"></div>
	    <div class="chim-3-bon"></div>
	    <div class="rectangle-45"></div>
	    <div class="rectangle-46"></div>
	    <div class="rectangle-47"></div>
	    <div class="chim-4-heat"></div>
	    <div class="chim-4-bon"></div>
	    <div class="rectangle-50"></div>
	    <div class="rectangle-51"></div>
	    <div class="rectangle-52"></div>
	    <div class="chim-5-heat"></div>
	    <div class="chim-5-bon"></div>
	    <div class="rectangle-55"></div>
	    <div class="rectangle-56"></div>
	    <div class="rectangle-57"></div>
	    <div class="rectangle-59"></div>
	    <div class="rectangle-8"></div>
	    <div class="rectangle-9"></div>
	    <div class="rectangle-10"></div>
	    <div class="rectangle-11"></div>
	    <div class="rectangle-13"></div>
	    <div class="rectangle-14"></div>
	    <div class="rectangle-15"></div>
	    <div class="rectangle-16"></div>
	    <div class="rectangle-17"></div>
	    <div class="rectangle-58"></div>
	    <div class="chim-1-cutum"></div>
	    <div class="chim-1-pum"></div>
	    <div class="chim-1-lot"></div>
	    <div class="chim-2-cutum"></div>
	    <div class="chim-2-pum"></div>
	    <div class="chim-2-lot"></div>
	    <div class="chim-3-cutum"></div>
	    <div class="chim-3-pum"></div>
	    <div class="chim-3-lot"></div>
	    <div class="chim-4-cutum"></div>
	    <div class="chim-4-pum"></div>
	    <div class="chim-4-lot"></div>
	    <div class="chim-5-cutum"></div>
	    <div class="chim-5-pum"></div>
	    <div class="chim-5-lot"></div>
	    <div class="chim-tem-cutum"></div>
	    <div class="chim-tem-pum"></div>
	    <div class="chim-tem-lot"></div>
	    <div class="div">설 비 명</div>
	    <div class="_1">침탄 1호기</div>
	    <div class="_2">침탄 2호기</div>
	    <div class="_3">침탄 3호기</div>
	    <div class="_4">침탄 4호기</div>
	    <div class="_5">침탄 5호기</div>
	    <div class="div2">템 퍼 링</div>
	    <div class="div3">고 객 사</div>
	    <div class="div4">품 명</div>
	    <div class="lot-no">LOT NO</div>
	    <div class="div5">공정 현황</div>
	    <div class="div6">승온</div>
	    <div class="div7">강온</div>
	    <div class="div8">냉각</div>
	    <div class="div9">공로</div>
	    <div class="div10">본처리</div>
		<div class="container">
			<!-- <div id="tab1" class="tabulator"></div> -->
		
		</div>
	</main>
	    
	    
<script>
	//전역변수
    var cutumTable;	

	//로드
	$(function(){
		//전체 거래처목록 조회
		getCutumList();
	});

	//이벤트
	//함수
	function getCutumList(){
		
		userTable = new Tabulator("#tab1", {
		    height:"750px",
		    layout:"fitColumns",
		    selectable:true,	//로우 선택설정
		    tooltips:true,
		    selectableRangeMode:"click",
		    reactiveData:true,
		    headerHozAlign:"center",
		    /*		    ajaxConfig:"POST",
		    ajaxLoader:false,
		    ajaxURL:"/tkheat/management/authority/productList",
		    ajaxProgressiveLoad:"scroll",
		    ajaxParams:{},
*/		    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
		    ajaxResponse:function(url, params, response){
				$("#tab1 .tabulator-col.tabulator-sortable").css("height","29px");
		        return response; //return the response data to tabulator
		    },
		    columns:[
		        {title:"NO", field:"idx", sorter:"int", width:80,
		        	hozAlign:"center"},
		        {title:"코드", field:"prod_code", sorter:"string", width:120,
			        hozAlign:"center"},	
			    {title:"등록일", field:"prod_date", sorter:"string", width:120,
				    hozAlign:"center"},     
				{title:"거래처명", field:"corp_name", sorter:"string", width:120,
				    hozAlign:"center"}, 
				{title:"품명", field:"prod_name", sorter:"string", width:150,
				    hozAlign:"center"}, 
		        {title:"품번", field:"prod_no", sorter:"string", width:120,
		        	hozAlign:"center"},		        
		        {title:"규격", field:"prod_gyu", sorter:"string", width:100,
		        	hozAlign:"center"},
		        {title:"재질", field:"prod_jai", sorter:"string", width:100,
		        	hozAlign:"center"},
		        {title:"공정", field:"tech_te", sorter:"string", width:100,
			        hozAlign:"center"},	
		        {title:"단중", field:"prod_danj", sorter:"int", width:100,
		        	hozAlign:"center"},  	
		        {title:"단위", field:"prod_danw", sorter:"int", width:100,
			        hozAlign:"center"},	
			    {title:"단가(EA)", field:"prod_danw", sorter:"int", width:100,
				    hozAlign:"center"},	
				{title:"단가(kG)", field:"prod_danw", sorter:"int", width:100,
				    hozAlign:"center"},
				{title:"표면경도", field:"prod_danw", sorter:"int", width:100,
					hozAlign:"center"},
			    {title:"경화깊이", field:"prod_danw", sorter:"int", width:100,
					hozAlign:"center"},
 			    {title:"심부경도", field:"prod_danw", sorter:"int", width:100,
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
	

    </script>

	</body>
</html>
