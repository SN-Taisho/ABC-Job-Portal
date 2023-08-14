<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="side-profile">

	<div class="sp-top">
	
		<img class="sp-cover" src="images/CoverPhoto.png" width="250" />
		<img class="sp-img" src="images/Profile.png" width="100" />


		<c:forEach items="${user}" var="u">
			<h5>${u.fullname}</h5>
			<p class="text-align-center">${u.occupation}</p>
		</c:forEach>
	</div>
	
	<c:forEach items="${user}" var="u">
		<p>${u.location}</p>
		<p>${u.bio}</p>
	</c:forEach>

</section>