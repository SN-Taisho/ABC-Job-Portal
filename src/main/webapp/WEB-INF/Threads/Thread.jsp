<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Portal NavBar -->
<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="Thread" name="HTMLtitle" />
</jsp:include>

<main class="single-main">

	<div class="post-card">
		
		<a class="post-op" href="profile">
			<img class="post-profile-img" src="images/Profile.png" width="50"/>
			<p>Sample Username</p>
		</a>
		<span class="post-date">Aug 08, 2023</span> 
		<img class="post-img"
			src="https://placehold.co/600x400" width="600" />

		<h5 class="post-heading">Post Heading</h5>

		<p class="post-paragraph">Post paragraph</p>

	</div>
	
	<div class="replies-container">
		<div class="reply-card">
			<a class="reply-user" href="profile"> 
			<img src="images/Profile.png" width="50" />
				<p>Sample Username</p>
			</a>
			<span class="reply-date">Aug 08, 2023</span>
			<p class="reply-paragraph">Sample Reply Paragraph</p>
		</div>
		
		<div class="reply-card">
			<a class="reply-user" href="profile"> 
			<img src="images/Profile.png" width="50" />
				<p>Sample Username</p>
			</a>
			<span class="reply-date">Aug 08, 2023</span>
			<p class="reply-paragraph">Sample Reply Paragraph</p>
		</div>
	</div>

</main>

<jsp:include page="../footer.jsp"></jsp:include>
