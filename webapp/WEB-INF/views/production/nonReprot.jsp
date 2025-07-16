<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>부적합보고서</title>
    <link rel="stylesheet" href="/tkheat/css/management/productInsert.css">
    <link rel="stylesheet" href="/tkheat/css/tabBar/tabBar.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@include file="../include/pluginpage.jsp" %> 
    <style>
    
.main{
	width:98%;
}
.container {
	display: flex;
	justify-content: space-between;
}
.nonReportModal {
    position: fixed; /* 화면에 고정 */
    top: 50%; /* 수직 중앙 */
    left: 50%; /* 수평 중앙 */
    display : none;
    transform: translate(-50%, -50%); /* 정확한 중앙 정렬 */
    z-index: 1000; /* 다른 요소 위에 표시 */
}
.header {
    display: flex; /* 플렉스 박스 사용 */
    justify-content: center; /* 중앙 정렬 */
    align-items: center; /* 수직 중앙 정렬 */
    background-color: #33363d; /* 배경색 */
    height: 50px; /* 높이 */
    color: white; /* 글자색 */
    font-size: 20px; /* 글자 크기 */
    text-align: center; /* 텍스트 정렬 */
}
.detail {
    background: #ffffff;
    border: 1px solid #000000;
    width: 1200px; /* 가로 길이 고정 */
    height: 670px; /* 세로 길이 고정 */
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.7);
    margin: 20px auto; /* 중앙 정렬 */
    padding: 20px;
    border-radius: 5px; /* 모서리 둥글게 */
    overflow-y: auto; /* 세로 스크롤 추가 */
    position: relative;
    margin-top: 0;
}

.insideTable {
    width: 100%; /* 테이블 너비 100% */
    border-collapse: collapse; /* 테두리 겹침 제거 */
}

.insideTable th,
.insideTable td {
    padding: 8px; /* 셀 패딩 */
    border: 1px solid #ccc; /* 셀 경계선 */
    vertical-align: middle; /* 수직 정렬 */
}

.insideTable th {
    background: #f0f0f0; /* 헤더 배경색 */
}

.basic, .rp-input, .form-control {
    width: calc(100% - 12px); /* 너비 조정 */
    padding: 5px; /* 내부 여백 */
    border: 1px solid #949494; /* 경계선 색상 */
    border-radius: 3px; /* 둥근 모서리 */
}

.basic[readonly] {
    background-color: #f9f9f9; /* 읽기 전용 필드 색상 */
}

textarea {
    width: 100%; /* 너비 100% */
    padding: 5px; /* 내부 여백 */
    border: 1px solid #949494; /* 경계선 색상 */
    border-radius: 3px; /* 둥근 모서리 */
}

.findImage {
    display: flex; /* 플렉스 박스 사용 */
    align-items: center; /* 수직 정렬 */
}

.findImage input[type="file"] {
    margin-right: 10px; /* 오른쪽 여백 */
}

.img-rounded {
    border-radius: 5px; /* 둥근 모서리 */
}

.imgArea {
    width: 100%; /* 이미지 영역 너비 */
    height: 100px; /* 이미지 영역 높이 */
    border: 1px solid #ddd; /* 경계선 */
    margin-bottom: 10px; /* 하단 여백 */
}

.imgArea img {
    width: 100%; /* 이미지 너비 */
    height: 100%; /* 이미지 높이 */
    object-fit: cover; /* 이미지 비율 유지 */
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
.btnSaveClose {
	display: flex;
	justify-content: center; /* 가운데 정렬 */
	gap: 20px; /* 버튼 사이 여백 */
	margin-top: 30px; /* 모달 내용과의 간격 */
	margin-bottom: 20px; /* 모달 하단과 버튼 사이 간격  */
}
.btnSaveClose button {
	width: 100px;
	height: 35px;
	background-color: #FFD700; /* 기본 배경 - 노란색 */
	color: black;
	border: 2px solid #FFC107; /* 노란 테두리 */
	border-radius: 5px;
	font-weight: bold;
	text-align: center;
	cursor: pointer;
	line-height: 35px;
	margin: 0 10px;
	margin-top: 10px;
	transition: background-color 0.3s ease, transform 0.2s ease;
}

/* 저장 버튼 호버 시 */
.btnSaveClose .save:hover {
	background-color: #FFC107;
	transform: scale(1.05);
}

/* 닫기 버튼 - 회색 톤 */
.btnSaveClose .close {
	background-color: #A9A9A9;
	color: black;
	border: 2px solid #808080;
}

/* 닫기 버튼 호버 시 */
.btnSaveClose .close:hover {
	background-color: #808080;
	transform: scale(1.05);
}
th{
	font-size : 14px;
}
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0,0,0,0.6);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 9999;
}

