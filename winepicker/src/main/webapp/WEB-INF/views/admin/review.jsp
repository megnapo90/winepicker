<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
<style>
    body {
        font-family: Arial, sans-serif;
    }
    .content {
        margin: 20px;
    }
    .innerOuter {
        margin: auto;
        width: 80%;
    }
    h2 {
        color: #333;
    }
    .form-group {
        margin-bottom: 20px;
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
    }
    .search-bar {
        position: relative;
        width: 300px;
    }
    .input-field {
        padding: 8px 12px;
        width: 100%;
        border: 1px solid #ccc;
        border-radius: 20px;
    }
    .search-bar button {
        position: absolute;
        right: 5px;
        top: 50%;
        transform: translateY(-50%);
        border: none;
        background: none;
        cursor: pointer;
    }
    .search-bar button img {
        width: 20px;
        height: 20px;
    }
    .btn-group {
        margin-top: 10px;
        text-align: right;
    }
    .btn-group button {
        padding: 8px 16px;
        margin-left: 10px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
        white-space: nowrap;
    }
    th {
        background-color: #f2f2f2;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    .user-list {
        margin-top: 20px;
    }
    .checkbox-column {
        width: 40px;
    }
    .number-column {
        width: 60px;
    }
    .action-link {
        color: #007bff;
        text-decoration: none;
    }
    .action-link:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
<jsp:include page="/WEB-INF/views/admin/adminList.jsp"/>

<div class="section">

<div class="content">
    <div class="innerOuter">
        <h2>리뷰 관리</h2>
        <div class="form-group">
            <div class="search-bar">
                <form action="${pageContext.request.contextPath}/admin/review" method="get">
                    <input type="text" name="keyword" placeholder="검색어를 입력하세요" value="${param.keyword}" class="input-field">
                    <button type="submit">
                        <img src="${pageContext.request.contextPath}/resources/images/search-icon.png" alt="Search">
                    </button>
                </form>
            </div>
            <div class="btn-group">
                <button type="button" onclick="replyReview()" id="replyBtn">선택 답변</button>
                <button type="button" onclick="deleteReview()" id="deleteBtn" class="btn-danger">선택 삭제</button>
            </div>
        </div>
        <div class="user-list">
            <table class="table">
                <thead>
                    <tr>
                        <th class="checkbox-column"><input type="checkbox" onclick="toggle(this);"></th>
                        <th class="number-column">번호</th>
                        <th>작성시간</th>
                        <th>주문번호</th>
                        <th>내용</th>
                        <th>점수</th>
                        <th>상태</th>
                        <th>수정시간</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${reviewList}" var="review" varStatus="status">
                        <tr>
                            <td class="checkbox-column"><input type="checkbox" name="selectedReviews" value="${review.reviewNo}"></td>
                            <td class="number-column">${review.reviewNo}</td>
                            <td>${review.createDate}</td>
                            <td>${review.orderNo}</td>
                            <td>${review.content}</td>
                            <td>${review.point}</td>
                            <td>${review.status}</td>
                            <td>${review.modifyDate}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty reviewList}">
                        <c:forEach var="i" begin="1" end="20">
                            <tr>
                                <td class="checkbox-column"><input type="checkbox" disabled></td>
                                <td class="number-column"></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${not empty reviewList && reviewList.size() < 10}">
                            <c:forEach var="i" begin="1" end="${10 - reviewList.size()}">
								<tr>
									<td class="checkbox-column"><input type="checkbox"
										disabled></td>
									<td class="number-column"></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</c:forEach>
                        </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script>
	function toggle(source) {
		var checkboxes = document.getElementsByName('selectedReviews');
		for (var i = 0; i < checkboxes.length; i++) {
			checkboxes[i].checked = source.checked;
		}
	}

	function deleteReview() {
		var selected = [];
		var checkboxes = document.getElementsByName('selectedReviews');
		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked) {
				selected.push(checkboxes[i].value);
			}
		}
		if (selected.length > 0 && confirm('정말 삭제하시겠습니까?')) {
			var form = document.createElement('form');
			form.method = 'post';
			form.action = '${pageContext.request.contextPath}/admin/deleteSelectedReviews';
			selected.forEach(function(value) {
				var input = document.createElement('input');
				input.type = 'hidden';
				input.name = 'selectedReviews';
				input.value = value;
				form.appendChild(input);
			});
			document.body.appendChild(form);
			form.submit();
			alert('선택된 리뷰가 삭제되었습니다.');
		}
	}

	function replyReview() {
		var selected = [];
		var checkboxes = document.getElementsByName('selectedReviews');
		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked) {
				selected.push(checkboxes[i].value);
			}
		}
		if (selected.length === 1) {
			var reviewNo = selected[0];
			window.location.href = '${pageContext.request.contextPath}/admin/updateReview?reviewNo='
					+ reviewNo;
		} else {
			alert("하나의 리뷰만 선택하여 답변해주세요.");
		}
	}
</script>
</body>
</html>
