<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../public-navbar.jsp">
	<jsp:param value="Reset Password" name="HTMLtitle"/>
</jsp:include>

<main class="tb-container limited">

		<section class="tb-form flex-col">

		<h3 class="form-heading">Reset Password</h3>
		<span id="error-text" class="form-error">${error_msg}</span>
		<sf:form id="resetForm" class="form-card" autocomplete="on" method="post" action="reset_password" onsubmit="validateResetForm(event)">
			
			<label class="input-group flex-col">Password <input id="password" type="password"
			required="true" placeholder="e.g. JohnDoe1" autocomplete="off" onkeyup="validatePassword()"
			name="password" path="password" maxlength="14"/>
			</label>
			
			<label class="input-group flex-col">Confirm your password<input type="password" id="passwordConfirmation"
				placeholder="Re-enter your new password" autocomplete="false" maxlength="14" required="true"
				onkeyup="validatePConfirmation()" />
				
			</label>
			
			<input type="hidden" name="email" value="${email}" required="true"/>

			<button type="submit" class="submit-button" style="margin-bottom: var(--s);">Change Password</button>

		</sf:form>
	</section>

	<div class="tb-image disappear">
		<img src="svgs/reset-password.svg" alt="svg">
	</div>

</main>
<script type="text/javascript" src="js/form-validation.js"></script>
<jsp:include page="../footer.jsp"></jsp:include>