<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- paired navbar -->
<jsp:include page="../public-navbar.jsp">
	<jsp:param value="Forgot Password" name="HTMLtitle"/>
</jsp:include>

<main class="tb-container limited">

	<section class="tb-form flex-col">

		<h3 class="form-heading">Forgot Password</h3>
		<span id="error-text" class="form-error"></span>
		<form id="emailForm" class="form-card" autocomplete="on"
			onsubmit="validateEmailForm(event)">

			<label class="input-group flex-col">Email <input id="email" type="email"
			required placeholder="example@email.com" autocomplete="off" onkeyup="validateEmail()"/>
			</label>

			<button class="submit-button">Submit</button>

			<hr class="divider">

			<a class="alt-form-link trans-ease-out" href="/signup"
				style="margin-bottom: 1rem;">Don't have an account?</a>

		</form>
	</section>

	<div class="tb-image disappear">
		<img src="svgs/forgot-password.svg" alt="svg">
	</div>

</main>
<script type="text/javascript" src="js/form-validation.js"></script>
<jsp:include page="../footer.jsp"></jsp:include>