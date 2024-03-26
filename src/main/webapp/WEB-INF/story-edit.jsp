<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/MainPage.css">
	<script src="https://kit.fontawesome.com/107b53be8e.js" crossorigin="anonymous"></script>

	<title>Feed</title>
</head>
<body>


	<%@ include file="header.jsp" %>

	<div class="container-fluid d-flex pb-4">

		<%@ include file="left-column.jsp" %>

		<!-- This div a everything displayed in the center of the main page -->
		<div class="central-column flex-fill">
			<div class="row">
                <h1 class="text-primary">Edit your story</h1>
				<form:form action="/story/${story.id}/edit" modelAttribute="story" method="put" >

                    <div class="mb-3">
                        <form:label for="input-story" path="title">Title or Question</form:label>
                        <form:input type="text" class="form-control" id="input-story" path="title"/>
                        <form:errors path="title" class="errors" />
                    </div>
                    <div class="mb-3">
                        <form:label for="textarea-story" path="content">Story</form:label>
                        <form:textarea path="content" class="form-control" id="textarea-story" style="height: 100px;"></form:textarea>
                        <form:errors path="content" class="errors" />
                    </div>

                    <form:hidden path="author"/>
                    <form:hidden path="id"/>
                
                    <button type="submit" class="btn btn-primary">Save</button>	<button data-bs-toggle="modal" data-bs-target="#deletion-modal" type="submit" class="btn btn-danger">Delete</button>	
                </form:form>
			</div>

			

			
		
		</div> <!-- end of central-column -->
	

		<%@ include file="right-column.jsp" %>
		
	</div>

		 <!-- Modal for deletion request -->
    <div class="modal" tabindex="-1" id="deletion-modal">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Deletion Confirmation</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Do you want to delete this story: "<strong class="text-purple">${story.title}</strong>"?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                <form action="/story/${story.id}/delete" method="post">
                    <input type="hidden" value="delete" name="_method">
                    <button type="submit" class="btn btn-danger">Yes, delete</button>
                </form> 
                
            </div>
            </div>
        </div>
    </div>

    <!-- end of modal-->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>