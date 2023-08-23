<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="Search" name="HTMLtitle" />
</jsp:include>

<main class="single-main">
	
	<jsp:include page="../search-nav.jsp"></jsp:include>
	
	<sf:form class="search-bar" action="job-results" method="get">
		<button class="search-btn job material-icons" type="submit">search</button>
		<input class="search-input job" placeholder="Search" name="keyword" value="${keyword}"/>
	</sf:form>
	
	<c:if test="${empty searchJob}">
		<div class="mini-card">
			<h4 class="mc-heading"
				style="margin-bottom: 0rem; text-align: center;">No job post found</h4>
		</div>
	</c:if>

	<c:if test="${not empty searchJob}">
		<c:set var="count" value="0" scope="page" />
		<c:forEach items="${searchJob}" var="j">
			
				<c:set var="count" scope="page" value="${count + 1}" />
				
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
		
		<c:if test="${count == 0}">
			<div class="mini-card">
				<h4 class="mc-heading"
					style="margin-bottom: 0rem; text-align: center;">No job post found</h4>
			</div>
		</c:if>
	</c:if>




</main>

<jsp:include page="../footer.jsp"></jsp:include>
