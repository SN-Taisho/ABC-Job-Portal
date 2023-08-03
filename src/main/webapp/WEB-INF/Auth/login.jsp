<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
		<span class="form-error">Sample Error Message</span>
		<form class="form-card" autocomplete="on">
			
			<label class="input-group flex-col">Email <input type="email"
				placeholder="example@email.com" autocomplete="false"/>
			</label>
			
			<label class="input-group flex-col">Password <input type="password"
				placeholder="e.g. johndoe01" autocomplete="off"/>
			</label>

			<div class="form-forgot-pass">
				<a class="alt-form-link trans-ease-out" href="/forgot-password">Forgot Password?</a>
				<button class="submit-button">Log In</button>
			</div>

			<hr class="divider">
			
			<a class="alt-form-link trans-ease-out" href="/signup" style="margin-bottom: 1rem;">Create an account</a>

		</form>
	</section>
	

</main>

<jsp:include page="../footer.jsp"></jsp:include>