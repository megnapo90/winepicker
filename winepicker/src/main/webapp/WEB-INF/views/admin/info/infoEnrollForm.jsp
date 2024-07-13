<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<style>
	img {
		width: 100px;
	}
	#enrollForm{
		border: 1px solid black;
	}
	
	#fieldset{
		/* border: 1px solid gray !important; */
		
		width: 500px;
		
		border-top-style: solid !important;
		border-top-color: gray !important;
	}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<div class="section">

	<div class="content">
		<br>
		<br>
		<div class="innerOuter">
			<h2>정보글 작성</h2>
			<br>
			
			<form action="${contextPath}/admin/infoEnroll" id="enrollForm" method="post" enctype="multipart/form-data">
				
				<fieldset id="fieldset1">
				<legend>메인 정보글</legend>
				
					<label>메인 정보글 : </label>
					<select id="main-info" name="infoName" required="required">
						<option value="MAIN">정보글 메인 페이지</option>
						<option value="WINE">와인 페이지 메인</option>
						<c:forEach var="wt" items="${wtList}">
							<option value="${wt.wineTypeEngName}">${wt.wineTypeName} 페이지 메인</option>
						</c:forEach>
					</select>
					<input type="button" value="선택" onclick="disableOthers()">
				</fieldset>
				
				
				<br><br><br><br><br><br><br><br>
				
				
				<fieldset id="fieldset2">
				<legend>포도 품종 상세 정보글</legend>
				
					<label for="wineTypeNo">와인타입: </label>
					<select name="wineTypeNo" id="wineTypeNo">
					<option>와인타입 선택(필수)</option>
					<c:forEach var="wt" items="${wtList}">
						<option value="${wt.wineTypeNo}" class="wineType">${wt.wineTypeName} ${wt.wineTypeNo}</option>
					</c:forEach>
					</select>
					<input type="button" value="선택" onclick="selectWineType()">
					
					<br>
					
					<label>포도 품종 상세 정보글 : </label>
					<select id="grapeNo" name="infoName" required="required">
					</select>
				
				</fieldset>
				
				<table align="center">
					
					<tr>
						<th>부제목</th>
						<td><input type="text" id="subtitle" class="form-control" name="subtitle" required></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${loginUser.userId}</td>
					</tr>

					<tr>
						<th>첨부파일</th>
						<td><input type="file" id="upfile" class="form-control" name="upfile"></td>
					</tr>


					<tr>
						<th>내용</th>
						<td>
							<textarea id="content" style="resize: none;" rows="10" class="form-control" name="noticeContent" required="required"></textarea>
						</td>
					</tr>
				</table>
				
				
				
				
				
				
				
				
				
				
				
				<%-- <input type="button" value="메인 정보글" name="main" onclick="updateInfo(this,0,0,0,0)">
				<input type="button" value="와인 정보글" name="wine" onclick="updateInfo(this,0,0,0,1)">
				<input type="button" value="레드와인 정보글" name="red" onclick="updateInfo(this,0,1,0,2)">
				<input type="button" value="화이트와인 정보글" name="white" onclick="updateInfo(this,0,2,0,2)">
				<input type="button" value="스파클링와인 정보글" name="sparkling" onclick="updateInfo(this,0,3,0,2)">
				 --%>
				
				
				<div align="center">
					<button type="submit" class="btn btn-primary">등록</button>
					<button type="button" class="btn btn-danger" onclick="resetAll()">취소</button>
				</div>
				
				
				
			</form>
		</div>
	</div>
	
	
</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

	<script>
		/* function updateInfo(elem, countryNo, wineTypeNo, grapeNo, depth){

			console.log(elem.name);

			var name = elem.name;

			if(wineTypeNo == 1){
				
			}

			$.ajax({
				url : "${contextPath}/admin/insertInfo/selectInfoList",
				type : "GET",
				data : {
					infoName : name,
					countryNo,
					wineTypeNo,
					grapeNo,
					depth
				},
				success : (result)=>{
					console.log(result);
					console.log(typeof result);
					console.log(result.infoName);

					$("#subtitle").val(result.subtitle);
					$("#content").val(result.content);

					if(result.wineTypeNo == 1) {

					}

					
				},error : (xhr)=>{
					console.log(xhr);
				}

			});
			
			
		} */
		
		
		
		
		
		
		
		
		function selectWineType() {
			
			var $num = $("select[name=wineTypeNo] option:selected").val();
			
			$.ajax({
	    		url: "${contextPath}/admin/wineTypeList",
	    		data:{
	    			wineTypeNo : $num
	    		},
	    		success : (gList)=>{
                	$("#grapeNo").empty();
	                $.each(gList, function(index, value){
	                	var num = value.grapeNo;
	                    $("#grapeNo").append(`<option value=\${num}>\${value.grapeName}</option>`)
	                })
	    		},
	    		error : (xhr)=>{
	    			$("#grapeNo").empty();
	    			console.log(xhr);
	    		}
	    	});
			
			
			$("#main-info").attr("disabled", "disabled");
			$("input[type=button]").attr("disabled", "disabled");
		};
		
		function disableOthers(){
			$("#wineTypeNo").attr("disabled", "disabled");
			$("#grapeNo").attr("disabled", "disabled");
			$("input[type=button]").attr("disabled", "disabled");
		}
		
		function resetAll(){
			location.href = "${contextPath}/admin/infoEnroll";
		}
		
		
		
		
	</script>

</body>
</html>