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
		
		<div class="profile-actions">
			<a class="action-btn" href="/edit-profile">Create Post</a>
			<a class="action-btn" href="/edit-profile">Add Education</a>
			<a class="action-btn" href="/edit-profile">Add Experience</a>
			<button id="openEditProfile" class="action-btn" href="/edit-profile" style="background-color: var(--tertiary)">Edit Profile</button>
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

<dialog id="editProfileModal" class="modal">

	<div class="align-center error-popup">
		<span class="material-icons" style="color: var(--danger);">error</span>
		<p id="error-text" class="pFont error-text"></p>
		<button class="btnAnimation icon material-icons"
			onclick="closeFormError()">close</button>
	</div>

	<h3 class="modal-heading">Edit Profile</h3>
	<form id="editProfileForm" class="align-center flex-col form"
		onsubmit="validateEditProfile(event)">
		
		<label class="input-group flex-col">Fullname <input id="fullname" type="text"
			required="true" placeholder="e.g. John Doe" autocomplete="off" onkeyup="validateFullname()"
			name="fullname" path="fullname"  style="background-color: var(--bgLight);"/>
			</label> 
		
		<label class="input-group flex-col">Occupation <input id="" type="text"
			required="true" placeholder="e.g. Software Engineer" autocomplete="off" onkeyup="validateFullname()"
			name="occupation" path="occupation"  style="background-color: var(--bgLight);"/>
			</label>
		
		<label class="input-group flex-col">Location <input id="" type="text"
			required="true" placeholder="e.g. JohnDoe01" autocomplete="off" onkeyup="validateFullname()"
			name="location" path="location"  style="background-color: var(--bgLight);"/>
			</label>
		
		<label class="input-group flex-col">Bio <input id="" type="text"
			required="true" placeholder="e.g. JohnDoe01" autocomplete="off" onkeyup="validateFullname()"
			name="bio" path="bio"  style="background-color: var(--bgLight);"/>
			</label>

		<button class="submit-btn btnAnimation"
			style="background-color: var(--success);" type="submit">Save</button>
	</form>
	<button id="closeEditProfile" class="material-icons modal-close">close</button>
	</dialog>
<script>
const modal = document.querySelector("#editProfileModal");
const openModal = document.querySelector("#openEditProfile");
const closeModal = document.querySelector("#closeEditProfile");

openModal.addEventListener("click", () => {
	  modal.showModal();
	});

	closeModal.addEventListener("click", () => {
	  modal.close();
	});
</script>

<jsp:include page="../footer.jsp"></jsp:include>
