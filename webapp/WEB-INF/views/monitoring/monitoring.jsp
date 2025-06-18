<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>통합모니터링</title>
    <link rel="stylesheet" href="/tkheat/css/monitoring/monitoring2.css">
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
div{
	text-align : center;
	border : 1px solid black;
}
    
    
    </style>
    
    
    <body>
    
   
    <div class="group-6">
    <div class="rectangle-12"></div>
    <div class="rectangle-4"></div>
    <div class="rectangle-252"></div>
    <div class="rectangle-253"></div>
    <div class="rectangle-6"></div>
    <div class="rectangle-84"></div>
    <div class="rectangle-230"></div>
    <div class="rectangle-231"></div>
    <div class="rectangle-232"></div>
    <div class="rectangle-233"></div>
    <div class="rectangle-234"></div>
    <div class="rectangle-235"></div>
    <div class="chim-1-heat"></div>
    <div class="chim-1-bon"></div>
    <div class="rectangle-35"></div>
    <div class="rectangle-36"></div>
    <div class="rectangle-37"></div>
    <div class="chim-2-heat"></div>
    <div class="chim-2-bon"></div>
    <div class="rectangle-40"></div>
    <div class="rectangle-41"></div>
    <div class="rectangle-42"></div>
    <div class="chim-3-heat"></div>
    <div class="chim-3-bon"></div>
    <div class="rectangle-45"></div>
    <div class="rectangle-46"></div>
    <div class="rectangle-47"></div>
    <div class="chim-4-heat"></div>
    <div class="chim-4-bon"></div>
    <div class="rectangle-50"></div>
    <div class="rectangle-51"></div>
    <div class="rectangle-52"></div>
    <div class="chim-5-heat"></div>
    <div class="chim-5-bon"></div>
    <div class="rectangle-55"></div>
    <div class="rectangle-56"></div>
    <div class="rectangle-57"></div>
    <div class="rectangle-73"></div>
    <div class="rectangle-74"></div>
    <div class="rectangle-75"></div>
    <div class="rectangle-76"></div>
    <div class="rectangle-77"></div>
    <div class="rectangle-78"></div>
    <div class="rectangle-79"></div>
    <div class="rectangle-80"></div>
    <div class="rectangle-81"></div>
    <div class="rectangle-82"></div>
    <div class="chim-1-heat2"></div>
    <div class="chim-1-bon2"></div>
    <div class="rectangle-85"></div>
    <div class="rectangle-86"></div>
    <div class="rectangle-87"></div>
    <div class="chim-2-heat2"></div>
    <div class="chim-2-bon2"></div>
    <div class="rectangle-88"></div>
    <div class="rectangle-89"></div>
    <div class="rectangle-90"></div>
    <div class="chim-3-heat2"></div>
    <div class="chim-3-bon2"></div>
    <div class="rectangle-91"></div>
    <div class="rectangle-92"></div>
    <div class="rectangle-93"></div>
    <div class="chim-4-heat2"></div>
    <div class="chim-4-bon2"></div>
    <div class="rectangle-94"></div>
    <div class="rectangle-95"></div>
    <div class="rectangle-96"></div>
    <div class="chim-5-heat2"></div>
    <div class="chim-5-bon2"></div>
    <div class="rectangle-97"></div>
    <div class="rectangle-98"></div>
    <div class="rectangle-99"></div>
    <div class="rectangle-100"></div>
    <div class="rectangle-101"></div>
    <div class="rectangle-102"></div>
    <div class="rectangle-103"></div>
    <div class="rectangle-104"></div>
    <div class="rectangle-105"></div>
    <div class="rectangle-106"></div>
    <div class="rectangle-107"></div>
    <div class="rectangle-108"></div>
    <div class="rectangle-109"></div>
    <div class="chim-1-heat3"></div>
    <div class="chim-1-bon3"></div>
    <div class="rectangle-110"></div>
    <div class="rectangle-111"></div>
    <div class="rectangle-112"></div>
    <div class="chim-2-heat3"></div>
    <div class="chim-2-bon3"></div>
    <div class="rectangle-113"></div>
    <div class="rectangle-114"></div>
    <div class="rectangle-115"></div>
    <div class="chim-3-heat3"></div>
    <div class="chim-3-bon3"></div>
    <div class="rectangle-116"></div>
    <div class="rectangle-117"></div>
    <div class="rectangle-118"></div>
    <div class="chim-4-heat3"></div>
    <div class="chim-4-bon3"></div>
    <div class="rectangle-119"></div>
    <div class="rectangle-120"></div>
    <div class="rectangle-121"></div>
    <div class="chim-5-heat3"></div>
    <div class="chim-5-heat4"></div>
    <div class="chim-5-bon3"></div>
    <div class="rectangle-122"></div>
    <div class="rectangle-123"></div>
    <div class="rectangle-124"></div>
    <div class="rectangle-125"></div>
    <div class="rectangle-126"></div>
    <div class="rectangle-127"></div>
    <div class="rectangle-128"></div>
    <div class="rectangle-129"></div>
    <div class="rectangle-130"></div>
    <div class="rectangle-131"></div>
    <div class="rectangle-132"></div>
    <div class="rectangle-133"></div>
    <div class="rectangle-134"></div>
    <div class="rectangle-236"></div>
    <div class="rectangle-237"></div>
    <div class="rectangle-238"></div>
    <div class="rectangle-239"></div>
    <div class="rectangle-240"></div>
    <div class="rectangle-241"></div>
    <div class="rectangle-242"></div>
    <div class="rectangle-243"></div>
    <div class="rectangle-244"></div>
    <div class="rectangle-245"></div>
    <div class="rectangle-246"></div>
    <div class="rectangle-247"></div>
    <div class="rectangle-248"></div>
    <div class="rectangle-249"></div>
    <div class="rectangle-250"></div>
    <div class="rectangle-251"></div>
    <div class="rectangle-254"></div>
    <div class="rectangle-13"></div>
    <div class="rectangle-135"></div>
    <div class="rectangle-140"></div>
    <div class="rectangle-141"></div>
    <div class="rectangle-142"></div>
    <div class="rectangle-143"></div>
    <div class="rectangle-144"></div>
    <div class="rectangle-145"></div>
    <div class="rectangle-146"></div>
    <div class="rectangle-147"></div>
    <div class="rectangle-148"></div>
    <div class="rectangle-149"></div>
    <div class="rectangle-150"></div>
    <div class="rectangle-151"></div>
    <div class="rectangle-152"></div>
    <div class="rectangle-153"></div>
    <div class="rectangle-16"></div>
    <div class="chim-1-cutum"></div>
    <div class="chim-1-pum"></div>
    <div class="chim-1-lot"></div>
    <div class="chim-2-cutum"></div>
    <div class="chim-2-pum"></div>
    <div class="chim-2-lot"></div>
    <div class="chim-3-cutum"></div>
    <div class="chim-3-pum"></div>
    <div class="chim-3-lot"></div>
    <div class="chim-4-cutum"></div>
    <div class="chim-4-pum"></div>
    <div class="chim-4-lot"></div>
    <div class="chim-5-cutum"></div>
    <div class="chim-5-pum"></div>
    <div class="chim-5-lot"></div>
    <div class="tem-1-cutum"></div>
    <div class="tem-1-pum"></div>
    <div class="tem-1-lot"></div>
    <div class="rectangle-61"></div>
    <div class="tem-2-cutum"></div>
    <div class="tem-2-pum"></div>
    <div class="tem-2-lot"></div>
    <div class="byun-1-cutum"></div>
    <div class="byun-1-pum"></div>
    <div class="byun-1-lot"></div>
    <div class="byun-2-cutum"></div>
    <div class="byun-2-pum"></div>
    <div class="byun-2-lot"></div>
    <div class="rectangle-67"></div>
    <div class="clean-cutum"></div>
    <div class="clean-pum"></div>
    <div class="clean-lot"></div>
    <div class="clean-cutum2"></div>
    <div class="clean-pum2"></div>
    <div class="clean-lot2"></div>
    <div class="clean-cutum3"></div>
    <div class="clean-pum3"></div>
    <div class="clean-lot3"></div>
    <div class="rectangle-70"></div>
    <div class="clean-cutum4"></div>
    <div class="clean-pum4"></div>
    <div class="clean-lot4"></div>
    <div class="clean-cutum5"></div>
    <div class="clean-pum5"></div>
    <div class="clean-lot5"></div>
    <div class="clean-cutum6"></div>
    <div class="clean-pum6"></div>
    <div class="clean-lot6"></div>
    <div class="clean-cutum7"></div>
    <div class="clean-pum7"></div>
    <div class="clean-lot7"></div>
    <div class="chim-5-heat5"></div>
    <div class="rectangle-255"></div>
    <div class="clean-cutum8"></div>
    <div class="clean-pum8"></div>
    <div class="clean-lot8"></div>
  </div>
	    
	    
