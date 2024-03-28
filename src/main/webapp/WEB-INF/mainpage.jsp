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
<script src="https://kit.fontawesome.com/107b53be8e.js"
	crossorigin="anonymous"></script>

<title>Feed</title>
</head>
<body>
	
	<!-- link for generating avatars -->
	
	<!-- MALE avatar : xsgames.co/randomusers/avatar.php?g=male -->
	<!-- FEMALE avatar: xsgames.co/randomusers/avatar.php?g=female -->
	
	<%-- <img src="https://ui-avatars.com/api/?name=${story.author.username }&length=1" class="rounded" alt="avatar"
								style="width: 64px; height: 64px"> --%>
	

	<%@ include file="header.jsp"%>

	<div class="container-fluid d-flex pb-4 shadow-top">

		<%@ include file="left-column.jsp"%>

		<!-- This div a everything displayed in the center of the main page -->
		<div class="central-column flex-fill">

			<div class="row my-3">
				<form:form action="/story/add" method="post" modelAttribute="story">
					<h4 class="text-primary">What if...</h4>
					<form:errors path="title" class="errors" />
					<div class="form-floating mb-2">
						<form:input type="text"
							class="form-control border border-primary border-1 text-primary"
							id="input-story" path="title" />
						<form:label for="input-story" path="title">Title or Question</form:label>
					</div>
					<div class="input-group">
						<div class="form-floating">
							<form:textarea path="content"
								class="form-control border border-primary border-1 text-primary"
								id="textarea-story" style="height: 100px;"></form:textarea>
							<form:label for="textarea-story" path="content">Story</form:label>
						</div>
						<form:errors path="content" class="errors" />
						<button type="submit" class="btn btn-primary">
							<i class="fa-solid fa-paper-plane"></i>
						</button>
					</div>
					<form:input type="hidden" path="author" value="${loggedInId}" />
				</form:form>
			</div>

			<c:forEach var="story" items="${stories}">
				<div class="row">

					<div class="col-xl-12 border-top my-2 py-2">
						<div class="comment-author d-flex">
							<img src="https://i.pravatar.cc/150?u=${story.author.id }" class="rounded" alt="avatar"
								style="width: 64px; height: 64px">
							<p class="px-3 mt-3" style="">
								<span style="font-weight: bold;">${story.author.firstname} ${story.author.lastname}</span> <span class="text-secondary">
									@${story.author.username}</span> - <small><fmt:formatDate
										value="${story.createdAt}" type="date" /></small>
							</p>

						</div>
						<p class="fs-4 fw-semibold " >
							<a href="/story/${story.id}"><span>What if ...</span>
								${story.title}</a>
						</p>
						<p class="pt-1" style="font-style: italic;">${story.content}</p>
						<div class="reaction-btn d-flex">
							<c:choose>
								<c:when test="${story.likes.contains(loggedUser)}">
									<!-- User has already liked the story -->
									<form action="/story/dislikes/${loggedInId}/${story.id}"
										method="post" class="reaction-like-form">
										<button type="submit" class="reaction-like mx-3"
											style="border: none; background: none; cursor: pointer;">
											<i class="fa-solid fa-heart"></i> ${story.likes.size()}
										</button>
									</form>
								</c:when>
								<c:otherwise>
									<!-- User has not liked the story -->
									<form action="/story/likes/${loggedInId}/${story.id}"
										method="post" class="reaction-like-form">
										<button type="submit" class="reaction-like mx-3"
											style="border: none; background: none; cursor: pointer;">
											<i class="fa-regular fa-heart"></i> ${story.likes.size()}
										</button>
									</form>
								</c:otherwise>
							</c:choose>
							<a href="/story/${story.id}#story-comments"
								class="reaction-post mx-3"><i class="fa-regular fa-comment"></i>
								${story.comments.size()}</a> <a href="#" class="reaction-save mx-3"><i
								class="fa-regular fa-bookmark"></i></a>
						</div>
					</div>
				</div>

			</c:forEach>

		</div>
		<!-- end of central-column -->


		<%@ include file="right-column.jsp"%>


	</div>

</body>
</html>