<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="posts-container">

	<a class="create-post-btn" href="/create-thread">Create Thread</a>
	
	<c:if test="${not empty threads}">
		<c:forEach items="${threads}" var="t">
		
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
			
		</c:forEach>
	</c:if>
	<c:if test="${empty threads}">
		
	</c:if>
	
</div>