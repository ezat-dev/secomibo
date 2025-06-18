<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>통합모니터링</title>
<link rel="stylesheet" href="/tkheat/css/monitoring/alarm1.css">
<link rel="stylesheet" href="/tkheat/css/tabBar/tabBar.css">
<%@include file="../include/pluginpage.jsp"%>
<style>
.main {
	width: 98%;
}

.container {
	display: flex;
	justify-content: space-between;
}

div {
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	font-size: 12px;
	padding: 2px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	box-sizing: border-box;
	border: 1px solid #ccc; /* 경계 확인용 */
	height: 28px; /* 고정 높이로 정렬 유지 */
}
</style>

<body>


	<main class="main">
		<div class="alarm-big-box-1"></div>
		<div class="alarm-1"></div>
		<div class="alarm-1">로내 SCR이상</div>
		<div class="alarm-2">로내롤러 INV.TRIP</div>
		<div class="alarm-3">아지테이터 INV.TRIP</div>
		<div class="alarm-4">입구테이블 모터-1 TRIP</div>
		<div class="alarm-5">입구테이블 모터-2 TRIP</div>
		<div class="alarm-6">추출테이블 모터-1 TRIP</div>
		<div class="alarm-7">순환펌프 TRIP</div>
		<div class="alarm-8">RC-FAN 모터 TRIP</div>
		<div class="alarm-9">로내 온도 과승(TIC)</div>
		<div class="alarm-10">로내 온도 하한(LNG차단)</div>
		<div class="alarm-11">로내 온도 하한(RX차단)</div>
		<div class="alarm-12">로내 절대 과승(히터 완전 OFF)</div>
		<div class="alarm-13">유조 온도 과승(TIC)</div>
		<div class="alarm-14">유조 온도 하한(TIC)</div>
		<div class="alarm-15">입구 PILOT 화염 미감지</div>
		<div class="alarm-16">입구 커튼버너 화염 미감지</div>
		<div class="alarm-17">출구 PILOT 화염 미감지</div>
		<div class="alarm-18">배기 PILOT 화염 미감지</div>
		<div class="alarm-19">출구 커튼버너 화염 미감지</div>
		<div class="alarm-20">로내 분위기 CP 이상</div>
		<div class="alarm-21">LPG 압력 이상</div>
		<div class="alarm-22">NH3 압력 이상</div>
		<div class="alarm-23">냉각수 압력 이상</div>
		<div class="alarm-24">유조 액면 LEVEL HI</div>
		<div class="alarm-25">유조 액면 LEVEL LOW</div>
		<div class="alarm-26">입구문 상승 이상</div>
		<div class="alarm-27">입구문 하강 이상</div>
		<div class="alarm-28">중간문 상승 이상</div>
		<div class="alarm-29">중간문 하강 이상</div>
		<div class="alarm-30" style="border : 2px solid yellow; background-color:red; color:yellow;">출구문 상승 이상</div>
		<div class="alarm-31">출구문 하강 이상</div>
		<div class="alarm-32">유조 E/V상승 이상</div>
		<div class="alarm-33">유조 E/V하강 이상</div>
		<div class="alarm-34">입구문 L/S 이상</div>
		<div class="alarm-35">중간문 L/S 이상</div>
		<div class="alarm-36">유조E/V L/S 이상</div>
		<div class="alarm-37">출구문L/S 이상</div>
		<div class="alarm-38">입구 제품-1 미감지</div>
		<div class="alarm-39">입구 제품-2 미감지</div>
		<div class="alarm-40">입구->로내 장입사이클 이상</div>
		<div class="alarm-41">로내->유조 추출사이클 이상</div>
		<div class="alarm-42">유조->추출 추출사이클 이상</div>
		<div class="alarm-43" style="border : 2px solid yellow; background-color:red; color:yellow;">비상정지[제어반]</div>
		<div class="alarm-44">비상정지[입구조작반]</div>
		<div class="alarm-45">비상정지[출구조작반]</div>
		<div class="alarm-46">RC->FAN회전감지 이상</div>
		<div class="alarm-47">아지테이터(좌) 회전감지 이상</div>
		<div class="alarm-48">아지테이터(우) 회전감지 이상</div>
		<div class="alarm-49">로내 조깅 전진 이상</div>
		<div class="alarm-50">추출 테이블 제품감지 이상</div>
		<div class="alarm-51">유조 진출 이상</div>
		<div class="alarm-52">RX GAS 유량 이상</div>
		<div class="alarm-53">LPG GAS 입력 이상</div>
		<div class="alarm-big-box-12"></div>
		<div class="alarm-54">로내 SCR이상</div>
		<div class="alarm-55">로내롤러 INV.TRIP</div>
		<div class="alarm-56">아지테이터 INV.TRIP</div>
		<div class="alarm-57">입구테이블 모터-1 TRIP</div>
		<div class="alarm-58">입구테이블 모터-2 TRIP</div>
		<div class="alarm-59">추출테이블 모터-1 TRIP</div>
		<div class="alarm-60">순환펌프 TRIP</div>
		<div class="alarm-61">RC-FAN 모터 TRIP</div>
		<div class="alarm-62">로내 온도 과승(TIC)</div>
		<div class="alarm-63">로내 온도 하한(LNG차단)</div>
		<div class="alarm-64">로내 온도 하한(RX차단)</div>
		<div class="alarm-65">로내 절대 과승(히터 완전 OFF)</div>
		<div class="alarm-66">유조 온도 과승(TIC)</div>
		<div class="alarm-67">유조 온도 하한(TIC)</div>
		<div class="alarm-68">입구 PILOT 화염 미감지</div>
		<div class="alarm-69">입구 커튼버너 화염 미감지</div>
		<div class="alarm-70">출구 PILOT 화염 미감지</div>
		<div class="alarm-71">배기 PILOT 화염 미감지</div>
		<div class="alarm-72">출구 커튼버너 화염 미감지</div>
		<div class="alarm-73">로내 분위기 CP 이상</div>
		<div class="alarm-74">LPG 압력 이상</div>
		<div class="alarm-75">NH3 압력 이상</div>
		<div class="alarm-76">냉각수 압력 이상</div>
		<div class="alarm-77">유조 액면 LEVEL HI</div>
		<div class="alarm-78">유조 액면 LEVEL LOW</div>
		<div class="alarm-79">입구문 상승 이상</div>
		<div class="alarm-80">입구문 하강 이상</div>
		<div class="alarm-81">중간문 상승 이상</div>
		<div class="alarm-82">중간문 하강 이상</div>
		<div class="alarm-83">출구문 상승 이상</div>
		<div class="alarm-84">출구문 하강 이상</div>
		<div class="alarm-85">유조 E/V상승 이상</div>
		<div class="alarm-86">유조 E/V하강 이상</div>
		<div class="alarm-87">입구문 L/S 이상</div>
		<div class="alarm-88">중간문 L/S 이상</div>
		<div class="alarm-89">유조E/V L/S 이상</div>
		<div class="alarm-90">출구문L/S 이상</div>
		<div class="alarm-91">입구 제품-1 미감지</div>
		<div class="alarm-92">입구 제품-2 미감지</div>
		<div class="alarm-93">입구->로내 장입사이클 이상</div>
		<div class="alarm-94">로내->유조 추출사이클 이상</div>
		<div class="alarm-95">유조->추출 추출사이클 이상</div>
		<div class="alarm-96">비상정지[제어반]</div>
		<div class="alarm-97">비상정지[입구조작반]</div>
		<div class="alarm-98">비상정지[출구조작반]</div>
		<div class="alarm-99">RC->FAN회전감지 이상</div>
		<div class="alarm-100">아지테이터(좌) 회전감지 이상</div>
		<div class="alarm-101">아지테이터(우) 회전감지 이상</div>
		<div class="alarm-102">로내 조깅 전진 이상</div>
		<div class="alarm-103">추출 테이블 제품감지 이상</div>
		<div class="alarm-104">유조 진출 이상</div>
		<div class="alarm-105">RX GAS 유량 이상</div>
		<div class="alarm-106">LPG GAS 입력 이상</div>
		<div class="alarm-big-box-3"></div>
		<div class="alarm-107">PLC 이상</div>
		<div class="alarm-108">PLC 밧데리 이상</div>
		<div class="alarm-109">비상 정지</div>
		<div class="alarm-110">CP 이상</div>
		<div class="alarm-111">본체 온도 이상</div>
		<div class="alarm-112">유조 온도 이상</div>
		<div class="alarm-113">N2 GAS 이상</div>
		<div class="alarm-114">LPG GAS 이상</div>
		<div class="alarm-115">팬 정지</div>
		<div class="alarm-116">오일 냉각 펌프 이상</div>
		<div class="alarm-117">아지테이터 이상</div>
		<div class="alarm-118" style="border : 2px solid yellow; background-color:red; color:yellow;">모터 트립</div>
		<div class="alarm-119">입구 도어 이상</div>
		<div class="alarm-120">중간 도어 이상</div>
		<div class="alarm-121">RX GAS 유량 이상</div>
		<div class="alarm-122">냉각수 이상</div>
		<div class="alarm-123">장입 포크 이상</div>
		<div class="alarm-124">축출 포크 이상</div>
		<div class="alarm-125">포크 테이블 이상</div>
		<div class="alarm-126">입구 체인 이상</div>
		<div class="alarm-127">엘리베이터 이상</div>
		<div class="alarm-128">엘리베이터 체인이상</div>
		<div class="alarm-129">출구 콘베어 이상</div>
		<div class="alarm-130">유조 제품 추출 이상</div>
		<div class="alarm-131">입구 프레임 디텍터 이상</div>
		<div class="alarm-132">출구 프레임 디텍터 이상</div>
		<div class="alarm-133">댐퍼 프레임 디텍터 이상</div>
		<div class="alarm-134">유조 레벨 이상</div>
		<div class="alarm-135">출구 도어 이상</div>
		<div class="alarm-136">LPG GAS 압력 이상</div>
		<div class="alarm-big-box-4"></div>
		<div class="alarm-137">PLC 이상</div>
		<div class="alarm-138">PLC 밧데리 이상</div>
		<div class="alarm-139">비상 정지</div>
		<div class="alarm-140">CP 이상</div>
		<div class="alarm-141">본체 온도 이상</div>
		<div class="alarm-142">유조 온도 이상</div>
		<div class="alarm-143">N2 GAS 이상</div>
		<div class="alarm-144">LPG GAS 이상</div>
		<div class="alarm-145">팬 정지</div>
		<div class="alarm-146">오일 냉각 펌프 이상</div>
		<div class="alarm-147">아지테이터 이상</div>
		<div class="alarm-148">모터 트립</div>
		<div class="alarm-149">입구 도어 이상</div>
		<div class="alarm-150">중간 도어 이상</div>
		<div class="alarm-151">RX GAS 유량 이상</div>
		<div class="alarm-152">냉각수 이상</div>
		<div class="alarm-153">장입 포크 이상</div>
		<div class="alarm-154">축출 포크 이상</div>
		<div class="alarm-155">포크 테이블 이상</div>
		<div class="alarm-156">입구 체인 이상</div>
		<div class="alarm-157">엘리베이터 이상</div>
		<div class="alarm-158">엘리베이터 체인이상</div>
		<div class="alarm-159">출구 콘베어 이상</div>
		<div class="alarm-160" style="border : 2px solid yellow; background-color:red; color:yellow;">유조 제품 추출 이상</div>
		<div class="alarm-161">입구 프레임 디텍터 이상</div>
		<div class="alarm-162">출구 프레임 디텍터 이상</div>
		<div class="alarm-163">댐퍼 프레임 디텍터 이상</div>
		<div class="alarm-164">유조 레벨 이상</div>
		<div class="alarm-165">출구 도어 이상</div>
		<div class="alarm-166">LPG GAS 압력 이상</div>
		<div class="bcf-1" style="font-size : 16px;">NO.1 BCF</div>
		<div class="bcf-2" style="font-size : 16px;">NO.2 BCF</div>
		<div class="bcf-3" style="font-size : 16px;">NO.3 BCF</div>
		<div class="bcf-4" style="font-size : 16px;">NO.4 BCF</div>
	</main>


	<script>

	//로드
	$(function(){
		getAlarm1();
		
	});
	


	//OPC값 알람 조회
    function getAlarm1(){
		$.ajax({
			url:"/tkheat/monitoring/getAlarm1",
			type:"post",
			dataType:"json",
			success:function(result){				
				var data = result.multiValues;
				
	            for(let key in data){
	            	for(let keys in data[key]){
	            		var d = data[key];
						
						if(d[keys].action == "c"){
							c(keys, d[keys].value)	
						}
	            	}                    	
	            }
			}
		});
	}
	
	function c(keys, value){
//		$("."+keys).text(value);
		
		if(value == true){
			$("."+keys).css("background-color","red");
			$("."+keys).css("color","white");
		}else{
			$("."+keys).css("background-color","#f1f1f1");
			$("."+keys).css("color","black");
		}
		
	}

	

	

    </script>

</body>
</html>
