<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- paired navbar -->
<jsp:include page="../public-navbar.jsp"></jsp:include>

<main class="tb-container limited">

	<div class="tb-image disappear">
		<img src="svgs/forgot-password.svg" alt="svg">
	</div>

	<section class="tb-form flex-col">

		<h3 class="form-heading">OTP<br>Verification Code</h3>
		<span id="error-text" class="form-error"></span>
		<form id="otpForm" class="form-card" autocomplete="on" onsubmit="validateOTPForm(event)">

<!-- 			<label class="input-group flex-col">Enter the six digit code
				sent to your email address<input id="code" type="text" required maxlength="6"
				placeholder="000000" autocomplete="off" onkeyup="validateCode()"
				style="margin: var(--tiny) auto 0rem; text-align: center; width: 150px;"/>
			</label> -->
			
			<label class="input-group flex-col text-align-center">Enter the six digit code sent to your email address
				<div class="otp-container justify-center" style="margin: 0.5rem 0rem;">
					<input class="OTP" type="text" required maxlength="1"
					autocomplete="off" onkeyup="validateOTP()" value="1">
					
					<input class="OTP" type="text" required maxlength="1"
					autocomplete="off" onkeyup="validateOTP()" value="2">
					
					<input class="OTP" type="text" required maxlength="1"
					autocomplete="off" onkeyup="validateOTP()" value="3">
					
					<input class="OTP" type="text" required maxlength="1"
					autocomplete="off" onkeyup="validateOTP()" value="4">
					
					<input class="OTP" type="text" required maxlength="1"
					autocomplete="off" onkeyup="validateOTP()" value="5">
					
					<input class="OTP" type="text" required maxlength="1"
					autocomplete="off" onkeyup="validateOTP()" value="6">
				</div>
			</label>

			<button class="submit-button">Verify</button>

			<hr class="divider">

			<a class="alt-form-link trans-ease-out" href="/signup"
				style="margin-bottom: 1rem;">Don't have an account?</a>

		</form>
	</section>
	
	<script src="js/otp-validation.js"></script>



</main>

<jsp:include page="../footer.jsp"></jsp:include>