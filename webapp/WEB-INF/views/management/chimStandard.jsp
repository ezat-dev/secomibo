<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>그룹관리</title>
    <%-- <%@ include file="../include/sideBar.jsp" %> --%>
    <link rel="stylesheet" href="/tkheat/css/tabBar/tabBar.css">
    <%@include file="../include/pluginpage.jsp" %>
    <link rel="stylesheet" href="/tkheat/css/management/userinsert2.css">
    <script type="text/javascript" src="https://oss.sheetjs.com/sheetjs/xlsx.full.min.js"></script>
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/locales-all.min.js'></script>
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
        .groupScheduleView {
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
	    .modal-content{
	        background: white;
		    width: 70%;
		    max-width: 1065px;
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
        .modal.show .modal-content{
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
        .modal-content form, .alarm-modal-content form{
            display: flex;
            flex-direction: column;
        }
        .modal-content label, .alarm-modal-content label{
            font-weight: bold;
            margin: 10px 0 5px;
        }
        .modal-content input, .modal-content textarea, 
        .alarm-modal-content input, .alarm-modal-content textarea{
            width: 97%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        select {
            width: 14%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .modal-content button, 
        .alarm-modal-content button{
            background-color: #d3d3d3;
            color: black;
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .modal-content button:hover, 
        .alarm-modal-content button:hover{
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
		    margin-right: 0px;
		    margin-top: 4px;
		    margin-left: -16%;
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
.group-time-button {
    background-color: white;
    border: 1px solid black;
    border-radius: 4px;
    height: 40px;
    padding: 0px 15px;
    font-size: 14px;
    color: #333;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    box-shadow: none;
    transition: background-color 0.2s;
    width: 158px;
}
.alarm-group-button{
    background-color: white;
    border: 1px solid black;
    border-radius: 4px;
    height: 40px;
    padding: 0px 15px;
    font-size: 14px;
    color: #333;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    box-shadow: none;
    transition: background-color 0.2s;
    width: 158px;
}
.recieve-alarm-button{
    background-color: white;
    border: 1px solid black;
    border-radius: 4px;
    height: 40px;
    padding: 0px 15px;
    font-size: 14px;
    color: #333;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    box-shadow: none;
    transition: background-color 0.2s;
    width: 188px;
}
/* 모달 전체 배경 */
.modal {
  display: none; /* 초기에는 숨김 */
  position: fixed;
  z-index: 999;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
  overflow: auto;
  font-family: 'Arial', sans-serif;
}

/* 모달 내용 영역 */
.time-modal {
  background-color: #fff;
  margin: 8% auto;
  padding: 20px 30px;
  border-radius: 12px;
  width: 60%;
  max-width: 623px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.3);
  position: relative;
}

/* 모달 닫기 버튼 */
.close {
  position: absolute;
  top: 12px;
  right: 18px;
  font-size: 28px;
  font-weight: bold;
  color: #333;
  cursor: pointer;
  transition: color 0.2s;
}

.close:hover {
  color: #e74c3c;
}

/* 모달 제목 */
.time-modal h2 {
  text-align: center;
  margin-bottom: 20px;
  font-size: 20px;
  color: #333;
}

/* 테이블 기본 스타일 */
.time-modal table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

.time-modal th, .time-modal td {
  border: 1px solid #ddd;
  padding: 10px;
  text-align: center;
  font-size: 14px;
}

.time-modal th {
  background-color: #f2f2f2;
  font-weight: bold;
}

/* 입력 필드 */
.time-modal input[type="datetime-local"] {
  width: 90%;
  padding: 6px 8px;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 13px;
}

/* 모달 하단 버튼 */
.modal-footer {
  text-align: right;
}

.modal-footer button {
  padding: 8px 16px;
  margin-left: 10px;
  border: none;
  border-radius: 6px;
  font-size: 14px;
  cursor: pointer;
  transition: background 0.2s;
}

.modal-footer button[type="submit"] {
  background-color: #3498db;
  color: #fff;
}

.modal-footer button[type="submit"]:hover {
  background-color: #2980b9;
}

.modal-footer button#cancelBtn {
  background-color: #ccc;
}

.modal-footer button#cancelBtn:hover {
  background-color: #999;
}
	   .alarm-modal-content{
	        background: white;
			width: 100%;
			max-width: 1555px;
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
        .alarm-modal-content{
            transform: scale(1);
            opacity: 1;
        }
    </style>
</head>

<body>

    <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
               <div class="box1">
	           <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
	           <label class="daylabel">그룹별 조회 :</label>
				<select id="groupSelect" name="group_filter">
				    <option value="">-- 전체 그룹 --</option> 
				    <option value="1">그룹 A</option>
				    <option value="2">그룹 B</option>
				    <option value="3">그룹 C</option>
				    <option value="4">그룹 D</option>
				    <option value="5">그룹 E</option>
				</select>
				
				<!-- <span class="mid"  style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span> -->
	
			<!-- 	<input type="text"autocomplete="off" class="daySet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택"> 
 -->
	
			  <label class="daylabel">성명 :</label>
			 <input type="text" id="user_name" style="font-size:16px; height:30px; width:220px; margin-bottom:10px; text-align:center; border-radius:6px; border:1px solid #ccc;" placeholder="이름 입력">



	</div>

	           
		<!-- 
                <button class="select-button">
                    <img src="/tkheat/css/image/search-icon.png" alt="select" class="button-image">조회
                </button>
              -->
                <button class="insert-button" style="width: 125px;">
                    <img src="/tkheat/css/image/insert-icon.png" alt="insert" class="button-image">회원 그룹 관리
                </button>
                <button class="group-time-button">
                    <img src="/tkheat/css/image/insert-icon.png" alt="insert" class="button-image">알람 발송 스케줄
                </button>
                <button class="recieve-alarm-button">
                    <img src="/tkheat/css/image/insert-icon.png" alt="insert" class="button-image">그룹별 수신 알람 설정
                </button>
                <button class="alarm-group-button">
                    <img src="/tkheat/css/image/insert-icon.png" alt="insert" class="button-image">알람 그룹 관리
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
<div id="groupTimeModal" class="modal">
  <div class="time-modal">
    <h2>알람 발송 스케줄</h2>

    <form id="groupTimeForm">
      <table>
        <thead>
          <tr>
            <th>그룹</th>
                <th>시작 날짜</th>
                <th>종료 날짜</th>
                <th>시작 시간</th>
                <th>종료 시간</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>
              <select name="group_id" required style="width: 100px;">
                <option value="">--그룹 선택--</option>
                <option value="1">그룹 A</option>
                <option value="2">그룹 B</option>
                <option value="3">그룹 C</option>
                <option value="4">그룹 D</option>
                <option value="5">그룹 E</option>
              </select>
            </td>
                <td><input type="date" name="start_date" required></td>
                <td><input type="date" name="end_date" required></td>
                <td><input type="time" name="start_time" required></td>
                <td><input type="time" name="end_time" required></td>
          </tr>
        </tbody>
      </table>

      <div class="modal-footer">
        <button type="submit" id="saveTimeBtn">저장</button>
        <button type="button" id="cancelBtn">취소</button>
      </div>
    </form>
  </div>
</div>
        <div class="view">
            <div id="dataTable"></div>
            
            <div id="groupScheduleDataTable" style="margin-left:75px"></div>
        </div>
         <div class="groupScheduleView">
        </div>
    </main>
	
	   <div id="modalContainer" class="modal">
	    <div class="modal-content">
	<!--         <span class="close">&times;</span> -->
	        <h2>회원 그룹 관리</h2>
            <div id="modalDataTable" style="margin-bottom: 20px;"></div> 
	        <form id="corrForm"autocomplete="off">

	            <!-- <button type="submit" id="saveCorrStatus">저장</button> -->
	            <!-- <button type="submit" id="updateCorrStatus" style="display: none;">수정</button>-->
	            <button type="button" id="closeModal">닫기</button>
	        </form>
	    </div>
	</div>
	
		   <div id="alarmGroupModal" class="modal">
	    <div class="alarm-modal-content">
	<!--         <span class="close">&times;</span> -->
	        <h2>알람 그룹 관리</h2>
            <div id="alarmGroupTable" style="margin-bottom: 20px;"></div> 
	        <form id="corrForm"autocomplete="off">

	            <!-- <button type="submit" id="saveCorrStatus">저장</button> -->
	            <!-- <button type="submit" id="updateCorrStatus" style="display: none;">수정</button>-->
	            <button type="button" id="closeModal">닫기</button>
	        </form>
	    </div>
	</div>
	
			   <div id="recieveAlarmModal" class="modal">
	    <div class="alarm-modal-content">
	<!--         <span class="close">&times;</span> -->
	        <h2>그룹별 수신 알람 설정</h2>
            <div id="recieveAlarmTable" style="margin-bottom: 20px;"></div> 
	        <form id="corrForm"autocomplete="off">

	            <!-- <button type="submit" id="saveCorrStatus">저장</button> -->
	            <!-- <button type="submit" id="updateCorrStatus" style="display: none;">수정</button>-->
	            <button type="button" id="closeModal">닫기</button>
	        </form>
	    </div>
	</div>


<script>
let now_page_code = "h03";
var dataTable;
var selectedRowData = null;
var modalDataTable; // ⚠️ 모달용 Tabulator 변수 추가
var alarmGroupTable;
var groupScheduleDataTable;
var calendar;
var calendarEl;
var recieveAlarmTable;

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
     console.log("서버 응답 데이터 확인:", response);
      return response;
    },
    columns: [
      { title: "NO", formatter: "rownum", hozAlign: "center", width: 120 },
      { title: "user_code", field: "user_code", sorter: "string", width: 240, hozAlign: "center"},
      { title: "user_pw", field: "user_pw", sorter: "string", width: 240, hozAlign: "center", visible: false },

      { title: "아이디", field: "user_id", sorter: "string", width: 100, hozAlign: "center" },
      { title: "비밀번호", field: "user_pw", sorter: "string", width: 240, hozAlign: "center", visible: false },
      { title: "성명", field: "user_name", sorter: "string", width: 120, hozAlign: "center" },
      { title: "소속 그룹", field: "user_groups", width: 140, hozAlign: "center" }
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

      calendarEl = document.getElementById('groupScheduleDataTable'); // ID 재사용

      calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth', // 기본 월별 뷰
      locale: 'ko', // 한국어 설정
      height: "600px", 
      headerToolbar: { 
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      displayEventTime: false,
      eventTimeFormat: {
          hour: '2-digit', // 시 (예: 10)
          minute: '2-digit', // 분 (예: 15)
          meridiem: false, // 🌟 오전/오후(AM/PM) 표시를 완전히 제거합니다.
          hour12: false     // 🌟 12시간제 대신 24시간제를 사용하도록 강제합니다.
      },
      
      // 🚨 DB 데이터 연동 핵심: 서버 API에서 JSON 이벤트 데이터를 가져옵니다.
      events: {
          // Tabulator에서 사용했던 URL을 재사용하되, 반환 형식이 FullCalendar JSON 형식이어야 합니다.
          url: "/tkheat/user/getGroupScheduleList", 
          method: 'POST', // POST 방식으로 요청
          // 데이터를 FullCalendar 형식으로 변환하는 함수
          eventDataTransform: function(rawEventData) {
              // 백엔드에서 받은 schedule 데이터를 FullCalendar 이벤트 형식으로 변환합니다.
              return {
                  id: rawEventData.schedule_id,
                  groupId: rawEventData.group_id,
                  title: '그룹 ' + rawEventData.group_id + ' (' + rawEventData.start_time + '~' + rawEventData.end_time + ')', // 예시 제목
                  start: rawEventData.start_date + 'T' + rawEventData.start_time, // 'YYYY-MM-DDT10:15:00' 형식
                  end: rawEventData.end_date + 'T' + rawEventData.end_time, // 'YYYY-MM-DDT22:15:00' 형식
                  allDay: false // 시간 정보가 있으므로 allDay는 false
              };
          },
          failure: function() {
              console.error('일정 데이터를 불러오는 데 실패했습니다.');
          }
      }
      // ... 필요한 다른 옵션 (eventClick 등)
  });

  calendar.render();

  
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
	        ajaxURL: "/tkheat/user/selectList", // 적절한 데이터 로드 URL 사용
	        ajaxParams: {work_day: todayDate },
	        placeholder: "조회된 데이터가 없습니다.",
	        columns: [
	        	{ title: "user_code", field: "user_code", visible: false},
	        	{ title: "no", field: "no", visible: false},
	            { title: "ID", field: "user_id", sorter: "string", hozAlign: "center", width: 110 },
	            { title: "성명", field: "user_name", sorter: "string", hozAlign: "center", width: 120 },
	            { title: "부서", field: "user_busu", sorter: "string", hozAlign: "center", width: 120 },
	            { 
	                title: "그룹 A", 
	                field: "user_groups", 
	                width: 140, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                    const groupString = cell.getValue();
	                    console.log("groupString: ", groupString);
	                    let isChecked = false;
	                    
	                    // 1. groupString이 유효하고, 'A 그룹'을 포함하는지 확인
	                    if (groupString && groupString.includes('A')) {
	                         isChecked = true;
	                    }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: handleGroupClick
	            },
	            { 
	                title: "그룹 B", 
	                field: "user_groups", 
	                width: 140, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                    const groupString = cell.getValue();
	                    console.log("groupString: ", groupString);
	                    let isChecked = false;
	                    
	                    // 1. groupString이 유효하고, 'A 그룹'을 포함하는지 확인
	                    if (groupString && groupString.includes('B')) {
	                         isChecked = true;
	                    }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: handleGroupClick
	            },
	            { 
	                title: "그룹 C", 
	                field: "user_groups", 
	                width: 140, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                    const groupString = cell.getValue();
	                    console.log("groupString: ", groupString);
	                    let isChecked = false;
	                    
	                    // 1. groupString이 유효하고, 'A 그룹'을 포함하는지 확인
	                    if (groupString && groupString.includes('C')) {
	                         isChecked = true;
	                    }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: handleGroupClick
	            },
	            { 
	                title: "그룹 D", 
	                field: "user_groups", 
	                width: 140, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                    const groupString = cell.getValue();
	                    console.log("groupString: ", groupString);
	                    let isChecked = false;
	                    
	                    // 1. groupString이 유효하고, 'A 그룹'을 포함하는지 확인
	                    if (groupString && groupString.includes('D')) {
	                         isChecked = true;
	                    }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: handleGroupClick
	            },
	            { 
	                title: "그룹 E", 
	                field: "user_groups", 
	                width: 140, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                    const groupString = cell.getValue();
	                    console.log("groupString: ", groupString);
	                    let isChecked = false;
	                    
	                    // 1. groupString이 유효하고, 'A 그룹'을 포함하는지 확인
	                    if (groupString && groupString.includes('E')) {
	                         isChecked = true;
	                    }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: handleGroupClick
	            }
	        ],
	        // 모달 내 테이블 클릭 이벤트 (필요 시 추가)
	        rowClick: function(e, row) {
	            // ... (모달 내 테이블 클릭 시 동작 정의)
	        }
	    });
	}

	//알람 그룹 테이블
	  function initAlarmGroupTable() {
	    if (alarmGroupTable) {
	    	alarmGroupTable.destroy();
	    }
	    //오늘 날짜
	    const todayDate = getTodayDate();  
	    
	    alarmGroupTable = new Tabulator('#alarmGroupTable', {
	        height: "450px", // 테이블 높이 설정 (모달 크기에 맞게)
	        layout: "fitColumns",
	        headerHozAlign: "center",
	        ajaxConfig: { method: 'POST' },
	        contentType: 'application/json',
	        ajaxLoader: false,
	        ajaxURL: "/tkheat/alarm/allAlarmList", // 적절한 데이터 로드 URL 사용
	        placeholder: "조회된 데이터가 없습니다.",
	        columns: [
		        {title: "알람 주소", field: "alarm_address", hozAlign: "center", width: 180},
		        {title: "알람 내용", field: "comment", hozAlign: "center", width: 250},
	            { 
	                title: "그룹 A", 
	                field: "group_a", 
	                width: 110, 
	                hozAlign: "center",
	                headerSort: false, 
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: alarmGroupClick
	            },
	            { 
	                title: "그룹 B", 
	                field: "group_b", 
	                width: 110, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: alarmGroupClick
	            },
	            { 
	                title: "그룹 C", 
	                field: "group_c", 
	                width: 110, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: alarmGroupClick
	            },
	            { 
	                title: "그룹 D", 
	                field: "group_d", 
	                width: 110, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: alarmGroupClick
	            },
	            { 
	                title: "그룹 E", 
	                field: "group_e", 
	                width: 110, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: alarmGroupClick
	            },
	            { 
	                title: "알람 그룹 F", 
	                field: "group_f", 
	                width: 110, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: alarmGroupClick
	            },
	            { 
	                title: "알람 그룹 G", 
	                field: "group_g", 
	                width: 110, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: alarmGroupClick
	            },
	            { 
	                title: "알람 그룹 H", 
	                field: "group_h", 
	                width: 110, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: alarmGroupClick
	            },
	            { 
	                title: "알람 그룹 I", 
	                field: "group_i", 
	                width: 110, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: alarmGroupClick
	            },
	            { 
	                title: "알람 그룹 J", 
	                field: "group_j", 
	                width: 110, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: alarmGroupClick
	            },
	        ],
	        // 모달 내 테이블 클릭 이벤트 (필요 시 추가)
	        rowClick: function(e, row) {
	            // ... (모달 내 테이블 클릭 시 동작 정의)
	        }
	    });
	}

		//그룹별 수신 알람 테이블
	  function initRecieveAlarmTable() {
	    if (recieveAlarmTable) {
	    	recieveAlarmTable.destroy();
	    }
	    
	    recieveAlarmTable = new Tabulator('#recieveAlarmTable', {
	        height: "450px", // 테이블 높이 설정 (모달 크기에 맞게)
	        layout: "fitColumns",
	        headerHozAlign: "center",
	        ajaxConfig: { method: 'POST' },
	        contentType: 'application/json',
	        ajaxLoader: false,
	        ajaxURL: "/tkheat/user/getGroupList", // 적절한 데이터 로드 URL 사용
	        placeholder: "조회된 데이터가 없습니다.",
	        columns: [
		        {title: "group_id", field: "group_id", hozAlign: "center", width: 130},
	        	{ title: "그룹 이름", field: "group_name", hozAlign: "center", width: 150},
	            { 
	                title: "알람 그룹 A", 
	                field: "recieve_a", 
	                width: 120, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: recieveAlarmpClick
	            },
	            { 
	                title: "알람 그룹 B", 
	                field: "recieve_b", 
	                width: 120, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: recieveAlarmpClick
	            },
	            { 
	                title: "알람 그룹 C", 
	                field: "recieve_c", 
	                width: 120, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: recieveAlarmpClick
	            },
	            { 
	                title: "알람 그룹 D", 
	                field: "recieve_d", 
	                width: 120, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: recieveAlarmpClick
	            },
	            { 
	                title: "알람 그룹 E", 
	                field: "recieve_e", 
	                width: 120, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: recieveAlarmpClick
	            },
	            { 
	                title: "알람 그룹 F", 
	                field: "recieve_f", 
	                width: 120, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: recieveAlarmpClick
	            },
	            { 
	                title: "알람 그룹 G", 
	                field: "recieve_g", 
	                width: 120, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: recieveAlarmpClick
	            },
	            { 
	                title: "알람 그룹 H", 
	                field: "recieve_h", 
	                width: 120, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: recieveAlarmpClick
	            },
	            { 
	                title: "알람 그룹 I", 
	                field: "recieve_I", 
	                width: 120, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: recieveAlarmpClick
	            },
	            { 
	                title: "알람 그룹 J", 
	                field: "recieve_j", 
	                width: 120, 
	                hozAlign: "center",
	                // HTML 체크박스를 반환하는 formatter
	                formatter: function(cell, formatterParams, onRender){
	                	const groupValue = cell.getValue(); 
	                    let isChecked = false;
	                    
				        if (groupValue == 1) { 
				            isChecked = true;
				        }
	                    console.log("isChecked: ", isChecked);
	                    if (isChecked) {
	                        return '<input type="checkbox" checked>';
	                    } else {
	                        return '<input type="checkbox">';
	                    }
	                },
	                cellClick: recieveAlarmpClick
	            },
	        ],
	        // 모달 내 테이블 클릭 이벤트 (필요 시 추가)
	        rowClick: function(e, row) {
	            // ... (모달 내 테이블 클릭 시 동작 정의)
	        }
	    });
	}

  //그룹 선택시 호출 함수
    function handleGroupClick(e, cell) {
        if (e.target.type !== 'checkbox') {
            return; 
        }
        // e.target.checked는 클릭 후의 체크박스 상태 (true 또는 false)를 반환합니다.
        const isChecked = e.target.checked; 

        console.log("체크박스 클릭:", isChecked, cell.getData());
	  console.log("체크박스 클릭:", e.target.checked, cell.getData());
      // 이벤트가 라디오 버튼에서 발생했는지 확인
          const groupTitle = cell.getColumn().getDefinition().title; 
          console.log("어떤 그룹인지: ", groupTitle);
          console.log("user_code: ", cell.getData().user_code);
          const user_code = cell.getData().user_code;
    
    // 2-2. 그룹 제목과 ID를 연결하는 맵 정의 (가장 확실한 방법)
    const groupIdMap = {
        "그룹 A": 1,
        "그룹 B": 2,
        "그룹 C": 3,
        "그룹 D": 4,
        "그룹 E": 5
    };
    const group_id = groupIdMap[groupTitle];
    console.log("group_id: ", group_id);

    let url = '';
    let method = '';
    let message = '';

    if (isChecked) {
        // 체크: 그룹에 추가 (INSERT 요청)
        url = '/tkheat/user/insertGroup'; // 서버에 그룹 추가를 요청할 URL
        method = 'POST';
        message = '그룹에 추가되었습니다.';
    } else {
        // 체크 해제: 그룹에서 제외 (DELETE 요청)
        url = '/tkheat/user/deleteGroup'; // 서버에 그룹 해제를 요청할 URL
        method = 'POST'; 
        message = '그룹에서 해제되었습니다.';
    }

    // 서버에 보낼 데이터 (user_code와 group_id)
    const data = {
        user_code: user_code,
        group_id: group_id
    };
    $.ajax({
        url: url,
        type: method,
        contentType: 'application/json', // JSON 형식으로 데이터를 보낼 때
        data: JSON.stringify(data),
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
                alert("오류가 발생했습니다: " + response.data);
            }
        },
        error: function(xhr, status, error) {
            alert('오류 발생: 변경 사항이 저장되지 않았습니다. (' + error + ')');
            // 실패 시 체크박스 상태를 되돌립니다.
            // (가장 확실한 방법은 Tabulator 데이터를 다시 로드하는 것입니다.)
            dataTable.replaceData(); 
        }
    });
  }

    //알람 그룹 선택 시 호출 함수
    function alarmGroupClick(e, cell) {
        if (e.target.type !== 'checkbox') {
            return; 
        }
        // e.target.checked는 클릭 후의 체크박스 상태 (true 또는 false)를 반환합니다.
        const isChecked = e.target.checked;
        const newValue = isChecked ? 1 : 0; // 서버에 보낼 값 (1 또는 0) 

        const alarm_address = cell.getData().alarm_address; // 알람 고유 ID (PK)
        const columnField = cell.getColumn().getField(); // 클릭된 칼럼 이름 (예: "group_a", "group_b")
        const groupTitle = cell.getColumn().getDefinition().title; // 컬럼 제목 (예: "그룹 A")
        console.log("alarm_address: ", alarm_address + ", 필드: ", columnField + ", 새 값: ", newValue);

        // 서버에 보낼 데이터
        const data = {
        	alarm_address: alarm_address,
            fieldName: columnField, // "group_a", "group_b" 등
            newValue: newValue      // 1 또는 0
        };
        $.ajax({
            url: '/tkheat/alarm/updateAlarmGroup', 
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            
            success: function(response) {
                // 서버 응답이 성공 (true)일 경우
                if (response === true) { // 서버 응답 구조에 맞게 수정 (예: {success: true})
                    //alert(`${groupTitle} 상태가 성공적으로 ${isChecked ? '추가' : '해제'}되었습니다.`);
                    
                    // 2. Tabulator 데이터 업데이트 (화면 갱신)
                    const row = cell.getRow();
                    const updateObj = {};
                    
                    // 클릭된 칼럼 필드(group_a 등)의 값을 새 값(1 또는 0)으로 설정
                    updateObj[columnField] = newValue;
                    row.update(updateObj); 
                    
                } else {
                    alert("오류가 발생했습니다: " + (response.message || '알 수 없는 오류'));
                    // 실패 시, Tabulator를 강제 새로고침하여 체크박스 상태를 되돌립니다.
                    // alarmGroupTable.replaceData(); 
                }
            },
            error: function(xhr, status, error) {
                alert('오류 발생: 변경 사항이 저장되지 않았습니다. (' + error + ')');
                // 실패 시, 실제 데이터의 상태와 맞추기 위해 테이블을 새로고침하는 것이 안전합니다.
                // alarmGroupTable.replaceData(); 
            }
        });
  }

    //그룹별 수신 알람 선택 시 호출 함수
    function recieveAlarmpClick(e, cell) {
        if (e.target.type !== 'checkbox') {
            return; 
        }
        // e.target.checked는 클릭 후의 체크박스 상태 (true 또는 false)를 반환합니다.
        const isChecked = e.target.checked;
        const newValue = isChecked ? 1 : 0; // 서버에 보낼 값 (1 또는 0) 

        const group_id = cell.getData().group_id; // 알람 고유 ID (PK)
        const columnField = cell.getColumn().getField(); // 클릭된 칼럼 이름 (예: "group_a", "group_b")
        const groupTitle = cell.getColumn().getDefinition().title; // 컬럼 제목 (예: "그룹 A")
        console.log("알람 ID: ", group_id + ", 필드: ", columnField + ", 새 값: ", newValue);

        // 서버에 보낼 데이터
        const data = {
        	group_id: group_id,
            fieldName: columnField, // "group_a", "group_b" 등
            newValue: newValue      // 1 또는 0
        };
        $.ajax({
            url: '/tkheat/user/updateRecieveAlarm', 
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            
            success: function(response) {
                // 서버 응답이 성공 (true)일 경우
                if (response === true) { // 서버 응답 구조에 맞게 수정 (예: {success: true})
                    //alert(`${groupTitle} 상태가 성공적으로 ${isChecked ? '추가' : '해제'}되었습니다.`);
                    
                    // 2. Tabulator 데이터 업데이트 (화면 갱신)
                    const row = cell.getRow();
                    const updateObj = {};
                    
                    // 클릭된 칼럼 필드(group_a 등)의 값을 새 값(1 또는 0)으로 설정
                    updateObj[columnField] = newValue;
                    row.update(updateObj); 
                    
                } else {
                    alert("오류가 발생했습니다: " + (response.message || '알 수 없는 오류'));
                    // 실패 시, Tabulator를 강제 새로고침하여 체크박스 상태를 되돌립니다.
                    // alarmGroupTable.replaceData(); 
                }
            },
            error: function(xhr, status, error) {
                alert('오류 발생: 변경 사항이 저장되지 않았습니다. (' + error + ')');
                // 실패 시, 실제 데이터의 상태와 맞추기 위해 테이블을 새로고침하는 것이 안전합니다.
                // alarmGroupTable.replaceData(); 
            }
        });
  }
    
