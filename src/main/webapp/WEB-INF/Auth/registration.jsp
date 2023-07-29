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
		<span class="form-error">Sample Error Message</span>
		<form class="form-card" autocomplete="off">

			<label class="input-group flex-col">First Name <input
				type="text" placeholder="e.g. John" autocomplete="off"/>
			</label> 
			
			<label class="input-group flex-col">Last Name <input
				type="text" placeholder="e.g. Doe" autocomplete="off"/>
			</label> 
			
			<label class="input-group flex-col">Email <input type="email"
				placeholder="example@email.com" autocomplete="false"/>
			</label>
			
			<label class="input-group flex-col">Password <input type="password"
				placeholder="e.g. johndoe01" autocomplete="off"/>
			</label>

			<div class="form-forgot-pass">
				<a class="alt-form-link">Forgot Password?</a>
				<button class="submit-button">Sign Up</button>
			</div>

			<hr class="divider">
			
			<a class="alt-form-link trans-ease-out" href="/login" style="margin-bottom: 1rem;">Already have an account?</a>

		</form>
	</section>
	

</main>

<jsp:include page="../footer.jsp"></jsp:include>

