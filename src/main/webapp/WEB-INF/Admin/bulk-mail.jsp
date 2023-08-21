<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="Bulk Mail" name="HTMLtitle" />
</jsp:include>

<main class="single-main">

	<section class="create-post">
		<h3 class="form-heading">Send Bulk Mail</h3>
		
		<sf:form class="create-form" method="post" action="send_bulk_mail" modelAttribute="bulkMail">
		
			<label class="input-group flex-col">Subject<input id="" type="text" 
			required="true" placeholder="Insert interesting title" autocomplete="off"
			name="subject" path="subject" style="line-height: 2rem;"/>
			</label>
			
			<label class="input-group flex-col">Content<textarea class="textarea"
			placeholder="Write about something here" rows="15" name="content" path="content"></textarea>
			</label>
			
			<button class="submit-button" type="submit" style="border-radius: 10px;">Send Mail</button>


		</sf:form>
		
	</section>

</main>

<script type="text/javascript" src="js/form-validation.js"></script>

<jsp:include page="../footer.jsp"></jsp:include>
