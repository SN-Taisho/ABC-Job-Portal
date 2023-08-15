<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="Search" name="HTMLtitle" />
</jsp:include>

<main class="single-main">
	
	<sf:form class="search-bar" action="search-results" method="get">
		<button class="search-btn material-icons" type="submit">search</button>
		<input class="search-input" placeholder="Search" name="keyword"/>
	</sf:form>
	
	<c:if test="${empty searchUser}">
		<div class="mini-card">
			<h4 class="mc-heading"
				style="margin-bottom: 0rem; text-align: center;">No users found</h4>
		</div>
	</c:if>

	<c:if test="${not empty searchUser}">
		<c:set var="count" value="0" scope="page" />
		<c:forEach items="${searchUser}" var="u">
			
			<c:if test="${u.username ne currentUser}">
				<c:set var="count" scope="page" value="${count + 1}" />
				<div class="mini-card">
					<a class="post-op" href="/view-profile/${u.username}"
						style="margin: auto 0rem;"> <img class="post-profile-img"
						src="images/Profile.png" width="50" />
						<div>
							<h4 class="mc-heading" style="margin-bottom: 0.25rem;">${u.fullname}</h4>
							<p class="mc-paragraph">${u.occupation}</p>
							<p class="mc-paragraph">${u.location}</p>
						</div>
					</a>
				</div>
			</c:if>

		</c:forEach>
		
		<c:if test="${count == 0}">
			<div class="mini-card">
				<h4 class="mc-heading"
					style="margin-bottom: 0rem; text-align: center;">No users
					found</h4>
			</div>
		</c:if>
	</c:if>




</main>

<jsp:include page="../footer.jsp"></jsp:include>
