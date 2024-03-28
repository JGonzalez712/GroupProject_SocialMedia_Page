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
				
				<div class="col-xl-12 my-2 py-2">
					<div class="comment-author d-flex">
						<img src="https://i.pravatar.cc/150?u=${story.author.id}" class="rounded" alt="avatar" style="width:64px; height:64px">
						<p class="px-3 mt-3">${story.author.firstname} ${story.author.lastname} <span class="text-secondary"> @${story.author.username}</span> - <small><fmt:formatDate value = "${story.createdAt}" type ="date"/></small></p>
						
					</div>
					<p class="fs-4 fw-semibold text-primary"><span>What if ...</span> ${story.title}</p>
					<p class="pt-1">${story.content}</p>
					<div class="d-flex justify-content-between">
						<div class="reaction-btn d-flex">
							<a href="#" class="reaction-like mx-3"><i class="fa-regular fa-heart"></i> ${story.likes.size()}</a>
							<a href="#" class="reaction-post mx-3"><i class="fa-regular fa-comment"></i> ${story.comments.size()}</a>
							<a href="#" class="reaction-save mx-3"><i class="fa-regular fa-bookmark"></i></a>					
						</div>
						<c:if test="${story.author.id==loggedUser.id}">
							<div class="reaction-btn-admin">
								<a href="/story/${story.id}/edit" class="reaction-edit mx-2 text-dark"><i class="fa-regular fa-pen-to-square"></i></a>
								<button data-bs-toggle="modal" data-bs-target="#deletion-modal" class="reaction-delete mx-2 btn"><i class="fa-solid fa-trash"></i></button>
							</div>						
						</c:if>
					
					</div>
				</div>
				
			
			</div>

			<div class="add-comment">
				<form:form action="/story/${story.id}/comment" method="post" modelAttribute="comment">
					<form:hidden path="author" value="${loggedInId}"/>
                    <!--<form:hidden path="story" value="${story.id}"/>-->
					<form:errors path="content" class="errors" />
					<div class="input-group mb-3">						
						<form:input path="content" class="form-control" placeholder="add a comment" aria-label="comment" aria-describedby="add-comment"/>
						<button class="btn btn-outline-primary" type="submit" id="add-comment">Comment</button>
					</div>
				</form:form>
			</div>

			<div id="story-comments">
                <!-- list of comments -->
                <c:forEach var="comment" items="${story.comments}">
                    <div class="row comments border-top my-2 pt-2">
                        <div class="d-flex justify-content-between">
						 	<div class="comment-author d-flex">
                            	<img src="https://i.pravatar.cc/150?u=${comment.author.id }" class="rounded" alt="avatar"
								style="width: 64px; height: 64px">
                            	<p class="px-2">${comment.author.firstname} ${comment.author.lastname} <span class="text-secondary"> @${comment.author.username}</span> - <small><fmt:formatDate value = "${comment.createdAt}" type ="date"/></small></p>
                            
                        	</div>
							<!-- <a href="#" class="text-secondary"><i class="fa-regular fa-heart fa-xl"></i></a> -->
							<c:choose>
                    <c:when test="${comment.usersWhoLikedMe.contains(loggedUser)}">
                        <!-- User has already liked the story -->
                        <form action="/comment/dislikes/${loggedInId}/${comment.id}" method="post" class="reaction-like-form">
                            <button type="submit" class="reaction-like mx-3" style="border: none; background: none; cursor: pointer;">
                                <i class="fa-solid fa-heart"></i> ${comment.usersWhoLikedMe.size()}
                            </button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <!-- User has not liked the story -->
                        <form action="/comment/likes/${loggedInId}/${comment.id}" method="post" class="reaction-like-form">
                            <button type="submit" class="reaction-like mx-3" style="border: none; background: none; cursor: pointer;">
                                <i class="fa-regular fa-heart"></i> ${comment.usersWhoLikedMe.size()}
                            </button>
                        </form>
                    </c:otherwise>
                </c:choose>
						
						</div>
                        <p>${comment.content}</p>
                    </div>
                </c:forEach>
            
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