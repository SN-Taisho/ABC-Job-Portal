<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- paired navbar -->
<jsp:include page="../public-navbar.jsp"></jsp:include>

<main class="tb-container limited">

		<section class="tb-form flex-col">

		<h3 class="form-heading">Reset Password</h3>
		<span class="form-error">Sample Error Message</span>
		<form class="form-card" autocomplete="on">
			
			<label class="input-group flex-col">Enter your new password<input type="password"
				placeholder="e.g. JohnDoe01" autocomplete="false"/>
			</label>
			
			<label class="input-group flex-col">Confirm your password<input type="password"
				placeholder="e.g. JohnDoe01" autocomplete="false"/>
			</label>

			<button class="submit-button" style="margin-bottom: var(--s);">Change Password</button>

		</form>
	</section>

	<div class="tb-image disappear">
		<img src="svgs/reset-password.svg" alt="svg">
	</div>

</main>

<jsp:include page="../footer.jsp"></jsp:include>