.modal-content {
  background: white;
  padding: 20px;
  border-radius: 8px;
  width: 90%;
  max-width: 1000px;
  position: relative;
}

.modal-header {
  display: flex;
  justify-content: space-between;
  font-weight: bold;
  font-size: 18px;
  margin-bottom: 10px;
}

.modal-close {
  cursor: pointer;
  font-size: 24px;
}    
    
    
    </style>
    
    
    <body>
    
    <div class="tab">
    <div class="box1">
         <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
        
        
		<label class="daylabel">일자 : </label>
		<input type="date" class="sdate" id="sdate" style="font-size: 16px;" autocomplete="off"> ~ 
		<input type="date" class="edate" id="edate" style="font-size: 16px;" autocomplete="off">
			
		<!-- <label class="daylabel">고객명 : </label>
		<input type="text" class="corp_name" id="corp_name" style="font-size: 16px;" autocomplete="off">
			
		<label class="daylabel">품명 : </label>
		<input type="text" class="prod_name" id="prod_name" style="font-size: 16px;" autocomplete="off">
			
		<label class="daylabel">품번 : </label>
		<input type="text" class="prod_no" id="prod_no" style="font-size: 16px; autocomplete="off">
		
		<label class="daylabel">규격 : </label>
		<input type="text" class="prod_gyu" id="prod_gyu" style="font-size: 16px; autocomplete="off">
		
		<label class="daylabel">제품구분 : </label>
		<input type="text" class="prod_gubn" id="prod_gubn" style="font-size: 16px; autocomplete="off"> -->
			
	</div>
    
    <div class="button-container">
        <button class="select-button" onclick="getNonReportList();">
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
	    
	    
	   <form method="post" id="nonReportForm" name="nonReportForm"> 
	    <div class="nonReportModal">
			<div class="header">부적합보고서</div>
	    		<div class="detail">
					<div class="subTitle">
						<div style=" position:absolute; width:40px; left:110px;"><input type="button" id="" name="" title="검색" class="btnSearchSmall" style="margin-top:2px;" onclick="ipgoListModal();" /></div>
						<div class="h3">수주정보</div>
					</div>
					<table cellspacing="0" cellpadding="0" width="100%" class="">									
						<tr>
							<th class="">수주NO</th>
							<td class=""><input id="ord_code" name="ord_code" class="basic" type="text" style="width:90%;" value=""/></td>
							<th class="">고객명</th>
							<td class=""><input id="corp_name" name="corp_name" class="basic" type="text" style="width:90%;" value="" /></td>
							<th class="">품명</th>
							<td class=""><input id="prod_name" name="prod_name" class="basic" type="text" style="width:90%;" value="" /></td>
							<th class="">품번</th>
							<td class=""><input id="prod_no" name="prod_no" class="basic" type="text" style="width:90%;" value="" /></td>
						</tr>
						<tr>
							<th class="">규격</th>
							<td class=""><input id="prod_gyu" name="prod_gyu" class="basic" type="text" style="width:90%;" value="" /></td>
							<th class="">재질</th>
							<td class=""><input id="prod_jai" name="prod_jai" class="basic" type="text" style="width:90%;" value="" /></td>
							<th class="">공정</th>
							<td class=""><input id="tech_te" name="tech_te" class="basic" type="text" style="width:90%;" value="" /></td>
							<th class="">표면경도</th>
							<td class=""><input id="prod_pg" name="prod_pg" class="basic" type="text" style="width:90%;" value="" /></td>
						</tr>
						<tr>
							<th class="">경화깊이</th>
							<td class=""><input id="prod_cd" name="prod_cd" class="basic" type="text" style="width:90%;" value="" /></td>
							<th class="">심부경도</th>
							<td class=""><input id="prod_sg" name="prod_sg" class="basic" type="text" style="width:90%;" value="" /></td>
							<th class="">수주일</th>
							<td class=""><input id="ord_date" name="ord_date" class="basic" type="text" style="width:90%;" value="" /></td>
							<th class="">입고LOT</th>
							<td class=""><input id="ord_lot" name="ord_lot" class="basic" type="text" style="width:90%;" value="" /></td>
							<td class="" hidden=''><input id="ilbo_code" name="ilbo_code" class="basic" type="text" style="width:90%;" value="" /></td>
							<td class="" hidden=''><input id="ilbo_no" name="ilbo_no" class="basic" type="text" style="width:90%;" value="" /></td>
						</tr>
					</table>
								
					<table cellspacing="0" cellpadding="0" width="100%">
						<colgroup>
							<col width="60%" />
							<col width="40%" />
						</colgroup>
						<tr>
							<td class="leftSide">								
								<div class="subTitle">
									<div class="h3">기본</div>
								</div>
								<table cellspacing="0" cellpadding="0" width="100%" class="insideTable">
									<tr>
										<th class="">작성일</th>
										<td class=""><input id="werr_date" name="werr_date" type="date" style="width:100px;"  maxlength="20" size="20"  /></td>
										<th class="">발생일</th>
										<td class=""><input id="werr_wdate" name="werr_wdate" type="date" style="width:100px;"  maxlength="20" size="20"  /></td>
										<th class="">설비선택</th>
										<td>
										<select id="werr_fac" name="werr_fac" class="basic"style="width: 100px">									
											
												<option value="고주파 1호기(폐기)">고주파 1호기(폐기)</option>
											
												<option value="고주파 2호기 (폐기)">고주파 2호기 (폐기)</option>
											
												<option value="고주파 5호기">고주파 5호기</option>
											
												<option value="급수시설">급수시설</option>
											
												<option value="변성로 1호기">변성로 1호기</option>
											
												<option value="변성로 2호기">변성로 2호기</option>
											
												<option value="쇼트 1호기">쇼트 1호기</option>
											
												<option value="쇼트 2호기">쇼트 2호기</option>
											
												<option value="쇼트 3호기">쇼트 3호기</option>
											
												<option value="쇼트 4호기">쇼트 4호기</option>
											
												<option value="전기시설">전기시설</option>
											
												<option value="진공세정기 2호기">진공세정기 2호기</option>
											
												<option value="침탄로 1호기">침탄로 1호기</option>
											
												<option value="침탄로 2호기">침탄로 2호기</option>
											
												<option value="침탄로 3호기">침탄로 3호기</option>
											
												<option value="침탄로 4호기">침탄로 4호기</option>
											
												<option value="침탄로 5호기">침탄로 5호기</option>
											
												<option value="콤프레샤">콤프레샤</option>
											
												<option value="템퍼링기 1호기">템퍼링기 1호기</option>
											
												<option value="템퍼링기 2호기">템퍼링기 2호기</option>
											
								       </select>
										</td>
										</tr>
									<tr>
										<th class="">관리번호</th>
										<td class=""><input id="werr_lot" name="werr_lot" class="basic" type="text" style="width:70%;" value="" /></td>
										<th class="">발생부서</th>
										<td class=""><input id="werr_team" name="werr_team" class="basic" type="text" style="width:70%;" value="" /></td>
										<th class="">구분</th>
										<td>
										<select class="basic" id="werr_in_out_gubn" name="werr_in_out_gubn" style="width:100px;">												
												<option selected="selected">사내</option>
												<option>사외</option>
										</select>
										</td>
									</tr>
									<tr>
										<th class="">보고자</th>
										<td class="">
											<input id="werr_user" name="werr_user" class="basic" type="text" style="width:70%;" value="" />
										</td>
										<th class="">수량</th>
										<td class=""><input id="werr_amnt" name="werr_amnt" class="basic" type="text" style="width:70%;" value="" /></td>
									</tr>
								</table>
											
								<div class="subTitle">
									<div class="h3">불량</div>
								</div>
								<table cellspacing="0" cellpadding="0" width="100%" class="insideTable">
									<tr>
										
										
										<th class="">불량유형</th>
										<td class="">
											<select id="werr_gubn" name="werr_gubn" class="basic">
												<option selected="selected">찍힘</option>
												<option>외관(이물)</option>
												<option>외관(발청)</option>
												<option>외관(조도)</option>
												<option>경도</option>
												<option>경화깊이</option>
												<option>조직</option>
												<option>크랙</option>
												<option>사양오적용(혼입)</option>
												<option>변형</option>
											</select>
										</td>
										<th class="">조치구분</th>
										<td class="">
											<select id="werr_jgubn" name="werr_jgubn" class="basic">
												<option selected="selected">재작업</option>
												<option>폐기</option>
												<option>업체통보후납품</option>
												<option>별도관리(보관)</option>
												<option>기타</option>
											</select>
										</td>
										</tr>
									<tr>
										<th class="">불량내용</th>
										<td class=""><textarea id="werr_gnote" name="werr_gnote" class="basic" style="width:90%; height:60px;"></textarea></td>
										<th class="">대책수립 및<br />
											대책실시</th>
										<td class=""><textarea id="werr_jnote" name="werr_jnote" class="basic" style="width:90%; height:60px;"></textarea></td>
									</tr>
									<tr>
										<th class="">발생원인 및<br />
											원인분석</th>
										<td class=""><textarea id="werr_case" name="werr_case" class="basic" style="width:90%; height:60px;"></textarea></td>
										<th class="">결과분석 및<br />
											사후관리</th>
										<td class=""><textarea id="werr_note" name="werr_note" class="basic" style="width:90%; height:60px;"></textarea></td>
									</tr>
								</table>					
							</td>
							<td class="rightSide">
								<div id="tabs">
									<ul>
										<li><a href="#tabs-1">개선전</a></li>
										<li><a href="#tabs-2">개선후</a></li>
									</ul>
									<div id="tabs-1">
										<p><div class="findImage">
										<input type="file" name="beforeImg" title="이미지 찾기" onchange="previewImage(this,'previewId1')"> 
										<div class="imgArea" id='previewId1' style="height:190px;border:1px solid #ddd;"><img id="prev_previewId1" src="/resources/images/noimage_01.gif" width="100%" height="100%" /></div></div></p>
									</div>
									<div id="tabs-2">
										<p><div class="findImage">
										<input type="file" name="afterImg" title="이미지 찾기" onchange="previewImage(this,'previewId2')">
										<div class="imgArea" id='previewId2' style="height:190px;border:1px solid #ddd;"><img id="prev_previewId2" src="/resources/images/noimage_01.gif" width="100%" height="100%" /></div></div></p>
									</div>
								</div>
								<input type="file" name="werr_fname" id="werr_fname" title="파일 첨부"  onchange="" />
								</td>
							</tr>
					</table>
					<div class="btnSaveClose">
						 <button class="delete" type="button" onclick="deleteNonReprot();"  style="display: none;">삭제</button>	
						 <button class="save" type="button" onclick="save();">저장</button>
						 <button class="close" type="button" onclick="window.close();">닫기</button>
    	  			</div>
				</div>
			</div>	
			</form>
			
			
			<!-- 수주정보(검색버튼) 팝업창 -->
			<div id="ipgoListModal" class="modal-overlay" style="display: none;">
				<div class="modal-content">
					<div class="modal-header">
						<span class="modal-title">설비 리스트</span> <span class="modal-close" onclick="closeIpgoListModal()">&times;</span>
					</div>
					<div id="ipgoListTabulator" style="height: 500px;"></div>
				</div>
			</div>
						
	    
