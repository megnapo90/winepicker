<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<style>
#main-img img{
	box-sizing: content-box;
	
	position: absolute;
	top: 0px;
	left: 0px;
	
	/* float: left; */

    width: 500px;
    margin-top: 0;
    margin-right: 20px;
}
#subtitle{
    box-sizing: content-box;
    
    position: absolute;
    top: 0px;
    left: 580px;

    font-size: xx-large;
    font-weight: bolder;
}
#info-main-content{

	position: absolute;
	top: 80px;
	left: 550px;
    box-sizing: content-box;
    
    font-size: x-large;

}
pre{
	overflow : auto;
	white-space: pre-wrap;
}
.link{
	position: absolute;
	top: 500px;
	left: 50px;
	
	font-size: x-large;
	font-weight: bold;
	font-style: italic;
	
}

.link a{
	color: black;
	
}
</style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
    
    <c:set var="depth" value="${info.depth}" scope="session"/>
    <c:set var="wineTypeNo" value="${info.wineTypeNo}" scope="session"/>
    <c:set var="countryNo" value="${info.countryNo}" scope="session"/>
    <c:set var="infoName" value="${info.infoName}" scope="session"/>
    
    
<div class="section">


	<div id="info-main">
        <div id="main-img">
            <img src="${contextPath}/resources/admin/info/${info.changeName}" alt="인포 사진">
        </div>
        <div id="subtitle"><p>${info.subtitle}</p></div>
        <div id="info-main-content">
			<pre width="inherit">${info.content}</pre>
        </div>
    </div>
    
   	<div class="link">
   		<c:choose>
   			<c:when test="${info.infoName eq 'Red'}">
   				<c:set var="num" value="1"/>
				<a onclick="sendPost()">${info.infoName} 상품 보러 가기</a>
				<script>
					function sendPost(){
						var f = document.createElement('form');
						f.setAttribute('method', 'post');
						f.setAttribute('action', `${contextPath}/product/list?types=${num}`);
						document.body.appendChild(f);
						f.submit();
					}
				</script>
   			</c:when>
   		</c:choose>
	</div>
    
    
    
	<c:if test="${loginUser.gradeNo eq 0}">
		<script>
            (()=>{
                $("#info-main").css("display", "none");
            })();
		</script>
		
		<form action="${contextPath}/admin/infoUpdate" method="post" enctype="multipart/form-data">
        <table align="center">
        	<tr>
        		<th>INFO_NAME</th>
        		<td>
                    <textarea  name="infoName"  id="infoName" style="resize: none;" rows="1" class="form-control" required="required" readonly>${info.infoName}</textarea>                
                </td>
        	</tr>
        	<tr>
        		<th>COUNTRY_NO</th>
        		<td>
                    <textarea  name="countryNo"  id="countryNo" style="resize: none;" rows="1" class="form-control" required="required" readonly>${info.countryNo}</textarea>                
                </td>
        	</tr>
        	<tr>
        		<th>WINE_TYPE_NO</th>
        		<td>
                    <textarea  name="wineTypeNo"  id="wineTypeNo" style="resize: none;" rows="1" class="form-control" required="required" readonly>${info.wineTypeNo}</textarea>                
                </td>
        	</tr>
        	<tr>
        		<th>GRAPE_NO</th>
        		<td>
                    <textarea  name="grapeNo"  id="grapeNo" style="resize: none;" rows="1" class="form-control" required="required" readonly>${info.grapeNo}</textarea>                
                </td>
        	</tr>
        	<tr>
        		<th>DEPTH</th>
        		<td>
                    <textarea  name="depth"  id="depth" style="resize: none;" rows="1" class="form-control" required="required" readonly>${info.depth}</textarea>                
                </td>
        	</tr>
        	<tr>
        		<th>ORIGIN_NAME</th>
        		<td>
                    <textarea  name="originName"  id="originName" style="resize: none;" rows="1" class="form-control" required="required" readonly>${info.originName}</textarea>                
                </td>
        	</tr>
        	<tr>
        		<th>CHANGE_NAME</th>
        		<td>
                    <textarea  name="changeName"  id="changeName" style="resize: none;" rows="1" class="form-control" required="required" readonly>${info.changeName}</textarea>                
                </td>
        	</tr>
        	
            <tr>
                <th>부제목</th>
                <td>
                    <textarea  name="subtitle"  id="" style="resize: none;" rows="1" class="form-control" required="required">${info.subtitle}</textarea>                
                </td>
            </tr>

            <tr>
                <th>첨부파일</th>
                <td><input type="file" id="upfile" class="form-control" name="upfile"></td>
            </tr>


            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" id="content" style="resize: none;" cols="80" rows="15" class="form-control"  required="required">${info.content}</textarea>
                </td>
            </tr>
        </table>
        <div align="center">
            <button type="submit" class="btn btn-primary">수정</button>
            <button type="reset" class="btn btn-danger">취소</button>
        </div>
    </form>
		
	</c:if>




