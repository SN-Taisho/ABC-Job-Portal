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
				<tr>
					<td>X</td>
					<td>sanmpleuser</td>
					<td>Sample Fullname</td>
					<td>sample@email.com</td>
					<td>User</td>
					<td class="action-td">
						<button class="material-icons crud-actions view">visibility</button>
						<button id="openEditUser1"
							class="material-icons crud-actions edit">edit</button>
						<button class="material-icons crud-actions delete">delete</button>
					</td>

					<dialog id="editUserModal1" class="modal">

					<h3 class="modal-heading">Edit Profile1</h3>
					<span id="error-text" class="form-error"></span>
					<form id="editUserForm1" class="align-center flex-col form">

						<label class="input-group flex-col">Fullname* <input
							id="fullname" type="text" required="true"
							placeholder="This field cannot be left blank" autocomplete="off"
							name="" path="" value="" />
						</label> <label class="input-group flex-col">Occupation <input
							id="" type="text" placeholder="Leave blank if unemployed"
							autocomplete="off" name="" path="" value="" />
						</label> <label class="input-group flex-col">Location <input id=""
							type="text" placeholder="City/State, Country" autocomplete="off"
							name="" path="" value="" />
						</label> <label class="input-group flex-col">Bio <textarea
								class="textarea" placeholder="Tell everyone about yourself"
								rows="3" name="" path=""></textarea>
						</label>

						<button class="submit-button btnAnimation"
							style="background-color: var(--success); margin: 1rem auto;" type="submit">Save</button>
					</form>
					<button id="closeEditUser1" class="material-icons modal-close">close</button>
					</dialog>
					<script>
					const editProfileM1 = document.querySelector("#editUserModal1");
					const openEditProfile1 = document.querySelector("#openEditUser1");
					const closeEditProfile1 = document.querySelector("#closeEditUser1");
					
					openEditProfile1.addEventListener("click", () => {
						editProfileM1.showModal();
						});
					
					closeEditProfile1.addEventListener("click", () => {
							editProfileM1.close();
						});
					</script>

				</tr>
				<tr>
					<td>X</td>
					<td>sanmpleuser</td>
					<td>Sample Fullname</td>
					<td>sample@email.com</td>
					<td>
						<form class="role-form">
							<input value="User"/>
							<button class="material-icons crud-actions auth">edit</button>
						</form>
					</td>
					<td class="action-td">
						<button class="material-icons crud-actions view">visibility</button>
						<button id="openEditUser2"
							class="material-icons crud-actions edit">edit</button>
						<button class="material-icons crud-actions delete">delete</button>
					</td>

					<dialog id="editUserModal2" class="modal">

					<h3 class="modal-heading">Edit Profile2</h3>
					<span id="error-text" class="form-error"></span>
					<form id="editUserForm2" class="align-center flex-col form">

						<label class="input-group flex-col">Fullname* <input
							id="fullname" type="text" required="true"
							placeholder="This field cannot be left blank" autocomplete="off"
							name="" path="" value="" />
						</label> <label class="input-group flex-col">Occupation <input
							id="" type="text" placeholder="Leave blank if unemployed"
							autocomplete="off" name="" path="" value="" />
						</label> <label class="input-group flex-col">Location <input id=""
							type="text" placeholder="City/State, Country" autocomplete="off"
							name="" path="" value="" />
						</label> <label class="input-group flex-col">Bio <textarea
								class="textarea" placeholder="Tell everyone about yourself"
								rows="3" name="" path=""></textarea>
						</label>

						<button class="submit-button btnAnimation"
							style="background-color: var(--success); margin: 1rem auto;" type="submit">Save</button>
					</form>
					<button id="closeEditUser2" class="material-icons modal-close">close</button>
					</dialog>
					<script>
					const editProfileM2 = document.querySelector("#editUserModal2");
					const openEditProfile2 = document.querySelector("#openEditUser2");
					const closeEditProfile2 = document.querySelector("#closeEditUser2");
					
					openEditProfile2.addEventListener("click", () => {
						editProfileM2.showModal();
						});
					
					closeEditProfile2	.addEventListener("click", () => {
							editProfileM2.close();
						});
					</script>

				</tr>
			</tbody>
		</table>
	</div>

</main>

<jsp:include page="../footer.jsp"></jsp:include>