<script>
	//전역변수
    var cutumTable;	
    var isEditMode = false; //수정,최초저장 구분값

	//로드
	$(function(){
		var tdate = todayDate();
		var ydate = yesterDate();
		
		$("#sdate").val(ydate);
		$("#edate").val(tdate);
		getNonReportList();
	});

	//이벤트
	//함수
	function getNonReportList(){
		
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
		    ajaxURL:"/tkheat/production/nonReport/getNonReportList",
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
		    	{title:"NO", field:"idx", sorter:"int", width:80,
		        	hozAlign:"center"},
		        {title:"발생일", field:"werr_wdate", sorter:"string", width:120,
			        hozAlign:"center", headerFilter:"input"},	
			    {title:"고객명", field:"corp_name", sorter:"string", width:120,
				    hozAlign:"center", headerFilter:"input"},     
				{title:"품명", field:"prod_name", sorter:"string", width:120,
				    hozAlign:"center", headerFilter:"input"}, 
				{title:"품번", field:"prod_no", sorter:"string", width:150,
				    hozAlign:"center", headerFilter:"input"}, 
		        {title:"수주일", field:"ord_date", sorter:"string", width:120,
		        	hozAlign:"center", headerFilter:"input"},		        
		        {title:"공정", field:"tech_te", sorter:"string", width:100,
		        	hozAlign:"center", headerFilter:"input"},
		        {title:"설비", field:"werr_fac", sorter:"string", width:100,
		        	hozAlign:"center", headerFilter:"input"},
		        {title:"구분", field:"werr_gubn", sorter:"string", width:100,
			        hozAlign:"center", headerFilter:"input"},	
		        {title:"수량", field:"werr_amnt", sorter:"int", width:100,
		        	hozAlign:"center", headerFilter:"input"},
			    {title:"NO", field:"werr_code", sorter:"int", width:80,
			        hozAlign:"center", visible:false},	
			    {title:"NO", field:"ilbo_code", sorter:"int", width:80,
				    hozAlign:"center", visible:false},	
				{title:"NO", field:"ilbo_no", sorter:"int", width:80,
					hozAlign:"center", visible:false},	
				    
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
			rowDblClick:function(e, row){

				var data = row.getData();
				selectedRowData = data;
				isEditMode = true;
				$('#nonReportForm')[0].reset();
				

				/* Object.keys(data).forEach(function (key) {
			        const field = $('#nonReportForm [name="' + key + '"]');

			        if (field.length) {
			            field.val(data[key]);
			        }
				}); */
				nonReportDetail(data.werr_code);
				 $('.delete').show();
			},
		});		
	}

	
	function nonReportDetail(werr_code){
		$.ajax({
			url:"/tkheat/production/nonReport/nonReportDetail",
			type:"post",
			dataType:"json",
			data:{
				"werr_code":werr_code
			},
			success:function(result){
//				console.log(result);
				var allData = result.data;
				
				for(let key in allData){
//					console.log(allData, key);	
					$("input[name='"+key+"']").val(allData[key]);
				}

				$('.nonReportModal').show().addClass('show');
			}
		});
	}


	



	// 드래그 기능 추가
	const modal = document.querySelector('.nonReportModal');
	const header = document.querySelector('.header'); // 헤더를 드래그할 요소로 사용

	header.addEventListener('mousedown', function(e) {
	    let offsetX = e.clientX - modal.getBoundingClientRect().left; // 마우스와 모달의 x 위치 차이
	    let offsetY = e.clientY - modal.getBoundingClientRect().top; // 마우스와 모달의 y 위치 차이

	    function moveModal(e) {
	        modal.style.left = (e.clientX - offsetX) + 'px';
	        modal.style.top = (e.clientY - offsetY) + 'px';
	    }

	    function stopMove() {
	        window.removeEventListener('mousemove', moveModal); // 이동 중지
	        window.removeEventListener('mouseup', stopMove); // 마우스 업 이벤트 제거
	    }

	    window.addEventListener('mousemove', moveModal); // 마우스 이동 이벤트
	    window.addEventListener('mouseup', stopMove); // 마우스 업 이벤트
	});
		

	// 모달 열기
	const insertButton = document.querySelector('.insert-button');
	const nonReportModal = document.querySelector('.nonReportModal');
	const closeButton = document.querySelector('.close');

	insertButton.addEventListener('click', function() {
		isEditMode = false;  // 추가 모드
	    $('#nonReportForm')[0].reset(); // 폼 초기화
	    nonReportModal.style.display = 'block'; // 모달 표시

		$('.delete').hide();
	});

	closeButton.addEventListener('click', function() {
		nonReportModal.style.display = 'none'; // 모달 숨김
	});



	//설비검색버튼 리스트 모달
    function ipgoListModal() {
        document.getElementById('ipgoListModal').style.display = 'flex';

        
        let ipgoListTable = new Tabulator("#ipgoListTabulator", {
            height:"450px",
            layout:"fitColumns",
            selectable:true,
            ajaxURL:"/tkheat/production/nonReport/getNonReportIpgoList",
            ajaxConfig:"POST",
            ajaxParams:{
            	"ord_code": "",
                "corp_name": "",
                "prod_name": "",
                "prod_no": "",
                "prod_gyu": "", 
                "prod_jai": "",
                "tech_te": "",
                "prod_pg": "",
                "prod_no": "",
                "prod_sg": "", 
                "ord_date": "",
                "ord_lot": "", 

                },
		    ajaxResponse:function(url, params, response){
//				$("#tab1 .tabulator-col.tabulator-sortable").css("height","55px");
				console.log(response);
		        return response.data; //return the response data to tabulator
		    },    
            columns:[
            	{title:"수주NO", field:"ord_code", sorter:"string", width:120,
				    hozAlign:"center", headerFilter:"input"}, 
				{title:"거래처", field:"corp_name", sorter:"string", width:150,
				    hozAlign:"center", headerFilter:"input"}, 
		        {title:"품명", field:"prod_name", sorter:"string", width:100,
		        	hozAlign:"center", headerFilter:"input"},
		        {title:"품번", field:"prod_no", sorter:"string", width:100,
		        	hozAlign:"center", headerFilter:"input"},
		        {title:"규격", field:"prod_gyu", sorter:"string", width:100,
			        hozAlign:"center", headerFilter:"input"},	
		        {title:"재질", field:"prod_jai", sorter:"string", width:100,
		        	hozAlign:"center", headerFilter:"input"},  	
		        {title:"공정", field:"tech_te", sorter:"string", width:80,
			        hozAlign:"center", headerFilter:"input"},	
			    {title:"표면경도", field:"prod_pg", sorter:"string", width:100,
				    hozAlign:"center", headerFilter:"input"},	
				{title:"심부경도", field:"prod_sg", sorter:"string", width:100,
				    hozAlign:"center", headerFilter:"input"},
				{title:"경화깊이", field:"prod_cd", sorter:"string", width:100,
					hozAlign:"center", headerFilter:"input"},
				{title:"수주일", field:"ord_date", sorter:"string", width:100,
					hozAlign:"center", headerFilter:"input"},	
				{title:"입고LOT", field:"ord_lot", sorter:"string", width:100,
					hozAlign:"center", headerFilter:"input"},
            ],
            rowDblClick:function(e, row){
                let data = row.getData();
                
                document.getElementById('ord_code').value = data.ord_code;
                document.getElementById('corp_name').value = data.corp_name;
                document.getElementById('prod_name').value = data.prod_name;
                document.getElementById('prod_no').value = data.prod_no;
                document.getElementById('prod_gyu').value = data.prod_gyu;
                document.getElementById('prod_jai').value = data.prod_jai;
                document.getElementById('tech_te').value = data.tech_te;
                document.getElementById('prod_pg').value = data.prod_pg;
                document.getElementById('prod_sg').value = data.prod_sg;
                document.getElementById('prod_cd').value = data.prod_cd;
                document.getElementById('ord_date').value = data.ord_date;
                document.getElementById('ord_lot').value = data.ord_lot;
                
                document.getElementById('ipgoListModal').style.display = 'none';
            }
        });
    }

    function closeIpgoListModal() {
        document.getElementById('ipgoListModal').style.display = 'none';
    }



  //부적합보고서 저장
    function save() {
	    var formData = new FormData($("#nonReportForm")[0]);

	    let confirmMsg = "";

	    if (isEditMode && selectedRowData && selectedRowData.werr_code) {
	        formData.append("mode", "update");
	        formData.append("werr_code", selectedRowData.werr_code);
	        confirmMsg = "수정하시겠습니까?";
	    } else {
	        formData.append("mode", "insert");
	        confirmMsg = "저장하시겠습니까?";
	    }

	    if (!confirm(confirmMsg)) {
	        return;
	    }

	    $.ajax({
	        url: "/tkheat/production/nonReportInsert/nonReportSave",
	        type: "POST",
	        data: formData,
	        contentType: false,
	        processData: false,
	        dataType: "json",
	        success: function(result) {
	        	alert("저장 되었습니다.");
                $(".nonReportModal").hide();
                getNonReportList();
	        },
	        error: function(xhr, status, error) {
	            console.error("저장 오류:", error);
	        }
	    });
	}


	function deleteNonReprot() {
	    if (!selectedRowData || !selectedRowData.werr_code) {
	        alert("삭제할 대상을 선택하세요.");
	        return;
	    }

	    if (!confirm("삭제하시겠습니까?")) {
	        return;
	    }

	    $.ajax({
	        url: "/tkheat/production/nonReportInsert/nonReportDelete",
	        type: "POST",
	        data: {
	        	werr_code: selectedRowData.werr_code
	        },
	        dataType: "json",
	        success: function(result) {
	            if (result.status === "success") {
	                alert("삭제되었습니다.");
	                $(".nonReportModal").hide();
	                getNonReportList();
	            } else {
	                alert("삭제 중 오류가 발생했습니다: " + result.message);
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("삭제 오류:", error);
	            alert("삭제 요청 중 오류가 발생했습니다.");
	        }
	    });
	}





				    

    </script>

	</body>
</html>
