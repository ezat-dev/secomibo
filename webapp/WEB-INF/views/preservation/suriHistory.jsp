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
.suriHistoryModal {
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
    height: 660px; /* 세로 길이 고정 */
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

.basic, .rp-input {
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
	    
	    
 <div class="suriHistoryModal">    
  <div class="detail">
   <div class="header">
   		설비수리이력
   </div>
    <table cellspacing="0" cellpadding="0" width="100%">
        <tbody>
            <tr>
                <td class="">
                    <table cellspacing="0" cellpadding="0" width="100%" class="insideTable">
                        <colgroup span="4">
                            <col width="*">
                            <col width="30%">
                            <col width="*">
                            <col width="30%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th class="left" style="width: 15%;">설비</th>
                                <td class="">
                                    <select id="facCode" name="fac_code" class="basic" style="width:80%;">
                                        <option value="5">고주파 1호기(폐기):(5)</option>
                                        <option value="6">고주파 2호기 (폐기):(6)</option>
                                        <option value="9">고주파 5호기:(9)</option>
                                        <option value="21">급수시설:(21)</option>
                                        <option value="10">변성로 1호기:(10)</option>
                                        <option value="11">변성로 2호기:(11)</option>
                                        <option value="12">쇼트 1호기:(12)</option>
                                        <option value="13">쇼트 2호기:(13)</option>
                                        <option value="14">쇼트 3호기:(14)</option>
                                        <option value="19">쇼트 4호기:(19)</option>
                                        <option value="20">전기시설:(20)</option>
                                        <option value="15">진공세정기 2호기:(15)</option>
                                        <option value="1">침탄로 1호기:(1)</option>
                                        <option value="2">침탄로 2호기:(2)</option>
                                        <option value="3">침탄로 3호기:(3)</option>
                                        <option value="4">침탄로 4호기:(4)</option>
                                        <option value="18">침탄로 5호기:(18)</option>
                                        <option value="22">콤프레샤:(22)</option>
                                        <option value="16">템퍼링기 1호기:(16)</option>
                                        <option value="17">템퍼링기 2호기:(17)</option>
                                    </select>
                                </td>
                                <th rowspan="3" class="" style="width: 15%;">수리전 사진<span class="left"></span></th>
                                <td rowspan="3" class="findImage">
                                    <input type="hidden" name="type" value="run">
                                    <input type="file" name="imageFile1" title="이미지 찾기" onchange="previewImage(this,'previewId')">
                                    <div class="imgArea" id="previewId" style="height:100px;"></div>
                                </td>
                            </tr>
                            <tr>
                                <th class="left" style="width: 15%;">일자</th>
                                <td class=""><input id="ffxDate" name="ffx_date" class="date js-datepicker hasDatepicker" type="text" style="width:100px;" value="2025-03-26" maxlength="20" size="20" readonly="readonly"></td>
                            </tr>
                            <tr>
                                <th class="left" style="width: 15%;">내용</th>
                                <td class=""><textarea id="ffxNote" name="ffx_note" rows="8" class="basic" style="width:100%;"></textarea></td>
                            </tr>
                            <tr>
                                <th class="left" style="width: 15%;">소요부품<input type="button" title="검색" class="btnSearchSmall" onclick="MM_openBrWindow('etcSub_popup_12','Srch','width=800,height=430,scrollbars=yes')"></th>
                                <td>
                                    <input id="ffxPrt" name="ffx_prt" class="basic" type="text" style="width:100%;" value="" readonly="readonly" placeholder="검색버튼을 눌러 선택해 주세요.">
                                    <input id="sprCode" name="spr_code" class="basic" type="hidden">
                                    <input id="sprTime" name="spr_time" class="basic" type="hidden">
                                </td>
                                <th rowspan="4" class="" style="width: 15%;">수리후 사진</th>
                                <td rowspan="4" class="findImage">
                                    <input type="hidden" name="type" value="run">
                                    <input type="file" name="imageFile2" title="이미지 찾기" onchange="previewImage(this,'previewId2')">
                                    <div class="imgArea" id="previewId2" style="height:100px;"></div>
                                </td>
                            </tr>
                            <tr>
                                <th class="left" style="width: 15%;">수리처</th>
                                <td class=""><input id="ffxWrk" name="ffx_wrk" class="basic" type="text" style="width:100%;" value=""></td>
                            </tr>
                            <tr>
                                <th class="left" style="width: 15%;">수리비용</th>
                                <td class="">
                                    <input id="ffxEvt" name="ffx_evt" class="basic" type="hidden" style="width:100%;" value="">
                                    <input id="ffxTime" name="ffx_time" class="basic" type="hidden" style="width:100%;" value="">
                                    <input id="ffxEnd" name="ffx_end" class="basic" type="hidden" style="width:100%;" value="">
                                    <input id="ffxCost" name="ffx_cost" class="basic" type="text" style="width:100%;" value="">
                                </td>
                            </tr>
                            <tr>
                                <th class="left" style="width: 15%;">담당자</th>
                                <td class="">
                                    <select id="ffxMan" name="ffx_man" class="basic" style="width:100px;">
                                        <option value="admin">admin:(0)</option>
                                        <option value="정중환">정중환:(2)</option>
                                        <option value="김성우">김성우:(4)</option>
                                        <option value="조병수">조병수:(5)</option>
                                        <option value="이용희">이용희:(7)</option>
                                        <option value="외국인전용ID">외국인전용ID:(9)</option>
                                        <option value=".">.:(10)</option>
                                        <option value="이은영">이은영:(12)</option>
                                        <option value=".">.:(13)</option>
                                        <option value="두사르(이전등록)">두사르(이전등록):(14)</option>
                                        <option value=".">.:(15)</option>
                                        <option value="피안트(퇴사)">피안트(퇴사):(16)</option>
                                        <option value="라시크 (퇴사)">라시크 (퇴사):(17)</option>
                                        <option value="자리드(퇴사)">자리드(퇴사):(18)</option>
                                        <option value="김희관(퇴사)">김희관(퇴사):(19)</option>
                                        <option value="박영훈(퇴사)">박영훈(퇴사):(20)</option>
                                        <option value="김동우(퇴사)">김동우(퇴사):(21)</option>
                                        <option value="전광석(퇴사)">전광석(퇴사):(22)</option>
                                        <option value="기한(퇴사)">기한(퇴사):(23)</option>
                                        <option value="배정은(퇴사)">배정은(퇴사):(24)</option>
                                        <option value="산지와">산지와:(26)</option>
                                        <option value="마메쉬(퇴사)">마메쉬(퇴사):(27)</option>
                                        <option value="두민드(퇴사)">두민드(퇴사):(28)</option>
                                        <option value="황윤민(퇴사)">황윤민(퇴사):(29)</option>
                                        <option value="조성환(퇴사)">조성환(퇴사):(30)</option>
                                        <option value="이주영">이주영:(31)</option>
                                        <option value="가얀">가얀:(32)</option>
                                        <option value="스푼(퇴사)">스푼(퇴사):(33)</option>
                                        <option value="남태욱(퇴사)">남태욱(퇴사):(34)</option>
                                        <option value="니산타(퇴사)">니산타(퇴사):(35)</option>
                                        <option value="두사르">두사르:(36)</option>
                                        <option value="피얀타">피얀타:(37)</option>
                                        <option value="사미라(퇴사)">사미라(퇴사):(38)</option>
                                        <option value="민학기( 퇴사)">민학기( 퇴사):(39)</option>
                                        <option value="김영수">김영수:(40)</option>
                                        <option value="패툼">패툼:(41)</option>
                                        <option value="응웬티하">응웬티하:(42)</option>
                                        <option value="양수석">양수석:(43)</option>
                                        <option value="최균홍">최균홍:(44)</option>
                                        <option value="정희주">정희주:(45)</option>
                                        <option value="장무강">장무강:(46)</option>
                                        <option value="">:(47)</option>
                                        <option value="">:(48)</option>
                                        <option value="123">123:(49)</option>
                                        <option value="22">22:(50)</option>
                                        <option value="">:(51)</option>
                                        <option value="123123">123123:(52)</option>
                                        <option value="ㅁㅁㅁ">ㅁㅁㅁ:(53)</option>
                                    </select>
                                </td>
                            </tr>
                            <!-- <tr>
                                <td class=""></td>
                                <td class=""></td>
                                <td class=""></td>
                                <td class=""></td>
                            </tr> -->
                            <tr>
                                <th class="left">차기점검일</th>
                                <td class=""><input id="ffxNext" name="ffx_next" class="date js-datepicker hasDatepicker" type="text" style="width:100px;" value="2025-03-26" maxlength="20" size="20"></td>
                            </tr>
                            <tr>
                                <th>완료</th>
                                <td><input id="ffxCheck" name="ffx_check" class="basic" type="checkbox" value="" onchange="nextFfxDate(this);"></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
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
	const modal = document.querySelector('.suriHistoryModal');
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
	const suriHistoryModal = document.querySelector('.suriHistoryModal');
	const closeButton = document.querySelector('.close');

	insertButton.addEventListener('click', function() {
		suriHistoryModal.style.display = 'block'; // 모달 표시
	});

	closeButton.addEventListener('click', function() {
		suriHistoryModal.style.display = 'none'; // 모달 숨김
	});
		


    </script>

	</body>
</html>
