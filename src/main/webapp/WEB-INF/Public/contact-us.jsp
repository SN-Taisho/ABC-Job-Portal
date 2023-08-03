<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- paired navbar -->
<jsp:include page="../public-navbar.jsp">
	<jsp:param value="Contact Us" name="HTMLtitle"/>
</jsp:include>

<main class="public limited justify-center">

	<div class="pub-card">
		<h3 class="pub-heading">Contact Us</h3>
		<img src="svgs/contact-us.svg" alt="svg">
		<div id="contactContainer" class="justify-evenly flex-wrap">
			<div class="contact-card">
				<h4 class="pub-subheading">Email</h4>
				<p class="pub-paragraph">jobs@abc.com</p>
			</div>
			<div class="contact-card">
				<h4 class="pub-subheading">Telephone</h4>
				<p class="pub-paragraph">+63 344-3306</p>
			</div>
			<div class="contact-card">
				<h4 class="pub-subheading">Address</h4>
				<p class="pub-paragraph">145 Tori Lane, Pasig, Metro Manila,
					Philippines</p>
			</div>
		</div>
	</div>

</main>

<jsp:include page="../footer.jsp"></jsp:include>