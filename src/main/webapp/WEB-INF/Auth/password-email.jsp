<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- paired navbar -->
<jsp:include page="../public-navbar.jsp">
	<jsp:param value="Email Verification" name="HTMLtitle"/>
</jsp:include>

<main class="tb-container limited">

	<section class="tb-form flex-col">

		<h3 class="form-heading">OTP<br>Verification Code</h3>
		<span id="error-text" class="form-error"></span>
		<form id="otpForm" class="form-card" autocomplete="on" onsubmit="validateOTPForm(event)">
			
			<label class="input-group flex-col text-align-center">Enter the six digit code sent to your email address
				
				<input id="fullOTP" type="hidden" maxlength="6" autocomplete="off">
				
				<div class="otp-container justify-center" style="margin: 0.5rem 0rem;">
				
					<input class="OTP" type="text" required maxlength="1"
					autocomplete="off" onkeyup="validateOTP()">
					
					<input class="OTP" type="text" required maxlength="1"
					autocomplete="off" onkeyup="validateOTP()">
					
					<input class="OTP" type="text" required maxlength="1"
					autocomplete="off" onkeyup="validateOTP()">
					
					<input class="OTP" type="text" required maxlength="1"
					autocomplete="off" onkeyup="validateOTP()">
					
					<input class="OTP" type="text" required maxlength="1"
					autocomplete="off" onkeyup="validateOTP()">
					
					<input class="OTP" type="text" required maxlength="1"
					autocomplete="off" onkeyup="validateOTP()">
					
				</div>
			</label>

			<button class="submit-button" style="margin-bottom: var(--s);">Verify</button>

		</form>
	</section>

	<div class="tb-image disappear">
		<img src="svgs/email-validation.svg" alt="svg">
	</div>


</main>
<script type="text/javascript" src="js/form-validation.js"></script>
<jsp:include page="../footer.jsp"></jsp:include>