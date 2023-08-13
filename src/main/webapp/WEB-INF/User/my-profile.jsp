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
			<a class="action-btn" href="/create-thread">Create a thread</a>
			<button id="openAddExp" class="action-btn">Add Experience</button>
			<button id="openAddEdu" class="action-btn">Add Education</button>
			<button id="openEditProfile" class="action-btn" style="background-color: var(--tertiary)">Edit Profile</button>
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

	<h3 class="modal-heading">Edit Profile</h3>
	<span class="form-error">error</span>
	
	<form id="editProfileForm" class="align-center flex-col form"
		onsubmit="validateEditProfile(event)">
		
		<label class="input-group flex-col">Fullname* <input id="fullname" type="text"
			required="true" placeholder="This field cannot be left blank" autocomplete="off" onkeyup="validateFullname()"
			name="fullname" path="fullname"  />
		</label> 
		
		<label class="input-group flex-col">Occupation <input id="" type="text"
			placeholder="Leave blank if unemployed" autocomplete="off"
			name="occupation" path="occupation"  />
		</label>
		
		<label class="input-group flex-col">Location <input id="" type="text"
			placeholder="City/State, Country" autocomplete="off"
			name="location" path="location"  />
		</label> 
			
			
		<label class="input-group flex-col">Bio <textarea class="textarea"
			placeholder="Tell everyone about yourself" rows="3" name="bio"
			path="bio"></textarea>
		</label>

	<button class="submit-button btnAnimation"
			style="background-color: var(--success);" type="submit">Save</button>
	</form>
	<button id="closeEditProfile" class="material-icons modal-close">close</button>
</dialog>

<dialog id="addExpModal" class="modal">

	<h3 class="modal-heading" style="margin-bottom: 0.5rem;">Add<br>Experience</h3>
	
	<form id="editProfileForm" class="align-center flex-col form"
		onsubmit="validateEditProfile(event)">
		
		<label class="input-group flex-col">Occupation <input type="text"
			required="true" placeholder="e.g. Software Engineer" autocomplete="off"
			name="" path=""/>
		</label> 
		
		<label class="input-group flex-col">Company <input type="text"
			required="true" placeholder="e.g. Google" autocomplete="off"
			name="" path=""/>
		</label>
		
		<label class="input-group flex-col">Start Year <input type="text"
			required="true" placeholder="e.g. 2020" autocomplete="off"
			name="" path=""/>
		</label> 
		
		<label class="input-group flex-col">End Year <input type="text"
			required="true" placeholder="e.g. 2021" autocomplete="off"
			name="" path=""/>
		</label> 

	<button class="submit-button btnAnimation"
			style="background-color: var(--success);" type="submit">Save</button>
	</form>
	<button id="closeAddExp" class="material-icons modal-close">close</button>
</dialog>


<dialog id="addEduModal" class="modal">

	<h3 class="modal-heading" style="margin-bottom: 0.5rem;">Add<br>Education</h3>
	
	<form id="editProfileForm" class="align-center flex-col form"
		onsubmit="validateEditProfile(event)">
		
		<label class="input-group flex-col">Course <input type="text"
			required="true" placeholder="e.g. BDSE" autocomplete="off"
			name="" path=""/>
		</label>
		
		<label class="input-group flex-col">School <input type="text"
			required="true" placeholder="e.g. Lithan Academy" autocomplete="off"
			name="" path=""/>
		</label>
		
		<label class="input-group flex-col">Start Year <input type="text"
			required="true" placeholder="e.g. 2020" autocomplete="off"
			name="" path=""/>
		</label> 
		
		<label class="input-group flex-col">End Year <input type="text"
			required="true" placeholder="e.g. 2021" autocomplete="off"
			name="" path=""/>
		</label> 

	<button class="submit-button btnAnimation"
			style="background-color: var(--success);" type="submit">Save</button>
	</form>
	<button id="closeAddEdu" class="material-icons modal-close">close</button>
</dialog>

<script>
const editProfileM = document.querySelector("#editProfileModal");
const openEditProfile = document.querySelector("#openEditProfile");
const closeEditProfile = document.querySelector("#closeEditProfile");

openEditProfile.addEventListener("click", () => {
	editProfileM.showModal();
	});

closeEditProfile.addEventListener("click", () => {
		editProfileM.close();
	});
</script>

<script>
const addExpM = document.querySelector("#addExpModal");
const openAddExp = document.querySelector("#openAddExp");
const closeAddExp = document.querySelector("#closeAddExp");

openAddExp.addEventListener("click", () => {
	addExpM.showModal();
	});

closeAddExp.addEventListener("click", () => {
		addExpM.close();
	});
</script>

<script>
const addEduM = document.querySelector("#addEduModal");
const openAddEdu = document.querySelector("#openAddEdu");
const closeAddEdu = document.querySelector("#closeAddEdu");

openAddEdu.addEventListener("click", () => {
	addEduM.showModal();
	});

closeAddEdu.addEventListener("click", () => {
		addEduM.close();
	});
</script>

<script type="text/javascript" src="js/form-validation.js"></script>

<jsp:include page="../footer.jsp"></jsp:include>