</div>
    
    
    
    <div id="list">
    
    <ul class="ul">
    	<li class="depth1">
    		<a href="${contextPath}/admin/info/wine">와인 정보글</a>
    		<ul>
    			<c:forEach var="i" items="${iList}">
    			<c:if test="${i.wineTypeNo gt 0 and i.depth eq 2}">
	    			<li class="depth${i.depth} wineTypeNo${i.wineTypeNo}">
	    				<a href="${contextPath}/admin/info/${i.infoName}">${i.infoName}</a>
	    				<ul>
	    					<c:forEach var="j" items="${iList}">
	    					<c:if test="${j.wineTypeNo eq i.wineTypeNo and j.depth eq 3}">
	    						<li class="depth${j.depth} wineTypeNo${j.wineTypeNo}">
	    							<a href="${contextPath}/admin/info/${j.infoName}">${j.infoName}</a>
	    						</li>
	    					</c:if>
	    					</c:forEach>
	    				</ul>
	    			</li>
    			</c:if>
    			</c:forEach>
    		</ul>
    	</li>
    </ul>
    
    <ul class="ul">
    	<li class="depth1">
    		<a href="${contextPath}/admin/info/country">나라 정보글</a>
    			<ul>
    				<c:forEach var="i" items="${iList}">
    				<c:if test="${i.countryNo gt 0}">
    					<li class="depth${i.depth} country">
    						<a href="${contextPath}/admin/info/${i.infoName}">${i.infoName}</a>
    					</li>
    				</c:if>
    				</c:forEach>
    			</ul>
    	</li>
    </ul>
    

    </div>
    
    
    <script>
		(()=>{
			if(${depth} == 0){
				console.log(`${infoName}`);
				$(".depth2").css("display", "none");
				$(".depth3").css("display", "none");
			}
		})();

		(()=>{
			if(${depth} == 1 && `${infoName}.toLowerCase().equals("wine")`){
				console.log(`${infoName}`);
				$(".depth3").css("display", "none");
			}
		})();

		(()=>{
			if(${depth} == 2 && ${wineTypeNo} == 1){
				console.log(`${infoName}`);
				$(".country").css("display", "none");
				$(".depth3.wineTypeNo2").css("display", "none");
				$(".depth3.wineTypeNo3").css("display", "none");
			}
		})();
		
		(()=>{
			if(${depth} == 2 && ${wineTypeNo} == 2){
				console.log(`${infoName}`);
				$(".country").css("display", "none");
				$(".depth3.wineTypeNo1").css("display", "none");
				$(".depth3.wineTypeNo3").css("display", "none");
			}
		})();
		
		(()=>{
			if(${depth} == 2 && ${wineTypeNo} == 3){
				console.log(`${infoName}`);
				$(".country").css("display", "none");
				$(".depth3.wineTypeNo1").css("display", "none");
				$(".depth3.wineTypeNo2").css("display", "none");
			}
		})();
		
		
		
		(()=>{
			if(${depth} == 3 && ${wineTypeNo} == 1){
				$(".country").css("display", "none");
				$(".depth3.wineTypeNo2").css("display", "none");
				$(".depth3.wineTypeNo3").css("display", "none");
			}
		})();
		
		(()=>{
			if(${depth} == 3 && ${wineTypeNo} == 2){
				$(".country").css("display", "none");
				$(".depth3.wineTypeNo1").css("display", "none");
				$(".depth3.wineTypeNo3").css("display", "none");
			}
		})();
		
		(()=>{
			if(${depth} == 3 && ${wineTypeNo} == 3){
				$(".country").css("display", "none");
				$(".depth3.wineTypeNo1").css("display", "none");
				$(".depth3.wineTypeNo2").css("display", "none");
			}
		})();
		
		(()=>{
			if(${depth} == 3 && ${countryNo} > 0){
				$(".wineTypeNo1").css("display", "none");
				$(".wineTypeNo2").css("display", "none");
				$(".wineTypeNo3").css("display", "none");
			}
		})();
		
		
		
		
		/* $.ajax({
	        url: `${contextPath}/product/searchByAjax`,
	        type: 'GET',
	        traditional: true,
	        data: {
	            volumes: selectedVolumes,
	            types: selectedTypes,
	            redSubTypes: selectedRedSubTypes,
	            whiteSubTypes: selectedWhiteSubTypes,
	            sparklingSubTypes: selectedSparklingSubTypes,
	            countries: selectedCountries,
	            minPrices: minPrices,  // 추가: 슬라이더의 최소 가격
	            maxPrices: maxPrices,  // 추가: 슬라이더의 최대 가격
	            sortOption: sortOption
	        },
	        success: function(result) {
	            console.log('서버 응답 데이터:', result);
				
	            var wineExts = '';
	            for (var wineExt of result) {
	           	var formattedPrice = wineExt.price.toLocaleString();
	            	
	                wineExts += `<div class="wine-card-info-wrap" data-href="${contextPath}/product/detail/\${wineExt.wineNo}">`;
	                wineExts += `  <div class="wine-image-wrap">`;
	                wineExts += `    <img src="${contextPath}/resources/images/product/\${wineExt.wineImage.changeName}" alt="\{wineExt.wineName}">`;
	                wineExts += `    <p class="wine-title">\${wineExt.wineName}</p>`;
	                wineExts += `  </div>`;
	                wineExts += `  <div class="wine-price-info">`;
	                wineExts += `    <p>\${formattedPrice}원</p>`;
	                wineExts += `  </div>`;
	                wineExts += `  <div class="type-country">`;
	                wineExts += `    <img src="${contextPath}/resources/css/images/product/country/country\${wineExt.countryNo}.png" alt="\${wineExt.countryNo} Image" class="country-image" />`;
	                wineExts += `    <img src="${contextPath}/resources/css/images/product/type/type\${wineExt.grape.wineTypeNo}.svg" alt="\${wineExt.grape.wineTypeNo} Image" class="type-image" />`;
	                wineExts += `  </div>`;
	                wineExts += `</div>`;
	            }

	            document.getElementById('productList').innerHTML = wineExts;

	            document.querySelectorAll('.wine-card-info-wrap').forEach(function(product) {
	                product.addEventListener('click', function() {
	                    var href = product.getAttribute('data-href');
	                    window.location.href = href;
	                });
	            });
	        },
	        error: function(error) {
	            console.error('AJAX 요청 에러:', error);
	            document.getElementById('productList').innerHTML = '<p>데이터를 불러오는 중 오류가 발생했습니다.</p>';
	        }
	    }); */
		
		
    </script>
    
    
    
    
 
    


    

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>