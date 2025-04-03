<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설비등록</title>
    <link rel="stylesheet" href="/tkheat/css/management/facInsert.css">
    <link rel="stylesheet" href="/tkheat/css/tabBar/tabBar.css">
	<%@include file="../include/pluginpage.jsp" %>    
<style>
    
	
	.container {
		display: flex;
		justify-content: space-between;
/*		margin-left:1008px;
		margin-top:200px;*/
	}

        #tab1, #tab2, #tab3, #tab4 {
            visibility: hidden;
        }

        #tab1 {
            visibility: visible;
        }

        .tabulator {
            width: 90%;
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
	    
	    
	<div class="facModal">
      <div class="fac-main"></div>
      <div class="fac-header">설비등록</div>
      <div class="_1">설비번호</div>
      <div class="_2">설비명</div>
      <div class="_3">규격</div>
      <div class="_4">형식</div>
      <div class="_5">용도</div>
      <div class="_6">설비종류</div>
      <div class="_7">관리자(정)</div>
      <div class="_8">관리자(부)</div>
      <div class="_9">사용부서</div>
      <div class="_10">제조번호</div>
      <div class="_11">설치장소</div>
      <div class="_12">제조사국적</div>
      <div class="_13">제조회사</div>
      <div class="_14">구입처</div>
      <div class="_15">유지보수업체</div>
      <div class="_16">도입시기</div>
      <div class="_17">제조일자</div>
      <div class="_18">구입가격</div>
      <div class="_19">실적및현황 출력</div>
      <div class="_20">처리용량</div>
      <div class="_21">가동기준시간</div>
      <div class="_22">점검주기</div>
      <div class="_23">주변설비 및 관련사항</div>
      <div class="_24">비고</div>
      <div class="_25">설비점검주의사항</div>
      <div class="_26">이미지</div>
      <div class="_27">특이사항</div>
      <input type="text" class="fac-no">
	  <input type="text" class="fac-name">
	  <select class="fac-gyu">
	    <option value="가스질화">가스질화</option>
	    <option value="이온질화">이온질화</option>
	    <option value="침탄">침탄</option>
	    <option value="VC">VC</option>
	    <option value="PQ">PQ</option>
	    <option value="TEMPERING">TEMPERING</option>
	    <option value="진공">진공</option>
	    <option value="세척기">세척기</option>
	    <option value="후처리">후처리</option>
	    <option value="기타">기타</option>
	  </select>
	  <input type="text" class="fac-hyun">
	  <input type="text" class="fac-yong">
	  <input type="text" class="fac-man-1">
	  <select class="tech-no">
	    <option value=""></option> <!-- 내용 비워둠 -->
	  </select>
	  <input type="text" class="fac-man-1">
	  <input type="text" class="fac-man-2">
	  <input type="text" class="fac-lot">
	  <input type="text" class="fac-e-1">
	  <input type="text" class="fac-plc">
	  <input type="text" class="fac-e-2">
	  <input type="text" class="fac-make">
	  <input type="text" class="fac-cbuy">
	  <input type="date" class="fac-e-3">
	  <input type="text" class="fac-buy">
	  <input type="date" class="fac-mday">
	  <input type="text" class="fac-mon">
	  <input type="text" class="fac-dan">
	  <input type="text" class="fac-able">
	  <input type="text" class="fac-time">
	  <input type="text" class="fac-test">
	  <input type="text" class="fac-e-4">
	  <input type="text" class="fac-bigo">
	  <input type="text" class="fac-cau">
	  <input type="file" class="file-upload">
	  <div class="image-preview"></div> <!-- 이미지 미리보기 박스 -->
	  <input type="text" class="fac-unus">
      <div class="save">저장</div>
      <div class="close">닫기</div>

    </div>    
	    
	    
	    
	    
	    
<script>
	//전역변수
    var cutumTable;	

	//로드
	$(function(){
		//전체 거래처목록 조회
		getFacList();
	});

	//이벤트
	//함수
	function getFacList(){
		
		userTable = new Tabulator("#tab1", {
		    height:"750px",
		    layout:"fitColumns",
		    selectable:true,	//로우 선택설정
		    tooltips:true,
		    selectableRangeMode:"click",
		    selectableRows:true,
		    reactiveData:true,
		    headerHozAlign:"center",
		    ajaxConfig:"POST",
		    ajaxLoader:false,
		    ajaxURL:"/tkheat/management/facInsert/getFacList",
		    ajaxProgressiveLoad:"scroll",
		    ajaxParams:{},
		    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
		    ajaxResponse:function(url, params, response){
				$("#tab1 .tabulator-col.tabulator-sortable").css("height","29px");
		        return response; //return the response data to tabulator
		    },
		    columns:[
		        {title:"NO", field:"idx", sorter:"int", width:80,
		        	hozAlign:"center"},
		        {title:"설비NO", field:"fac_no", sorter:"string", width:120,
		        	hozAlign:"center"},
		        {title:"설비명", field:"fac_name", sorter:"string", width:150,
		        	hozAlign:"center"},
		        {title:"규격", field:"fac_gyu", sorter:"string", width:100,
		        	hozAlign:"center"},
		        {title:"형식", field:"fac_hyun", sorter:"string", width:200,
		        	hozAlign:"center"},
		        {title:"용도", field:"fac_yong", sorter:"int", width:200,
		        	hozAlign:"center"},
		        {title:"설치장소", field:"fac_plc", sorter:"int", width:200,
			        hozAlign:"center"},
			    {title:"능력", field:"fac_able", sorter:"int", width:120,
				    hozAlign:"center"},
				{title:"제작사", field:"fac_make", sorter:"int", width:150,
					hozAlign:"center"},
				{title:"구매처", field:"fac_cbuy", sorter:"int", width:100,
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
	


	// 드래그 기능 추가
	const modal = document.querySelector('.facModal');
	const header = document.querySelector('.fac-header'); // 헤더를 드래그할 요소로 사용

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
	const facModal = document.querySelector('.facModal');
	const closeButton = document.querySelector('.close');

	insertButton.addEventListener('click', function() {
		facModal.style.display = 'block'; // 모달 표시
	});

	closeButton.addEventListener('click', function() {
	    facModal.style.display = 'none'; // 모달 숨김
	});




	
    </script>

	</body>
</html>
