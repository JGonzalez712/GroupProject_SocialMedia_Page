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
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/MainPage.css">
<script src="https://kit.fontawesome.com/107b53be8e.js" crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>
	<div class="main-container">
		<div class="left-column"><!-- Note: This div container manages everything displayed in the left column of the main page. -->
			<div class="icons-text">			 
        		<a href="/#">
        			<i class="fa-brands fa-x-twitter"></i>
        		</a>	
			</div>
			<div class="icons-text ">
				<a href="/#">
					<div><i class="fa-solid fa-house-chimney"></i></div>
					<div> <p>Home</p></div>
				<a/>
			</div>
			<div class="icons-text">
    			<a href="/#">
			        <div><i class="fas fa-search"></i></div>
			        <div> <p>Explore</p></div>
			    </a>
			</div>
			<div class="icons-text">
				<a href="/#">
					<div><i class="fa-regular fa-bell"></i></div>
					<div> <p>Notifications</p></div>
				</a>
			</div>
			<div class="icons-text">
				 <a href="/#">
        			<div><i class="fa-regular fa-envelope"></i></div>
       				<div><p>Messages</p></div>
    			</a>
			</div>
			<div class="icons-text">
				<a href="/#">
					<div><i class="fa-regular fa-square"></i></div>
					<div> <p>Grok</p></div>
				<a/>
			</div>
			<div class="icons-text">
				<a href="/#">	
					<div><i class="fa-solid fa-list"></i></div>
					<div> <p>Lists</p></div>
				</a>
			</div>
			<div class="icons-text">
				<a href="/#">
					<div><i class="fa-solid fa-user-group"></i></div>
					<div> <p>Communities</p></div>
				<a/>
			</div>
			<div class="icons-text">
				<a href="/#">
					<div><i class="fa-brands fa-x-twitter"></i></div>
					<div> <p>Premium</p></div>
				</a>
			</div>
			<div class="icons-text">
				<a href="/#">
					<div><i class="fa-regular fa-user"></i></div>
					<div> <p>Profile</p></div>
				</a>
			</div>
			<div class="icons-text">
				<a href="/#">
				<div><i class="fa-solid fa-ellipsis"></i></div>
				</a>
				<a href="/#">
				<div> <p>More</p></div>
				</a>	
			</div>
			<div class="icons-text">
				<a href="/" class="btn btn-info" role="button">Post</a>
			</div>
			<div class="user-column">
				<div class="icons-text">
					<i class="fa-regular fa-user"></i>
					<div> <p>(Here userName, name)</p></div>
				</div>
			</div>
		</div>
		<!-- This div menages everything displayed in the center of the main page -->
		<div class="central-column">
			<div class="comment-box">
		<h2>Create a comment</h2>
		<form:form action="/createComment" method="post" modelAttribute="comment">
			<form:input type="hidden" path="user" value="${loggedInId}"/>
			<form:label path="content" class="col-sm-2 col-form-label">Add comment:</form:label>
			<form:input type="text" path="content" class="form-control" id="inputEmail3"/>
			<form:errors path="content" />
			<button type="submit" class="btn btn-primary">Comment</button>
		</form:form>
	</div>
	<div>
		<a href="logOut" class="btn btn-danger" role="button">Log out</a>
	</div>
	<div class="main">
		<table id="thisT" class="table table-hover table-bordered ">
			<thead>
				<tr>
					<th style="text-align: center" colspan="2">these are all the
						comments</th>
				</tr>
			</thead>
			<tbody>

				
				<c:choose>
					<c:when test="${empty comments}">
						<tr>
							<td colspan="2">No comments yet</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="oneComment" items="${comments}">
							<tr>
								<td>${oneComment.content}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
		</table>
	</div>
		</div>
		<!-- This div menages everything displayed in the right side of the main page -->
		<div class="right-column">
			
		</div>
		
	</div>
</body>
</html>