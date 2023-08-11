<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!-- paired navbar -->
<jsp:include page="../public-navbar.jsp">
	<jsp:param value="Login" name="HTMLtitle"/>
</jsp:include>

<main class="tb-container limited">

	<div class="tb-image disappear">
		<img src="svgs/login.svg" alt="svg">
	</div>
	
		<section class="tb-form flex-col">

		<h3 class="form-heading">Log In</h3>
		<span class="form-error"></span>
		
		<c:url var="post_url" value="/login"></c:url>
		
		<form class="form-card" autocomplete="on" action="${post_url}" method="post">
			
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			
			<label class="input-group flex-col">Username <input type="text" name="username"
				required placeholder="e.g. jdoe" autocomplete="false"/>
			</label>
			
			<label class="input-group flex-col">Password <input type="password" name="password"
				required placeholder="e.g. johndoe01" autocomplete="off"/>
			</label>

			<div class="form-forgot-pass">
				<a class="alt-form-link trans-ease-out" href="/forgot-password">Forgot Password?</a>
				<input class="submit-button" type="submit" value="submit"/>
			</div>

			<hr class="divider">
			
			<a class="alt-form-link trans-ease-out" href="/signup" style="margin-bottom: 1rem;">Create an account</a>

		</form>
	</section>
	

</main>

<jsp:include page="../footer.jsp"></jsp:include>