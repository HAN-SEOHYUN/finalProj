<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

//select box
</script>
			<div class="orderInfo-order">
				<div class="order-select-wrap">
					<select class="mulit-select" name="order-item" id="order-item">
						<option value="" selected>선택하세요</option>
						<c:forEach var = "vo" items ="${list }">
						<option value="${vo.no} ">${vo.categoryName} </option>
						</c:forEach>
					</select> 
					<div class="addBtnWrap"><button class="addBtn" id="orderAddBtn">추가</button>&nbsp;<i class="fa-solid fa-circle-plus" id="plusI"></i></div>
				</div>
			</div>
</body>
</html>