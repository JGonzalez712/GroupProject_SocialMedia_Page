<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

	<%@ include file="header.jsp"%>
	    <div class="container-fluid p-5 shadow-top  "   >
	    	
	        <section class="row border-bottom pb-3">
	            <h1 class="text-1xl">${loggedUser.firstname} ${loggedUser.lastname}</h1>
	            <div class="d-flex justify-content-between align-items-center">
	                <div>
	                   <%--  <img src="https://i.pravatar.cc/150?u=${loggedUser.id }" class="rounded" alt="avatar"
									style="width: 32px; height: 32px"> --%>
							<img src="https://i.pravatar.cc/150?u=${loggedUser.id }" class="rounded" alt="avatar"
								style="width: 64px; height: 64px">			
	                    <label class="px-3 mt-3">
	                        ${loggedUser.firstname} ${loggedUser.lastname} <span class="text-success">
	                            @${loggedUser.username}</span> 
	                    </label>
	                </div>
	                <button class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#edit-profile-modal">Edit profile</button>
	            
	            </div>
	        
	        </section>
	        <section class="row py-3">
	            <div class="col d-flex">
	                <p class="px-3 fw-bold">${loggedUser.authoredStories.size()} stories </p>
	                <p class="px-3">0 followers </p>
	                <p>0 following </p>
	            
	            </div>
	            <div class="col">
	                <p class="fw-bold">${loggedUser.email}</p>
	                <p class="">Member since <span class="text-secondary"><fmt:formatDate value="${loggedUser.createdAt}" type="date" /></span></p>
	            </div>
	            <div class="col">
	                <h4>About me</h4>
	                <p><%-- Hey there, I'm ${loggedUser.firstname} ${loggedUser.lastname} 
	                Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. --%> 
	                	${loggedUser.about != null && !loggedUser.about.isEmpty() ? loggedUser.about : "Add something about yourself"}
	                </p>
	            </div>
	        
	        
	        </section>
	        <section class="row py-3">
	            <ul class="nav nav-tabs" role="tablist">
	                <li class="nav-item" role="presentation">
	                    <a class="nav-link active" id="simple-tab-0" data-bs-toggle="tab" href="#simple-tabpanel-0" role="tab" aria-controls="simple-tabpanel-0" aria-selected="true">My Stories</a>
	                </li>
	                <li class="nav-item" role="presentation">
	                    <a class="nav-link" id="simple-tab-1" data-bs-toggle="tab" href="#simple-tabpanel-1" role="tab" aria-controls="simple-tabpanel-1" aria-selected="false">Liked Stories</a>
	                </li>
	                <li class="nav-item" role="presentation">
	                    <a class="nav-link" id="simple-tab-2" data-bs-toggle="tab" href="#simple-tabpanel-2" role="tab" aria-controls="simple-tabpanel-2" aria-selected="false">Saved Stories</a>
	                </li>
	                </ul>
	                <div class="tab-content pt-5 col-4" id="tab-content">
	                    <div class="tab-pane active" id="simple-tabpanel-0" role="tabpanel" aria-labelledby="simple-tab-0">
	                        <ol class="list-group list-group-flush list-group-numbered">	
	                                <c:forEach var="story" items="${loggedUser.authoredStories}">
	                                    <li class="list-group-item">${story.title}</li> 
	                                </c:forEach>
	                        </ol>                    
	                    </div>
	                    <div class="tab-pane" id="simple-tabpanel-1" role="tabpanel" aria-labelledby="simple-tab-1">
	                        <ol class="list-group list-group-flush list-group-numbered">	
	                                <c:forEach var="story" items="${loggedUser.likedStories}">
	                                    <li class="list-group-item">${story.title}</li> 
	                                </c:forEach>
	                        </ol>
	                    </div>
	                    <div class="tab-pane" id="simple-tabpanel-2" role="tabpanel" aria-labelledby="simple-tab-2">
	                        <ol class="list-group list-group-flush list-group-numbered">                        
	                                <c:forEach var="story" items="${loggedUser.savedStories}">
	                                    <li class="list-group-item">${story.title}</li> 
	                                </c:forEach>
	                            </ol>                    
	                    </div>  
	                </div>
	        </section>
	    
	    </div>
	
	    <!-- modal for profile edit -->
	        <div class="modal fade" id="edit-profile-modal" tabindex="-1" aria-labelledby="edit-profile-modal" aria-hidden="true">
	
	        <div class="modal-dialog modal-lg">
	        <form:form action="/profile/edit" method="PUT" modelAttribute="loggedUser">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title">Edit Profile</h5>
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <div class="modal-body">
	                        
	                    <div class="row mb-3">
	                        <div class="col">
	                            <form:label for="input-firstname" path="firstname" class="form-label">First name<span class="text-danger">*</span></form:label>
	                            <form:input type="text" path="firstname" class="form-control" id="input-firstname" aria-describedby="input-firstname" required="required"/>
	                            <span style = "color:red"><form:errors path="firstname" /> </span>	
	                        </div>
	                        <div class="col">
	                            <form:label for="input-lastname" path="lastname" class="form-label">Last name</form:label>
	                            <form:input type="text" path="lastname" class="form-control" id="input-lastname" aria-describedby="input-lastname"/>
	                            <span style = "color:red"><form:errors path="lastname" /> </span>
	                        </div>
	                    </div>
	                     <div class="row mb-3">
	                   
	                        <div class="col">
	                            <form:label for="input-lastname" path="lastname" class="form-label">About me</form:label>
	                            <form:input type="text" path="about" class="form-control" id="input-lastname" aria-describedby="input-lastname"/>
	                            <span style = "color:red"><form:errors path="lastname" /> </span>
	                        </div>
	                    </div>
	                      
	                    <div class="row mb-3">
	                        <div class="col">
	                            <form:label for="input-username" path="username" class="form-label">Username<span class="text-danger">*</span></form:label>
	                            <form:input type="text" path="username" class="form-control" id="input-username" aria-describedby="input-username" reuired="required"/>
	                            <span style = "color:red"><form:errors path="username" /> </span>
	                        
	                        </div>
	                        <div class="col">
	                            <label class="form-label">Email address</label>
	                            <input type="email" class="form-control" disabled value="${loggedUser.email}"/>	
	                            <form:hidden path="email"/>
	                        </div>		
	                    </div>
	                    <div class="row mb-3">
	                        <div class="col">
	                            <label for="input-pwd" class="form-label">Password</label>
	                            <input type="password" class="form-control" id="input-pwd" disabled value="${loggedUser.password}"/>
	                            <form:hidden path="password"/>
	                           <%--  <form:hidden path="confirm" value="123456879"/> --%>
	                            <form:hidden path="id"/>
	                        </div>
	                    </div>
	                
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	                    <button type="submit" class="btn btn-primary">Save changes</button>
	                </div>
	            </div>
	        </form:form>            
	        
	        </div>
	        
	        </div>
			
    <!-- end of modal -->


    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    

</body>
</html>