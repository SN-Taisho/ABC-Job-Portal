<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../public-navbar.jsp">
	<jsp:param value="Thank You" name="HTMLtitle"/>
</jsp:include>

<main class="public limited justify-center">

	<div class="pub-card">
		<img src="svgs/registration-success.svg" alt="svg">
		<h3 class="pub-heading confirmation">Registration Success</h3>
		<p class="pub-paragraph text-align-center">Your account was successfully registered,
			you may now use your credentials to login.</p>
		<a href="/login" class="pub-link btnAnimation">Login Now!</a>
	</div>

</main>

<jsp:include page="../footer.jsp"></jsp:include>