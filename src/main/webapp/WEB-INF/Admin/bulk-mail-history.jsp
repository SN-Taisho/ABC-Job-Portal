<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="Bulk Mail History" name="HTMLtitle" />
</jsp:include>

<main class="single-main">
	
	<a class="create-post-btn" href="/send-bulk-mail">Send Bulk Mail</a>
		
	<div class="admin-table-container">
		<table class="admin-table">
			<thead>
				<tr>
					<th>No.</th>
					<th>Subject</th>
					<th>Sender</th>
					<th>Date Sent</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${bulkMail}" var="b" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${b.subject}</td>
					<td>${b.getUser().getFullname()}</td>
					<td>${b.date}</td>
					<td><button class="material-icons crud-actions view" onclick="window.location.href='/view-mail?bmId=${b.id}'">visibility</button></td>
				</tr>
			</c:forEach>
				<tr>
			</tbody>
		</table>
	</div>

</main>

<jsp:include page="../footer.jsp"></jsp:include>
