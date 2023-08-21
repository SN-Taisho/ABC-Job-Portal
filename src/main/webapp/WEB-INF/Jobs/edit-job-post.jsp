<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="Edit Job Post" name="HTMLtitle" />
</jsp:include>

<c:forEach items="${jobPost}" var="j">
	<c:set var="jobPostId" value="${j.id}"></c:set>
	<c:set var="jobTitle" value="${j.title}"></c:set>
	<c:set var="jobCompany" value="${j.company}"></c:set>
	<c:set var="jobSalary" value="${j.salary}"></c:set>
	<c:set var="jobContent" value="${j.content}"></c:set>
</c:forEach>

<main class="single-main">

	<section class="create-post">
		<h3 class="form-heading">Create a Job Post</h3>
		
		<sf:form class="create-form" method="post" action="edit_job_post?jpId=${jobPostId}" modelAttribute="jobPost">
		
			<label class="input-group flex-col">Job Title <input id="" type="text" 
			required="true" placeholder="Insert interesting title" autocomplete="off"
			name="title" path="title" value="${jobTitle}" style="line-height: 2rem;"/>
			</label>
			
			<label class="input-group flex-col">Company <input id="" type="text" 
			required="true" placeholder="Insert interesting title" autocomplete="off"
			name="company" path="company" value="${jobCompany}" style="line-height: 2rem;"/>
			</label>
			
			<label class="input-group flex-col">Salary <input id="" type="text" 
			required="true" placeholder="Insert interesting title" autocomplete="off"
			name="salary" path="salary" value="${jobSalary}" style="line-height: 2rem;"/>
			</label>
			
			<label class="input-group flex-col">Description <textarea class="textarea"
			placeholder="Write about something here" rows="5" name="content" path="content">${jobContent}</textarea>
			</label>
			
			<button class="submit-button" type="submit" style="border-radius: 10px;">Post</button>
			<a class="cancel-btn" href="job-post?jpId=${jobPostId}">Cancel</a>

		</sf:form>
		
	</section>

</main>

<jsp:include page="../footer.jsp"></jsp:include>
