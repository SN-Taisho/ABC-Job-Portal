<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- paired navbar -->
<jsp:include page="../public-navbar.jsp"></jsp:include>

<main class="tb-container limited">

	<div class="tb-image disappear">
		<img src="svgs/sign-up.svg" alt="svg">
	</div>
	
		<section class="tb-form flex-col">

		<h3 class="form-heading">Sign Up</h3>
		<span id="error-text" class="form-error">Sample Error Message</span>
		<form class="form-card" autocomplete="off">

			<label class="input-group flex-col">Full Name <input id="fullname"
				type="text" placeholder="e.g. John Doe" autocomplete="off" onkeyup="validateFullname()"/>
			</label> 
			
			<label class="input-group flex-col">Username <input id="username"
				type="text" placeholder="e.g. JohnDoe01" autocomplete="off" onkeyup="validateUsername()"/>
			</label> 
			
			<label class="input-group flex-col">Email <input id="email"
			type="email" placeholder="example@email.com" autocomplete="off" onkeyup="validateEmail()"/>
			</label>
			
			<label class="input-group flex-col">Password <input id="password" 
			type="password" placeholder="e.g. JohnDoe2001" autocomplete="off" onkeyup="validatePassword()"/>
			</label>


			<button class="submit-button">Sign Up</button>


			<hr class="divider">

			<a class="alt-form-link trans-ease-out" href="/login"
				style="margin-bottom: 1rem;">Already have an account?</a>

		</form>
	</section>
	

</main>

<jsp:include page="../footer.jsp"></jsp:include>

