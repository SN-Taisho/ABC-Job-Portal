<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="Profile" name="HTMLtitle" />
</jsp:include>

<main class="single-main">

	<div class="posts-container">
		
		<h3 class="pub-heading" style="text-transform: capitalize;">What employers are looking for</h3>

		<c:if test="${not empty jobPosts}">
			<c:forEach items="${jobPosts}" var="j">
				<div class="post-card">
					<a class="post-op" href="profile"> <img
						class="post-profile-img" src="images/Profile.png" width="50" />
						<p>${j.getUser().getFullname()}</p>
					</a> <span class="post-date">${j.date}</span> 
					
					<h5 class="post-heading">Occupation: ${j.title} at ${j.company}</h5>
					<h5 class="post-heading">Salary: ${j.salary}</h5>
					
					<img class="post-img"
						src="${j.photoImagePath}" alt="${j.photos}" width="600"/>

					<p class="post-paragraph">${j.content}</p>

					<hr class="divider">

					<div class="post-btn-container">
						<a class="thread-link" href="/job-post?jpId=${j.id}">View Job Post</a>
					</div>

				</div>
			</c:forEach>
		</c:if>
		<c:if test="${empty jobPosts}">
			<div class="post-card">
					<h5 class="post-heading" style="text-align: center">No jobs are currently listed</h5>
				</div>
		</c:if>
	</div>

</main>

<jsp:include page="../footer.jsp"></jsp:include>
