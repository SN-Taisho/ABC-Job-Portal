<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="Profile" name="HTMLtitle" />
</jsp:include>

<c:forEach items="${user}" var="u">
	<c:set var="fullname" value="${u.fullname}"></c:set>
	<c:set var="username" value="${u.username}"></c:set>
	<c:set var="occupation" value="${u.occupation}"></c:set>
	<c:set var="location" value="${u.location}"></c:set>
	<c:set var="bio" value="${u.bio}"></c:set>
</c:forEach>

<main class="single-main">

	<div class="profile">
		<img class="cover-photo" src="images/CoverPhoto.png" width="920" /> 
		<img class="profile-photo" src="images/Profile.png" width="100" />
		
		<div class="profile-details">
				<h5 class="profile-name">${fullname}</h5>
				<p class="profile-occupation">${occupation}</p>
				
				<p>${location}</p>
				<p>${bio}</p>
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
			
			<c:if test="${not empty experience}">
				<c:forEach items="${experience}" var="exp" varStatus="status">
					<div class="mini-card">
						<h6 class="mc-heading">${exp.occupation} at ${exp.company}</h6>
						<p><c:out value="Total Years: ${exp.endYear - exp.startYear}"></c:out></p>
						<p>${exp.startYear}-${exp.endYear}</p>

						<div class="post-management justify-evenly" style="margin-top: 1rem;">
							<button id="openEditExp${status.count}"
								style="background-color: var(--success);">Edit</button>
							<button
								onclick="window.location.href='delete_experience?expId=${exp.id}'"
								style="background-color: var(--danger);">Delete</button>
						</div>
					</div>
					
					<dialog id="editExpModal${status.count}" class="modal">

						<h3 class="modal-heading">
							Edit<br>Reply
						</h3>
						<sf:form class="align-center flex-col form" method="post"
							action="update_experience?expId=${exp.id}" modelAttribute="experience">

						<label class="input-group flex-col">Occupation <input
							type="text" required="true" placeholder="e.g. Software Engineer"
							autocomplete="off" name="occupation" path="occupation" value="${exp.occupation}"/>
						</label>

						<label class="input-group flex-col">Company <input
							type="text" required="true" placeholder="e.g. Google"
							autocomplete="off" name="company" path="company" value="${exp.company}"/>
						</label>

						<label class="input-group flex-col">Start Year <input
							type="text" required="true" placeholder="e.g. 2020"
							autocomplete="off" name="startYear" path="startYear" value="${exp.startYear}"/>
						</label>

						<label class="input-group flex-col">End Year <input
							type="text" required="true" placeholder="e.g. 2021"
							autocomplete="off" name="endYear" path="endYear" value="${exp.endYear}"/>
						</label>

						<button class="submit-button btnAnimation"
								style="background-color: var(- -success);" type="submit">Save</button>
						</sf:form>
						<button id="closeEditExp${status.count}" class="material-icons modal-close">close</button>
						</dialog>

						<script>
						document.querySelector("#openEditExp${status.count}").addEventListener("click", () => {
							document.querySelector("#editExpModal${status.count}").showModal();
							});
						
						document.querySelector("#closeEditExp${status.count}").addEventListener("click", () => {
							document.querySelector("#editExpModal${status.count}").close();
							});
						</script>
				</c:forEach>
			</c:if>
			<c:if test="${empty experience}">
				<div class="mini-card">
					<h6 class="mc-heading text-align-center">Add your work experience here</h6>
				</div>
			</c:if>
			
		</div>

		<div class="info-section">
			<h5 class="is-heading">Education</h5>
			<c:if test="${not empty education}">
				<c:forEach items="${education}" var="edu" varStatus="status">
					<div class="mini-card">
						<h6 class="mc-heading">${edu.course} at ${edu.school}</h6>
						<p>
							<c:out value="Total Years: ${edu.endYear - edu.startYear}"></c:out>
						</p>
						<p>${edu.startYear}-${edu.endYear}</p>

						<div class="post-management justify-evenly"
							style="margin-top: 1rem;">
							<button id="openEditEdu${status.count}"
								style="background-color: var(--success);">Edit</button>
							<button
								onclick="window.location.href='delete_education?eduId=${exp.id}'"
								style="background-color: var(--danger);">Delete</button>
						</div>
					</div>

					<dialog id="editEduModal${status.count}" class="modal">

					<h3 class="modal-heading">
						Edit<br>Education
					</h3>
					<sf:form class="align-center flex-col form" method="post"
						action="update_education?eduId=${edu.id}"
						modelAttribute="education">

						<label class="input-group flex-col">Course <input type="text"
							required="true" placeholder="e.g. BDSE" autocomplete="off"
							name="course" path="course" value="${edu.course}" />
						</label>

						<label class="input-group flex-col">School <input
							type="text" required="true" placeholder="e.g. Lithan Academy"
							autocomplete="off" name="school" path="school" value="${edu.school}" />
						</label>

						<label class="input-group flex-col">Start Year <input
							type="text" required="true" placeholder="e.g. 2020"
							autocomplete="off" name="startYear" path="startYear" value="${edu.startYear}" />
						</label>

						<label class="input-group flex-col">End Year <input
							type="text" required="true" placeholder="e.g. 2021"
							autocomplete="off" name="endYear" path="endYear" value="${edu.endYear}" />
						</label>

						<button class="submit-button btnAnimation"
							style="background-color: var(- -success);" type="submit">Save</button>
					</sf:form>
					<button id="closeEditEdu${status.count}"
						class="material-icons modal-close">close</button>
					</dialog>

					<script>
						document.querySelector("#openEditEdu${status.count}").addEventListener("click", () => {
							document.querySelector("#editEduModal${status.count}").showModal();
							});
						
						document.querySelector("#closeEditEdu${status.count}").addEventListener("click", () => {
							document.querySelector("#editEduModal${status.count}").close();
							});
						</script>
				</c:forEach>
			</c:if>
			<c:if test="${empty education}">
				<div class="mini-card">
					<h6 class="mc-heading text-align-center">Please add your education here</h6>
				</div>
			</c:if>
		</div>
	</div>

	<hr class="divider">

	<div class="posts-container">

		<c:if test="${not empty threads}">
		<c:set var="count" value="0" scope="page" />
		<c:forEach items="${threads}" var="t">
			
			<c:if test="${t.getUser().getUsername() eq username}">
				<c:set var="count" scope="page" value="${count + 1}" />
				<div class="post-card">
					<a class="post-op" href="view-profile?username=${t.getUser().getUsername()}"> <img class="post-profile-img"
						src="images/Profile.png" width="50" />
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
					<h4 class="mc-heading" style="margin-bottom: 0rem; text-align: center;">User has no threads posted</h4>
				</div>
			</c:if>
		</c:if>
		<c:if test="${empty threads}">
		</c:if>
	</div>
