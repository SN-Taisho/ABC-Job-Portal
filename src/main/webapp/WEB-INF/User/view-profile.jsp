<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Portal NavBar -->
<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="Profile" name="HTMLtitle" />
</jsp:include>

<main class="single-main">

	<div class="profile">
		<img class="cover-photo" src="images/CoverPhoto.png" width="920" /> 
		<img class="profile-photo" src="images/Profile.png" width="100" />

		<div class="profile-details">
			<h5 class="profile-name">Anzel Ken Sakamoto</h5>
			<p class="profile-occupation">Current Occupation</p>
			
			<p>Ichikawa, Chiba Japan</p>
			<p>Bio sample paragraph, Software engineering student at Lithan Academy Singapore</p>
		</div>
	</div>

	<div class="info-container">
		<div class="info-section">
			<h5 class="is-heading">Experience</h5>
			<div class="mini-card">
				<h6 class="mc-heading">Software Engineer at IBM</h6>
				<p>4 Years</p>
				<p>2019-2023</p>
			</div>
			
			<div class="mini-card">
				<h6 class="mc-heading">Software Engineer at IBM</h6>
				<p>4 Years</p>
				<p>2019-2023</p>

			</div>
		</div>

		<div class="info-section">
			<h5 class="is-heading">Education</h5>
			<div class="mini-card">
				<h6 class="mc-heading">Software Engineering Student at Lithan
					Academy</h6>
				<p>4 Years</p>
				<p>2022-2026</p>
			</div>
		</div>
	</div>

	<hr class="divider">

	<div class="posts-container">

		<div class="post-card">
			<a class="post-op" href="profile"> <img class="post-profile-img"
				src="images/Profile.png" width="50" />
				<p>Sample Username</p>
			</a> <span class="post-date">Aug 08, 2023</span> <img class="post-img"
				src="https://placehold.co/600x400" width="600" />

			<h5 class="post-heading">Post Heading</h5>

			<p class="post-paragraph">Post paragraph</p>

			<hr class="divider">

			<div class="post-btn-container">
				<a class="thread-link" href="/thread/1">View Thread</a>
			</div>

		</div>

		<div class="post-card">
			<a class="post-op" href="profile"> <img class="post-profile-img"
				src="images/Profile.png" width="50" />
				<p>Sample Username</p>
			</a> <span class="post-date">Aug 08, 2023</span> <img class="post-img"
				src="https://placehold.co/600x400" width="600" />

			<h5 class="post-heading">Post Heading</h5>

			<p class="post-paragraph">Post paragraph</p>

			<hr class="divider">

			<div class="post-btn-container">
				<a class="thread-link" href="/thread/1">View Thread</a>
			</div>

		</div>
	</div>

</main>

<jsp:include page="../footer.jsp"></jsp:include>
