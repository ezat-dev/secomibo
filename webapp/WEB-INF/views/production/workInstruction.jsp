<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>작업지시</title>
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

.workSetModal {
	position: fixed; /* 화면에 고정 */
	top: 50%; /* 수직 중앙 */
	left: 22%; /* 수평 중앙 */
	display: none;
	transform: translate(-50%, -50%); /* 정확한 중앙 정렬 */
	z-index: 20010; /* 다른 요소 위에 표시 */
	border:2px solid black;
	background-color:white;
}

.workWaitModal {
	position: fixed; /* 화면에 고정 */
	top: 50%; /* 수직 중앙 */
	left: 70%; /* 수평 중앙 */
	display: none;
	transform: translate(-50%, -50%); /* 정확한 중앙 정렬 */
	z-index: 20010; /* 다른 요소 위에 표시 */
	border:2px solid black;
	background-color:white;
}

.header {
	display: flex; /* 플렉스 박스 사용 */
	justify-content: center; /* 중앙 정렬 */
	align-items: center; /* 수직 중앙 정렬 */
	margin-bottom: 10px; /* 상단 여백 */
	background-color: #33363d; /* 배경색 */
	height: 50px; /* 높이 */
	color: white; /* 글자색 */
	font-size: 20px; /* 글자 크기 */
	text-align: center; /* 텍스트 정렬 */
}

.btnSaveClose button {
	background: #007bff; /* 버튼 배경색 */
	color: white; /* 버튼 글자색 */
	border: none; /* 경계선 없음 */
	padding: 8px 15px; /* 내부 여백 */
	cursor: pointer; /* 커서 변경 */
	border-radius: 3px; /* 모서리 둥글게 */
	margin: 0 10px; /* 버튼 간격 */
	margin-top: 10px;
	align-items: center; /* 수직 중앙 정렬 */
}

.btnSaveClose button:hover {
	background: #0056b3; /* 호버 시 색상 변경 */
}

