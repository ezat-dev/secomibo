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
.gojangModal {
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
    width: 700px; /* 가로 길이 고정 */
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
	
	
	<div class="gojangModal">
	<div class="header">측정기기고장이력</div>    
	 <form name="searchForm" method="post" enctype="multipart/form-data">
        <div id="editPop">
    
            <!-- Article List -->
    
            <div class="detail">
                <table cellspacing="0" cellpadding="0" width="100%">
                    <tbody><tr>
                        <td>
                            <table cellspacing="0" cellpadding="0" width="100%" class="insideTable">
    
                                <colgroup span="4">
                                    <col width="10%">
                                    <col width="40%">
                                    <col width="10%">
                                    <col width="40%">
                                </colgroup>
                                <tbody><tr>
                                    <th class="left">측정기기</th>
                                    <td>
                                        <select id="TER_CODE" name="ter_code" class="form-control rp-input" style="width:102%;">
                                            
                                                <option value="1">로크웰경도기</option>
                                            
                                                <option value="2">비커스경도기</option>
                                            
                                        </select>
                                    </td>
                                    <th class="left">수리시작시간</th>
                                    <td>
                                        <input type="text" class="form-control rp-input js-datepicker js-date-now hasDatepicker" id="TERR_STRT" name="terr_strt" value="" placeholder="0000-00-00" style="width:50%;">
    
                                        
                                            
                                            
                                                <input type="text" class="form-control rp-input" id="TERR_STRT_h" name="terr_strt_h" placeholder="00" value="0" style="width:10%; text-align: center;">시
                                                <input type="text" class="form-control rp-input" id="TERR_STRT_mm" name="terr_strt_mm" placeholder="00" value="0" style="width:10%; text-align: center;">분
                                                <input type="text" class="form-control rp-input" id="TERR_STRT_ss" name="terr_strt_ss" placeholder="00" value="0" style="width:10%; text-align: center;">초
                                            
                                            
                                        </td>
                                </tr>
                                <tr>
                                    <th class="left">확인자</th>
                                    <td>
                                        <select id="TERR_CHKMAN" name="terr_chkman" class="basic rp-input" style="width:102%;">
                                            
                                                <option value="0">admin</option>
                                            
                                                <option value="2">정중환</option>
                                            
                                                <option value="5">조병수</option>
                                            
                                                <option value="12">이은영</option>
                                            
                                                <option value="7">이용희</option>
                                            
                                                <option value="26">산지와</option>
                                            
                                                <option value="31">이주영</option>
                                            
                                                <option value="32">가얀</option>
                                            
                                                <option value="36">두사르</option>
                                            
                                                <option value="41">패툼</option>
                                            
                                                <option value="42">응웬티하</option>
                                            
                                                <option value="44">최균홍</option>
                                            
                                                <option value="45">정희주</option>
                                            
                                                <option value="37">피얀타</option>
                                            
                                                <option value="4">김성우</option>
                                            
                                                <option value="9">외국인전용ID</option>
                                            
                                                <option value="46">장무강</option>
                                            
                                                <option value="40">김영수</option>
                                            
                                        </select>
                                    </td>
                                    <th class="left">수리종료시간</th>
                                    <td>
    
                                        <input type="text" class="form-control rp-input js-datepicker js-date-now hasDatepicker" id="TERR_END" name="terr_end" value="" placeholder="0000-00-00" style="width:50%;">
                                        
                                            
                                            
                                                <input type="text" class="form-control rp-input" id="TERR_END_h" name="terr_end_h" placeholder="00" value="0" style="width:10%; text-align: center;">시
                                                <input type="text" class="form-control rp-input" id="TERR_END_mm" name="terr_end_mm" placeholder="00" value="0" style="width:10%; text-align: center;">분
                                                <input type="text" class="form-control rp-input" id="TERR_END_ss" name="terr_end_ss" placeholder="00" value="0" style="width:10%; text-align: center;">초
    
                                    </td>
                                </tr>
    
                                <tr>
                                    <th class="left">고장일시</th>
                                    <td>
                                        <input type="text" class="form-control rp-input" id="TERR_DATE" name="terr_date" value="" placeholder="0000-00-00" style="width:101%;">
                                    </td>
                                    <th class="left">수리시간</th>
                                    <td>
                                        <input type="text" class="form-control rp-input" id="TERR_TIME" name="terr_time" value="" style="width:101%;" disabled="">
                                        <input type="text" class="form-control rp-input hidden" id="TERR_CODE" name="terr_code" value="-1" style="width:101%;">
                                    </td>
                                </tr>
                                <tr>
                                    <th class="left">상태</th>
                                    <td>
                                        <select id="TERR_CONDI" name="terr_condi" class="basic rp-input" style="width:102%;">
                                            <option>가동</option>
                                            <option>비가동</option>
                                        </select>
                                    </td>
                                    <th class="left">수리자</th>
                                    <td>
                                        <input type="text" class="form-control rp-input" id="TERR_MAN" name="terr_man" value="" style="width:101%;">
                                    </td>
                                </tr>
                                <tr>
                                    <th class="left">소요비용</th>
                                    <td>
                                        <input type="text" class="basic rp-input" onchange="getNumber(this);" onkeyup="getNumber(this);" id="TERR_COST" name="terr_cost" value="" style="text-align:right; width:100%;">
                                    </td>
                                    <th class="left">수리</th>
                                    <td>
                                        <select id="TERR_SURI" name="terr_suri" class="basic rp-input" style="width:102%;">
                                            <option>수리</option>
                                            <option>완료</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="left">고장현상</th>
                                    <td>
                                        <textarea type="text" class="basic rp-input" rows="2" id="TERR_REWARD" name="terr_reward" style="width:100%;"></textarea>
                                    </td>
                                    <th class="left">수리내용</th>
                                    <td>
                                        <textarea type="text" class="basic rp-input" rows="2" id="TERR_CONTENT" name="terr_content" style="width:100%;"></textarea>
                                    </td>
                                </tr><tr>
                                    <th class="left">비고</th>
                                    <td colspan="4">
                                        <textarea type="text" class="basic rp-input" rows="5" id="TERR_BIGO" name="terr_bigo" style="width:100%; height: 100px;"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="left">수리전사진</th>
                                    <td>
                                                <input id="TERR_BPHOTO" name="terr_bphoto" type="file" class="rp-input" onchange="rpReadImageURL(this); $(this).parent().find('img').removeClass('rp-file-del');" style="float:left;width: 220px;">
                                                <button onclick="imageDelete(this)" style="float:left">X</button><br><br>
                                                <img id="TERR_BPHOTO_BEFORE" name="terr_bphoto_before" height="220" width="100%" align="center" src="files/facstd/?" style="display: none;">
                                            
                                    </td>
                                    <th class="left">수리후사진</th>
                                    <td>
                                                <input id="TERR_APHOTO" name="terr_aphoto" type="file" class="rp-input" onchange="rpReadImageURL(this); $(this).parent().find('img').removeClass('rp-file-del');" style="float:left;width: 220px;">
                                                <button onclick="imageDelete(this)" style="float:left">X</button><br><br>
                                                <img id="TERR_APHOTO_AFTER" name="terr_aphoto_after" height="220" width="100%" align="center" src="files/facstd/?" style="display: none;">
                                            
                                    </td>
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
    
    </form>
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
	const modal = document.querySelector('.gojangModal');
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
	const gojangModal = document.querySelector('.gojangModal');
	const closeButton = document.querySelector('.close');

	insertButton.addEventListener('click', function() {
		gojangModal.style.display = 'block'; // 모달 표시
	});

	closeButton.addEventListener('click', function() {
		gojangModal.style.display = 'none'; // 모달 숨김
	});
		


    </script>

	</body>
</html>
