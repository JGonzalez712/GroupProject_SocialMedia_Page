<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<meta charset="UTF-8">
	<title>Sign up!</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/LoginPageStyle.css">
	<!-- change to match your file/naming structure -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/app.js"></script>
	<script src="https://kit.fontawesome.com/107b53be8e.js" crossorigin="anonymous"></script>
	<!-- change to match your file/naming structure -->
</head>
<body>

	 <header>
        <nav class="navbar navbar-expand-lg bg-body-tertiary shadow" >
            <div class="container">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarButtonsExample" aria-expanded="false" >
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="/"><h3> <i class="fa-solid fa-circle-question fa-2xl"></i> What if </h3> </a>
                <div class="collapse navbar-collapse" id="navbarButtonsExample">
                    
                    
                </div>
            </div>
            </nav>
    </header>
	<div class="container">

		<div class="app-desciption p-1 my-4 bg-light rounded-3">
				<div class="container py-1">
					<h1 class="display-5 fw-bold">What if you could rewrite your preferred show?</h1>
					<p class="col-md-8 fs-4">This is a mini social media blogging to share your rewrite of your favorite movie</p>
				</div>
        </div>
		<div class="main py-5">	


			<div class="registration-div my-3">
				<form:form action="registration" method="POST" modelAttribute="user">
					<h2>Register</h2>
					<div class="mb-3">
						<form:label for="input-firstname" path="firstname" class="form-label">Firstname</form:label>
						<form:input type="text" path="firstname" class="form-control"
							id="input-firstname" aria-describedby="input-firstname" />
						<span style = "color:red"><form:errors path="firstname" /> </span>
					</div>
					<div class="mb-3">
						<form:label for="input-lastname" path="lastname"
							class="form-label">Lastname</form:label>
						<form:input type="text" path="lastname" class="form-control"
							id="input-lastname" aria-describedby="input-lastname" />
						<span style = "color:red"><form:errors path="lastname" /> </span>
					</div>
					<div class="mb-3">
						<form:label for="input-username" path="username"
							class="form-label">Username</form:label>
						<form:input type="text" path="username" class="form-control"
							id="input-username" aria-describedby="input-username" />
						<span style = "color:red"><form:errors path="username" /> </span>
					</div>
					<div class="mb-3">
						<form:label for="input-email" path="email"
							class="form-label">Email
							address</form:label>
						<form:input path="email"  type="email" class="form-control"
							id="input-email" aria-describedby="input-email" />
						<form:errors style="color:red" path="email" />
					</div>
					<div class="mb-3">
						<form:label for="input-pwd" path="password"
							class="form-label">Password</form:label>
						<form:input type="password" path="password" class="form-control"
							id="input-pwd" />
						<form:errors path="password" style="color:red" />
					</div>
					<div class="mb-3">
						<form:label for="input-pwd-confim" path="confirm"
							class="form-label">Confirm
							password</form:label>
						<form:input path="confirm" type="password" class="form-control"
							id="input-pwd-confirm" />
						<form:errors path="confirm" style="color:red"/>
					</div>
					<button type="submit" class="btn btn-primary">Create an account</button>
				</form:form>
			</div>
			<div class="registration-div">
				<form:form action="/logIn" method="POST" modelAttribute="loginUser">
					<h2>Log In</h2>
					<div class="mb-3">
						<form:label for="input-email-login" path="email"
							class="form-label">Email
							address</form:label>
						<form:input path="email" type="email" class="form-control"
							id="input-email-login" aria-describedby="input-email-login" />
						<form:errors path="email" style="color:red"/>
					</div>
					<div class="mb-3">
						<form:label for="input-pwd-login" path="password"
							class="form-label">Password</form:label>
						<form:input type="password" path="password" class="form-control"
							id="input-pwd-login" />
						<form:errors path="password" style="color:red"/>
					</div>
					<button type="submit" class="btn btn-primary">Login</button>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
