<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
.fr{
	float:right;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	
});
//예약페이지 열기
function booking(locNo){
	
	console.log("locNo:"+locNo);
	//현재창에서 페이지 이동
	$(location).attr("href", "/buyer/locview?locNo="+locNo);
	
}
//판매처 지도 열기
function mapView(station,spot){
	
	console.log("station:"+station);
	console.log("spot:"+spot);
	//팝업창 새로 띄우기
	window.open("/buyer/sellerLocMap?station="+station+"&spot="+spot, "판매처지도", "width=400, height=300, left=100, top=50");
	
}
//채팅창 열기
function inquire(id,sort){
	
	console.log("id:"+id);
	console.log("sort:"+sort);
	//현재창에서 페이지 이동
	$(location).attr("href", "/createRoom?id="+id+"&sort="+sort);
	
}
</script>

<div class="wrap container">
<div style="padding: 10px;">
<table class="table table-bordered">
	<thead>
	<tr>
	<th style="width: 25%">장소</th>
	<th style="width: 25%">세부위치(지도)</th>
	<th style="width: 25%">시간</th>
	<th style="width: 25%">판매자</th>

	</tr>
	</thead>
	<tbody>
	<c:forEach var="item" items="${sellerLocList}" begin="0" end="${sellerLocList.size()}" step="1">
		<tr>
		<td>${item.zone }</td>
		<td>${item.station } ${item.spot }<button class="btn btn-success btn-sm fr" onclick="mapView('${item.station }','${item.spot }')">지도보기</button></td>
		<td>${item.sellerTimeS } ~ ${item.sellerTimeE} <button class="btn btn-info btn-sm fr" onclick="booking(${item.locNo})">예약하기</button></td>
		<td>${item.sellerId }<button class="btn btn-warning btn-sm fr" onclick="inquire('${item.sellerId}','판매자')">문의하기</button></td>
	</c:forEach>
	</tbody>
</table>

<jsp:include page="sellerLocPaging.jsp" />
</div>
</div>