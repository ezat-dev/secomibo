<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sparePart관리</title>
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
.container2 {
	display: flex;
	justify-content: space-between;
}
.spareModal {
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
    margin-bottom: 10px; /* 상단 여백 */
    background-color: #33363d; /* 배경색 */
    height: 50px; /* 높이 */
    color: white; /* 글자색 */
    font-size: 20px; /* 글자 크기 */
    text-align: center; /* 텍스트 정렬 */
}
#editPop {
    background: #ffffff;
    border: 1px solid #000000;
    width: 500px; /* 가로 길이 고정 */
    height: 650px; /* 세로 길이 고정 */
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.7);
    margin: 20px auto; /* 중앙 정렬 */
    padding: 20px;
    border-radius: 5px; /* 모서리 둥글게 */
    overflow-y: auto; /* 세로 스크롤 추가 */
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
		<div class="container">
			<div id="tab1" class="tabulator"></div>
		</div>
		<div class="container2">
			<div id="sub" class="tabulator"></div>
		</div>
	</main>
	
	
	<div class="spareModal">    
	  <div id="editPop">
	  	<div class="header">
	  	
	  	</div>
		<div class="detail">
			<table cellspacing="0" cellpadding="0" width="100%">
				<tbody><tr>
					<td>
						<table cellspacing="0" cellpadding="0" width="100%" class="insideTable" table-layout:fixed="">
							<tbody><tr>
								<th class="" style="width: 20%;">매입처</th>
								<td>
									<select id="spp_purchase" name="spp_purchase" class="basic valPost valClean" style="width:100%;">
	
										
											<option value="(주)금성풍력 서울지사">(주)금성풍력 서울지사</option>
										
											<option value="(주)대한히타">(주)대한히타</option>
										
											<option value="(주)동광화학">(주)동광화학</option>
										
											<option value="(주)성호기업">(주)성호기업</option>
										
											<option value="(주)세원에너지">(주)세원에너지</option>
										
											<option value="(주)알피네트웍스">(주)알피네트웍스</option>
										
											<option value="(주)제일연마영남영업소">(주)제일연마영남영업소</option>
										
											<option value="(주)한국하우톤온산공상">(주)한국하우톤온산공상</option>
										
											<option value="(주)한국PME">(주)한국PME</option>
										
											<option value="2000ENG">2000ENG</option>
										
											<option value="그랜드종합상">그랜드종합상</option>
										
											<option value="길호철강(주)">길호철강(주)</option>
										
											<option value="대광화학">대광화학</option>
										
											<option value="범우루브켐">범우루브켐</option>
										
											<option value="월드히타엔지니어링">월드히타엔지니어링</option>
										
											<option value="한성엠텍">한성엠텍</option>
										
									</select>
								</td>
							</tr>
							<tr>
								<th class="" style="width: 20%;">품번</th>
								<td>
									<input id="spp_no" name="spp_no" class="basic valPost valClean" type="text" style="width:100%;" value="">
									<input id="spp_idx" name="spp_idx" class="basic valPost valClean" type="hidden" value="">
								</td>
							</tr>
							<tr>
								<th class="left">품명</th>
								<td>
									<input id="spp_name" name="spp_name" class="basic valPost valClean" type="text" style="width:90%;" value="">
								</td>
							</tr>
							<tr>
								<th class="left">규격</th>
								<td>
									<input id="spp_gyu" name="spp_gyu" class="basic valPost valClean" type="text" style="width:90%;" value="">
								</td>
							</tr>
							<tr>
								<th class="left">교체주기</th>
								<td>
									<input id="spp_yong" name="spp_yong" class="basic valPost valClean" type="text" style="width:90%;" value="">
								</td>
							</tr>
							<tr>
								<th class="left">적정재고</th>
								<td>
									<input id="spp_proper" name="spp_proper" class="basic valPost valClean" type="text" style="width:90%;" value="">
								</td>
							</tr>
							<tr>
								<th class="left">비고</th>
								<td>
									<input id="SPP_BIGO" name="spp_bigo" class="basic valPost valClean" type="text" style="width:90%;" value="">
								</td>
							</tr>
	
	
	
						</tbody></table>
				</td></tr><tr>
					<td rowspan="3">
						<table class="insideTable" cellspacing="0" cellpadding="0" width="100%">
							<tbody>
							<tr>
								
								<th class="thSub2">이미지</th>
								<td class="tdRight">
									<div>
										<input id="imgInput0" class="imgInputClass valClean" type="file" title="이미지 찾기">
										<input type="button" value="X" onclick="$('#img0').attr('src', '/resources/images/noimage_01.gif'); $('#imgInput0').val('');">
										<a href="" class="form-control aphoto" download="">다운로드</a>
									</div>
									<div class="imgArea" style="width:200px; height:150px; border:1px solid #ddd;">
										<img id="img0" class="imgClass rp-img-popup" style="width:100%; height:100%;" src="/resources/images/noimage_01.gif">
									</div>
								</td>
							</tr>
							</tbody>
						</table>
						<script type="text/javascript">
							$(function(){
								// 파일 선택시 이미지 띄우기
								$('.imgInputClass').change(function(event){
									var selectedFile = event.target.files[0];
									var reader = new FileReader();
	
									var img = $(this).parent().parent().find('img')[0];
									img.title = selectedFile.name;
	
									reader.onload = function(event) {
										img.src = event.target.result;
									};
	
									reader.readAsDataURL(selectedFile);
								});
							});
						</script>
					</td>
				</tr>
					
				
			</tbody></table>
		</div>
		<div class="btnSaveClose">
			<button class="save" type="button" onclick="save();">저장</button>
			<button class="close" type="button" onclick="window.close();">닫기</button>
    	 </div>
	</div>
