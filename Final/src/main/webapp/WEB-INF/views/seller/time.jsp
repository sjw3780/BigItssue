<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">

function upOpentime(sysHour, sysMin) {
	$(location).attr("href", "/seller/upOpentime?startTime1="+sysHour+"&startTime2="+sysMin);
}

function upClosetime(sysHour, sysMin) {
	$(location).attr("href", "/seller/upClosetime?endTime1="+sysHour+"&endTime2="+sysMin);
}

function mDelete(magazineNo) {
	result = confirm('판매중인 빅이슈를 삭제하시겠습니까?'+'\n'+
						'삭제 후에는 변경할 수 없습니다.');
// 	console.log(result);
	if(result==true) {
		$(location).attr("href", "/seller/mDelete?magazineNo="+magazineNo);
	} else {
		return false;
	}
}

</script>

<div style="padding: 10px;">
* 판매자가 지정한 시간 외에 오픈/마감 시간을 변경하고 싶다면, 아래 버튼을 누르세요.<br>
&nbsp;&nbsp;오픈/마감 시간에 따라 버튼이 비활성화됩니다<br>

<!-- 현재시간 가져오기 -->
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="HH" var="sysHour" />
<fmt:formatDate value="${now}" pattern="mm" var="sysMin" />
<fmt:formatDate value="${now}" pattern="HHmm" var="sysTime" />
<%-- 현재 시 : <c:out value="${sysHour}"/> --%>
<%-- 현재 분 : <c:out value="${sysMin}"/> --%>

<!-- 마감시간 전 -->
${sysTime }//${sellerTimeE }//${sellerTimeS }
<c:if test="${sysTime lt sellerTimeE }">
	<c:if test="${sysTime ge sellerTimeS }">
		&nbsp;&nbsp;<button id="btnOpen" class="btn btn-default" disabled>오픈</button>
		<button id="btnClose" class="btn btn-default" onclick="upClosetime(${sysHour}, ${sysMin })">마감</button>
	</c:if>
</c:if>
	
<!-- 마감시간 후 -->
<c:if test="${sysTime ge sellerTimeE }">
	&nbsp;&nbsp;<button id="btnOpen" class="btn btn-default" disabled>오픈</button>
	<button id="btnClose" class="btn btn-default" disabled>마감</button>
</c:if>
<%-- ${sysHour }${sysMin } --%>
<%-- ${startTime1 }${startTime2 } --%>

<!-- 오픈시간 전 -->
<c:if test="${sysTime lt sellerTimeS }">
	&nbsp;&nbsp;<button id="btnOpen" class="btn btn-default" onclick="upOpentime(${sysHour }, ${sysMin })">오픈</button>
	<button id="btnClose" class="btn btn-default" disabled>마감</button>
</c:if>

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
	<td style="width: 10%">변경</td>
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
	<form action="/seller/mUpdate?magazineNo=${b.magazineNo }" method="post" style="display: inline" >
	<td><input style="width: 150px; text-align:center;" type="text" name="month" value="${b.month }"/></td>
	<td>
		<input style="width: 30px; text-align:center;" name="circulation" type="text" value="${b.circulation }"/>&nbsp;
		<button class="btn btn-xs btn-default">변경</button>
	</form>
		<button id="mDelete" class="btn btn-xs btn-danger" onclick="mDelete(${b.magazineNo })">삭제</button>
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