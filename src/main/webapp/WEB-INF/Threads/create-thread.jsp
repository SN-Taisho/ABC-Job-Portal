<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Portal NavBar -->
<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="Create Thread" name="HTMLtitle" />
</jsp:include>

<main class="single-main">

	<section class="create-post">
		<h3 class="form-heading">Create a Thread</h3>
		<span id="error-text" class="form-error" style="font-size: 1.1rem;">test error</span>
		
		<form class="create-form">
		
			<label class="input-group flex-col">Title <input id="" type="text" 
			required="true" placeholder="Insert interesting title" autocomplete="off"
			name="" path=""/>
			</label>
			
			<label class="input-group flex-col">Content <textarea class="textarea"
			placeholder="Write about something here" rows="5" name="" path=""></textarea>
			</label>
			
			<button class="submit-button" type="submit" style="border-radius: 10px;">Post</button>
			
		</form>
		
	</section>

</main>

<script type="text/javascript" src="js/form-validation.js"></script>

<jsp:include page="../footer.jsp"></jsp:include>