<script>

	//로드
	$(function(){
		getMonitoringList();
		
	});
	


	function getMonitoringList(){
		$.ajax({
			url: "/tkheat/monitoring/getMonitoringList",
			type: "post",
			dataType: "json",
			success: function(result){
				var data = result.data;
				
				data.forEach(function(monitoring){
					let gb = monitoring.gb;
					console.log(monitoring);
					if(monitoring.pum) {
						$("." +gb+"pum").html(monitoring.pum);
					}
					if(monitoring.heat) {
						$("." +gb+"heat").html(monitoring.heat);
					}
					if(monitoring.cutum) {
						$("." +gb+"cutum").html(monitoring.cutum);
					}
					if(monitoring.lot) {
						$("." +gb+"lot").html(monitoring.lot);
					}
					if(monitoring.bon) {
						$("." +gb+"bon").html(monitoring.bon);
					}
					if(monitoring.gangon) {
						$("." +gb+"gangon").html(monitoring.gangon);
					}
					if(monitoring.cool) {
						$("." +gb+"cool").html(monitoring.cool);
					}
					if(monitoring.gonglo) {
						$("." +gb+"gonglo").html(monitoring.gonglo);
					}
					if(monitoring.gong) {
						$("." +gb+"gong").html(monitoring.gong);
					}
				});
			}
		});
	}

	

	

    </script>

	</body>
</html>
