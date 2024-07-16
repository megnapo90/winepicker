<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">

</head>

<style>
	.worldMap{

		box-sizing: content-box;
		/* border: 1px solid black; */

		position: relative;

		width: 1200px;
		height: 650px;
		opacity: 1;
		
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/worldMap.png");	
	}

	.Argentina{
		display: none;
	}
	.Argentina>.flag{
		position: absolute;
		left: 370px;
		top: 317px;

		width: 80px;
		height: 60px;
		opacity: 1;
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/Argentina.png");
	}
	.Argentina>.line{
		position: absolute;
		left: 270px;
		top: 410px;

		width: 115.52px;
		height: 0px;
		transform: rotate(138.86deg);
		opacity: 1;
			
		border: 1px dashed #3D3D3D;		
	}
	
	.Australia{
		display: none;
	}
	.Australia>.flag{
		position: absolute;
		left: 800px;
		top: 380px;

		width: 80px;
		height: 60px;
		opacity: 1;
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/Australia.png");
	}
	.Australia>.line{
		position: absolute;
		left: 850px;
		top: 460px;

		width: 150px;
		height: 0px;
		transform: rotate(35deg);
		opacity: 1;
			
		border: 1px dashed #3D3D3D;
	}
	
	.Chile{
		display: none;
	}
	.Chile>.flag{
		position: absolute;
		left: 370px;
		top: 330px;

		width: 80px;
		height: 60px;
		opacity: 1;
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/Chile.png");
	}
	.Chile>.line{
		position: absolute;
		left: 285px;
		top: 435px;

		width: 150px;
		height: 0px;
		transform: rotate(115deg);
		opacity: 1;
			
		border: 1px dashed #3D3D3D;	
	}
	
	
	.France{
		display: none;
	}
	.France>.flag{
		position: absolute;
		left: 520px;
		top: 80px;

		width: 80px;
		height: 80px;
		opacity: 1;
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/France.png");
	}
	.France>.line{
		position: absolute;
		left: 520px;
		top: 190px;

		width: 100px;
		height: 0px;
		transform: rotate(-90deg);
		opacity: 1;
			
		border: 1px dashed #3D3D3D;
	
	}
	
	
	.Germany{
		display: none;
	}
	.Germany>.flag{
		position: absolute;
		left: 544px;
		top: 27px;

		width: 80px;
		height: 60px;
		opacity: 1;
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/Germany.png");
	}
	.Germany>.line{
		position: absolute;
		left: 467px;
		top: 133px;

		width: 103px;
		height: 0px;
		transform: rotate(118.09deg);
		opacity: 1;
			
		border: 1px dashed #3D3D3D;
	
	}

	
	
	.Italy{
		display: none;
	}
	.Italy>.flag{
		position: absolute;
		left: 710px;
		top: 190px;

		width: 80px;
		height: 60px;
		opacity: 1;
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/Italy.png");
	}
	.Italy>.line{
		position: absolute;
		left: 600px;
		top: 240px;

		width: 120px;
		height: 0px;
		transform: rotate(-15deg);
		opacity: 1;
			
		border: 1px dashed #3D3D3D;
	
	}

	
	
	.NewZealand{
		display: none;
	}
	.NewZealand>.flag{
		position: absolute;
		left: 817px;
		top: 247px;

		width: 80px;
		height: 60px;
		opacity: 1;
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/NewZealand.png");
	}
	.NewZealand>.line{
		position: absolute;
		left: 842px;
		top: 377px;

		width: 169.94px;
		height: 0px;
		transform: rotate(69.33deg);
		opacity: 1;
			
		border: 1px dashed #3D3D3D;
	
	}

	
	
	.Portugal{
		display: none;
	}
	.Portugal>.flag{
		position: absolute;
		left: 295px;
		top: 196px;

		width: 80px;
		height: 60px;
		opacity: 1;
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/Portugal.png");
	}
	.Portugal>.line{
		position: absolute;
		left: 374px;
		top: 212px;

		width: 71.81px;
		height: 0px;
		transform: rotate(13.87deg);
		opacity: 1;
			
		border: 1px dashed #3D3D3D;
	
	}

	
	
	.Spain{
		display: none;
	}
	.Spain>.flag{
		position: absolute;
		left: 416px;
		top: 374px;

		width: 80px;
		height: 60px;
		opacity: 1;
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/Spain.png");
	}
	.Spain>.line{
		position: absolute;
		left: 393px;
		top: 298px;

		width: 162.29px;
		height: 0px;
		transform: rotate(-101.38deg);
		opacity: 1;
			
		border: 1px dashed #3D3D3D;
	
	}

	
	
	.USA{
		display: none;
	}
	.USA>.flag{
		position: absolute;
		left: 350px;
		top: 200px;

		width: 80px;
		height: 41.84px;
		opacity: 1;
		
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/USA.png");
	}
	.USA>.line{
		position: absolute;
		left: 220px;
		top: 250px;

		width: 140px;
		height: 0px;
		transform: rotate(163.48deg);
		opacity: 1;
			
		border: 1px dashed #3D3D3D;
	
	}
	.flag{
		z-index: 1;
	}

	.flag:hover{
		transform: perspective(200px) translateZ(100px);
		z-index: 2;
		cursor: pointer;
	}
	
	
	

