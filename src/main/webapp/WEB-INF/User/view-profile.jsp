<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="Profile" name="HTMLtitle" />
</jsp:include>


<c:forEach items="${user}" var="u">
	<c:set var="fullname" value="${u.fullname}"></c:set>
	<c:set var="username" value="${u.username}"></c:set>
	<c:set var="occupation" value="${u.occupation}"></c:set>
	<c:set var="location" value="${u.location}"></c:set>
	<c:set var="bio" value="${u.bio}"></c:set>
</c:forEach>

<main class="single-main">

	<div class="profile">
		<img class="cover-photo" src="images/CoverPhoto.png" width="920" /> 
		<img class="profile-photo" src="images/Profile.png" width="100" />
		
		<div class="profile-details">
				<h5 class="profile-name">${fullname}</h5>
				<p class="profile-occupation">${occupation}</p>
				
				<p>${location}</p>
				<p>${bio}</p>
		</div>
	</div>

	<div class="info-container">
		<div class="info-section">
			<h5 class="is-heading">Experience</h5>

			<c:if test="${not empty experience}">
				<c:forEach items="${experience}" var="exp" varStatus="status">
					<div class="mini-card">
						<h6 class="mc-heading">${exp.occupation} at ${exp.company}</h6>
						<p>
							<c:out value="Total Years: ${exp.endYear - exp.startYear}"></c:out>
						</p>
						<p>${exp.startYear}-${exp.endYear}</p>
					</div>
				</c:forEach>
			</c:if>

			<c:if test="${empty experience}">
				<div class="mini-card">
					<h6 class="mc-heading text-align-center">User has no work experience</h6>
				</div>
			</c:if>

		</div>

		<div class="info-section">
			<h5 class="is-heading">Education</h5>
			<c:if test="${not empty education}">
				<c:forEach items="${education}" var="edu" varStatus="status">
					<div class="mini-card">
						<h6 class="mc-heading">${edu.course}at ${edu.school}</h6>
						<p>
							<c:out value="Total Years: ${edu.endYear - edu.startYear}"></c:out>
						</p>
						<p>${edu.startYear}-${edu.endYear}</p>
					</div>
				</c:forEach>
			</c:if>

			<c:if test="${empty education}">
				<div class="mini-card">
					<h6 class="mc-heading text-align-center">User has no education</h6>
				</div>
			</c:if>
		</div>
	</div>

	<hr class="divider">

	<div class="posts-container">

		<c:if test="${not empty threads}">
		<c:set var="count" value="0" scope="page" />
		<c:forEach items="${threads}" var="t">
			
			<c:if test="${t.getUser().getUsername() eq username}">
				<c:set var="count" scope="page" value="${count + 1}" />
				<div class="post-card">
					<a class="post-op" href="view-profile/${t.getUser().getUsername()}"> <img class="post-profile-img"
						src="images/Profile.png" width="50" />
						<p>${t.getUser().getFullname()}</p>
					</a> <span class="post-date">${t.date}</span>
	
					<h5 class="post-heading">${t.title}</h5>
	
					<p class="post-paragraph">${t.content}</p>
	
					<hr class="divider">
	
					<div class="post-btn-container">
						<a class="thread-link" href="/thread/${t.id}">View Thread</a>
					</div>
				</div>
			</c:if>
			
		</c:forEach>
			<c:if test="${count == 0}">
				<div class="mini-card">
					<h4 class="mc-heading" style="margin-bottom: 0rem; text-align: center;">User has no threads posted</h4>
				</div>
			</c:if>
		</c:if>
		<c:if test="${empty threads}">
		</c:if>
	</div>

</main>

<jsp:include page="../footer.jsp"></jsp:include>
