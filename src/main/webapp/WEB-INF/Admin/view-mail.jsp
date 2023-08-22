<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="Thread" name="HTMLtitle" />
</jsp:include>

<c:forEach items="${bulkMail}" var="b">
	<c:set var="mailId" value="${b.id}"></c:set>
	<c:set var="mailSenderUsername" value="${b.getUser().getUsername()}"></c:set>
	<c:set var="mailSenderName" value="${b.getUser().getFullname()}"></c:set>
	<c:set var="mailDate" value="${b.date}"></c:set>
	<c:set var="mailSubject" value="${b.subject}"></c:set>
	<c:set var="mailContent" value="${b.content}"></c:set>
</c:forEach>

<main class="single-main">

	<div class="post-card">
		
		<a class="post-op" href="profile?username=${mailSenderUsername}">
			<img class="post-profile-img" src="images/Profile.png" width="50"/>
			<p>${mailSenderName}</p>
		</a>
		<span class="post-date">${mailDate}</span> 
		
		<h5 class="post-heading">${mailSubject}</h5>
		
		<p class="post-paragraph">${mailContent}</p>

		<div class="post-management">
			<button
				onclick="window.location.href='bulk-mail'"
				style="background-color: var(--danger);">Return</button>
		</div>
	</div>

</main>

<jsp:include page="../footer.jsp"></jsp:include>