</div>
	    
<script>
	//전역변수
    var cutumTable;	

	//로드
	$(function(){
		//전체 거래처목록 조회
		getSparePartList();
		getSpareSubList();
	});

	//이벤트
	//함수
	function getSparePartList(){
		
		userTable = new Tabulator("#tab1", {
		    height:"330px",
		    layout:"fitColumns",
		    selectable:true,	//로우 선택설정
		    tooltips:true,
		    selectableRangeMode:"click",
		    reactiveData:true,
		    headerHozAlign:"center",
		    ajaxConfig:"POST",
		    ajaxLoader:false,
		    ajaxURL:"/tkheat/preservation/sparePart/getSparePartList",
		    ajaxProgressiveLoad:"scroll",
		    ajaxParams:{},
		    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
		    ajaxResponse:function(url, params, response){
				$("#tab1 .tabulator-col.tabulator-sortable").css("height","55px");
		        return response; //return the response data to tabulator
		    },
		    columns:[
		        {title:"NO", field:"spp_idx", sorter:"int", width:80,
		        	hozAlign:"center"},
		        {title:"매입처", field:"spp_purchase", sorter:"string", width:120,
			        hozAlign:"center", headerFilter:"input"},	
			    {title:"품번", field:"spp_no", sorter:"string", width:120,
				    hozAlign:"center", headerFilter:"input"},     
				{title:"품명", field:"spp_name", sorter:"string", width:120,
				    hozAlign:"center", headerFilter:"input"}, 
				{title:"규격", field:"spp_gyu", sorter:"string", width:150,
				    hozAlign:"center", headerFilter:"input"}, 
		        {title:"교체주기", field:"spp_yong", sorter:"string", width:120,
		        	hozAlign:"center", headerFilter:"input"},		        
		        {title:"적정재고", field:"spp_proper", sorter:"int", width:100,
		        	hozAlign:"center", headerFilter:"input"},
		        {title:"비고", field:"spp_bigo", sorter:"string", width:100,
		        	hozAlign:"center", headerFilter:"input"},
		        {title:"입고", field:"sph_input", sorter:"int", width:100,
			        hozAlign:"center", headerFilter:"input"},	
		        {title:"수리출고", field:"sph_suriout", sorter:"int", width:100,
		        	hozAlign:"center", headerFilter:"input"},  	
		        {title:"자산출고", field:"sph_jasanout", sorter:"int", width:100,
			        hozAlign:"center", headerFilter:"input"},	
			    {title:"현재고", field:"spp_jaigo", sorter:"int", width:100,
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





	function getSpareSubList(){
		
		subTable = new Tabulator("#sub", {
		    height:"330px",
		    layout:"fitColumns",
		    selectable:true,	//로우 선택설정
		    tooltips:true,
		    selectableRangeMode:"click",
		    reactiveData:true,
		    headerHozAlign:"center",
		    ajaxConfig:"POST",
		    ajaxLoader:false,
		    ajaxURL:"/tkheat/preservation/sparePart/getSparePartList",
		    ajaxProgressiveLoad:"scroll",
		    ajaxParams:{},
		    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
		    ajaxResponse:function(url, params, response){
				$("#sub .tabulator-col.tabulator-sortable").css("height","55px");
		        return response; //return the response data to tabulator
		    },
		    columns:[
		        {title:"NO", field:"spp_idx", sorter:"int", width:80,
		        	hozAlign:"center"},
		        {title:"매입처", field:"spp_purchase", sorter:"string", width:120,
			        hozAlign:"center"},	
			    {title:"품번", field:"spp_no", sorter:"string", width:120,
				    hozAlign:"center"},     
				{title:"품명", field:"spp_name", sorter:"string", width:120,
				    hozAlign:"center"}, 
				{title:"규격", field:"spp_gyu", sorter:"string", width:150,
				    hozAlign:"center"}, 
		        {title:"교체주기", field:"spp_yong", sorter:"string", width:120,
		        	hozAlign:"center"},		        
		        {title:"적정재고", field:"spp_proper", sorter:"int", width:100,
		        	hozAlign:"center"},
		        {title:"비고", field:"spp_bigo", sorter:"string", width:100,
		        	hozAlign:"center"},
		        {title:"입고", field:"sph_input", sorter:"int", width:100,
			        hozAlign:"center"},	
		        {title:"수리출고", field:"sph_suriout", sorter:"int", width:100,
		        	hozAlign:"center"},  	
		        {title:"자산출고", field:"sph_jasanout", sorter:"int", width:100,
			        hozAlign:"center"},	
			    {title:"현재고", field:"spp_jaigo", sorter:"int", width:100,
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
    
    
    <script>
		
 	// 드래그 기능 추가
	const modal = document.querySelector('.spareModal');
	const header = document.querySelector('.header'); // 헤더를 드래그할 요소로 사용

	header.addEventListener('mousedown', function(e) {
		// transform 제거를 위한 초기 위치 설정
		const rect = modal.getBoundingClientRect();
		modal.style.left = rect.left + 'px';
		modal.style.top = rect.top + 'px';
		modal.style.transform = 'none'; // 중앙 정렬 해제

		let offsetX = e.clientX - rect.left;
		let offsetY = e.clientY - rect.top;

		function moveModal(e) {
			modal.style.left = (e.clientX - offsetX) + 'px';
			modal.style.top = (e.clientY - offsetY) + 'px';
		}

		function stopMove() {
			window.removeEventListener('mousemove', moveModal);
			window.removeEventListener('mouseup', stopMove);
		}

		window.addEventListener('mousemove', moveModal);
		window.addEventListener('mouseup', stopMove);
	});
		

	// 모달 열기
	const insertButton = document.querySelector('.insert-button');
	const spareModal = document.querySelector('.spareModal');
	const closeButton = document.querySelector('.close');

	insertButton.addEventListener('click', function() {
		spareModal.style.display = 'block'; // 모달 표시
	});

	closeButton.addEventListener('click', function() {
		spareModal.style.display = 'none'; // 모달 숨김
	});
		


    </script>

	</body>
</html>
