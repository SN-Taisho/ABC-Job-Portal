<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Portal NavBar -->
<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="Homepage" name="HTMLtitle" />
</jsp:include>

<main class="default-main">

	<jsp:include page="side-profile.jsp"></jsp:include>

	<jsp:include page="all-threads.jsp"></jsp:include>

</main>

<jsp:include page="../footer.jsp"></jsp:include>

