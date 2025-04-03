<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설비비가동등록</title>
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
.begaInsertModal {
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
.detail {
    background: #ffffff;
    border: 1px solid #000000;
    width: 800px; /* 가로 길이 고정 */
    height: 630px; /* 세로 길이 고정 */
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

.imgArea {
    width: 200px; /* 이미지 영역 너비 */
    height: 150px; /* 이미지 영역 높이 */
    border: 1px solid #ddd; /* 경계선 */
    margin-bottom: 10px; /* 하단 여백 */
}

.imgArea img {
    width: 100%; /* 이미지 너비 */
    height: 100%; /* 이미지 높이 */
    object-fit: cover; /* 이미지 비율 유지 */
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
	</main>
	    
	    
  <div class="begaInsertModal">	
	<div class="detail">
			<div class="header">
				설비비가동등록
			</div>
                <table cellspacing="0" cellpadding="0" width="100%">
                    <tbody><tr>
                        <td class="">
                            <table cellspacing="0" cellpadding="0" width="100%" class="insideTable">
                                <colgroup span="4">
                                    <col width="*">
                                    <col width="40%">
                                    <col width="*">
                                    <col width="40%">
                                </colgroup>
                                <tbody><tr>
                                    <th class="left">설비</th>
                                    <td class="">
                                        <input id="facCode" name="fac_code" class="basic" type="hidden" style="width:50%;" value="" readonly="readonly"> 
                                        <input id="facName" name="fac_name" class="basic" type="text" style="width:50%;" value="" readonly="readonly">
                                        <input type="button" title="검색" class="btnSearchSmall" onclick="MM_openBrWindow('etcSub_popup_10','Srch','width=800,height=630,scrollbars=yes')"></td>
                                    <th rowspan="7" class=""><span class="left">설비중지시간(분)</span></th>
                                    <td rowspan="7" class="">
                                        <table cellspacing="0" cellpadding="0" width="100%" class="insideTable">
                                            <tbody><tr>
                                                <th class="thSub">ITEM변경</th>
                                                <td class="tdRight"><input id="fstp01" name="fstp_01" class="basic" type="text" style="width:100%;" value="0" onchange="calcSum()"></td>
                                                </tr>
                                            <tr>
                                                <th class="thSub">물량부족</th>
                                                <td class="tdRight"><input id="fstp02" name="fstp_02" class="basic" type="text" style="width:100%;" value="0" onchange="calcSum()"></td>
                                                </tr>
                                            <tr>
                                                <th class="thSub">설비이상(기계)</th>
                                                <td class="tdRight"><input id="fstp03" name="fstp_03" class="basic" type="text" style="width:100%;" value="0" onchange="calcSum()"></td>
                                                </tr>
                                            <tr>
                                                <th class="thSub">설비이상(전기)</th>
                                                <td class="tdRight"><input id="fstp04" name="fstp_04" class="basic" type="text" style="width:100%;" value="0" onchange="calcSum()"></td>
                                                </tr>
                                            <tr>
                                                <th class="thSub">교육</th>
                                                <td class="tdRight"><input id="fstp05" name="fstp_05" class="basic" type="text" style="width:100%;" value="0" onchange="calcSum()"></td>
                                            </tr>
                                            <tr>
                                                <th class="thSub">교대</th>
                                                <td class="tdRight"><input id="fstp06" name="fstp_06" class="basic" type="text" style="width:100%;" value="0" onchange="calcSum()"></td>
                                            </tr>
                                            <tr>
                                                <th class="thSub">식사</th>
                                                <td class="tdRight"><input id="fstp07" name="fstp_07" class="basic" type="text" style="width:100%;" value="0" onchange="calcSum()"></td>
                                            </tr>
                                            <tr>
                                                <th class="thSub">휴식</th>
                                                <td class="tdRight"><input id="fstp08" name="fstp_08" class="basic" type="text" style="width:100%;" value="0" onchange="calcSum()"></td>
                                            </tr>
                                            <tr>
                                                <th class="thSub">기타</th>
                                                <td class="tdRight"><input id="fstp09" name="fstp_09" class="basic" type="text" style="width:100%;" value="0" onchange="calcSum()"></td>
                                                </tr>
                                            <tr>
                                                <th class="thSub">계</th>
                                                <td class="tdRight"><input id="fstp10" name="fstp_10" class="basic" type="text" style="width:100%;" value="0" readonly="readonly"></td>
                                            </tr>
                                        </tbody></table>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="left">일자</th>
                                    <td class=""><input id="fstpDate" name="fstp_date" class="date js-datepicker hasDatepicker" type="text" style="width:100px;" value="2025-03-26" maxlength="20" size="20" readonly="readonly"></td>
                                    </tr>
                                <tr>
                                    <th class="">계힉시간(분)</th>
                                    <td class=""><input id="fstpPlan" name="fstp_plan" class="basic" type="text" style="width:100%;" value="1440"></td>
                                    </tr>
                                <tr>
                                    <th class="">투입시간(분)</th>
                                    <td class=""><input id="fstpTu" name="fstp_tu" class="basic" type="text" style="width:100%;" value="1440"></td>
                                    </tr>
                                <tr>
                                    <th class="">준비시간(분)</th>
                                    <td class=""><input id="fstpStby" name="fstp_stby" class="basic" type="text" style="width:100%;" value="" onchange="calcSum()"></td>
                                </tr>
                                <tr>
                                    <th class="left">TOTAL현황</th>
                                    <td class="">
                                        <table cellspacing="0" cellpadding="0" width="100%" class="insideTable">
                                            <tbody><tr>
                                                <th class="thSub">실가동시간(분)</th>
                                                <td class="tdRight"><input id="fstpSil" name="fstp_sil" class="basic" type="text" style="width:100%;" value="" readonly="readonly"></td>
                                                </tr>
                                            <tr>
                                                <th class="thSub">인원</th>
                                                <td class="tdRight"><input id="fstpMan" name="fstp_man" class="basic" type="text" style="width:100%;" value="" onchange="calcSum()"></td>
                                                </tr>
                                            <tr>
                                                <th class="thSub">M-Hr</th>
                                                <td class="tdRight"><input id="fstpMhr" name="fstp_mhr" class="basic" type="text" style="width:100%;" value="" readonly="readonly"></td>
                                            </tr>
                                        </tbody></table>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="left">비고</th>
                                    <td valign="top" class=""><textarea name="fstp_bigo" class="basic" style="width:100%; height:40px;"></textarea></td>
                                </tr>
                                <tr>
                                    <td class=""></td>
                                    <td class=""></td>
                                    <td class=""></td>
                                    <td class=""></td>
                                </tr>
                            </tbody></table>
                        </td>
                        </tr>
                </tbody></table>
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
    
    
    <script>
		
 	// 드래그 기능 추가
	const modal = document.querySelector('.begaInsertModal');
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
	const begaInsertModal = document.querySelector('.begaInsertModal');
	const closeButton = document.querySelector('.close');

	insertButton.addEventListener('click', function() {
		begaInsertModal.style.display = 'block'; // 모달 표시
	});

	closeButton.addEventListener('click', function() {
		begaInsertModal.style.display = 'none'; // 모달 숨김
	});
		


    </script>

	</body>
</html>
