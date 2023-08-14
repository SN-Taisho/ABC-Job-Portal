<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="Create Thread" name="HTMLtitle" />
</jsp:include>

<main class="single-main">

	<section class="create-post">
		<h3 class="form-heading">Create a Thread</h3>
		
		<sf:form class="create-form" method="post" action="create_thread" modelAttribute="thread">
		
			<label class="input-group flex-col">Title <input id="" type="text" 
			required="true" placeholder="Insert interesting title" autocomplete="off"
			name="title" path="title"/>
			</label>
			
			<label class="input-group flex-col">Content <textarea class="textarea" required="required"
			placeholder="Write about something here" rows="5" name="content" path="content"></textarea>
			</label>
			
			<button class="submit-button" type="submit" style="border-radius: 10px;">Post</button>
			
		</sf:form>
		
	</section>

</main>

<script type="text/javascript" src="js/form-validation.js"></script>

<jsp:include page="../footer.jsp"></jsp:include>
