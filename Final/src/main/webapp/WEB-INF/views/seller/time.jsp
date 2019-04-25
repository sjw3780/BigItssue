<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">

$(document).ready(function() {
	
});

</script>

<div style="text-align: center;">
<button id="btnOpen" class="btn btn-default">오픈</button>
<button id="btnClose" class="btn btn-default">마감</button>
</div>

<div style="padding: 10px;">

<h4>오픈/마감 시간</h4>
<div style="text-align: center;">

<table class="table table-bordered">

<thead>
<tr>
	<td style="width: 20%">분류</td>
	<td style="width: 35%">오픈시간</td>
	<td style="width: 35%">마감시간</td>
	<td style="width: 10%"></td>
</tr>
</thead>

<tbody>
<tr>
	<form action="/seller/updateTime" method="POST">
	<td>시간</td>
	<td>
		<select name="startTime1">
			<c:forEach var="i" begin="1" end="24" step="1">
				<c:if test="${startTime1 eq i }">
				<option value="${startTime1 }" selected>${startTime1 }</option>
				</c:if>
				<c:if test="${startTime1 ne i }">
				<option value="${i }">${i }</option>
				</c:if>
			</c:forEach>
		</select>
		:
		<select name="startTime2">
			<c:forEach var="i" begin="00" end="59" step="01">
				<c:if test="${startTime2 eq i }">
				<option value="${startTime2 }" selected>${startTime2 }</option>
				</c:if>
				<c:if test="${startTime2 ne i }">
					<c:if test="${i lt 10 }">
					<option value="${i }">0${i }</option>
					</c:if>
					<c:if test="${i ge 10 }">
					<option value="${i }">${i }</option>
					</c:if>
				</c:if>
			</c:forEach>
		</select>
	</td>
	<td>
		<select name="endTime1">
			<c:forEach var="i" begin="1" end="24" step="1">
				<c:if test="${endTime1 eq i }">
				<option value="${endTime1 }" selected>${endTime1 }</option>
				</c:if>
				<c:if test="${endTime1 ne i }">
				<option value="${i }">${i }</option>
				</c:if>
			</c:forEach>
		</select>
		:
		<select name="endTime2">
			<c:forEach var="i" begin="00" end="59" step="01">
				<c:if test="${endTime2 eq i }">
				<option value="${endTime2 }" selected>${endTime2 }</option>
				</c:if>
				<c:if test="${endTime2 ne i }">
					<c:if test="${i lt 10 }">
					<option value="${i }">0${i }</option>
					</c:if>
					<c:if test="${i ge 10 }">
					<option value="${i }">${i }</option>
					</c:if>
				</c:if>
			</c:forEach>
		</select>
	</td>
	<td><button class="btn btn-xs btn-primary">변경</button></td>
	</form>
</tr>
</tbody>

</table>

<br><br><br>
</div>

<h4>판매중인 빅이슈</h4>
<div style="text-align: center; margin-bottom: 50px;">

<table id="sellBigissue" class="table table-bordered">

<thead>
<tr>
<!-- 	<td style="width: 18%">번호</td> -->
	<td style="width: 50%">판매 호수</td>
	<td style="width: 50%">판매 부수</td>
</tr>
</thead>

<tbody>

<c:if test="${bookListInfo.size() eq 0 }">
<tr>
	<td colspan="3">판매중인 빅이슈가 없습니다</td>
</tr>
</c:if>

<c:if test="${bookListInfo.size() ne 0 }">
<c:forEach items="${bookListInfo }" var="b">
<tr>
<%-- 	<td>${b.magazineNo }</td> --%>
	<form action="/seller/mUpdate?magazineNo=${b.magazineNo }" method="post" style="display: inline">
	<td><input style="width: 150px; text-align:center;" type="text" name="month" value="${b.month }"/></td>
	<td>
		<input style="width: 30px; text-align:center;" name="circulation" type="text" value="${b.circulation }"/>&nbsp;
		<button class="btn btn-xs btn-default">변경</button>
	</form>
		<a href="/seller/mDelete?magazineNo=${b.magazineNo }"><button class="btn btn-xs btn-danger">삭제</button></a>
	</td>
</tr>
</c:forEach>
</c:if>
</tbody>

</table>

<table class="table table-bordered">
<caption>판매할 빅이슈를 추가하고 싶다면, 아래 표 작성 후 '추가' 버튼을 누르세요</caption>
<thead>
<tr>
	<td>판매할 호수</td>
	<td>판매할 부수</td>
</tr>
</thead>
<tr>
	<form action="/seller/mPlus" method="post">
	<td style="width: 50%"><input style="width: 150px; text-align:center;" type="text" name="month"/></td>
	<td style="width: 50%">
		<input style="width: 30px; text-align:center;" name="circulation" type="text"/>&nbsp;
		<button id="btnPlus" class="btn btn-xs btn-primary">추가</button>		
	</td>
	</form>
</tr>
</table>


<br>
</div>

</div>