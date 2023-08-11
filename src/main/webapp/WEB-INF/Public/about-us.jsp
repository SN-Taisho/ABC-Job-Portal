<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- paired navbar -->
<jsp:include page="../public-navbar.jsp">
	<jsp:param value="About Us" name="HTMLtitle"/>
</jsp:include>

<main class="public limited justify-center">

	<div class="pub-card">
		<h3 class="pub-heading">About Us</h3>
		<img src="svgs/software-engineers.svg" alt="svg">
		<p class="pub-paragraph">
			ABC Job Portal is a website where you can browse through hundreds of
			job posts from top companies and apply for your dream job with just a
			few clicks.<br> <br>Don't miss this chance and join ABC Job
			Portal today!
		</p>
		<a href="/signup" class="pub-link btnAnimation">Sign up now!</a>
	</div>

</main>

<jsp:include page="../footer.jsp"></jsp:include>