//1호기 수신/거부 라디오 버튼 포맷터
function customCheckboxFormatter1(cell, formatterParams, onRendered) {
    const data = cell.getRow().getData();
    
    // 데이터가 null/undefined일 경우 'N'으로 기본값 설정
    const ynValue = data.message_yn || 'N'; 
    
    //console.log("ynValue: ", ynValue);
    
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
	    
	    //console.log("ynValue: ", ynValue);
	    
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

  // 알람 발송 스케줄 시간 버튼 클릭 시
  $('.group-time-button').click(function() {
	  $('#groupTimeModal form').trigger('reset');
    $('#groupTimeModal').show().addClass('show');
  });

  // 알람 그룹 관리 버튼 클릭 시
  $('.alarm-group-button').click(function() {
    $('#alarmGroupModal').show().addClass('show');
    initAlarmGroupTable();
  });
  // 그룹별 수신 알람 설정 버튼 클릭 시
  $('.recieve-alarm-button').click(function() {
    $('#recieveAlarmModal').show().addClass('show');
    initRecieveAlarmTable();
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
  $('.close, #closeModal, #cancelBtn').click(function() {
    $('#modalContainer').removeClass('show').hide();
    $('#groupTimeModal').removeClass('show').hide();
    $('#alarmGroupModal').removeClass('show').hide();
    $('#recieveAlarmModal').removeClass('show').hide();
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

  // 시간 저장 버튼 클릭 시
  $('#saveTimeBtn').click(function(event) {
    event.preventDefault();
    
    const formElement = document.getElementById('groupTimeForm'); 
    
    // 🌟 폼 요소를 FormData에 전달합니다. 🌟
    const formData = new FormData(formElement); 

    // ... (이하 데이터 추출 로직은 동일) ...
    const data = {
        group_id: formData.get('group_id'),
        start_date: formData.get('start_date'),
        end_date: formData.get('end_date'),
        start_time: formData.get('start_time'),
        end_time: formData.get('end_time')
    };
    console.log("전송 data: ", data);

    if (!data.group_id || !data.start_time || !data.end_time) {
        alert("모든 항목을 선택해 주세요.");
        return;
    }
    
    $.ajax({
        url: '/tkheat/user/insertGroupSchedule', 
        type: 'POST', 
        contentType: 'application/json', // 보내는 데이터 형식: JSON
        data: JSON.stringify(data), // JavaScript 객체를 JSON 문자열로 변환하여 전송
        success: function(response) {
            alert("알림 수신 시간이 성공적으로 업데이트되었습니다. ");
            
            // 모달 닫기 (이전에 정의된 closeGroupTimeModal 함수 사용 가정)
            if (typeof closeGroupTimeModal === 'function') {
                closeGroupTimeModal();
            } else {
                // closeGroupTimeModal 함수가 없을 경우, jQuery로 모달 숨기기
                $('#groupTimeModal').hide(); 
            }
            calendar.refetchEvents();
        },
        error: function(xhr, status, error) {
            alert('시간 설정 업데이트 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요. ❌');
            console.error("AJAX Error:", error, xhr.responseText);
        }
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

  //그룹별 조회
  $('#groupSelect').on('change', function() {
      const selectedGroupId = $(this).val(); // 선택된 <option>의 value (그룹 ID 또는 빈 문자열)
/*       // 빈 문자열인 경우 null로 변환 (Integer 바인딩 오류 방지)
      if (selectedGroupId === "") {
          selectedGroupId = null;
      } */
      console.log("선택된 그룹 ID:", selectedGroupId);

      // 1. 서버에 전송할 데이터 준비
      const dataToSend = {
          group_id: selectedGroupId // 서버에서 받을 파라미터 이름에 맞춰 사용
      };

      // 2. AJAX 요청: 서버에서 필터링된 알람 목록을 요청
      $.ajax({
          url: "/tkheat/user/getGroupUser",
          type: 'POST', 
          contentType: 'application/json', // 보내는 데이터 형식: JSON
          data: JSON.stringify(dataToSend), // JavaScript 객체를 JSON 문자열로 변환하여 전송 
          success: function(filteredData) {
              console.log("필터링된 데이터 수신:", filteredData.length);
              
              // 3. Tabulator 데이터 갱신
              // dataTable은 Tabulator 인스턴스 변수라고 가정합니다.
              if (typeof dataTable !== 'undefined' && dataTable.replaceData) {
                  // 서버로부터 받은 새 데이터로 Tabulator를 교체하여 화면을 갱신합니다.
                  dataTable.replaceData(filteredData);
              } else {
                  console.error("Tabulator 인스턴스를 찾을 수 없습니다: dataTable");
              }
          },
          
          error: function(xhr, status, error) {
              console.error("그룹별 알람 조회 중 오류 발생:", error);
              alert("알람 목록을 조회하는 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
          }
      });
  });
});
</script>


</body>
</html>