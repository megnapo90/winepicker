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

	.ARGENTINA{
		/* display: none; */
	}
	.ARGENTINA>.flag{
		position: absolute;
		left: 370px;
		top: 317px;

		width: 80px;
		height: 60px;
		opacity: 1;
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/Argentina.png");
	}
	.ARGENTINA>.line{
		position: absolute;
		left: 270px;
		top: 410px;

		width: 115.52px;
		height: 0px;
		transform: rotate(138.86deg);
		opacity: 1;
			
		border: 1px dashed #3D3D3D;		
	}
	
	.AUSTRALIA{
		/* display: none; */
	}
	.AUSTRALIA>.flag{
		position: absolute;
		left: 650px;
		top: 311px;

		width: 80px;
		height: 60px;
		opacity: 1;
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/Australia.png");
	}
	.AUSTRALIA>.line{
		position: absolute;
		left: 727px;
		top: 383px;

		width: 116.05px;
		height: 0px;
		transform: rotate(18.59deg);
		opacity: 1;
			
		border: 1px dashed #3D3D3D;
	}
	
	.CHILE{
		/* display: none; */
	}
	.CHILE>.flag{
		position: absolute;
		left: 327px;
		top: 255px;

		width: 80px;
		height: 60px;
		opacity: 1;
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/Chile.png");
	}
	.CHILE>.line{
		position: absolute;
		left: 226px;
		top: 377px;

		width: 146.74px;
		height: 0px;
		transform: rotate(114.99deg);
		opacity: 1;
			
		border: 1px dashed #3D3D3D;	
	}
	
	
	.FRANCE{
		/* display: none; */
	}
	.FRANCE>.flag{
		position: absolute;
		left: 420px;
		top: 51px;

		width: 80px;
		height: 80px;
		opacity: 1;
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/France.png");
	}
	.FRANCE>.line{
		position: absolute;
		left: 425px;
		top: 155px;

		width: 100px;
		height: 0px;
		transform: rotate(-90deg);
		opacity: 1;
			
		border: 1px dashed #3D3D3D;
	
	}
	
	
	.GERMANY{
		/* display: none; */
	}
	.GERMANY>.flag{
		position: absolute;
		left: 544px;
		top: 27px;

		width: 80px;
		height: 60px;
		opacity: 1;
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/Germany.png");
	}
	.GERMANY>.line{
		position: absolute;
		left: 467px;
		top: 133px;

		width: 103px;
		height: 0px;
		transform: rotate(118.09deg);
		opacity: 1;
			
		border: 1px dashed #3D3D3D;
	
	}

	
	
	.ITALY{
		/* display: none; */
	}
	.ITALY>.flag{
		position: absolute;
		left: 610px;
		top: 160px;

		width: 80px;
		height: 60px;
		opacity: 1;
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/Italy.png");
	}
	.ITALY>.line{
		position: absolute;
		left: 500px;
		top: 200px;

		width: 120px;
		height: 0px;
		transform: rotate(-15deg);
		opacity: 1;
			
		border: 1px dashed #3D3D3D;
	
	}

	
	
	.NEWZEALAND{
		/* display: none; */
	}
	.NEWZEALAND>.flag{
		position: absolute;
		left: 817px;
		top: 247px;

		width: 80px;
		height: 60px;
		opacity: 1;
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/NewZealand.png");
	}
	.NEWZEALAND>.line{
		position: absolute;
		left: 842px;
		top: 377px;

		width: 169.94px;
		height: 0px;
		transform: rotate(69.33deg);
		opacity: 1;
			
		border: 1px dashed #3D3D3D;
	
	}

	
	
	.PORTUGAL{
		/* display: none; */
	}
	.PORTUGAL>.flag{
		position: absolute;
		left: 295px;
		top: 196px;

		width: 80px;
		height: 60px;
		opacity: 1;
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/Portugal.png");
	}
	.PORTUGAL>.line{
		position: absolute;
		left: 374px;
		top: 212px;

		width: 71.81px;
		height: 0px;
		transform: rotate(13.87deg);
		opacity: 1;
			
		border: 1px dashed #3D3D3D;
	
	}

	
	
	.SPAIN{
		/* display: none; */
	}
	.SPAIN>.flag{
		position: absolute;
		left: 416px;
		top: 374px;

		width: 80px;
		height: 60px;
		opacity: 1;
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/Spain.png");
	}
	.SPAIN>.line{
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
		/* display: none; */
	}
	.USA>.flag{
		position: absolute;
		left: 322px;
		top: 154px;

		width: 80px;
		height: 41.84px;
		opacity: 1;
		
			
		background: no-repeat center/100% url("${contextPath}/resources/admin/country/USA.png");
	}
	.USA>.line{
		position: absolute;
		left: 200px;
		top: 212px;

		width: 123.08px;
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

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>



<body>
	<div class="section">
		<div class="worldMap">
		
			<div class="ARGENTINA">
				<div class="flag"></div>
				<div class="line"></div>
			</div>
			
			<div class="AUSTRALIA">
				<div class="flag"></div>
				<div class="line"></div>
			</div>
			
			<div class="CHILE">
				<div class="flag"></div>
				<div class="line"></div>
			</div>
			
			<div class="FRANCE">
				<div class="flag"></div>
				<div class="line"></div>
			</div>
			
			<div class="GERMANY">
				<div class="flag"></div>
				<div class="line"></div>
			</div>
			
			<div class="ITALY">
				<div class="flag"></div>
				<div class="line"></div>
			</div>
			
			<div class="NEWZEALAND">
				<div class="flag"></div>
				<div class="line"></div>
			</div>
			
			<div class="PORTUGAL">
				<div class="flag"></div>
				<div class="line"></div>
			</div>
			
			<div class="SPAIN">
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
			<c:forEach var="country" items="${cList}">
				<li><a href="${contextPath}/admin/info/${country.countryEngName}">${country.countryName}</a></li>
			</c:forEach>
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