<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>작업지시</title>
    <link rel="stylesheet" href="/tkheat/css/management/productInsert.css">
    <link rel="stylesheet" href="/tkheat/css/tabBar/tabBar.css">
    <script type="text/javascript" src="https://oss.sheetjs.com/sheetjs/xlsx.full.min.js"></script>
<%@include file="../include/pluginpage.jsp" %> 
    <style>
    
.main{
	width:98%;
}
.container {
	display: flex;
	justify-content: space-between;
}
.tabulator {
	width: 100%;
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
.box1 {
	display: flex;
	justify-content: right;
	align-items: center;
/*	width: 1500px;*/
/*	margin-left: -620px;*/
	margin-left: -25%;
}

.box1 input{
	width : 7%;
}
.box1 select{
	width: 5%
}  

.workSetModal {
	position: fixed; /* 화면에 고정 */
	top: 50%; /* 수직 중앙 */
	left: 40%; /* 수평 중앙 */
	display: none;
	transform: translate(-50%, -50%); /* 정확한 중앙 정렬 */
	z-index: 20010; /* 다른 요소 위에 표시 */
	border:2px solid black;
	background-color:white;
}


.workWaitModal {
	position: fixed; /* 화면에 고정 */
	top: 50%; /* 수직 중앙 */
	left: 70%; /* 수평 중앙 */
	display: none;
	transform: translate(-50%, -50%); /* 정확한 중앙 정렬 */
	z-index: 20011; /* 다른 요소 위에 표시 */
	border:2px solid black;
	background-color:white;
	width:1100px;
}

.workSelectModal {
	position: fixed; /* 화면에 고정 */
	top: 50%; /* 수직 중앙 */
	left: 40%; /* 수평 중앙 */
	display: none;
	transform: translate(-50%, -50%); /* 정확한 중앙 정렬 */
	z-index: 20010; /* 다른 요소 위에 표시 */
	border:2px solid black;
	background-color:white;
}

.workJModal {
	position: fixed; /* 화면에 고정 */
	width:1200px;
	height:700px;
	top: 50%; /* 수직 중앙 */
	left: 40%; /* 수평 중앙 */
	display: none;
	transform: translate(-50%, -50%); /* 정확한 중앙 정렬 */
	z-index: 20010; /* 다른 요소 위에 표시 */
	border:2px solid black;
	background-color:white;
}

.workAModal {
	position: fixed; /* 화면에 고정 */
	width:1600px;
	height:700px;
	top: 50%; /* 수직 중앙 */
	left: 50%; /* 수평 중앙 */
	display: none;
	transform: translate(-50%, -50%); /* 정확한 중앙 정렬 */
	z-index: 20010; /* 다른 요소 위에 표시 */
	border:2px solid black;
	background-color:white;
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

.tabulator-header > .tabulator-headers > .tabulator-col{
	height:55px !important;
}

.setRow{
	display:flex;
}

.setRow *{
	margin-right:5px;
	height:25px;
}

.setRow input,select{
	border: 1px solid black;
	width: 10%;
	height:25px;
}

.setRow button{
	width: 10%;
	height: 25px;
}

.setRowWait{
	display:flex;
}

.setRowWait *{
	margin-right:5px;
	height:25px;
}

.setRowWait input,select{
	border: 1px solid black;
	width: 12%;
	height:25px;
}

.setRowWait button{
	width: 10%;
	height: 25px;
}

input[type="date"] {
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

.workSelectBtn{
    width: 100px;
    height:50px;
    padding: 5px 10px;
    line-height: 50px;
    font-size: 14pt;
    text-align:center;
    align-items:center;
    border: 1px solid #ccc;
    border-radius: 6px;
    background-color: #f9f9f9;
    cursor:pointer;
}


.iRowLabel{
	display:inline-block;
	width:150px;
	height:25px;
}

.iRowLabel2{
	display:inline-block;
	width:100px;
	height:25px;
}

.iRowInput{
	/*display:flex;*/
	width:200px !important;
	height:25px;
}

.iRowInput2{
	width:100px !important;
	height:25px;
}

.iCol{
	width:35%;
	display:inline-block;
}


.iRow2{
	display:inline-block;
}
    </style>
    
    
    <body>
    
    <div class="tab">
    <div class="box1">
         <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
		<label class="daylabel">지시일 :</label>
		<input type="date" class="plnp_date" id="plnp_date" style="font-size: 16px;" autocomplete="off">
			
		<label class="daylabel">거래처명 :</label>
		<input type="text" class="corp_name" id="corp_name" style="font-size: 16px;" autocomplete="off">
			
		<label class="daylabel">품명 :</label>
		<input type="text" class="prod_name" id="prod_name" style="font-size: 16px;" autocomplete="off">
			
		<label class="daylabel">품번 :</label>
		<input type="text" class="prod_no" id="prod_no" style="font-size: 16px;" autocomplete="off">
		
		<label class="daylabel">제품구분 :</label>
		<input type="text" class="prod_gubn" id="prod_gubn" style="font-size: 16px;" autocomplete="off">
		
		<label class="daylabel">설비선택 :</label>
		<input type="text" class="fac_name" id="fac_name" style="font-size: 16px;" autocomplete="off">
			
	</div>
    <div class="button-container">
        <button class="select-button" onclick="getWorkInstructionList();">
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
	    
<!-- 다이얼로그 -->
<!-- 준비, 열처리, 템퍼링 등록구분 모달 -->
<div class="workSelectModal">
	<div class="detail">
		<div class="header">
			작업등록 선택
		</div>
		<div class="setRow">
			<div id="workJ" class="workSelectBtn" onclick="workSelectFunc('J')">준비</div>
			<div id="workA" class="workSelectBtn" onclick="workSelectFunc('A')">열처리</div>
			<div id="workR" class="workSelectBtn" onclick="workSelectFunc('R')">템퍼링</div>
		</div>
	</div>
    <div class="btnSelectClose">
<!--        <button class="save" type="button" onclick="save();">저장</button> -->
            <button class="workSelectClose" type="button" onclick="workSelectCloseBtn();">닫기</button>
    </div>		
</div>


<!-- 준비작업 저장 모달 -->
<div class="workJModal">
	<div class="detail">
		<div class="header">
		준비작업
		</div>
	</div>
		<form id="workJForm" name="workJForm">

			<div class="iRow">
				<label for="barcode" class="iRowLabel">수주NO</label>
				<input type="text" id="barcode" name="barcode" class="iRowInput"/>
				<button type="button" onclick="getWorkJBarcode();">검색</button>
			</div>
			<div class="setRow">
				<div id="workJTabu"></div>
			</div>
				
			<div class="iCol">	
				<div class="iRow">
					<label for="ilbo_strt" class="iRowLabel">작업 시작일</label>
					<input type="text" name="ilbo_strt" class="iRowInput"/>
				</div>
				<div class="iRow">
					<label for="ilbo_end" class="iRowLabel">작업 종료일</label>
					<input type="text" name="ilbo_end" class="iRowInput"/>
				</div>
				<div class="iRow">
					<label class="iRowLabel">*적재방법*</label>
				</div>
				<div class="iRow">
					<label for="wstd_t32" class="iRowLabel">1줄/1판</label>
					<input type="text" name="wstd_t32" class="iRowInput"/>
				</div>
				<div class="iRow">
					<label for="wstd_t33" class="iRowLabel">줄/단</label>
					<input type="text" name="wstd_t33" class="iRowInput"/>
				</div>
				<div class="iRow">
					<label for="wstd_t41" class="iRowLabel">단/Tray</label>
					<input type="text" name="wstd_t41" class="iRowInput"/>
				</div>
				<div class="iRow">
					<label class="iRowLabel">추가수량</label>
					<input type="text" name="wstd_t87" class="iRowInput"/>
				</div>
				<div class="iRow">
					<label class="iRowLabel">적재수량</label>
					<input type="text" name="wstd_t43" class="iRowInput"/>
				</div>
				<div class="iRow">
					<label for="wstd_t44" class="iRowLabel">Jig중량(kg)</label>
					<input type="text" name="wstd_t44" class="iRowInput"/>
				</div>
				<div class="iRow">
					<label for="wstd_t51" class="iRowLabel">제품중량(kg)</label>
					<input type="text" name="wstd_t51" class="iRowInput"/>
				</div>
				<div class="iRow">
					<label for="wstd_t52" class="iRowLabel">총중량(kg)</label>
					<input type="text" name="wstd_t52" class="iRowInput"/>
				</div>
	
				<!-- 
					작업자
					작업일(시작)	ilbo_strt
					작업일(종료)	ilbo_end
					
					*적재방법*
					1줄/1판		WSTD_T32
					줄/단			WSTD_T33
					단/Tray 		WSTD_T41
					추가수량
					적재수량
					Jig중량(kg) 	WSTD_T44
					제품중량(kg) 	WSTD_T51
					총중량(kg) 	WSTD_T52
					
					*적재주의사항*
					1줄			WSTD_T53
					2줄			WSTD_T54
					3줄			WSTD_T30
					치구불량
					비고
				 -->
			</div>
			<div class="iCol">
				<div class="iRow">
					<label class="iRowLabel">적재주의사항-1</label>
					<input type="text" name="wstd_t53" class="iRowInput"/>
				</div>
				<div class="iRow">
					<label class="iRowLabel">적재주의사항-2</label>
					<input type="text" name="wstd_t54" class="iRowInput"/>
				</div>
				<div class="iRow">
					<label class="iRowLabel">적재주의사항-3</label>
					<input type="text" name="wstd_t30" class="iRowInput"/>
				</div>
				<div class="iRow">
					<label class="iRowLabel">치구불량</label>
					<input type="text" class="iRowInput"/>
				</div>
				<div class="iRow">
					<label class="iRowLabel">비고</label>
					<input type="text" class="iRowInput"/>
				</div>
				<input type="text" name="ilbo_su" style="display:none;" />
				<input type="text" name="ilbo_jung" style="display:none;" />
				<input type="text" name="ord_code" style="display:none;" />
			</div>
		</form>
	
    <div class="btnSaveClose">
            <button class="save" type="button" onclick="workJSave();">저장</button>
            <button class="workJClose" type="button" onclick="workJCloseBtn();">닫기</button>
    </div>	
</div>

<!-- 열처리작업 저장 모달 -->
<div class="workAModal">
	<div class="detail">
		<div class="header">
		열처리작업
		</div>
	</div>
		<form id="workAForm" name="workAForm">

			<div class="iRow">
				<label for="barcode" class="iRowLabel">수주NO</label>
				<input type="text" id="barcodeA" name="barcode" class="iRowInput"/>
				<label for="ilbo_lot" class="iRowLabel">생산NO</label>
				<input type="text" id="ilbo_lot" name="ilbo_lot" class="iRowInput"/>
				<button type="button" onclick="getWorkABarcode();">검색</button>
			</div>
			<div class="setRow">
				<div id="workATabu"></div>
			</div>
				<div class="iRow2">
					<label for="ilbo_strt" class="iRowLabel2">작업시작</label>
					<input type="text" name="ilbo_strt" class="iRowInput"/>
				</div>
				<div class="iRow2">	
					<label for="ilbo_end" class="iRowLabel2">작업종료</label>
					<input type="text" name="ilbo_end" class="iRowInput"/>
				</div>					
				<div class="iRow2">
					<label for="ilbo_end" class="iRowLabel2">주/야</label>
					<input type="text" name="ilbo_end" class="iRowInput2"/>
				
				</div>				
				<div class="iRow2">
					<label for="ilbo_end" class="iRowLabel2">총수량</label>
					<input type="text" name="ilbo_end" class="iRowInput2"/>
				</div>				
				<div class="iRow2">
					<label for="ilbo_end" class="iRowLabel2">총중량</label>
					<input type="text" name="ilbo_end" class="iRowInput2"/>				
				</div>
				
				<div class="iRow">
					<div class="iRow2">
						<label for="ilbo_strt" class="iRowLabel2">설비</label>
						<input type="text" name="ilbo_strt" class="iRowInput"/>
					</div>
					<div class="iRow2">
						<label for="ilbo_strt" class="iRowLabel2">작업자</label>
						<input type="text" name="ilbo_strt" class="iRowInput"/>
					</div>
				</div>
				<div class="iRow">
					*****************************열처리 작업조건******************************************************************************
				</div>
				<div class="iRow">
					<div class="iRow2">
						<label for="wstd_gj11" class="iRowLabel2">예열온도</label>
						<input type="text" name="wstd_gj11" class="iRowInput2"/>
						<label for="wstd_gj12" class="iRowLabel2">침탄온도</label>
						<input type="text" name="wstd_gj12" class="iRowInput2"/>
						<label for="wstd_gj13" class="iRowLabel2">확산온도</label>
						<input type="text" name="wstd_gj13" class="iRowInput2"/>
						<label for="wstd_gj14" class="iRowLabel2">강온온도</label>
						<input type="text" name="wstd_gj14" class="iRowInput2"/>
						<label for="wstd_gj15" class="iRowLabel2">균열온도</label>
						<input type="text" name="wstd_gj15" class="iRowInput2"/>
						<label for="wstd_gj16" class="iRowLabel2">냉각온도</label>
						<input type="text" name="wstd_gj16" class="iRowInput2"/>
					</div>
				</div>
				<div class="iRow">
					<div class="iRow2">
						<label for="wstd_gj21" class="iRowLabel2">예열시간</label>
						<input type="text" name="wstd_gj21" class="iRowInput2"/>
						<label for="wstd_gj22" class="iRowLabel2">침탄시간</label>
						<input type="text" name="wstd_gj22" class="iRowInput2"/>
						<label for="wstd_gj23" class="iRowLabel2">확산시간</label>
						<input type="text" name="wstd_gj23" class="iRowInput2"/>
						<label for="wstd_gj24" class="iRowLabel2">강온시간</label>
						<input type="text" name="wstd_gj24" class="iRowInput2"/>
						<label for="wstd_gj25" class="iRowLabel2">균열시간</label>
						<input type="text" name="wstd_gj25" class="iRowInput2"/>
						<label for="wstd_gj26" class="iRowLabel2">냉각시간</label>
						<input type="text" name="wstd_gj26" class="iRowInput2"/>
					</div>
				</div>
				<div class="iRow">
					<div class="iRow2">
						<label for="wstd_gj31" class="iRowLabel2">예열CP</label>
						<input type="text" name="wstd_gj31" class="iRowInput2"/>
						<label for="wstd_gj32" class="iRowLabel2">침탄CP</label>
						<input type="text" name="wstd_gj32" class="iRowInput2"/>
						<label for="wstd_gj33" class="iRowLabel2">확산CP</label>
						<input type="text" name="wstd_gj33" class="iRowInput2"/>
						<label for="wstd_gj34" class="iRowLabel2">강온CP</label>
						<input type="text" name="wstd_gj34" class="iRowInput2"/>
						<label class="iRowLabel2">균열CP</label>
						<input type="text" class="iRowInput2"/>
						<label class="iRowLabel2">냉각CP</label>
						<input type="text" class="iRowInput2"/>
					</div>
				</div>
				<div class="iRow">
					<div class="iRow2">
						<label for="wstd_gj69" class="iRowLabel2">예열H2</label>
						<input type="text" name="wstd_gj69" class="iRowInput2"/>
						<label for="wstd_gj72" class="iRowLabel2">침탄H2</label>
						<input type="text" name="wstd_gj72" class="iRowInput2"/>
						<label for="wstd_gj73" class="iRowLabel2">확산H2</label>
						<input type="text" name="wstd_gj73" class="iRowInput2"/>
						<label for="wstd_gj74" class="iRowLabel2">강온H2</label>
						<input type="text" name="wstd_gj74" class="iRowInput2"/>
						<label class="iRowLabel2">균열H2</label>
						<input type="text" class="iRowInput2"/>
						<label class="iRowLabel2">냉각H2</label>
						<input type="text" class="iRowInput2"/>
					</div>
				</div>
				<div class="iRow">
					<div class="iRow2">
						<label for="wstd_gj79" class="iRowLabel2">예열NH3</label>
						<input type="text" name="wstd_gj79" class="iRowInput2"/>
						<label for="wstd_gj82" class="iRowLabel2">침탄NH3</label>
						<input type="text" name="wstd_gj82" class="iRowInput2"/>
						<label for="wstd_gj83" class="iRowLabel2">확산NH3</label>
						<input type="text" name="wstd_gj83" class="iRowInput2"/>
						<label for="wstd_gj84" class="iRowLabel2">강온NH3</label>
						<input type="text" name="wstd_gj84" class="iRowInput2"/>
						<label class="iRowLabel2">균열NH3</label>
						<input type="text" class="iRowInput2"/>
						<label class="iRowLabel2">냉각NH3</label>
						<input type="text" class="iRowInput2"/>
						<label class="iRowLabel2"></label>
						<input type="text" class="iRowInput2"/>
					</div>
				</div>
				<div class="iRow">
					<div class="iRow2">
						<label for="wstd_gj42" class="iRowLabel2">RX</label>
						<input type="text" name="wstd_gj42" class="iRowInput2"/>
						<label for="wstd_gj52" class="iRowLabel2">LPG</label>
						<input type="text" name="wstd_gj52" class="iRowInput2"/>
						<label for="wstd_gj17" class="iRowLabel2">교반속도</label>
						<input type="text" name="wstd_gj17" class="iRowInput2"/>
					</div>
				</div>
		</form>
	
    <div class="btnSaveClose">
            <button class="save" type="button" onclick="workASave();">저장</button>
            <button class="workAClose" type="button" onclick="workACloseBtn();">닫기</button>
    </div>	
</div>

<input type="text" id="plnpSeq" style="display:none;" value="0" />
<input type="text" id="plnpLot" style="display:none;" value="0" />

<form id="reportPrint" name="reportPrint">
	<input type="text" id="reportDate" name="reportDate" style="display:none;"/>
	<input type="text" id="reportBarcode" name="reportBarcode" style="display:none;"/>
	<input type="text" id="reportPlnpLot" name="reportPlnpLot" style="display:none;"/>
</form>

<a style="display:none;" id="downLoadLink" href="#" download="#"></a>
<iframe src="" frameborder="0" id="workReport" style="display:none;"></iframe>
<script>
	//전역변수
    var cutumTable;	
	
	//로드
	$(function(){
		//전체 거래처목록 조회
		var ydate = yesterDate();
		var tdate = todayDate();
		
		
		$("#plnp_date").val(tdate);		
		$("#s_plnp_date").val(tdate);
		
		$("#wait_ord_sdate").val(ydate);
		$("#wait_ord_edate").val(tdate);
		
		getWorkInstructionList();
	});

	//이벤트
	
	//작업지시서 출력
	$(".printer-button").on("click", function(){
		
		var printForm = new FormData($("#reportPrint")[0]);
		//선택한 행
		
		//plnp_lot
		//날짜
		//바코드
		
		$.ajax({
            url: "/tkheat/production/workInstruction/workInstructionReport",
            type: "POST",
            data: printForm,
            contentType: false,    
            processData: false,   
            dataType: "json",      
            success: function(result) {
                console.log(result);
				var resultData = result.data;

				var fileName = decodeURIComponent(resultData);
                var downLoadUrl = "/tkheat/print/"+fileName;
			
                console.log(downLoadUrl);
                
                $("#workReport").attr("src",downLoadUrl);
                $("#workReport").show();

                
/*
				$("#downLoadLink").prop("href",downLoadUrl);
				$("#downLoadLink").prop("download",fileName);
				
				$("#downLoadLink")[0].click();     
*/
                alert("저장 되었습니다.");

//                $(".chimStandardModal").hide();
 //               getBegaInsertList();
                
            },
            error: function(xhr, status, error) {
                console.error("저장 오류:", error);
            }
		})
	});
	
	//함수
	
	//작업지시 전체이력
	function getWorkInstructionList(){
		
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
		    ajaxURL:"/tkheat/production/workInstruction/getWorkInstructionList",
		    ajaxProgressiveLoad:"scroll",
		    ajaxParams:{
		    	"plnp_date": $("#plnp_date").val(),
                "corp_name": $("#corp_name").val(),
                "prod_name": $("#prod_name").val(),
                "prod_no": $("#prod_no").val(),
                "prod_gubn": $("#prod_gubn").val(),
                "fac_name": $("#fac_name").val()
			},
		    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
		    ajaxResponse:function(url, params, response){
				$("#tab1 .tabulator-col.tabulator-sortable").css("height","55px");
		        return response; //return the response data to tabulator
		    },
		    columns:[
		        {title:"NO", field:"plnp_no", sorter:"int", width:80,
		        	hozAlign:"center", visible:false},
		        {title:"입고일", field:"ord_date", sorter:"string", width:120,
			        hozAlign:"center"},	
		        {title:"지시일", field:"ilbo_strt", sorter:"string", width:120,
			        hozAlign:"center"},	
		        {title:"작업번호", field:"ilbo_lot", sorter:"string", width:140,
			        hozAlign:"center"},	
		        {title:"작업구분", field:"ilbo_gubn", sorter:"string", width:100,
			        hozAlign:"center"},	
		        {title:"수주NO", field:"ord_code", sorter:"string", width:140,
			        hozAlign:"center"},	
		        {title:"바코드", field:"plnp_barcode", sorter:"string", width:140,
			        hozAlign:"center", visible:false},	
/*			    {title:"제품사진", field:"prod_date", sorter:"string", width:120,
				    hozAlign:"center"},*/     
				{title:"설비", field:"fac_name", sorter:"string", width:120,
				    hozAlign:"center", headerFilter:"input"}, 
				{title:"순번", field:"ilbo_no", sorter:"string", width:80,
				    hozAlign:"center", headerFilter:"input"}, 
		        {title:"거래처", field:"corp_name", sorter:"string", width:120,
		        	hozAlign:"center", headerFilter:"input"},		        
		        {title:"품명", field:"prod_name", sorter:"string", width:160,
		        	hozAlign:"center", headerFilter:"input"},
		        {title:"품번", field:"prod_no", sorter:"string", width:160,
		        	hozAlign:"center", headerFilter:"input"},
		        {title:"규격", field:"prod_gyu", sorter:"string", width:100,
			        hozAlign:"center", headerFilter:"input"},	
		        {title:"재질", field:"prod_jai", sorter:"int", width:100,
		        	hozAlign:"center", headerFilter:"input"},  	
		        {title:"입고수량", field:"ord_su", sorter:"int", width:90,
			        hozAlign:"center", headerFilter:"input"},	
		        {title:"작업수량", field:"ilbo_su", sorter:"int", width:90,
			        hozAlign:"center", headerFilter:"input"},	
			    {title:"온도(침탄)", field:"plnp_tmp1", sorter:"int", width:100,
				    hozAlign:"center", visible:false, headerFilter:"input"},	
				{title:"시간(침탄)", field:"plnp_time1", sorter:"int", width:100,
				    hozAlign:"center", visible:false, headerFilter:"input"},
				{title:"온도(확산)", field:"plnp_tmp2", sorter:"int", width:100,
					hozAlign:"center", visible:false, headerFilter:"input"},
			    {title:"시간(확산)", field:"plnp_time2", sorter:"int", width:100,
					hozAlign:"center", visible:false, headerFilter:"input"},
 			    {title:"소려온도", field:"plnp_ttmp", sorter:"int", width:100,
					hozAlign:"center", visible:false, headerFilter:"input"},
 			    {title:"소려시간", field:"plnp_ttime", sorter:"int", width:100,
					hozAlign:"center", visible:false, headerFilter:"input"},
		        {title:"비고", field:"plnp_note", sorter:"int", width:100,
			        hozAlign:"center", headerFilter:"input"},	
		        {title:"경화깊이", field:"prod_cd", sorter:"int", width:300,
			        hozAlign:"center", headerFilter:"input"},	
		        {title:"표면경도", field:"prod_pg", sorter:"int", width:100,
			        hozAlign:"center", headerFilter:"input"},	
		        {title:"심부경도", field:"prod_sg", sorter:"int", width:100,
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
				
				$("#reportDate").val(rowData.plnp_date);
				$("#reportPlnpLot").val(rowData.plnp_lot);
				$("#reportBarcode").val(rowData.plnp_barcode);
				
				

			},
		});		
	}
	
	function nullValueRtn(value){
		var rtnValue = "";
		if(value != null){
			rtnValue = value;
		}
		return rtnValue;
	}
	
	//작업등록 선택
	function workSelectFunc(wGubun){
		//wGubun : J(준비), A(열처리), R(템퍼링)
		if(wGubun == 'J'){
			$("#workJForm")[0].reset();
			//모달 오픈
			//작업 시작일, 작업 종료일 지정
			$("input[name=ilbo_strt]").val(todayDate()+" "+nowTime());
			$("input[name=ilbo_end]").val(todayDate()+" "+nowTimeAfterOne());
			
			getWorkJList();
			workJModal.style.display = 'block'; // 모달 표시
		}else if(wGubun = 'A'){
			$("#workAForm")[0].reset();
			//모달 오픈
			
			getWorkAList();
			workAModal.style.display = 'block'; // 모달 표시			
		}else if(wGubun = 'R'){
			//모달 오픈
			
		}
	
		//작업등록 선택 모달 닫기
		workSelectCloseBtn();
	}
	
	//
	var workjTable;
	function getWorkJList(){
		
		workjTable = new Tabulator("#workJTabu", {
		    height:"200px",
		    layout:"fitColumns",
		    selectable:true,	//로우 선택설정
		    tooltips:true,
		    selectableRangeMode:"click",
		    reactiveData:true,
		    headerHozAlign:"center",
		    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
		    ajaxResponse:function(url, params, response){
				$("#workJTabu .tabulator-col.tabulator-sortable").css("height","55px");
		        return response; //return the response data to tabulator
		    },
		    columns:[
		        {title:"바코드", field:"ord_code", sorter:"string", width:120,
			        hozAlign:"center"},	
		        {title:"입고일", field:"ord_date", sorter:"string", width:120,
			        hozAlign:"center"},	
		        {title:"수량", field:"ord_su", sorter:"string", width:100,
			        hozAlign:"center", editor:true, 
			        cellEdited:function(cell){
			        	//
						var rowData = cell.getRow().getData();
						var cellData = cell.getData();						
						
						var prod_danj = rowData.prod_danj;
						var ord_su = cellData.ord_su;
						
						var ord_danj = prod_danj * ord_su;
						cell.getRow().getCell("ord_danj").setValue(ord_danj);
						$("input[name='ilbo_su']").val(ord_su);
						$("input[name='ilbo_jung']").val(ord_danj);						
			        }
			    },	
		        {title:"중량", field:"ord_danj", sorter:"string", width:100,
			        hozAlign:"center"
			    },
		        {title:"거래처", field:"corp_name", sorter:"string", width:120,
		        	hozAlign:"center", headerFilter:"input"},		        
		        {title:"품명", field:"prod_name", sorter:"string", width:160,
		        	hozAlign:"center", headerFilter:"input"},
		        {title:"품번", field:"prod_no", sorter:"string", width:160,
		        	hozAlign:"center", headerFilter:"input"},
		        {title:"소입경도", field:"prod_pg", sorter:"string", width:100,
			        hozAlign:"center", headerFilter:"input"},	
		        {title:"경화깊이", field:"prod_gd", sorter:"int", width:100,
		        	hozAlign:"center", headerFilter:"input"},
		        //적재방법 등 추가예정.
		        {title:"1줄/1판", field:"wstd_t32", visible:false},
		        {title:"줄/단", field:"wstd_t33", visible:false},
		        {title:"단/Tray", field:"wstd_t41", visible:false},
		        {title:"추가수량", field:"wstd_t87", visible:false},
		        {title:"적재수량", field:"wstd_t43", visible:false},
		        {title:"Jig중량(kg)", field:"wstd_t44", visible:false},
		        {title:"제품중량(kg)", field:"wstd_t51", visible:false},
		        {title:"총중량(kg)", field:"wstd_t52", visible:false},
		        {title:"적재주의사항-1", field:"wstd_t53", visible:false},
		        {title:"적재주의사항-2", field:"wstd_t54", visible:false},
		        {title:"적재주의사항-3", field:"wstd_t30", visible:false},
		        {title:"적재주의사항-3", field:"prod_danj", visible:false},
		    ],
		    rowFormatter:function(row){
			    var data = row.getData();
			    
			    row.getElement().style.fontWeight = "700";
				row.getElement().style.backgroundColor = "#FFFFFF";
			},
			rowClick:function(e, row){

				$("#workJTabu .tabulator-tableHolder > .tabulator-table > .tabulator-row").each(function(index, item){
						
					if($(this).hasClass("row_select")){							
						$(this).removeClass('row_select');
						row.getElement().className += " row_select";
					}else{
						$("#workJTabu div.row_select").removeClass("row_select");
						row.getElement().className += " row_select";	
					}
				});
			},
			rowDblClick:function(e, row){
				var data = row.getData();
				
				Object.keys(data).forEach(function (key) {					
			        var field = $('#workJForm .iCol div [name="' + key + '"]');

			        if (field.length) {
						console.log(field, key, data[key]);
			            field.val(data[key]);
			        }
				});
			}
		});		
	}
	
	
	//검색버튼 눌렀을 때
	//바코드 스캔 이후	
	var workjData = new Array();
	function getWorkJBarcode(){
		var barcode = $("#barcode").val();
		$.ajax({
			url:"/tkheat/production/workInstruction/getWorkJBarcode",
			type:"post",
			dataType:"json",
			data:{"barcode":barcode},
			success:function(result){
//				console.log(result);
				
				var data = result.data;
				
				if(data != "조회된 데이터 없음"){
				
					//현재 검색된 데이터가 리스트에 있는지 없는지비교					
					var workjTableData = workjTable.getData();
					var chk = true;
					
					for(var wData in workjTableData){
						if(workjTableData[wData].ord_code == data.ord_code){
							chk = false;
							break;
						}
					}
					
					if(chk){
						
						var obj = {
								"ord_code":data.ord_code,
								"ord_date":data.ord_date,
								"ord_su":data.ord_su,
								"ord_danj":data.ord_danj,
								"corp_name":data.corp_name,
								"prod_name":data.prod_name,
								"prod_no":data.prod_no,
								"prod_pg":data.prod_pg,
								"prod_gd":data.prod_gd,
								"wstd_t32":data.wstd_t32,
								"wstd_t33":data.wstd_t33,
								"wstd_t41":data.wstd_t41,
								"wstd_t87":data.wstd_t87,
								"wstd_t43":data.wstd_t43,
								"wstd_t44":data.wstd_t44,
								"wstd_t51":data.wstd_t51,
								"wstd_t52":data.wstd_t52,
								"wstd_t53":data.wstd_t53,
								"wstd_t54":data.wstd_t54,
								"wstd_t30":data.wstd_t30,
								"prod_danj":data.prod_danj
							}
							$("input[name='ilbo_su']").val(data.ord_su);
							$("input[name='ilbo_jung']").val(data.ord_danj);
							$("input[name='ord_code']").val(data.ord_code);
							workjData.push(obj);
							workjTable.setData(workjData);
					}
				}
			}
		})
	}
	
	function workJSave(){
		//form태그값 조회		
		var formData = new FormData($("#workJForm")[0]);
		
	    $.ajax({
	        url: "/tkheat/production/workInstruction/workJSave",
	        type: "POST",
	        data: formData,
	        contentType: false,
	        processData: false,
	        dataType: "json",
	        success: function(result) {
				console.log(result);
				$("#workJForm")[0].reset();
				workJCloseBtn();
	        },
	        error: function(xhr, status, error) {
	            console.error("저장 오류:", error);
	        }
	    });
		
		
	}
	
	var workaTable;
	function getWorkAList(){
		
		workaTable = new Tabulator("#workATabu", {
		    height:"200px",
		    layout:"fitColumns",
		    selectable:true,	//로우 선택설정
		    tooltips:true,
		    selectableRangeMode:"click",
		    reactiveData:true,
		    headerHozAlign:"center",
		    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
		    ajaxResponse:function(url, params, response){
				$("#workATabu .tabulator-col.tabulator-sortable").css("height","55px");
		        return response; //return the response data to tabulator
		    },
		    columns:[
		        {title:"바코드", field:"ord_code", sorter:"string", width:120,
			        hozAlign:"center"},	
		        {title:"입고일", field:"ord_date", sorter:"string", width:120,
			        hozAlign:"center"},	
		        {title:"수량", field:"ord_su", sorter:"string", width:100,
			        hozAlign:"center", editor:true, 
			        cellEdited:function(cell){
			        	//
						var rowData = cell.getRow().getData();
						var cellData = cell.getData();						
						
						var prod_danj = rowData.prod_danj;
						var ord_su = cellData.ord_su;
						
						var ord_danj = prod_danj * ord_su;
						cell.getRow().getCell("ord_danj").setValue(ord_danj);
						$("input[name='ilbo_su']").val(ord_su);
						$("input[name='ilbo_jung']").val(ord_danj);						
			        }
			    },	
		        {title:"중량", field:"ord_danj", sorter:"string", width:100,
			        hozAlign:"center"
			    },
		        {title:"거래처", field:"corp_name", sorter:"string", width:120,
		        	hozAlign:"center", headerFilter:"input"},		        
		        {title:"품명", field:"prod_name", sorter:"string", width:160,
		        	hozAlign:"center", headerFilter:"input"},
		        {title:"품번", field:"prod_no", sorter:"string", width:160,
		        	hozAlign:"center", headerFilter:"input"},
		        {title:"소입경도", field:"prod_pg", sorter:"string", width:100,
			        hozAlign:"center", headerFilter:"input"},	
		        {title:"경화깊이", field:"prod_gd", sorter:"int", width:100,
		        	hozAlign:"center", headerFilter:"input"},
		        //적재방법 등 추가예정.
		        {title:"1줄/1판", field:"wstd_t32", visible:false},
		        {title:"줄/단", field:"wstd_t33", visible:false},
		        {title:"단/Tray", field:"wstd_t41", visible:false},
		        {title:"추가수량", field:"wstd_t87", visible:false},
		        {title:"적재수량", field:"wstd_t43", visible:false},
		        {title:"Jig중량(kg)", field:"wstd_t44", visible:false},
		        {title:"제품중량(kg)", field:"wstd_t51", visible:false},
		        {title:"총중량(kg)", field:"wstd_t52", visible:false},
		        {title:"적재주의사항-1", field:"wstd_t53", visible:false},
		        {title:"적재주의사항-2", field:"wstd_t54", visible:false},
		        {title:"적재주의사항-3", field:"wstd_t30", visible:false},
		        {title:"적재주의사항-3", field:"prod_danj", visible:false},
		    ],
		    rowFormatter:function(row){
			    var data = row.getData();
			    
			    row.getElement().style.fontWeight = "700";
				row.getElement().style.backgroundColor = "#FFFFFF";
			},
			rowClick:function(e, row){

				$("#workATabu .tabulator-tableHolder > .tabulator-table > .tabulator-row").each(function(index, item){
						
					if($(this).hasClass("row_select")){							
						$(this).removeClass('row_select');
						row.getElement().className += " row_select";
					}else{
						$("#workJTabu div.row_select").removeClass("row_select");
						row.getElement().className += " row_select";	
					}
				});
			},
			rowDblClick:function(e, row){
				var data = row.getData();
				
				Object.keys(data).forEach(function (key) {					
			        var field = $('#workAForm .iCol div [name="' + key + '"]');

			        if (field.length) {
						console.log(field, key, data[key]);
			            field.val(data[key]);
			        }
				});
			}
		});		
	}
	
	function workSetCloseBtn(){
		workSetData = new Array();
		workSetTable.setData(workSetData);
		workSetModal.style.display = 'none'; // 모달 숨김
		
	}
	function workWaitCloseBtn(){
		workWaitModal.style.display = 'none'; // 모달 숨김
	}
	function workSelectCloseBtn(){
		workSelectModal.style.display = 'none'; // 모달 숨김
	}
	function workJCloseBtn(){
		workJModal.style.display = 'none'; // 모달 숨김
	}
	function workACloseBtn(){
		workAModal.style.display = 'none'; // 모달 숨김
	}

	
	//모달기능
	const workSetModal = document.querySelector('.workSetModal');
	const workWaitModal = document.querySelector('.workWaitModal');
	const workSelectModal = document.querySelector('.workSelectModal');
	const workJModal = document.querySelector('.workJModal');
	const workAModal = document.querySelector('.workAModal');
	
	const header = document.querySelector('.header'); // 헤더를 드래그할 요소로 사용
	const insertButton = document.querySelector('.insert-button');
	const workSetCloseButton = document.querySelector('.workSetClose');
	const workWaitCloseButton = document.querySelector('.workWaitClose');

	function workWaitSearch(){
		getWorkWaitList();
		
//		getWorkWaitListData();
		workWaitModal.style.display = 'block'; // 모달 표시
	}
	
	
	header.addEventListener('mousedown', function(e) {
		// transform 제거를 위한 초기 위치 설정
		const rect = workSetModal.getBoundingClientRect();
		workSetModal.style.left = rect.left + 'px';
		workSetModal.style.top = rect.top + 'px';
		workSetModal.style.transform = 'none'; // 중앙 정렬 해제

		let offsetX = e.clientX - rect.left;
		let offsetY = e.clientY - rect.top;

		function moveModal(e) {
			workSetModal.style.left = (e.clientX - offsetX) + 'px';
			workSetModal.style.top = (e.clientY - offsetY) + 'px';
		}

		function stopMove() {
			window.removeEventListener('mousemove', moveModal);
			window.removeEventListener('mouseup', stopMove);
		}

		window.addEventListener('mousemove', moveModal);
		window.addEventListener('mouseup', stopMove);
	});

		

	// 모달 열기

	insertButton.addEventListener('click', function() {
//		getIpgoAddList();
//		getWorkSetList();
//		get
		workSelectModal.style.display = 'block'; // 모달 표시
	});

    //엑셀 다운로드
	$(".excel-button").click(function () {
	    const today = new Date().toISOString().slice(0, 10).replace(/-/g, "");
	    const filename = "작업지시_" + today + ".xlsx";
	    userTable.download("xlsx", filename, { sheetName: "작업지시" });
	});
	
    </script>

	</body>
</html>
