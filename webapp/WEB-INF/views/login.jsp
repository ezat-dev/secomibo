<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/tkheat/css/login/style.css">
<%@include file="include/pluginpage.jsp" %>
  
  <style>
   a,
   button,
   input,
   select,
   h1,
   h2,
   h3,
   h4,
   h5,
   * {
       box-sizing: border-box;
       margin: 0;
       padding: 0;
       border: none;
       text-decoration: none;
       background: none;
   
       -webkit-font-smoothing: antialiased;
   } 
   
   menu, ol, ul {
       list-style-type: none;
       margin: 0;
       padding: 0;
   }
.reg{
    position: absolute;
    left: 69%;
    transform: translateX(-50%);
    bottom: 253px;
    width: 250px;
    display: flex;
    justify-content: center;
    z-index: 9999;
}
.insert-button {
    background-color: #6c757d;
    color: white;
    font-size: 14px;
    width: 105px;
    height: 25px;
    line-height: 28px;
    border-radius: 5px;
    cursor: pointer;
    text-align: center;
}
	    .modal-content {
	        background: white;
	        width: 24%;
	        max-width: 500px;
	        height: 80vh; 
	        overflow-y: auto; 
	        margin: -45% auto 0;
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
   </style>
  <title>Document</title>
</head>
<body>
  <div class="group-1">
    <div class="main"></div>
    <img class="background-1" src="/tkheat/css/login/background-10.png" />
    <div class="login-box"></div>
    
    <div class="id-input"></div>
    <div class="pw-input"></div>
    <div class="text-1">이 사이트는 미보기아 임직원 전용입니다.</div>
    <div class="text-2">주소: 전라북도 완주군 봉동읍 테크노밸리 3로 15</div>
    <form id="userForm">
	    <input type="text" id="n_id" name="user_id" placeholder="아이디를 입력하세요." />
	    <input type="password" id="n_pw" name="user_pw" placeholder="비밀번호를 입력하세요." />
	    <input type="hidden" id="n_ip" name="user_ip" placeholder="비밀번호를 입력하세요." />
    </form>
    <div class="button-group">
    <button class="login_btn" onclick="login();">로그인</button>
</div>
<div class="reg">
    <button class="insert-button">관리자 회원가입</button>
    </div>
    <div class="text-5">아이디</div>
    <div class="text-6">패스워드</div>
    <!-- <img class="logo" src="/tkheat/css/login/logo0.svg" /> -->
    <div class="text-4">미보기아 로그인</div>
    <div class="text-3">
      Copyright 2025. EZAutomation Co. All rights reserved.
      
    </div>
  </div>
  
  <!-- 회원가입 모달 -->
  	   <div id="modalContainer" class="modal">
	    <div class="modal-content">
	<!--         <span class="close">&times;</span> -->
	        <h2>사용자 등록</h2>
	        <form id="corrForm"autocomplete="off">
	          
		<!-- 	<input type="text" name="user_code" style="display:none;">
 -->
	
	            <label>ID</label>
				<input type="text" name="user_id">
	
	           <label>PassWord</label>
	           <input type="text" name="user_pw">

	
	            <label>성명</label>
	            <input type="text" name="user_name">
	            
	              <label>전화번호</label>
	            <input type="text" name="user_phone">
	            
	            
	            
	        <select name="user_level" style="display: none;">
			  <option value="3">기본</option>
			</select>
				            	
	            	
	            	            	
	            <label>회사명</label>
	             <input type="text" name="user_company">
	           
	            <label>직책</label>
	             <input type="text" name="user_jick">
	            
	         
	
	            <button type="submit" id="saveCorrStatus">저장</button>
	            <button type="submit" id="updateCorrStatus" style="display: none;">수정</button>
	            <button type="button" id="closeModal">닫기</button>
	        </form>
	    </div>
	</div>
  <script>

	$(function(){
		$.ajax({
			url:"https://api.ip.pe.kr/json" 
		}).done(function(val){
			console.log(val);
			console.log(val.ip);
			console.log(val.contry_code);
			$("#n_ip").val(val.ip);
		});

		//모달 열기
		  $('.insert-button').click(function() {
		      // 수정 숨기고 저장 보이게
		      $('#saveCorrStatus').show();
		      $('#updateCorrStatus').hide();
		    selectedRowData = null;
		    $('#corrForm')[0].reset();
		    $('#modalContainer').show().addClass('show');
		  });

		  //모달 닫기
		  $('.close, #closeModal').click(function() {
		    $('#modalContainer').removeClass('show').hide();
		  });

		  // 저장 버튼 클릭 시
		  $('#saveCorrStatus').click(function(event) {
		    event.preventDefault();
		    var formData = $('#corrForm').serialize();
		    if (selectedRowData && selectedRowData.user_code) {
		      formData.append('user_code', selectedRowData.user_code);  // 수정 시 user_code 추가
		    }
		    $.ajax({
		      url: "/tkheat/user/insert",
		      type: "POST",
		      data: formData,
		      //processData: false,
		      //contentType: false,
		      success: function(result) {
		        console.log(result);
		        if (result.status === "OK") {
		            alert(result.message); // "사용자 정보가 성공적으로 저장되었습니다."
		            $('#modalContainer').hide();
		            dataTable.setData("/tkheat/user/selectList", {});
		            selectedRowData = null;
		        } else {
		            alert("오류: " + result.data); 
		        }
		      },
		      error: function() {
		        alert('저장 중 오류가 발생했습니다.');
		      }
		    });
		  });
	});
  
  function login(){
		//var userData = new FormData($("#userForm")[0]);
		var userData = $("#userForm").serialize(); 
		$.ajax({
			url:"/tkheat/user/login",
			type:"post",
			//contentType: false,
			//processData: false,
			dataType: "json",
			data:userData,
			success:function(result){				
				console.log(result);
				if(result.status == "NG"){
					alert(result.data);	
				}else{				
					location.href = "/tkheat/tkHeat";
				}
			}
		});
	}


//모달
function modal_alert() {
    alert("아이디와 비밀번호를 확인해 주십시오!");
}

  </script>
</body>
</html>