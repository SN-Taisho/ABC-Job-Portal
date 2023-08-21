<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="Search" name="HTMLtitle" />
</jsp:include>

<main class="single-main">
	
	<jsp:include page="../search-nav.jsp"></jsp:include>
	
	<sf:form class="search-bar" action="thread-results" method="get">
		<button class="search-btn material-icons" type="submit">search</button>
		<input class="search-input" placeholder="Search" name="keyword" value="${keyword}"/>
	</sf:form>
	
	<c:if test="${empty searchThread}">
		<div class="mini-card">
			<h4 class="mc-heading"
				style="margin-bottom: 0rem; text-align: center;">No threads</h4>
		</div>
	</c:if>

	<c:if test="${not empty searchThread}">
		<c:set var="count" value="0" scope="page" />
		<c:forEach items="${searchThread}" var="t">
			
			<c:if test="${t.getUser().getUsername() ne currentUser}">
				<c:set var="count" scope="page" value="${count + 1}" />
				<div class="post-card">
					<a class="post-op"
						href="view-profile/?username=${t.getUser().getUsername()}"> <img
						class="post-profile-img" src="images/Profile.png" width="50" />
						<p>${t.getUser().getFullname()}</p>
					</a> <span class="post-date">${t.date}</span>

					<h5 class="post-heading">${t.title}</h5>

					<p class="post-paragraph">${t.content}</p>

					<hr class="divider">

					<div class="post-btn-container">
						<a class="thread-link" href="/thread?tId=${t.id}">View Thread</a>
					</div>
				</div>
			</c:if>

		</c:forEach>
		
		<c:if test="${count == 0}">
			<div class="mini-card">
				<h4 class="mc-heading"
					style="margin-bottom: 0rem; text-align: center;">No Threads</h4>
			</div>
		</c:if>
	</c:if>




</main>

<jsp:include page="../footer.jsp"></jsp:include>