.tabulator-header > .tabulator-headers > .tabulator-col{
	height:55px !important;
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
		<input type="text" class="prod_no" id="prod_no" style="font-size: 16px;" autocomplete="off">
		
		<label class="daylabel">제품구분 :</label>
		<input type="text" class="prod_gubn" id="prod_gubn" style="font-size: 16px;" autocomplete="off">
		
		<label class="daylabel">설비선택 :</label>
		<input type="text" class="fac_name" id="fac_name" style="font-size: 16px;" autocomplete="off">
			
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
	    
<!-- 다이얼로그 -->
<!-- 작업지시 모달 -->
<div class="workSetModal">    
	<div class="detail">
		<div class="header">
		작업지시
		</div>
		<div class="row">
			<label class="daylabel">지시일 :</label>
			<input type="date" class="plnp_date" id="s_plnp_date" style="font-size: 16px;" autocomplete="off">
			<select id="s_fac_code">
				<option value="1">침탄로 1호기</option>
				<option value="2">침탄로 2호기</option>
				<option value="3">침탄로 3호기</option>
				<option value="4">침탄로 4호기</option>
				<option value="18">침탄로 5호기</option>
			</select>
			<button type="button" onclick="workWaitSearch();">지시대기 조회</button>
		</div>
		<div id="workSetTabu"></div>
	</div>
	
    <div class="btnSaveClose">
            <button class="save" type="button" onclick="workSetSave();">저장</button>
            <button class="workSetClose" type="button" onclick="window.close();">닫기</button>
    </div>	
</div>

<!-- 지시대기검색 모달 -->
<div class="workWaitModal">    
	<div class="detail">
		<div class="header">
		지시대기검색
		</div>
		<div id="workWaitTabu"></div>
	</div>
	
    <div class="btnSaveClose">
<!--        <button class="save" type="button" onclick="save();">저장</button> -->
            <button class="workWaitClose" type="button" onclick="window.close();">닫기</button>
    </div>	
</div>

<script>
	//전역변수
    var cutumTable;	

	//로드
	$(function(){
		//전체 거래처목록 조회
		getWorkInstructionList();
		$("#s_plnp_date").val("2025-04-11");
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
	
	var workSetData = new Array();
	var workSetTable;
	function getWorkSetList(){
		
		workSetTable = new Tabulator("#workSetTabu", {
		    height:"750px",
		    layout:"fitColumns",
		    selectable:true,	//로우 선택설정
		    tooltips:true,
		    selectableRangeMode:"click",
		    reactiveData:true,
		    headerHozAlign:"center",
		    placeholder:"조회된 데이터가 없습니다.",
		    headerSort:false,
		    paginationSize:20,
		    /*data:workSetData,*/
		    columns:[
		        {title:"no", field:"no", sorter:"string", width:60,
		        	hozAlign:"center", visible:false},
		        {title:"삭제", field:"del_btn", sorter:"string", width:60,
			        hozAlign:"center"},	
		        {title:"순번", field:"plnp_seq", sorter:"string", width:60,
			        hozAlign:"center"},	
			    {title:"입고일", field:"ord_date", sorter:"string", width:90,
				    hozAlign:"center"},
		        {title:"업체명", field:"corp_name", sorter:"string", width:120,
		        	hozAlign:"center"},		        
		        {title:"품명", field:"prod_name", sorter:"string", width:100,
		        	hozAlign:"center"},
		        {title:"품번", field:"prod_no", sorter:"string", width:100,
		        	hozAlign:"center"},
		        {title:"규격", field:"prod_gyu", sorter:"string", width:50,
			        hozAlign:"center"},	
		        {title:"요구경도", field:"prod_pg", sorter:"string", width:50,
		        	hozAlign:"center"},  	
		        {title:"경화층깊이", field:"prod_gd1", sorter:"string", width:100,
			        hozAlign:"center"},	
			    {title:"수량", field:"prod_dsu", sorter:"string", width:100,
				    hozAlign:"center"},	
			    {title:"시작", field:"prod_strt", sorter:"string", width:100,
				    hozAlign:"center"},	
			    {title:"종료", field:"prod_end", sorter:"string", width:100,
				    hozAlign:"center"},	
			    {title:"송장번호", field:"plnp_bno", sorter:"string", width:100,
				    hozAlign:"center"},	
			    {title:"특기사항", field:"plnp_note", sorter:"string", width:100,
				    hozAlign:"center"},	
				{title:"prod_code", field:"prod_code", sorter:"string", width:80,
					hozAlign:"center", visible:false},				    
				{title:"corp_code", field:"corp_code", sorter:"string", width:80,
					hozAlign:"center", visible:false},	
				{title:"plnp_tmp1", field:"plnp_tmp1", sorter:"string", width:80,
					hozAlign:"center", visible:false},	
				{title:"plnp_tmp2", field:"plnp_tmp2", sorter:"string", width:80,
					hozAlign:"center", visible:false},	
				{title:"plnp_time1", field:"plnp_time1", sorter:"string", width:80,
					hozAlign:"center", visible:false},	
				{title:"plnp_time2", field:"plnp_time2", sorter:"string", width:80,
					hozAlign:"center", visible:false},	
				{title:"plnp_ttmp", field:"plnp_ttmp", sorter:"string", width:80,
					hozAlign:"center", visible:false},	
				{title:"plnp_ttime", field:"plnp_ttime", sorter:"string", width:80,
					hozAlign:"center", visible:false},	
		    ],
		    rowFormatter:function(row){
			    var data = row.getData();
			    
			    row.getElement().style.fontWeight = "700";
				row.getElement().style.backgroundColor = "#FFFFFF";
			},
			rowClick:function(e, row){

				$("#workSetTabu .tabulator-tableHolder > .tabulator-table > .tabulator-row").each(function(index, item){
						
					if($(this).hasClass("row_select")){							
						$(this).removeClass('row_select');
						row.getElement().className += " row_select";
					}else{
						$("#workSetTabu div.row_select").removeClass("row_select");
						row.getElement().className += " row_select";	
					}
				});

				var rowData = row.getData();
				
			},
			rowDblClick:function(e, row){

				var rowData = row.getData();
				
			},
		});		
	}
	
//	var workWaitTable;
/*
	function getWorkWaitListData(){
		$.ajax({
			url:"/tkheat/production/workInstruction/getWorkWaitList",
			type:"post",
			dataType:"json",
			data:{
		    	"sdate":"2025-04-01",
		    	"edate":"2025-04-10",
		    	"plnp_date": $("#plnp_date").val(),
                "corp_name": $("#corp_name").val(),
                "prod_name": $("#prod_name").val(),
                "prod_no": $("#prod_no").val(),
                "prod_gubn": $("#prod_gubn").val(),
                "fac_name": $("#fac_name").val(),				
			},
			success:function(result){
				workWaitTable.setData(result.data);
			}
		});
	}
*/
	var workWaitData;
	var workWaitTable;
	
	function getWorkWaitList(){
		
		workWaitTable = new Tabulator("#workWaitTabu", {
		    height:"750px",
		    layout:"fitColumns",
		    selectable:true,	//로우 선택설정
		    tooltips:true,
		    selectableRangeMode:"click",
		    reactiveData:true,
		    headerHozAlign:"center",
		    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
			ajaxConfig:"POST",
		    ajaxLoader:false,
		    ajaxURL:"/tkheat/production/workInstruction/getWorkWaitList",
		    ajaxProgressiveLoad:"scroll",
		    ajaxParams:{
		    	"sdate":"2025-04-01",
		    	"edate":"2025-04-10",
		    	"plnp_date": $("#plnp_date").val(),
                "corp_name": $("#corp_name").val(),
                "prod_name": $("#prod_name").val(),
                "prod_no": $("#prod_no").val(),
                "prod_gubn": $("#prod_gubn").val(),
                "fac_name": $("#fac_name").val(),	
			},	    
		    ajaxResponse:function(url, params, response){
		    	$("#workWaitTabu .tabulator-col.tabulator-sortable").css("height","55px");
		        return response; //return the response data to tabulator
		    },
		    columns:[
		        {title:"id", field:"id", sorter:"int", width:60, hozAlign:"center", visible:false},
		        {title:"NO", field:"prod_code", sorter:"int", width:80, hozAlign:"center", visible:false},
		        {title:"수주NO", field:"ord_code", sorter:"string", width:100, hozAlign:"center"},	
			    {title:"입고일", field:"ord_date", sorter:"string", width:100, hozAlign:"center"},
		        {title:"거래처", field:"corp_name", sorter:"string", width:120, hozAlign:"center", headerFilter:"input"},		        
		        {title:"품명", field:"prod_name", sorter:"string", width:100, hozAlign:"center", headerFilter:"input"},
		        {title:"품번", field:"prod_no", sorter:"string", width:100, hozAlign:"center", headerFilter:"input"},
		        {title:"ORD_LOT", field:"ord_lot", sorter:"string", width:100, hozAlign:"center", headerFilter:"input"},	
		        {title:"잔량", field:"work_su", sorter:"int", width:80, hozAlign:"center", headerFilter:"input"},  	
		        {title:"표면경도", field:"prod_pg", sorter:"int", width:100, hozAlign:"center", headerFilter:"input"},	
			    {title:"경화깊이", field:"prod_cd", sorter:"int", width:100, hozAlign:"center", headerFilter:"input"},	
				{title:"시간(침탄)", field:"prod_gyu", sorter:"int", width:100, hozAlign:"center", visible:false, headerFilter:"input"},
				{title:"온도(확산)", field:"corp_code", sorter:"int", width:100, hozAlign:"center", visible:false, headerFilter:"input"},
			    {title:"시간(확산)", field:"wstd_n06", sorter:"int", width:100, hozAlign:"center", visible:false, headerFilter:"input"},
 			    {title:"소려온도", field:"wstd_n07", sorter:"int", width:100, hozAlign:"center", visible:false, headerFilter:"input"},
 			    {title:"소려시간", field:"wstd_n11", sorter:"int", width:100, hozAlign:"center", visible:false, headerFilter:"input"},
		        {title:"비고", field:"wstd_n12", sorter:"int", width:100, hozAlign:"center", visible:false, headerFilter:"input"},	
		        {title:"경화깊이", field:"wstd_ready", sorter:"int", width:100, hozAlign:"center", visible:false, headerFilter:"input"},	
		        {title:"표면경도", field:"wstd_workdate", sorter:"int", width:100, hozAlign:"center", visible:false, headerFilter:"input"},	
		        {title:"심부경도", field:"prod_jai", sorter:"int", width:100, hozAlign:"center", visible:false, headerFilter:"input"},	
			    {title:"심부경도", field:"prod_code", sorter:"int", width:100, hozAlign:"center", visible:false, headerFilter:"input"},
			    {title:"심부경도", field:"plnp_seq", sorter:"int", width:100, hozAlign:"center", visible:false, headerFilter:"input"},
			    {title:"심부경도", field:"prod_gd1", sorter:"int", width:100, hozAlign:"center", visible:false, headerFilter:"input"},
			    {title:"심부경도", field:"plnp_dsu", sorter:"int", width:100, hozAlign:"center", visible:false, headerFilter:"input"},
			    {title:"심부경도", field:"plnp_strt", sorter:"int", width:100, hozAlign:"center", visible:false, headerFilter:"input"},
			    {title:"심부경도", field:"plnp_end", sorter:"int", width:100, hozAlign:"center", visible:false, headerFilter:"input"},
		    ],
		    rowFormatter:function(row){
			    var data = row.getData();
			    
			    row.getElement().style.fontWeight = "700";
				row.getElement().style.backgroundColor = "#FFFFFF";
			},
			rowClick:function(e, row){

				$("#workWaitTabu .tabulator-tableHolder > .tabulator-table > .tabulator-row").each(function(index, item){
						
					if($(this).hasClass("row_select")){							
						$(this).removeClass('row_select');
						row.getElement().className += " row_select";
					}else{
						$("#workWaitTabu div.row_select").removeClass("row_select");
						row.getElement().className += " row_select";	
					}
				});

				var rowData = row.getData();
				
			},
			rowDblClick:function(e, row){

				
//				workSetData

				/*
				1.삭제
				2.순번				no
				3.입고일				ord_date
				4.업체명
				5.품명
				6.품번
				7.규격
				8.요구경도
				9.경화층깊이
				10.수량
				11.침탄온도(hidden)
				12.침탄시간(hidden)
				13.확산온도(hidden)
				14.확산시간(hidden)
				15.소려온도(hidden)
				16.소려시간(hidden)
				17.시작
				18.종료
				19.송장번호
				20.특기사항
				*/				
				
				var rowData = row.getData();
				console.log(workSetData.length);
				
				var obj = {
					"id" : rowData.id,					//NO
					"del_btn": "",						//삭제
					"plnp_seq": rowData.plnp_seq,		//순번
					"ord_date" : rowData.ord_date,		//입고일
					"corp_name" : rowData.ord_code,		//업체명
					"prod_name" : rowData.prod_name,	//품명
					"prod_no" : rowData.prod_no,		//품번
					"prod_gyu" : rowData.prod_gyu,		//규격
					"prod_pg" : rowData.prod_pg,		//요구경도
					"prod_gd1" : rowData.prod_gd1,		//경화층깊이
					"plnp_dsu" : rowData.plnp_dsu,		//수량
					"plnp_strt": "00:00",		//시작
					"plnp_end":  "23:59",		//종료
					"plnp_bno" : rowData.ord_lot,	//송장번호
					"plnp_note" : " ",	//특기사항
					"wstd_n06" : rowData.wstd_n06,		
					"wstd_n07" : rowData.wstd_n07,
					"wstd_n11" : rowData.wstd_n11,
					"wstd_n12" : rowData.wstd_n12,
					"wstd_ready" : rowData.wstd_ready,
					"wstd_worktime" : rowData.wstd_worktime,
					"prod_jai" : rowData.prod_jai,
					"prod_code" : rowData.prod_code,
					"corp_code" : rowData.corp_code
				}
				
				workWaitTable.deleteRow(rowData.id);
				
				console.log(obj);
				workSetData.push(obj);
				workSetTable.setData(workSetData);
				
			},
		});		
	}
	
	//작업지시 등록
	function workSetSave(){
		console.log(workSetTable.getData());
		
//		var workSetDataSend = JSON.stringify(workSetTable.getData());
		
		var plnpDate = $("#s_plnp_date").val();
		var facCode = $("#s_fac_code").val();
		
		var sendObj = {
				"workData": workSetTable.getData(),
				"plnpDate":plnpDate,
				"facCode":facCode
		}
		
		console.log(typeof JSON.stringify(sendObj));
		
		
		$.ajax({
			url:"/tkheat/production/workInstruction/setWorkSetSave",
			type:"post",
			contentType: false,
			processData: false,			
			dataType:"json",
			data:JSON.stringify(sendObj),
			success:function(result){
				console.log(result);
			},error: function(xhr, status, status) {
				console.log(xhr);
				console.log(status);
				console.log(status);
            }
		});
	}

	
	//모달기능
	const workSetModal = document.querySelector('.workSetModal');
	const workWaitModal = document.querySelector('.workWaitModal');
	const header = document.querySelector('.header'); // 헤더를 드래그할 요소로 사용
	const insertButton = document.querySelector('.insert-button');
	const workSetCloseButton = document.querySelector('.workSetClose');
	const workWaitCloseButton = document.querySelector('.workWaitClose');

	function workWaitSearch(){
		getWorkWaitList();
		
//		getWorkWaitListData();
		workWaitModal.style.display = 'block'; // 모달 표시
	}
	
	
	header.addEventListener('mousedown', function(e) {
		// transform 제거를 위한 초기 위치 설정
		const rect = workSetModal.getBoundingClientRect();
		workSetModal.style.left = rect.left + 'px';
		workSetModal.style.top = rect.top + 'px';
		workSetModal.style.transform = 'none'; // 중앙 정렬 해제

		let offsetX = e.clientX - rect.left;
		let offsetY = e.clientY - rect.top;

		function moveModal(e) {
			workSetModal.style.left = (e.clientX - offsetX) + 'px';
			workSetModal.style.top = (e.clientY - offsetY) + 'px';
		}

		function stopMove() {
			window.removeEventListener('mousemove', moveModal);
			window.removeEventListener('mouseup', stopMove);
		}

		window.addEventListener('mousemove', moveModal);
		window.addEventListener('mouseup', stopMove);
	});

		

	// 모달 열기

	insertButton.addEventListener('click', function() {
//		getIpgoAddList();
		getWorkSetList();
		workSetModal.style.display = 'block'; // 모달 표시
	});
	

	workSetCloseButton.addEventListener('click', function() {
		workSetData = new Array();
		workSetTable.setData(workSetData);
		workSetModal.style.display = 'none'; // 모달 숨김
	});

	workWaitCloseButton.addEventListener('click', function() {
		workWaitModal.style.display = 'none'; // 모달 숨김
	});
	
    </script>

	</body>
</html>