</style>




<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>





	<div class="section">
		<div class="worldMap">
		
			<div class="Argentina">
				<div class="flag"></div>
				<div class="line"></div>
			</div>
			
			<div class="Australia">
				<div class="flag"></div>
				<div class="line"></div>
			</div>
			
			<div class="Chile">
				<div class="flag"></div>
				<div class="line"></div>
			</div>
			
			<div class="France">
				<div class="flag"></div>
				<div class="line"></div>
			</div>
			
			<div class="Germany">
				<div class="flag"></div>
				<div class="line"></div>
			</div>
			
			<div class="Italy">
				<div class="flag"></div>
				<div class="line"></div>
			</div>
			
			<div class="NewZealand">
				<div class="flag"></div>
				<div class="line"></div>
			</div>
			
			<div class="Portugal">
				<div class="flag"></div>
				<div class="line"></div>
			</div>
			
			<div class="Spain">
				<div class="flag"></div>
				<div class="line"></div>
			</div>
			
			<div class="USA">
				<div class="flag"></div>
				<div class="line"></div>
			</div>
			
		</div>
	</div>
	
	
	
	<div id="list">
    
    <ul class="ul">
    	<li class="depth1">
    		<a href="${contextPath}/admin/info/wine">와인 정보글</a>
    	</li>
    </ul>
    
    <ul class="ul">
    	<li class="depth1">
    		<a href="${contextPath}/admin/info/country">나라 정보글</a>
    			<ul>
    				<c:forEach var="i" items="${iList}">
    				<c:if test="${i.countryNo gt 0}">
    					<li class="depth${i.depth}">
    						<a href="${contextPath}/admin/info/${i.infoName}">${i.infoName}</a>
    					</li>
    				</c:if>
    				</c:forEach>
    			</ul>
    	</li>
    </ul>
    

    </div>
	
	
	<c:forEach var="country" items="${cList}">
		<c:if test="${not empty country.countryEngName}">
			<script>
				console.log(`${country.countryEngName}`);
				console.log($(`.${country.countryEngName}`));
				$(`.${country.countryEngName}`).css("display", "block");
			</script>
		</c:if>
	</c:forEach>

	<script>
		(()=>{
			if(${depth} == 1 && `${infoName}.toLowerCase().equals("country")`){
				$(".wineTypeNo1").css("display", "none");
				$(".wineTypeNo2").css("display", "none");
				$(".wineTypeNo3").css("display", "none");
			}
		})();
	
		$(".flag").click((e)=>{
			console.log(e.target);
			console.log($(e.target));
			var countryName = $(e.target).parent().attr("class");
			location.href = `${contextPath}/admin/info/\${countryName}`;
		});

		$(".flag").hover(function(e){
			console.log(e.target);
			$(e.target).next().css("border", "1px solid red");
		}, function(e){
			$(e.target).next().css("border", "1px dashed #3D3D3D");
		})
		
		
		
	</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>