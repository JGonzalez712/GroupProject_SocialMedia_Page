<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>this is a test. User info</h1>
		<p>username: ${user.userName}</p>
		<p>username: ${user.email}</p>
	</div>
	<div>
		<a href="logOut" class="btn btn-danger" role="button">Log out</a>
	</div>
</body>
</html>