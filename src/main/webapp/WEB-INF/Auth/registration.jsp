<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../public-navbar.jsp">
	<jsp:param value="Sign Up" name="HTMLtitle"/>
</jsp:include>

<main class="tb-container limited">

	<div class="tb-image disappear">
		<img src="svgs/sign-up.svg" alt="svg">
	</div>
	
		<section class="tb-form flex-col">

		<h3 class="form-heading">Sign Up</h3>
		<span id="error-text" class="form-error">${error_msg}</span>
		<sf:form id="registrationForm" class="form-card" autocomplete="off" onsubmit="validateRegistration(event)"
			action="sign-up" method="post" modelAttribute="user">

				<label class="input-group flex-col">Full Name <sf:input id="fullname" type="text" 
			required="true" placeholder="e.g. John Doe" autocomplete="off" onkeyup="validateFullname()"
			name="fullname" path="fullname" />
			</label> 
			
			<label class="input-group flex-col">Username <sf:input id="username" type="text"
			required="true" placeholder="e.g. JohnDoe01" autocomplete="off" onkeyup="validateUsername()"
			name="username" path="username" />
			</label> 
			
			<label class="input-group flex-col">Email <sf:input id="email" type="email"
			required="true" placeholder="example@email.com" autocomplete="off" onkeyup="validateEmail()"
			name="email" path="email" />
			</label>
			
			<label class="input-group flex-col">Password <sf:input id="password" type="password"
			required="true" placeholder="e.g. JohnDoe2001" autocomplete="off" onkeyup="validatePassword()"
			name="password" path="password" />
			</label>


			<button class="submit-button" type="submit" value="sign-up">Sign Up</button>


			<hr class="divider">

			<a class="alt-form-link trans-ease-out" href="/login"
				style="margin-bottom: 1rem;">Already have an account?</a>

		</sf:form>
	</section>
	

</main>
<script type="text/javascript" src="js/form-validation.js"></script>
<jsp:include page="../footer.jsp"></jsp:include>

