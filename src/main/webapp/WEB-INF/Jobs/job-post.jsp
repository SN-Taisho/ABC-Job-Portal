<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="Job Post" name="HTMLtitle" />
</jsp:include>

<c:forEach items="${jobPost}" var="j">
	<c:set var="jobPostId" value="${j.id}"></c:set>
	<c:set var="jOpUsername" value="${j.getUser().getUsername()}"></c:set>
	<c:set var="jobPostOp" value="${j.getUser().getFullname()}"></c:set>
	<c:set var="jobPostDate" value="${j.date}"></c:set>
	<c:set var="jobPostTitle" value="${j.title}"></c:set>
	<c:set var="jobPostCompany" value="${j.company}"></c:set>
	<c:set var="jobPostSalary" value="${j.salary}"></c:set>
	<c:set var="jobPostPhotoPath" value="${j.photoImagePath}"></c:set>
	<c:set var="jobPostContent" value="${j.content}"></c:set>
</c:forEach>

<main class="single-main">

	<div class="post-card">
		
		<a class="post-op" href="profile?username=${jOpUsername}">
			<img class="post-profile-img" src="images/Profile.png" width="50"/>
			<p>${jobPostOp}</p>
		</a>
		
		<span class="post-date">Aug 08, 2023</span>
		<h5 class="post-heading">Occupation: ${jobPostTitle} at ${jobPostCompany}</h5>
		<h5 class="post-heading">Salary: ${jobPostSalary}</h5>
		
		<img class="post-img"
			src="${jobPostPhotoPath}" alt="job-post-attachment.png" width="600" />
			
		<p class="post-paragraph">${jobPostContent}</p>
		
		<sec:authorize access="hasRole('Admin')">
			<div class="post-management">
				<button onclick="window.location.href='edit-job-post?jpId=${jobPostId}'" style="background-color: var(--success);">Edit</button>
				<button onclick="window.location.href='delete_job_post?jpId=${jobPostId}'" style="background-color: var(--danger);">Delete</button>
			</div>
		</sec:authorize>

	</div>
	
	<button id="openApplyJob" class="reply-button btnAnimation">Submit a response</button>
	
	<div class="replies-container">

		<c:forEach items="${responses}" var="r">
			<div class="reply-card">
				<a class="reply-user" href="view-profile?username=${r.getUser().getUsername()}"> <img
					src="images/Profile.png" width="50" />
					<p>${r.getUser().getFullname()}</p>
				</a> <span class="reply-date">${r.date}</span>
				
				<h5 class="post-heading">Responder Information:</h5>
				<p class="reply-paragraph">Contact No.: ${r.contactInfo}</p>
				
				<p class="reply-paragraph">${r.content}</p>
				
				<a class="reply-link btnAnimation" href="/view-profile?username=${r.getUser().getUsername()}">View User Profile</a>
			</div>
		</c:forEach>

	</div>

	<dialog id="applyJobModal" class="modal">

	<h3 class="modal-heading">
		Reply to<br>Thread
	</h3>
	<span id="error-text" class="form-error"></span> <sf:form
		class="align-center flex-col form" method="post" action="respond_job_post"
		modelAttribute="jobPostResponse">

		<input type="hidden" name="jobPostId" path="jobPostId"
			value="${jobPostId}" />

		<label class="input-group flex-col">Contact Information <input id="" type="text"
			placeholder="Mobile/Telephone No." autocomplete="off" name="contactInfo"
			path="contactInfo"/>
		</label>
		
		<label class="input-group flex-col">Enter your response here <textarea
				class="textarea" placeholder="Brief explanation about your response" rows="5"
				name="content" path="content"></textarea>
		</label>

		<button class="submit-button btnAnimation"
			style="background-color: var(--success);" type="submit">Save</button>
	</sf:form>
	<button id="closeApplyJob" class="material-icons modal-close">close</button>
	</dialog>

</main>

<script>
const applyJobM = document.querySelector("#applyJobModal");
const openApplyJob = document.querySelector("#openApplyJob");
const closeApplyJob = document.querySelector("#closeApplyJob");

openApplyJob.addEventListener("click", () => {
	applyJobM.showModal();
	});

closeApplyJob.addEventListener("click", () => {
		applyJobM.close();
	});
</script>

<jsp:include page="../footer.jsp"></jsp:include>
