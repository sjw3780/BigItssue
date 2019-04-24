<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">


</style>

<div class="header">

<nav class="navbar navbar-default">
	<div class="container">	
		<div class="navbar-header">
			<a href="#" class="standard-logo"><img src="http://bigissue.kr/wp-content/themes/canvas/images/Bigissue_kr_logo_main.png" alt="Bigissue Logo"></a>
		</div>
		
		<div id="topMenu" class="topMenu">
		
			<ul class="nav navbar-nav">
				<li class="menu"><a href="#">판매처 보기</a></li>
				<li class="menu"><a href="#">공지사항</a></li>
				
				<c:if test="${not login }">
					<a href="#"><button class="btn btnLogin">로그인</button></a>
					<a href="#"><button class="btn btnJoin">회원가입</button></a>
				</c:if>

				<c:if test="${login }">
					${id }님
					<a href="#"><button class="btn btnLogout">로그아웃</button></a>
					<a href=#><button class="btn btnMypage">마이페이지</button></a>
				</c:if>
			</ul>			
		</div>
	</div>
</nav>
</div>