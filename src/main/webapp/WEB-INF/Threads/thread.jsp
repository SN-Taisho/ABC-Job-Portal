<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="Thread" name="HTMLtitle" />
</jsp:include>

<c:forEach items="${thread}" var="t">
	<c:set var="threadId" value="${t.id}"></c:set>
	<c:set var="tOpUsername" value="${t.getUser().getUsername()}"></c:set>
	<c:set var="threadOp" value="${t.getUser().getFullname()}"></c:set>
	<c:set var="threadDate" value="${t.date}"></c:set>
	<c:set var="threadTitle" value="${t.title}"></c:set>
	<c:set var="threadContent" value="${t.content}"></c:set>
</c:forEach>

<main class="single-main">

	<div class="post-card">
		
		<a class="post-op" href="profile?username=${tOpUsername}">
			<img class="post-profile-img" src="images/Profile.png" width="50"/>
			<p>${threadOp}</p>
		</a>
		<span class="post-date">${threadDate}</span> 
		
		<h5 class="post-heading">${threadTitle}</h5>
		
		<p class="post-paragraph">${threadContent}</p>

	</div>
	
	<c:if test="${not empty replies}">
		
		<button id="openCreateReply" class="reply-button btnAnimation">Reply to thread</button>
		
		<div class="replies-container">

			<c:forEach items="${replies}" var="replies">
				<div class="reply-card">
					<a class="reply-user" href="profile?username=${replies.getUser().getUsername()}"> <img
						src="images/Profile.png" width="50" />
						<p>${replies.getUser().getFullname()}</p>
					</a> <span class="reply-date">${replies.date}</span>
					<p class="reply-paragraph">${replies.content}</p>
				</div>
			</c:forEach>

		</div>
	</c:if>
	
	<c:if test="${empty replies}">
		<div class="replies-container">
			<button id="openCreateReply" class="reply-button btnAnimation">Be the first to reply</button>
			
				<div class="reply-card">
					<h5 class="post-heading text-align-center" style="margin-bottom: 0rem;">There are no replies as of the moment</h5>
				</div>
				
		</div>
	</c:if>

	<dialog id="createReplyModal" class="modal">

	<h3 class="modal-heading">Reply to<br>Thread</h3>
	<span id="error-text" class="form-error"></span> <sf:form
		class="align-center flex-col form" method="post"
		action="reply_thread" modelAttribute="threadReply">
	
		<input type="hidden" name="threadId" path="threadId" value="${threadId}"/>
		
		<label class="input-group flex-col">Enter your reply here <textarea
				class="textarea" placeholder="Tell everyone about yourself" rows="5"
				name="content" path="content"></textarea>
		</label>

		<button class="submit-button btnAnimation"
			style="background-color: var(- -success);" type="submit">Save</button>
	</sf:form>
	<button id="closeCreateReply" class="material-icons modal-close">close</button>
	</dialog>

</main>

<script>
const createReplyM = document.querySelector("#createReplyModal");
const openCreateReply = document.querySelector("#openCreateReply");
const closeCreateReply = document.querySelector("#closeCreateReply");

openCreateReply.addEventListener("click", () => {
	createReplyM.showModal();
	});

closeCreateReply.addEventListener("click", () => {
		createReplyM.close();
	});
</script>

<jsp:include page="../footer.jsp"></jsp:include>
