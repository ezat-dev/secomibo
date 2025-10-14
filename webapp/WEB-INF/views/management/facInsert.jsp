<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>권한 설정</title>
    <%-- <%@ include file="../include/sideBar.jsp" %> --%>
    <link rel="stylesheet" href="/tkheat/css/tabBar/tabBar.css">
    <%@include file="../include/pluginpage.jsp" %>
    <link rel="stylesheet" href="/tkheat/css/management/userinsert2.css">
    <script type="text/javascript" src="https://oss.sheetjs.com/sheetjs/xlsx.full.min.js"></script>
    <style>
    
        .container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            margin-left: 1008px;
            margin-top: 200px;
        }
        .view {
            display: flex;
            justify-content: center;
            margin-top: 1%;
        }
        .tab {
            width: 95%;
            margin-bottom: 37px;
            margin-top: 5px;
            height: 45px;
            border-radius: 6px 6px 0px 0px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .modal {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            transition: opacity 0.3s ease-in-out;
        }
	    .modal-content {
	        background: white;
		    width: 50%;
		    max-width: 715px;
	        height: 80vh; 
	        overflow-y: auto; 
	        margin: 6% auto 0;
	        padding: 20px;
	        border-radius: 10px;
	        position: relative;
	        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
	        transform: scale(0.8);
	        transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out;
	        opacity: 0;
	    }
        .modal.show {
            display: block;
            opacity: 1;
        }
        .modal.show .modal-content {
            transform: scale(1);
            opacity: 1;
        }
        .close {
            background-color:white;
            position: absolute;
            right: 15px;
            top: 10px;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
        }
        .modal-content form {
            display: flex;
            flex-direction: column;
        }
        .modal-content label {
            font-weight: bold;
            margin: 10px 0 5px;
        }
        .modal-content input, .modal-content textarea {
            width: 97%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .modal-content button {
            background-color: #d3d3d3;
            color: black;
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .modal-content button:hover {
            background-color: #a9a9a9;
        }
        .button-container {
    		display: flex;
		    gap: 10px;
		    margin-left: auto;
		    margin-right: 10px;
		    margin-top: 40px;
		}
		.box1 {
		    display: flex;
		    justify-content: right;
		    align-items: center;
		    width: 1000px;
		    margin-right: 20px;
		    margin-top:4px;
		}
        .dayselect {
            width: 20%;
            text-align: center;
            font-size: 15px;
        }
        .daySet {
        	width: 20%;
      		text-align: center;
            height: 16px;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
        }
        .daylabel {
            margin-right: 10px;
            margin-bottom: 13px;
            font-size: 18px;
            margin-left: 20px;
        }
        button-container.button{
        height: 16px;
        }
         .mid{
        margin-right: 9px;
	    font-size: 20px;
	    font-weight: bold;
	
	    height: 42px;
	    margin-left: 9px;
        }
        .row_select {
	    background-color: #ffeeba !important;
	    }
	    
	    .form-row {
  display: flex;
  align-items: center;
  gap: 16px;           /* 레이블–인풋 간격 */
  flex-wrap: wrap;     /* 화면 좁아지면 줄 바꿈 */
  margin-bottom: 12px; /* 각 행 간 간격 */
}
	.delete-button {
	    height: 40px; /* tab보다 조금 작게 설정 */
	    padding: 0 11px; /* 좌우 패딩 */
	    border: 1px solid rgb(53, 53, 53);
	    border-radius: 4px; /* 모서리 둥글게 */
	    background-color: #ffffff; /* 배경색 */
	    cursor: pointer; /* 포인터 커서 */
	    display: flex; /* 내부 요소를 플렉스 박스로 설정 */
	    align-items: center; /* 버튼 안에서 세로 가운데 정렬 */
	}

    </style>
</head>

<body>

    <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
               <div class="box1">
	           <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
	           <label class="daylabel">입사 연도 :</label>
				<input type="text" autocomplete="off" class="yearSet" id="startDate" style="font-size:16px; height:30px; width:220px; margin-bottom:10px; text-align:center; border-radius:6px; border:1px solid #ccc;" placeholder="시작 날짜 선택">
				
				<!-- <span class="mid"  style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span> -->
	
			<!-- 	<input type="text"autocomplete="off" class="daySet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택"> 
 -->
	
			  <label class="daylabel">성명 :</label>
			 <input type="text" id="user_name" style="font-size:16px; height:30px; width:220px; margin-bottom:10px; text-align:center; border-radius:6px; border:1px solid #ccc;" placeholder="이름 입력">



	</div>

	           
		
                <button class="select-button">
                    <img src="/tkheat/css/image/search-icon.png" alt="select" class="button-image">조회
                </button>
                <button class="insert-button">
                    <img src="/tkheat/css/image/insert-icon.png" alt="insert" class="button-image">추가
                </button>
                <!-- 
                <button class="delete-button">
				    <img src="/tkheat/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
				</button>
                <button class="excel-button">
                    <img src="/tkheat/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀
                </button>
                 -->
                
            </div>
        </div>

        <div class="view">
            <div id="dataTable"></div>
        </div>
    </main>
	
	   <div id="modalContainer" class="modal">
	    <div class="modal-content">
	<!--         <span class="close">&times;</span> -->
	        <h2>사용자 등록</h2>
            <div id="modalDataTable" style="margin-bottom: 20px;"></div> 
	        <form id="corrForm"autocomplete="off">

	            <button type="submit" id="saveCorrStatus">저장</button>
	            <button type="submit" id="updateCorrStatus" style="display: none;">수정</button>
	            <button type="button" id="closeModal">닫기</button>
	        </form>
	    </div>
	</div>


<script>
let now_page_code = "h03";
var dataTable;
var selectedRowData = null;
var modalDataTable; // ⚠️ 모달용 Tabulator 변수 추가

$(function() {
  // Initialize the dataTable
  dataTable = new Tabulator('#dataTable', {
    height: "705px",
    layout: "fitColumns",
    headerHozAlign: "center",
    ajaxConfig: { method: 'POST' },
    ajaxLoader: false,
    ajaxURL: "/tkheat/user/selectList",
    ajaxParams: {},
    placeholder: "조회된 데이터가 없습니다.",
    ajaxResponse: function(url, params, response) {
     // console.log("서버 응답 데이터 확인:", response);
      return response;
    },
    columns: [
      { title: "NO", formatter: "rownum", hozAlign: "center", width: 120 },
      { title: "user_code", field: "user_code", sorter: "string", width: 240, hozAlign: "center"},
      { title: "user_pw", field: "user_pw", sorter: "string", width: 240, hozAlign: "center", visible: false },

      { title: "아이디", field: "user_id", sorter: "string", width: 100, hozAlign: "center" },
      { title: "비밀번호", field: "user_pw", sorter: "string", width: 240, hozAlign: "center", visible: false },
      { title: "성명", field: "user_name", sorter: "string", width: 120, hozAlign: "center" },
      { title: "전화번호", field: "user_phone", width: 140, hozAlign: "center" },
      { title: "1라인 수신", field: "message_yn", sorter: "string", width: 100, hozAlign: "center",
    	    formatter: function(cell) {
    	        const value = cell.getValue();
    	        
    	        if (value === 'Y') {
    	            return "수신";
    	        } else if (value === 'N') {
    	            return "거부";
    	        } else {
    	            // Y나 N이 아닌 경우 (null, undefined 등)
    	            return value || "거부"; // 값이 없으면 기본값으로 '거부' 처리
    	        }
    	    } },
      { title: "2라인 수신", field: "message_yn2", sorter: "string", width: 100, hozAlign: "center",
    	    formatter: function(cell) {
    	        const value = cell.getValue();
    	        
    	        if (value === 'Y') {
    	            return "수신";
    	        } else if (value === 'N') {
    	            return "거부";
    	        } else {
    	            // Y나 N이 아닌 경우 (null, undefined 등)
    	            return value || "거부"; // 값이 없으면 기본값으로 '거부' 처리
    	        }
    	    } }
    ],
    rowClick: function(e, row) {
      $('#dataTable .tabulator-row').removeClass('row_select');
      row.getElement().classList.add('row_select');
      selectedRowData = row.getData();

      // 선택된 행 정보를 오른쪽 영역에 표시
      $('#display_user_name').text('성명: ' + selectedRowData.user_name);
      $('#display_user_phone').text('전화번호: ' + selectedRowData.user_phone);


      // 2. 1호기 알람 상태에 따라 HTML 변경 (기존 코드 수정)
      const alarm1_yn = selectedRowData.message_yn;
      console.log("alarm1_yn: ", alarm1_yn);
      const alarm1_html = createAlarmCheckboxHtml('1라인 알람', alarm1_yn);
      // display_message_yn이 이미 P 태그이므로 내부를 변경합니다.
      $('#display_message_yn').html(alarm1_html); 

      // 3. 2호기 알람 상태에 따라 HTML 변경 (기존 코드 수정)
      const alarm2_yn = selectedRowData.message_yn2; 
      console.log("alarm2_yn: ", alarm2_yn);
      const alarm2_html = createAlarmCheckboxHtml('2라인 알람', alarm2_yn);
      // display_message_yn2가 이미 P 태그이므로 내부를 변경합니다.
      $('#display_message_yn2').html(alarm2_html); 
    },
    rowDblClick: function(e, row) {
      var d = row.getData();
      selectedRowData = d;
      $('#corrForm')[0].reset();
      $('input[name="no"]').val(d.idx);
      $('input[name="user_id"]').val(d.user_id);
      $('input[name="user_pw"]').val(d.user_pw);
      $('input[name="st_day"]').val(d.st_day);
      $('input[name="user_phone"]').val(d.user_phone);
      $('input[name="user_name"]').val(d.user_name);
      $('select[name="user_level"]').val(d.user_level);
      $('input[name="user_busu"]').val(d.user_busu);
      $('input[name="user_jick"]').val(d.user_jick);

      // 저장 숨기고 수정 보이게
      $('#saveCorrStatus').hide();
      $('#updateCorrStatus').show();
      
      $('#modalContainer').show().addClass('show');
    }
  });

  
  // 조회 버튼 클릭 시
  $('.select-button').click(function() {
    var user_name = $('#user_name').val();
    var startDate = $('#startDate').val();
/*     console.log("조회 버튼 클릭됨 - 전송 데이터:", {
      user_name: user_name,
      startDate: startDate
    }); */
   // console.log("전송된 startDate 값:", startDate);
    dataTable.setData("/tkheat/user/selectList", {});

  });

  function initModalDataTable() {
	    if (modalDataTable) {
	        modalDataTable.destroy();
	    }
	    //오늘 날짜
	    const todayDate = getTodayDate();  
	    
	    modalDataTable = new Tabulator('#modalDataTable', {
	        height: "450px", // 테이블 높이 설정 (모달 크기에 맞게)
	        layout: "fitColumns",
	        headerHozAlign: "center",
	        ajaxConfig: { method: 'POST' },
	        ajaxLoader: false,
	        ajaxURL: "/tkheat/user/selectModalList", // 적절한 데이터 로드 URL 사용
	        ajaxParams: {work_day: todayDate },
	        placeholder: "조회된 데이터가 없습니다.",
	        columns: [
	        	{ title: "user_code", field: "user_code", visible: false},
	        	{ title: "no", field: "no", visible: false},
	            { title: "ID", field: "user_id", sorter: "string", hozAlign: "center", width: 110 },
	            { title: "성명", field: "user_name", sorter: "string", hozAlign: "center", width: 120 },
	            { title: "부서", field: "user_busu", sorter: "string", hozAlign: "center", width: 120 },
	                        { 
	                title: "1라인 수신", 
	                field: "message_yn", 
	                hozAlign: "center", 
	                width: 110,
	                formatter: customCheckboxFormatter1, // 커스텀 포맷터 적용
	                cellClick: handleCheckboxClick // 셀 클릭 이벤트 핸들러 적용
	            },
	            { title: "2라인 수신", field: "message_yn2", sorter: "string", hozAlign: "center", width: 110,
	                formatter: customCheckboxFormatter2, // 커스텀 포맷터 적용
	                cellClick: handleCheckboxClick},
	                { title: "근무조", field: "work_time", sorter: "string", hozAlign: "center", width: 120,
	                    // 🌟 editor 속성 추가: 셀 클릭 시 편집 모드 활성화
	                    editor: "select", 
	                    // 🌟 editorParams 추가: 드롭다운 옵션 정의
	                    editorParams: {
	                        // value: 표시될 값, label: 드롭다운에 보일 텍스트
	                        values: [
	                            {value: "오전", label: "오전"},
	                            {value: "오후", label: "오후"},
	                            {value: "", label: "선택 안함"} // 선택 사항
	                        ],
	                        verticalNavigation: "editor" // 키보드 탐색 설정
	                    },
	                    // 🌟 formatter 속성 추가 (선택 사항): 값이 없을 때 기본 텍스트 표시
	                    formatter: function(cell){
	                        const value = cell.getValue();
	                        return value || "선택"; // 값이 없을 때 '선택'이라고 표시
	                    },
	                    // 🌟 셀 변경 이벤트 핸들러 추가: 값 변경 시 즉시 처리
	                    cellEdited: function(cell){
	                        // 드롭다운에서 값이 변경되었을 때 실행됩니다.
	                        // 여기서 변경된 값을 사용하여 AJAX 요청을 보내거나, 
	                        // '저장' 버튼을 위한 내부 데이터 업데이트 로직을 추가할 수 있습니다.
	                        handleWorkTimeEdited(cell); 
	                    } },
	        ],
	        // 모달 내 테이블 클릭 이벤트 (필요 시 추가)
	        rowClick: function(e, row) {
	            // ... (모달 내 테이블 클릭 시 동작 정의)
	        }
	    });
	}

//1호기 수신/거부 라디오 버튼 포맷터
function customCheckboxFormatter1(cell, formatterParams, onRendered) {
    const data = cell.getRow().getData();
    
    // 데이터가 null/undefined일 경우 'N'으로 기본값 설정
    const ynValue = data.message_yn || 'N'; 
    
    console.log("ynValue: ", ynValue);
    
    // 1. 셀이 렌더링 된 후 실행될 콜백 함수를 등록합니다.
    onRendered(function() {
        // 셀 컴포넌트(cell)의 DOM 요소 내에서 체크박스를 찾습니다.
        const checkbox = cell.getElement().querySelector('input[type="checkbox"]');
        
        if (checkbox) {
            // 2. data.message_yn 값에 따라 체크박스의 checked 속성을 직접 설정합니다.
            // 'Y'이면 true (체크됨), 아니면 false (체크 안됨)
            checkbox.checked = (ynValue === 'Y');
            
            // 3. (선택 사항) 체크박스에 대한 이벤트 리스너를 여기서 설정할 수도 있습니다.
            //    현재는 column 정의의 cellClick을 사용하고 있다면 이 부분은 불필요합니다.
        }
    });

    // 4. 반환할 HTML 문자열 (checked 속성 없이 깨끗하게)
    //    체크 상태는 onRendered에서 설정되므로, HTML 템플릿에는 checked 속성을 넣지 않습니다.
    return `
        <label style="display: block; width: 100%; text-align: center;">
            <input type="checkbox" 
                   value="Y" 
                   data-field="message_yn" 
                   data-code="${data.user_code}"> 수신
        </label>
    `;
}
//2호기 수신/거부 라디오 버튼 포맷터 (message_yn2 필드를 사용)
  function customCheckboxFormatter2(cell, formatterParams, onRendered) {
	    const data = cell.getRow().getData();
	    
	    // 데이터가 null/undefined일 경우 'N'으로 기본값 설정
	    const ynValue = data.message_yn2 || 'N'; 
	    
	    console.log("ynValue: ", ynValue);
	    
	    // 1. 셀이 렌더링 된 후 실행될 콜백 함수를 등록합니다.
	    onRendered(function() {
	        // 셀 컴포넌트(cell)의 DOM 요소 내에서 체크박스를 찾습니다.
	        const checkbox = cell.getElement().querySelector('input[type="checkbox"]');
	        
	        if (checkbox) {
	            // 2. data.message_yn 값에 따라 체크박스의 checked 속성을 직접 설정합니다.
	            // 'Y'이면 true (체크됨), 아니면 false (체크 안됨)
	            checkbox.checked = (ynValue === 'Y');
	            
	            // 3. (선택 사항) 체크박스에 대한 이벤트 리스너를 여기서 설정할 수도 있습니다.
	            //    현재는 column 정의의 cellClick을 사용하고 있다면 이 부분은 불필요합니다.
	        }
	    });

	    // 4. 반환할 HTML 문자열 (checked 속성 없이 깨끗하게)
	    //    체크 상태는 onRendered에서 설정되므로, HTML 템플릿에는 checked 속성을 넣지 않습니다.
	    return `
	        <label style="display: block; width: 100%; text-align: center;">
	            <input type="checkbox" 
	                   value="Y" 
	                   data-field="message_yn2" 
	                   data-code="${data.user_code}"> 수신
	        </label>
	    `;
  }

//라디오 버튼 클릭 이벤트 처리 함수
  function handleCheckboxClick(e, cell) {
	  console.log("체크박스 클릭:", e.target.checked, cell.getData());
      // 이벤트가 라디오 버튼에서 발생했는지 확인
      
    // 1. 클릭된 체크박스의 상태 및 정보 추출
    const input = e.target;
    const row = cell.getRow();
    const rowData = row.getData();
    const fieldName = cell.getField(); // 'message_yn' 또는 'message_yn2'
    const newValue = input.checked ? 'Y' : 'N'; // 👈 실제 체크 상태를 기준으로 'Y'/'N' 결정
    
    // 2. Tabulator 내부 데이터 갱신 (화면과 데이터 일치)
    // 클릭된 필드의 상태만 Tabulator 내부 데이터에 반영
    row.update({
        [fieldName]: newValue
    }).then(function() {
        // 3. 서버 전송 데이터 준비
        // 최신 데이터(클릭으로 인해 message_yn/2가 업데이트된 상태)를 가져옵니다.
        const currentData = row.getData();
        console.log("currentData: ", currentData);
        
        // 서버 @ModelAttribute Users에 맞게 필요한 최소 필드만 구성
        const dataToSend = {
            user_code: currentData.user_code,
            user_id: currentData.user_id,
            user_pw: currentData.user_pw,
            message_yn: currentData.message_yn,
            message_yn2: currentData.message_yn2
        };
        
        console.log("메시지 수신 상태 업데이트 요청 데이터:", dataToSend);

          // 2. AJAX 통신 (tb_user 업데이트 및 tb_user_worktime 저장)
          $.ajax({
              url: "/tkheat/user/updateMessage", 
              type: "POST",
              data: dataToSend,
              success: function(response) {
                  if (response == true) {
                      //alert(`${fieldName} 상태가 성공적으로 ${newValue == 'Y' ? '수신' : '거부'}로 변경되었습니다. (작업 시간 기록 완료)`);
                      
                      // Tabulator 데이터 업데이트 (화면 갱신)
                      const row = cell.getRow();
                      const currentData = row.getData();
                      
                      // Tabulator 행 데이터를 수동으로 업데이트합니다.
                      const updateObj = {};
                      updateObj[fieldName] = newValue;
                      row.update(updateObj); 
                      
                  } else {
                      alert("업데이트 중 오류가 발생했습니다: " + response.data);
                  }
              },
              error: function() {
                  alert('서버와의 통신 중 오류가 발생했습니다.');
              }
          });
    });
  }
	
  // 삽입 버튼 클릭 시
  $('.insert-button').click(function() {
      // 수정 숨기고 저장 보이게
      $('#saveCorrStatus').show();
      $('#updateCorrStatus').hide();
    selectedRowData = null;
    $('#corrForm')[0].reset();
    $('#modalContainer').show().addClass('show');
    initModalDataTable(); 
  });

  // 삭제 버튼 클릭 시
  $('.delete-button').click(function() {
    if (!selectedRowData) {
      alert('삭제할 행을 먼저 클릭해 주세요.');
      return;
    }
    if (!selectedRowData) {
    	  alert('삭제할 행을 먼저 클릭해 주세요.');
    	  return;
    	}
    	if (!confirm('선택된 항목을 정말 삭제하시겠습니까?')) return;

    	const deleteData = { user_code: selectedRowData.user_code };
    	console.log("삭제 요청 데이터:", deleteData); // 추가된 로그

    	$.ajax({
    	  url: "/geomet/user/userInsert/delete",
    	  type: "POST",
    	  contentType: "application/json",
    	  data: JSON.stringify(deleteData),
    	  success: function(res) {
    	    alert('삭제되었습니다.');
    	
    	    dataTable.setData("/geomet/user/userInsert/select", {});
    	    selectedRowData = null;
    	  },
    	  error: function() {
    	    alert('삭제 중 오류가 발생했습니다.');
    	  }
    	});
  });

  // 모달 닫기
  $('.close, #closeModal').click(function() {
    $('#modalContainer').removeClass('show').hide();
    dataTable.setData("/tkheat/user/selectList", {});
  });

//1. 오늘 날짜를 YYYY-MM-DD 형식으로 반환하는 헬퍼 함수
  function getTodayDate() {
      const today = new Date();
      const year = today.getFullYear();
      // getMonth()는 0부터 시작하므로 +1, padStart(2, '0')로 2자리수 확보
      const month = String(today.getMonth() + 1).padStart(2, '0');
      const day = String(today.getDate()).padStart(2, '0');
      return year + "-" + month + "-" + day;
  }
  
  // 저장 버튼 클릭 시
  $('#saveCorrStatus').click(function(event) {
    event.preventDefault();

    const todayDate = getTodayDate();
    console.log("todayDate: ", todayDate);
    let dataToSend = []; // 전송할 데이터를 담을 배열
    let dataToDelete = [];  //  삭제할 데이터

    if (!modalDataTable) {
        alert('테이블 데이터가 준비되지 않았습니다.');
        return;
    }

    dataToSend = []; // 데이터 배열 초기화

    // 1. Tabulator에서 모든 행 컴포넌트(Row Component)를 가져옵니다.
    const allRows = modalDataTable.getRows();

    // 2. 각 행을 순회하며 DOM 요소의 체크박스 상태를 직접 확인합니다.
    allRows.forEach(row => {
        const rowElement = row.getElement(); // 행의 DOM 요소
        const rowData = row.getData();       // 행의 기본 데이터

        const workTime = rowData.work_time || "";
        
        if (workTime === '오전' || workTime === '오후') { 
            dataToSend.push({
                user_code: rowData.user_code,
                work_day: todayDate,
                work_time: workTime
            });
        }else if (workTime === "" || workTime === "선택 안함") { 
            // 삭제 요청은 user_code와 work_day만 필요
            dataToDelete.push({
                user_code: rowData.user_code,
                work_day: todayDate
            });
        }
    });
    
    if (dataToSend.length === 0) {
        alert("저장할 체크된 사용자 데이터가 없습니다.");
        return;
    }

    console.log("서버에 전송할 체크된 사용자 데이터 (JSON 배열):", dataToSend);
    console.log("삭제할 데이터:", dataToDelete);

    //2. ajax 요청
    let ajaxRequests = [];
    if (dataToSend.length > 0) {
    $.ajax({
      url: "/tkheat/user/insertWorkTime",
      type: "POST",
      contentType: "application/json", // 👈 필수: JSON 데이터임을 서버에 알림
      data: JSON.stringify(dataToSend), // 👈 필수: JS 객체를 JSON 문자열로 변환
      //processData: false,
      //contentType: false,
      success: function(result) {
        console.log(result);
        if (result === true) {
            //alert("성공적으로 저장되었습니다."); // "사용자 정보가 성공적으로 저장되었습니다."
            $('#modalContainer').hide();
            //dataTable.setData("/tkheat/user/selectList", {});
            //selectedRowData = null;
        } else {
            //alert("오류: " + result.data); 
        }
      },
      error: function() {
        alert('저장 중 오류가 발생했습니다.');
      }
    });
    }

    if (dataToDelete.length > 0) {
        ajaxRequests.push(
            $.ajax({
                // 🚨 삭제 전용 컨트롤러 URL 사용
                url: "/tkheat/user/deleteWorkTime", 
                type: "POST", // DELETE 메서드가 더 적합하지만, POST를 흔히 사용
                contentType: "application/json",
                data: JSON.stringify(dataToDelete)
            })
        );
        console.log("삭제 데이터:", dataToDelete);
    }

    // 3. 모든 요청의 성공/실패 처리
    Promise.all(ajaxRequests)
        .then(results => {
            // 모든 요청이 성공했을 때
            alert("작업 시간 정보가 성공적으로 처리되었습니다.");
            $('#modalContainer').hide();
            dataTable.setData("/tkheat/user/selectList", {});
        })
        .catch(error => {
            // 하나라도 실패했을 때
            alert('일부 요청 처리 중 오류가 발생했습니다.');
            console.error("AJAX 오류:", error);
        });
  });

  //수정 버튼 클릭 시
  $('#updateCorrStatus').click(function(event) {
    event.preventDefault();
    //var formData = new FormData($('#corrForm')[0]);
    var formData = $('#corrForm').serialize();
    if (selectedRowData && selectedRowData.user_code) {
      formData.append('user_code', selectedRowData.user_code);  // 수정 시 user_code 추가
    }
/*     for (var pair of formData.entries()) {
        console.log(pair[0] + ': ' + pair[1]);
      } */
        

    $.ajax({
      url: "/geomet/user/userInsert/update",
      type: "POST",
      data: formData,
      //processData: false,
      //contentType: false,
      success: function() {
        alert("수정되었습니다!");
        $('#modalContainer').hide();
    
        dataTable.setData("/geomet/user/userInsert/select", {});
        selectedRowData = null;
      },
      error: function() {
        alert('저장 중 오류가 발생했습니다.');
      }
    });
  });
});
</script>


</body>
</html>