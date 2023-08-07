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

<link rel="icon" href="images/Logo.png" type="image/icon type">

</head>

<body>

	<header id="navbar" class="align-center justify-between">

		<a id="navbarLeft" class="align-center text-deco-none" href="/home">
			<img src="images/Logo.png" alt="ABC Job Portal Logo" width="100">
			<h1 class="hFont">ABC Jobs</h1>
		</a>

		<ul id="publicNav" class="align-center list-style-none hFont">
			<li><a href="/login" id="loginLink" class="btnAnimation">Log
					In</a></li>
			<li><a href="/signup" id="signupLink" class="btnAnimation">Sign
					Up</a></li>
		</ul>

		<button class="nav-menu-open autohide material-icons btnAnimation" onclick="toggleNavMenu()">menu</button>

	</header>

	<nav class="nav-menu">
		<ul class="nav-menu-links">
			<li><a href="/home">Home</a></li>
			<li><a href="/signup">Sign Up</a></li>
			<li><a href="/login">Login</a></li>

		</ul>
	</nav>