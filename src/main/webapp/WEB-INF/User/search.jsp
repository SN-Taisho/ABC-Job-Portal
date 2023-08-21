<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="Search" name="HTMLtitle" />
</jsp:include>

<main class="single-main">

	<jsp:include page="../search-nav.jsp"></jsp:include>

	<sf:form class="search-bar" action="user-results" method="get">
		<button class="search-btn user material-icons" type="submit">search</button>
		<input class="search-input user" placeholder="Search" name="keyword"/>
	</sf:form>
	

</main>

<jsp:include page="../footer.jsp"></jsp:include>
