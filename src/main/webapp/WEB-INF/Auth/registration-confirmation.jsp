<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- paired navbar -->
<jsp:include page="../public-navbar.jsp"></jsp:include>

<main class="tb-container limited">

	<div class="tb-image disappear">
		<img src="svgs/forgot-password.svg" alt="svg">
	</div>

	<section class="tb-form flex-col">

		<h3 class="form-heading">Verify Email</h3>
		<span class="form-error">Sample Error Message</span>
		<form class="form-card" autocomplete="on">

			<label class="input-group flex-col" style="text-align: center;">Enter
				the verification code sent to your email address<input type="email"
				placeholder="example@email.com" autocomplete="false" />
			</label>

			<button class="submit-button">Submit</button>

			<hr class="divider">

			<a class="alt-form-link trans-ease-out" href="/signup"
				style="margin-bottom: 1rem;">Don't have an account?</a>

		</form>
	</section>



</main>

<jsp:include page="../footer.jsp"></jsp:include>