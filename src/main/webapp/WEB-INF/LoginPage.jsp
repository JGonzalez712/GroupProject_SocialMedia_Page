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
<title>Sing up!</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/LoginPageStyle.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body>
	<div class="container">
		<div class="header">
			<div>
				<h6>Social Media Page</h6>
			</div>
		</div>
		<hr>
		<div class="main">
			<div class="registration-div">
				<form:form action="registration" method="POST" modelAttribute="user">
					<legend>Register</legend>
					<div class="mb-3">
						<form:label for="exampleInputEmail1" path="userName"
							class="form-label">Username</form:label>
						<form:input type="text" path="userName" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp" />
						<span style = "color:red"><form:errors path="userName" /> </span>
					</div>
					<div class="mb-3">
						<form:label for="exampleInputEmail1" path="email"
							class="form-label">Email
							address</form:label>
						<form:input path="email"  type="email" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp" />
						<form:errors style="color:red" path="email" />
					</div>
					<div class="mb-3">
						<form:label for="exampleInputPassword1" path="password"
							class="form-label">Password</form:label>
						<form:input type="password" path="password" class="form-control"
							id="exampleInputPassword1" />
						<form:errors path="password" style="color:red" />
					</div>
					<div class="mb-3">
						<form:label for="exampleInputPassword1" path="confirm"
							class="form-label">Confirm
							password</form:label>
						<form:input path="confirm" type="password" class="form-control"
							id="exampleInputPassword1" />
						<form:errors path="confirm" style="color:red"/>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form:form>
			</div>
			<div class="registration-div">
				<form:form action="/logIn" method="POST" modelAttribute="loginUser">
					<legend>Log In</legend>
					<div class="mb-3">
						<form:label for="exampleInputEmail1" path="email"
							class="form-label">Email
							address</form:label>
						<form:input path="email" type="email" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp" />
						<form:errors path="email" style="color:red"/>
					</div>
					<div class="mb-3">
						<form:label for="exampleInputPassword1" path="password"
							class="form-label">Password</form:label>
						<form:input type="password" path="password" class="form-control"
							id="exampleInputPassword1" />
						<form:errors path="password" style="color:red"/>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