</main>

<dialog id="editProfileModal" class="modal">

	<h3 class="modal-heading">Edit Profile</h3>
	<span id="error-text" class="form-error"></span>
	
	<sf:form id="editProfileForm" class="align-center flex-col form" method="post" action="update_profile" modelAttribute="user"
		onsubmit="validatedEditProfile(event)">
		
		<label class="input-group flex-col">Fullname* <input id="fullname" type="text"
			required="true" placeholder="This field cannot be left blank" autocomplete="off" onkeyup="validateFullname()"
			name="fullname" path="fullname" value="${fullname}"/>
		</label> 
		
		<label class="input-group flex-col">Occupation <input id="" type="text"
			placeholder="Leave blank if unemployed" autocomplete="off"
			name="occupation" path="occupation" value="${occupation}" />
		</label>
		
		<label class="input-group flex-col">Location <input id="" type="text"
			placeholder="City/State, Country" autocomplete="off"
			name="location" path="location" value="${location}" />
		</label> 
			
			
		<label class="input-group flex-col">Bio <textarea class="textarea"
			placeholder="Tell everyone about yourself" rows="3" name="bio"
			path="bio">${bio}</textarea>
		</label>

	<button class="submit-button btnAnimation"
			style="background-color: var(--success);" type="submit">Save</button>
	</sf:form>
	<button id="closeEditProfile" class="material-icons modal-close">close</button>
</dialog>

<dialog id="addExpModal" class="modal">

	<h3 class="modal-heading" style="margin-bottom: 0.5rem;">Add<br>Experience</h3>
	
	<sf:form id="editProfileForm" class="align-center flex-col form"
		method="post" action="add_experience" modelAttribute="experience">
		
		<label class="input-group flex-col">Occupation <input type="text"
			required="true" placeholder="e.g. Software Engineer" autocomplete="off"
			name="occupation" path="occupation"/>
		</label> 
		
		<label class="input-group flex-col">Company <input type="text"
			required="true" placeholder="e.g. Google" autocomplete="off"
			name="company" path="company"/>
		</label>
		
		<label class="input-group flex-col">Start Year <input type="text"
			required="true" placeholder="e.g. 2020" autocomplete="off"
			name="startYear" path="startYear"/>
		</label> 
		
		<label class="input-group flex-col">End Year <input type="text"
			required="true" placeholder="e.g. 2021" autocomplete="off"
			name="endYear" path="endYear"/>
		</label> 

	<button class="submit-button btnAnimation"
			style="background-color: var(--success);" type="submit">Save</button>
	</sf:form>
	<button id="closeAddExp" class="material-icons modal-close">close</button>
</dialog>


<dialog id="addEduModal" class="modal">

	<h3 class="modal-heading" style="margin-bottom: 0.5rem;">Add<br>Education</h3>
	
	<sf:form id="editProfileForm" class="align-center flex-col form"
		method="post" action="add_education" modelAttribute="education">
		
		<label class="input-group flex-col">Course <input type="text"
			required="true" placeholder="e.g. BDSE" autocomplete="off"
			name="course" path="course"/>
		</label>
		
		<label class="input-group flex-col">School <input type="text"
			required="true" placeholder="e.g. Lithan Academy" autocomplete="off"
			name="school" path="school"/>
		</label>
		
		<label class="input-group flex-col">Start Year <input type="text"
			required="true" placeholder="e.g. 2020" autocomplete="off"
			name="startYear" path="startYear"/>
		</label> 
		
		<label class="input-group flex-col">End Year <input type="text"
			required="true" placeholder="e.g. 2021" autocomplete="off"
			name="endYear" path="endYear"/>
		</label> 

	<button class="submit-button btnAnimation"
			style="background-color: var(--success);" type="submit">Save</button>
	</sf:form>
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
