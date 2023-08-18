<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="User Management" name="HTMLtitle" />
</jsp:include>

<main class="single-main">

	<div class="admin-table-container">
		<table class="admin-table">
			<thead>
				<tr>
					<th>No.</th>
					<th>Username</th>
					<th>Fullname</th>
					<th>Email Address</th>
					<th>Role</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${users}" var="u" varStatus="status">
				
					<td>${status.count}</td>
					<td>${u.username}</td>
					<td>${u.fullname}</td>
					<td>${u.email}</td>
					<td>
						<sf:form class="role-form" action="/reassign_user?uid=${u.id}" method="post" modelAttribute="user">
							<c:forEach items="${u.roles}" var="r">
								<input value="${r.name}" name="name" path="name"/>
							</c:forEach>
							<button class="material-icons crud-actions auth" type="submit">edit</button>
						</sf:form>
					</td>
					<td class="action-td">
						<button class="material-icons crud-actions view" onclick="window.location.href='/view-profile?username=${u.username}'">visibility</button>
						<button id="openEditUser${status.count}"
							class="material-icons crud-actions edit">edit</button>
						<button class="material-icons crud-actions delete" onclick="window.location.href='delete_user?uid=${u.id}'">delete</button>
					</td>

					<dialog id="editUserModal${status.count}" class="modal">

					<h3 class="modal-heading">Edit Profile${status.count}</h3>
					<span id="error-text" class="form-error"></span>
					<sf:form id="editUserForm${status.count}" class="align-center flex-col form"
						method="post" action="update_user_profile" modelAttribute="user">

						<label class="input-group flex-col">Fullname* <input
							id="fullname" type="text" required="true"
							placeholder="This field cannot be left blank" autocomplete="off"
							name="fullname" path="fullname" value="${u.fullname}" />
						</label> <label class="input-group flex-col">Occupation <input
							id="" type="text" placeholder="Leave blank if unemployed"
							autocomplete="off" name="occupation" path="occupation" value="${u.occupation}" />
						</label> <label class="input-group flex-col">Location <input id=""
							type="text" placeholder="City/State, Country" autocomplete="off"
							name="location" path="location" value="${u.location}" />
						</label> <label class="input-group flex-col">Bio <textarea
								class="textarea" placeholder="Tell everyone about yourself"
								rows="3" name="bio" path="bio">${u.bio}</textarea>
						</label>

						<button class="submit-button btnAnimation"
							style="background-color: var(--success); margin: 1rem auto;" type="submit">Save</button>
					</sf:form>
					<button id="closeEditUser${status.count}" class="material-icons modal-close">close</button>
					</dialog>
					<script>
					const editProfileM${status.count} = document.querySelector("#editUserModal${status.count}");
					const openEditProfile${status.count} = document.querySelector("#openEditUser${status.count}");
					const closeEditProfile${status.count} = document.querySelector("#closeEditUser${status.count}");
					
					openEditProfile${status.count}.addEventListener("click", () => {
						editProfileM${status.count}.showModal();
						});
					
					closeEditProfile${status.count}	.addEventListener("click", () => {
							editProfileM${status.count}.close();
						});
					</script>
				</tr>
				
			</c:forEach>
				<tr>
			</tbody>
		</table>
	</div>

</main>

<jsp:include page="../footer.jsp"></jsp:include>
