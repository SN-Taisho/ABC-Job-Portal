<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>ABC Jobs | <%=request.getParameter("HTMLtitle") != null ? request.getParameter("HTMLtitle") : "ABC Jobs"%></title>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/postlogin.css">
<link rel="stylesheet" href="css/admin.css">;

<link rel="icon" href="images/Logo.png" type="image/icon type">

</head>

<body>

	<header id="navbar" class="align-center justify-between alt"
		style="background-color: var(--bgLight);">

		<a id="navbarLeft" class="align-center text-deco-none"
			href="/homepage"> <img src="images/Logo.png"
			alt="ABC Job Portal Logo" width="100">
			<h1 class="hFont">ABC Jobs</h1>
		</a>

		<div class="align-center justify-evenly">
			<ul id="portalNav" class="align-center list-style-none hFont">
				<li><a href="/jobs" class="btnAnimation"><span
						class="material-icons nav-icons">work</span>Jobs</a></li>
				<li><a href="/homepage" class="btnAnimation"><span
						class="material-icons nav-icons">home</span>Home</a></li>
			</ul>

			<button class="nav-menu-open material-icons btnAnimation"
				onclick="toggleNavMenu()" style="margin-left: 10px;">menu</button>
		</div>

	</header>

	<nav class="nav-menu alt">
		<ul class="nav-menu-links">
			<li><a href="/homepage">Home</a></li>
			<li><a href="/jobs">Jobs</a></li>
			<li><a href="/my-profile">Profile</a></li>
			<li><a href="/search">Search</a></li>
			<form action="logout" method="post">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> 
					<input type="submit" name="Logout"
					value="Logout" class="logout-btn btnAnimation" />
			</form>
		</ul>
	</nav>