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
.jgInsertModal {
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
    height: 690px; /* 세로 길이 고정 */
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
	
	<div class="jgInsertModal">
	   <div id="editPop">
	   	<div class="header">설비점검기준등록</div>
            <div class="detail">
                <table cellspacing="0" cellpadding="0" width="100%">
                    <tbody><tr>
                        <td>
                            <table cellspacing="0" cellpadding="0" width="100%" class="insideTable">
                                <colgroup span="2">
                                    <col width="20%">
                                    <col width="80%">
                                </colgroup>
                                <tbody><tr>
                                    <th>설비그룹</th>
                                    <td>
                                        <input id="CHS_NO" name="chs_no" class="basic" type="text" style="width:96%;" value="" readonly="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>설비</th>
                                    <td>
                                        
                                            
                                                <input id="FAC_CODE" name="fac_code" class="basic" type="hidden" style="width:83%;" value="">
                                                <input id="FAC_NAME" name="fac_name" class="basic" type="text" style="width:83%;" value="" disabled="">
                                            
                                            
                                        
    
                                        <input type="button" title="검색" class="btnSearchSmall" onclick="MM_openBrWindow2('fa_facstd_faclityList','Srch','width=680,height=350,scrollbars=yes')">
                                    </td>
                                </tr>
    
                                <tr>
                                    <th>설비번호</th>
                                    <td>
                                        <input id="FAC_NO" name="fac_no" class="basic" type="text" style="width:96%;" value="" disabled="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>순번</th>
                                    <td><input id="CHS_SORT" name="chs_sort" class="basic" type="text" style="width:96%;" value=""></td>
                                </tr>
                                <tr>
                                    <th>점검주기</th>
                                    <td>
                                        <select id="CHS_GUBN" name="chs_gubn" style="width:98%;">
                                            <option>일상</option>
                                            <option>주간</option>
                                            <option>월간</option>
                                            <option>분기</option>
                                            <option>반기</option>
                                            <option>수시</option>
                                            <option>공정순회</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>구분</th>
                                    <td>
                                        <select id="CHS_GUBN_DETAIL" style="width:98%;">
                                            <option>주간</option>
                                            <option>야간</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>점검항목</th>
                                    <td><input id="CHS_HANG" name="chs_hang" class="basic" type="text" style="width:96%;" value=""></td>
                                </tr>
                                <tr>
                                    <th>기준방법</th>
                                    <td><input id="CHS_KIJUN" name="chs_kijun" class="basic" type="text" style="width:96%;" value=""></td>
                                </tr>
                                <tr>
                                    <th>하한</th>
                                    <td><input id="CHS_MIN" name="chs_min" class="basic" type="text" style="width:96%;" value=""></td>
                                </tr>
                                <tr>
                                    <th>상한</th>
                                    <td><input id="CHS_MAX" name="chs_max" class="basic" type="text" style="width:96%;" value=""></td>
                                </tr>
                                <tr>
                                    <th>단위</th>
                                    <td><input id="CHS_DANW" name="chs_dawn" class="basic" type="text" style="width:96%;" value=""></td>
                                </tr>
                                <tr>
                                    <th>점검방법</th>
                                    <td><input id="CHS_CHKMETHOD" name="chs_chkmethod" class="basic" type="text" style="width:96%;" value=""></td>
                                </tr>
                                <tr>
                                    <th>조치방법</th>
                                    <td><input id="CHS_STEPMETHOD" name="chs_stepmethod" class="basic" type="text" style="width:96%;" value=""></td>
                                </tr>
                                <tr>
                                    <th>이미지</th>
                                    <td>
                                        <input id="CHS_IMG" name="chs_img" type="file" style="width:96%;" value="" accept="image/*">
    
                                    </td>
                                </tr>
    
                            </tbody></table>
                        </td>
                    </tr>
                </tbody></table>
            </div>
    
            <div class="clear"></div>
            <!-- Article List.end -->
    
            <div class="popBottomSec">
    
                        
                            
                            <div class="btnPopBottom" style="width:410px;">
                                <ul>
    
                                    <li><input class="btnPopSave" type="button" title="저장" onclick="requestAjax('fa_facstd_insert');"></li>
                                    <li><input class="btnPopCancel" type="button" title="취소" onclick="window.close();"></li>
                                </ul>
                            </div>
    
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
	const modal = document.querySelector('.jgInsertModal');
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
	const jgInsertModal = document.querySelector('.jgInsertModal');
	const closeButton = document.querySelector('.close');

	insertButton.addEventListener('click', function() {
		jgInsertModal.style.display = 'block'; // 모달 표시
	});

	closeButton.addEventListener('click', function() {
		jgInsertModal.style.display = 'none'; // 모달 숨김
	});
		


    </script>

	</body>
</html>
