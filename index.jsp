<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.date.*" %>
<%@ page import="java.sql.ResultSet.*" %>
<html>
<head>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
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
				<a href="index.jsp" class="navbar-brand"> Home </a>
			</div>
		</nav>
	</header>
		<div class="col">
		<div class="container col-md-10" style="margin-top: 2%;">
			<h3 class="text-center">Student's Details </h3>
			<br>
			<table class="table table-bordered">
				<thead class=" text-center">
					<tr style="background-color: #bdbdbd;">
						<th>Email</th>
						<th>Name</th>
						<th>Enrollment</th>
						<th>Mobile</th>
						<th>Modify</th>
					</tr>
				</thead>
				<tbody class="table">
		<% 
		try {
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database_name", "username", "password");
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM table_name");
			ResultSet rs = null;
			rs=ps.executeQuery();
			while (rs.next()) {
				String id=rs.getString("id");
				String email=rs.getString("email");
				String name=rs.getString("name");
				String enrollment=rs.getString("enrollment");
				String mobile=rs.getString("mobile");
				out.println("<tr>");
					out.println("<td>" + email + "</td>");
					out.println("<td>" + name + "</td>");
					out.println("<td> " + enrollment + "</td>");
					out.println("<td>  " + mobile + "</td>");%>
				<td>
					<button id="btn1" onclick="show()">Edit</button> &nbsp;&nbsp;&nbsp;
					<button id="btn2" onclick="showConfirmationDialog()">Delete</button>
				</td>
				
					<style>
						#btn1{
							border: 0.1px solid transparent;
							border-color: blue;
							color: rgb(255, 255, 255);
							background-color: blue;
						}
						#btn2{
							border: 0.1px solid transparent;
							border-color: red;
							color: rgb(255, 255, 255);
							background-color: red;
						}
					</style>
				<script>
				function showConfirmationDialog() {
					if (confirm("Are you sure you want to delete this record?")) {
						window.location.href = "del.jsp?id=<%=id%>";
					}
				}
				function show() {
					if (confirm("Are you sure you want to update this record?")) {
						window.location.href = 'edit-form.jsp?id=<%=id%>';
					}
				}
			</script>
					<% out.println("</tr>");
			}
		} catch (SQLException e) {
			out.println("Error connecting to database: " + e.getMessage());
		}
		%>				
				</tbody>
			</table>
			<div class="container-sm">
				<a href="index.jsp" class="btn btn-success">Add Student</a>
			</div>
		</div>
	</div>
</body>
</html>