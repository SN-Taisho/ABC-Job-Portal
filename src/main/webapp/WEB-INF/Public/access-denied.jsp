<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="!isAuthenticated()">
	<jsp:include page="../public-navbar.jsp"></jsp:include>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
	<jsp:include page="../portal-navbar.jsp"></jsp:include>
</sec:authorize>

<main class="public limited justify-center">

	<div class="pub-card">
		<img src="svgs/password-success.svg" alt="svg">
		<h3 class="pub-heading danger">Access Denied</h3>
		<p class="pub-paragraph text-align-center">You do not have access to this page. Please return to the home page</p>
		<a href="/login" class="pub-link alt btnAnimation">Return Home</a>
	</div>

</main>

<jsp:include page="../footer.jsp"></jsp:include>