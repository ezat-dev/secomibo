<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>부적합등록</title>
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
.nonModal {
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
    width: 1300px; /* 가로 길이 고정 */
    height: 720px; /* 세로 길이 고정 */
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
.box1 {
	display: flex;
	justify-content: right;
	align-items: center;
	width: 1500px;
	margin-left: -310px;
}

.box1 input[type="text"]{
	width : 5%;
}
.box1 input[type="date"]{
	width : 7%;
}
.box1 select{
	width: 5%
}


    
    </style>
    
    
    <body>
    
    <div class="tab">
    <div class="box1">
         <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
        
		<label class="daylabel">기간 : </label>
		<input type="date" class="sdate" id="sdate" style="font-size: 16px;" autocomplete="off"> ~ 
		<input type="date" class="edate" id="edate" style="font-size: 16px;" autocomplete="off">
		
			
	</div>
    
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
	    
	<div class="nonModal">    
	 <form name="searchForm" method="post" enctype="multipart/form-data">	
            <div id="editPop">
            	<div class="header">
            			부적합등록
            	</div>
                
                <!-- Article List1 -->
                <div class="section1">
                    <div class="subTitle">
                        <div class="h3">기본정보</div></div>
                    <div class="detail">
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
                                            <th class="left">거래처</th>
                                            <td class=""><input id="corpName" class="basic" type="text" style="width:60%;" value="" name="corp_name" readonly=""> <input type="button" value="검색" onclick="MM_openBrWindow('etcSub_popup_14?startDate=2025-03-25&amp;endDate=2025-03-25','Srch','width=950,height=830,scrollbars=yes')" class="btnSearchSmall"></td>
                                            <th class="">품명</th>
                                            <td class=""><input id="prodName" class="basic" type="text" style="width:90%;" value="" name="prod_name" readonly=""></td>
                                        </tr>
                                        <tr>
                                            <th class="">품번</th>
                                            <td class=""><input id="prodNo" class="basic" type="text" style="width:90%;" value="" name="prod_no" readonly=""></td>
                                            
                                            <th hidden="" class="">LOT No</th>
                                            <td hidden="" class=""><input id="werrLot" class="basic" type="text" style="width:90%;" value="" name="werr_lot" readonly=""></td>
                                        </tr>
                                        <tr>
                                            <th class="">작성일자</th>
                                            <td class=""><input id="werrDate" class="date js-datepicker hasDatepicker" type="date" style="width:100px;" value="2025-03-25" maxlength="20" size="20" name="werr_date" readonly=""></td>
                                            
                                            <th hidden="" class="">관리번호</th>
                                            <td hidden="" class=""><input id="werrYu" class="basic" type="text" style="width:90%;" value="" name="werr_yu" readonly=""></td>
                                            
                                            <th class="">금액</th>
                                            <td class=""><input id="werrMon" class="basic" type="text" style="width:90%;" value="" name="werr_mon"></td>
                                        </tr>
                                        <tr>
                                            <th class="">발생일자</th>
                                            <td class=""><input id="werrWdate" class="date js-datepicker hasDatepicker" type="text" style="width:100px;" value="" maxlength="20" size="20" name="werr_wdate" readonly=""></td>
                                            <th class="">열처리LOT</th>
                                            <td class=""><input id="techTe" class="basic" type="text" style="width:90%;" value="" name="tech_te" readonly=""></td>
                                        </tr>
                                        <tr>
                                            <th class="">발생자</th>
                                            <td class=""><input id="werrUser" class="basic" type="text" style="width:90%;" value="" name="werr_user"></td>
                                            <th class="">보고자</th>
                                            <td class=""><input id="werrRep" class="basic" type="text" style="width:90%;" value="admin" name="werr_rep"></td>
                                        </tr>
                                        <tr>
                                            <th class="">생산수량</th>
                                            <td class=""><input id="werrAmnt" class="basic" type="text" style="width:90%;" value="" name="werr_amnt"></td>
                                            <th class="">설비</th>
                                            <td class="">
                                            <input id="facName" class="basic" type="text" style="width:90%;" value="" name="fac_name" readonly=""></td>
                                            <input id="ilboCode" class="basic" type="hidden" style="width:90%;" value="" name="ilbo_code" readonly="">
                                            <input id="ilboNo" class="basic" type="hidden" style="width:90%;" value="" name="ilbo_no" readonly="">
                                            <input id="werrCode" class="basic" type="hidden" style="width:90%;" value="" name="werr_code" readonly="">
                                        </tr>
                                    </tbody></table>
                                </td>
                                </tr>
                        </tbody></table>
                    </div>
                </div>
                <div class="clear"></div>
                <!-- Article List1.end -->
            
                <!-- Article List2 -->
                <div class="subTitle">
                    <div class="h3">불량정보</div></div>
                    
                <div class="detail">				
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
                                           <th class="">알림</th>
                                           <td class="">
                                               <input type="checkbox" id="werrAlert" name="werr_alert" checked="checked" class="">
                                           </td>
                                           <th class="">부서</th>
                                           <td class="">
                                            <select id="werrBuso" name="werr_buso" class="basic" style="width: 100%" value="">									
                                                
                                                    <option value="" selected="selected"></option>
                                                  
                                                    <option value="123" selected="selected">123</option>
                                                  
                                                    <option value="123123" selected="selected">123123</option>
                                                  
                                                    <option value="22" selected="selected">22</option>
                                                  
                                                    <option value="관리" selected="selected">관리</option>
                                                  
                                                    <option value="ㅁㅁㅁ" selected="selected">ㅁㅁㅁ</option>
                                                  
                                                    <option value="생산" selected="selected">생산</option>
                                                  
                                                    <option value="생산관리" selected="selected">생산관리</option>
                                                  
                                                    <option value="생산팀" selected="selected">생산팀</option>
                                                  
                                                    <option value="영업" selected="selected">영업</option>
                                                  
                                                    <option value="영업팀" selected="selected">영업팀</option>
                                                  
                                                    <option value="퇴사" selected="selected">퇴사</option>
                                                  
                                                    <option value="품질" selected="selected">품질</option>
                                                  
                                                    <option value="품질팀" selected="selected">품질팀</option>
                                                  
                                            </select>	
                                       </td>
                                    </tr>
                                    <tr>
                                        
                                        
                                        <th class="">불량구분</th>
                                        <td class="">
                                            <select class="basic" id="werrGubn" name="werr_gubn" style="width:100px;">												
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
                                            <select class="basic" id="werrinOutGubn" name="werrin_out_gubn" style="width:100px;">												
                                                <option selected="selected">사내</option>
                                                <option>사외</option>
                                            </select>
                                        </td>
                                        <th rowspan="3" class="">개선전</th>
                                        <td rowspan="3" class="findImage"><input type="hidden" name="type" value="error">
                                            <input type="file" name="imageFile1" title="이미지 찾기" onchange="previewImage(this,'previewId1')">
                                            <div class="imgArea" id="previewId1" style="height:168px;"><img id="prev_previewId1" src="/resources/images/noimage_01.gif" width="100%" height="100%"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="">불량내용</th>
                                        <td class=""><textarea name="werr_gnote" id="werrGnote" class="basic" style="width:90%; height:80px;"></textarea></td>
                                        </tr>
                                    <tr>
                                        <th class="">발생원인 및 <br>원인분석</th>
                                        <td class=""><textarea name="werr_case" id="werrCase" class="basic" style="width:90%;; height:80px;"></textarea></td>
                                        </tr>
                                    <tr>
                                        <th class="">조치구분</th>
                                        <td class="">
                                            <select class="basic" id="werrJgubn" name="werr_jgubn" style="width:100px;">												
                                                <option>재작업</option>
                                                <option>폐기</option>
                                                <option>업체통보후납품</option>
                                                <option>별도관리(보관)</option>
                                                <option>기타</option>
                                            </select>
                                        </td>
                                        <th rowspan="3" class="">개선후</th>
                                        <td rowspan="3" class="findImage"><input type="hidden" name="type" value="error">
                                            <input type="file" name="imageFile2" title="이미지 찾기" onchange="previewImage(this,'previewId2')">
                                            <div class="imgArea" id="previewId2" style="height:168px;"><img id="prev_previewId2" src="/resources/images/noimage_01.gif" width="100%" height="100%"></div>
                                        </td>
                                        </tr>
                                    <tr>
                                        <th class="">대책수립 및<br>
                                           	 대책실시</th>
                                        <td class=""><textarea name="werr_jnote" id="werrJnote" class="basic" style="width:90%; height:200px;"></textarea>
                                        <input type="file" name="werr_fname" id="werrFname" title="파일 첨부" onchange="">
                                        <!-- <input type="button" value="X" onclick=""> -->
                                        </td>
                                        </tr>
                                    <!-- <tr>
                                        <th class="">결과분석 및<br />
                                            사후관리</th>
                                        <td class=""><textarea name="werrNote" id="werrNote" class="basic" style="width:100%; height:80px;"></textarea></td>
                                        </tr> -->
                                </tbody></table>
                            </td>
                            </tr>
                    </tbody></table>
                    <table cellspacing="0" cellpadding="0" width="100%" class="">
                                    <tbody><tr>
                                          <td></td>
                                          <td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;확인일자&nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;확인자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점검내용&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비고</td>
                                      </tr>
                                    <tr>
                                        <th>유효성점검1차</th>
                                        <td class="">
                                            <input id="checkDateA" class="date js-datepicker hasDatepicker" type="text" style="width:100px;" value="2025-03-25" maxlength="20" size="20" name="check_date_a" readonly="">
                                            <input id="werrUser1" name="werr_user1" class="basic" type="text" style="width:100px;" value="">
                                            <input id="werrNote1" name="werr_note1" class="basic" type="text" style="width:200px;" value="">
                                            <input id="werrBigo1" name="werr_bigo1" class="basic" type="text" style="width:100px;" value="">
                                        </td>
                                    </tr>								
                                    <tr>
                                        <th class="">유효성점검2차</th>
                                        <td class="">
                                            <input id="checkDateB" class="date js-datepicker hasDatepicker" type="text" style="width:100px;" value="2025-03-25" maxlength="20" size="20" name="check_date_b" readonly="">
                                            <input id="werrUser2" name="werr_user2" class="basic" type="text" style="width:100px;" value="">
                                            <input id="werrNote2" name="werr_note2" class="basic" type="text" style="width:200px;" value="">
                                            <input id="werrBigo2" name="werr_bigo2" class="basic" type="text" style="width:100px;" value="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="">유효성점검3차</th>
                                        <td class="">
                                            <input id="checkDateC" class="date js-datepicker hasDatepicker" type="text" style="width:100px;" value="2025-03-25" maxlength="20" size="20" name="check_date_c" readonly="">
                                            <input id="werrUser3" name="werr_user3" class="basic" type="text" style="width:100px;" value="">
                                            <input id="werrNote3" name="werr_note3" class="basic" type="text" style="width:200px;" value="">
                                            <input id="werrBigo3" name="werr_bigo3" class="basic" type="text" style="width:100px;" value="">
                                        </td>
                                    </tr>
                    </tbody></table>
                </div>  
                <div class="btnSaveClose">
					 <button class="save" type="button" onclick="save();">저장</button>
					 <button class="close" type="button" onclick="window.close();">닫기</button>
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
		getNonInsertList();
	});

	//이벤트
	//함수
	// 객체는 work
	function getNonInsertList(){
		
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
		    ajaxURL:"/tkheat/quality/nonInsert/getNonInsertList",
		    ajaxProgressiveLoad:"scroll",
		    ajaxParams:{
		    	"sdate": $("#sdate").val(),
                "edate": $("#edate").val(),
			    },
		    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
		    ajaxResponse:function(url, params, response){
				$("#tab1 .tabulator-col.tabulator-sortable").css("height","29px");
		        return response; //return the response data to tabulator
		    },
		    columns:[
		        {title:"검사일", field:"werr_date", sorter:"string", width:120,
			        hozAlign:"center"},	
			    {title:"거래처", field:"corp_name", sorter:"string", width:120,
				    hozAlign:"center"},     
				{title:"품명", field:"prod_name", sorter:"string", width:120,
				    hozAlign:"center"}, 
				{title:"품번", field:"prod_no", sorter:"string", width:150,
				    hozAlign:"center"}, 
		        {title:"열처리LOT", field:"werr_lot", sorter:"string", width:120,
		        	hozAlign:"center"},		        
		        {title:"유형", field:"werr_gubn", sorter:"string", width:100,
		        	hozAlign:"center"},
		        {title:"수량", field:"werr_amnt", sorter:"int", width:100,
		        	hozAlign:"center"},
		        {title:"금액", field:"werr_mon", sorter:"int", width:100,
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
	const modal = document.querySelector('.nonModal');
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
	const nonModal = document.querySelector('.nonModal');
	const closeButton = document.querySelector('.close');

	insertButton.addEventListener('click', function() {
		nonModal.style.display = 'block'; // 모달 표시
	});

	closeButton.addEventListener('click', function() {
		nonModal.style.display = 'none'; // 모달 숨김
	});
		


    </script>
    

	</body>
</html>
