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
		
		<c:if test="${tOpUsername eq currentUser}">
			<div class="post-management">
				<button id="openEditThread" style="background-color: var(--success);">Edit</button>
				<button onclick="window.location.href='delete_thread?tId=${threadId}'" style="background-color: var(--danger);">Delete</button>
			</div>
		</c:if>
	</div>
	
	<c:if test="${not empty replies}">
		
		<button id="openCreateReply" class="reply-button btnAnimation">Reply to thread</button>
		
		<div class="replies-container">

			<c:forEach items="${replies}" var="replies" varStatus="status">
			
				<div class="reply-card">
					<a class="reply-user" href="profile?username=${replies.getUser().getUsername()}"> <img
						src="images/Profile.png" width="50" />
						<p>${replies.getUser().getFullname()}</p>
					</a> <span class="reply-date">${replies.date}</span>
					<p class="reply-paragraph">${replies.content}</p>

					<c:if test="${replies.getUser().getUsername() eq currentUser}">
						<div class="post-management">
							<button id="openEditReply${status.count}"
								style="background-color: var(--success);">Edit</button>
							<button
								onclick="window.location.href='delete_reply?trId=${replies.id}'"
								style="background-color: var(--danger);">Delete</button>
						</div>
						
						<dialog id="editReplyModal${status.count}" class="modal">

						<h3 class="modal-heading">
							Edit<br>Reply
						</h3>
						<span id="error-text" class="form-error"></span> <sf:form
							class="align-center flex-col form" method="post"
							action="update_reply?trId=${replies.id}" modelAttribute="threadReply">

							<input type="hidden" name="threadId" path="threadId"
								value="${threadId}" />

							<label class="input-group flex-col">Enter your reply here
								<textarea class="textarea"
									placeholder="Write down your thoughts" rows="5" name="content"
									path="content">${replies.content}</textarea>
							</label>

							<button class="submit-button btnAnimation"
								style="background-color: var(- -success);" type="submit">Save</button>
						</sf:form>
						<button id="closeEditReply${status.count}" class="material-icons modal-close">close</button>
						</dialog>

						<script>
						document.querySelector("#openEditReply${status.count}").addEventListener("click", () => {
							document.querySelector("#editReplyModal${status.count}").showModal();
							});
						
						document.querySelector("#closeEditReply${status.count}").addEventListener("click", () => {
							document.querySelector("#editReplyModal${status.count}").close();
							});
						</script>
					</c:if>
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
				class="textarea" placeholder="Write down your thoughts" rows="5"
				name="content" path="content"></textarea>
		</label>

		<button class="submit-button btnAnimation"
			style="background-color: var(- -success);" type="submit">Save</button>
	</sf:form>
	<button id="closeCreateReply" class="material-icons modal-close">close</button>
	</dialog>
	
	<dialog id="editThreadModal" class="modal">

	<h3 class="modal-heading">Edit<br>Thread</h3>
	<sf:form class="align-center flex-col form" method="post"
		action="update_thread?tId=${threadId}" modelAttribute="thread">
		
		<label class="input-group flex-col">Title <textarea
				class="textarea" placeholder="Insert interesting title" rows="2"
				name="title" path="title">${threadTitle}</textarea>
		</label>
		
		<label class="input-group flex-col">Content <textarea
				class="textarea" placeholder="Main thread content here" rows="5"
				name="content" path="content">${threadContent}</textarea>
		</label>

		<button class="submit-button btnAnimation"
			style="background-color: var(- -success);" type="submit">Save</button>
	</sf:form>
	<button id="closeEditThread" class="material-icons modal-close">close</button>
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

<script>
const editThreadM = document.querySelector("#editThreadModal");
const openEditThread = document.querySelector("#openEditThread");
const closeEditThread = document.querySelector("#closeEditThread");

openEditThread.addEventListener("click", () => {
	editThreadM.showModal();
	});

closeEditThread.addEventListener("click", () => {
		editThreadM.close();
	});
</script>

<jsp:include page="../footer.jsp"></jsp:include>
