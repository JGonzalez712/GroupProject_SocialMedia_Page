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
			<div class="add-comment">
				<h2>Create a comment</h2>
				<form:form action="/createComment" method="post" modelAttribute="comment">
					<div class="input-group mb-3">
						<form:input type="hidden" path="author" value="${loggedInId}"/>
						<form:errors path="content" />
						<form:input path="content" class="form-control" placeholder="add a comment" aria-label="comment" aria-describedby="add-comment"/>
						<button class="btn btn-outline-primary" type="submit" id="add-comment">Button</button>
					</div>
				</form:form>
			</div>

			<!-- list of comments -->
			<c:forEach var="comment" items="${comments}">
				<div class="comments border-top my-2 py-2">
					<div class="comment-author d-flex">
						<img src="https://avatar.iran.liara.run/public" class="rounded" alt="avatar" style="width:64px; height:64px">
						<p class="px-3 mt-3">Name <span class="text-secondary"> @${comment.author.username}</span> - <small><fmt:formatDate value = "${comment.createdAt}" type ="date"/></small></p>
						
					</div>
					<p class="pt-1">${comment.content}</p>
				</div>
			</c:forEach>

		
		</div> <!-- end of central-column -->
	

		<%@ include file="right-column.jsp" %>
		
		
	</div>

</body>
</html>