<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- paired navbar -->
<jsp:include page="../public-navbar.jsp">
	<jsp:param value="Home" name="HTMLtitle" />
</jsp:include>

<main class="tb-container limited">

	<div id="homeContent" class="tb-content flex-col">
		<h2 class="homeHeading">
			Code you correct,<br> <strong class="highlight">people
				we connect</strong>
		</h2>
		<p class="homeParag">
			<span>Develop your future</span> and <span>connect with great
				opportunities</span>, join the leading community in software engineering
		</p>

		<button id="joinUsBtn" class="trans-ease-out"
			onclick="window.location='<%=request.getContextPath()%>/signup'">Join
			Us</button>
	</div>

	<div class="tb-image">
		<img src="svgs/team-up.svg" alt="svg">
	</div>

</main>

<jsp:include page="../footer.jsp"></jsp:include>

