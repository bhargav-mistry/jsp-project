<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
<email>Students</email>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<style>
	.navbar{
            background-color: #ef5858;
			margin-bottom: 80px;
        }
</style>
</head>

</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark">
			<div>
				<a href="index.jsp" class="navbar-brand"> Student App</a>
			</div>
		</nav>
	</header>
	<div class="container col-md-6">
		<div class="card">
			<div class="card-body">
				<c:if test="${Student != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${Student == null}">
					<form action="validate.jsp" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${Student != null}">
            			Edit Student
            		</c:if>
						<c:if test="${Student == null}">
            			Add New Student
            		</c:if>
					</h2>
				</caption>

				<c:if test="${Student != null}">
					<input type="hidden" name="id" value="<c:out value='${Student.id}' />" />
				</c:if>
				<fieldset class="form-group">
					<label>mobile </label> <input type="text"
						value="<c:out value='${Student.mobile}' />" class="form-control"
						name="mobile" required="required">
				</fieldset>
				<fieldset class="form-group">
					<label>email</label> <input type="text"
						value="<c:out value='${Student.email}' />" class="form-control"
						name="email" required="required" minlength="5">
				</fieldset>

				<fieldset class="form-group">
					<label>Name</label> <input type="text"
						value="<c:out value='${Student.name}' />" class="form-control"
						name="name" minlength="5">
				</fieldset>

				<fieldset class="form-group">
					<label>enrollment</label> <input type="text"
					value="<c:out value='${Student.name}' />" class="form-control"
					name="enrollment" minlength="1">
				</fieldset>
				<button type="submit" class="btn btn-success" action="index.jsp">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>