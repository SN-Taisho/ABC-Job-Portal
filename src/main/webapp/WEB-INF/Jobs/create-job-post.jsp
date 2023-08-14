<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../portal-navbar.jsp">
	<jsp:param value="Create Job Post" name="HTMLtitle" />
</jsp:include>

<main class="single-main">

	<section class="create-post">
		<h3 class="form-heading">Create a Job Post</h3>
		<span id="error-text" class="form-error" style="font-size: 1.1rem;">test error</span>
		
		<sf:form class="create-form" method="post" action="create_job_post" modelAttribute="jobPost" 
			enctype="multipart/form-data">
		
			<label class="input-group flex-col">Job Title <input id="" type="text" 
			required="true" placeholder="Insert interesting title" autocomplete="off"
			name="title" path="title" style="line-height: 2rem;"/>
			</label>
			
			<label class="input-group flex-col">Company <input id="" type="text" 
			required="true" placeholder="Insert interesting title" autocomplete="off"
			name="company" path="company" style="line-height: 2rem;"/>
			</label>
			
			<label class="input-group flex-col">Salary <input id="" type="text" 
			required="true" placeholder="Insert interesting title" autocomplete="off"
			name="salary" path="salary" style="line-height: 2rem;"/>
			</label>
			
			<label class="input-group flex-col">Description <textarea class="textarea"
			placeholder="Write about something here" rows="5" name="content" path="content"></textarea>
			</label>
			
			<div class="input-group flex-col align-center">
				<label class="file-input">Upload a Picture</label> <input
					required="true" type="file" name="fileImage" id="photo"
					accept="image/png, image/jpeg" />
			</div>
			<div class="image-preview">
				<img id="imgPreview" class="pFont" src="#" alt=""
					style="width: inherit;" />
			</div>
			
			<button class="submit-button" type="submit" style="border-radius: 10px;">Post</button>

			<script>
            $(document).ready(() => {
            	
                $("#photo").change(function () {
                    const file = this.files[0];
                    if (file) {
                        let reader = new FileReader();
                        reader.onload = function (event) {
                            $("#imgPreview")
                              .attr("src", event.target.result);
                        };
                        reader.readAsDataURL(file);
                    }
                });
            });
       		</script>

		</sf:form>
		
	</section>

</main>

<script type="text/javascript" src="js/form-validation.js"></script>

<jsp:include page="../footer.jsp"></jsp:include>
