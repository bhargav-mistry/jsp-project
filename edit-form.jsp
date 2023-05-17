<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <email>Edit Data</email>
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
				<caption>
					<h2>
            			Edit Student
					</h2>
				</caption>			
						<form action="update.jsp" method="post">
							<%@ page import="java.sql.*" %>
							<%
								// Retrieve data from the database
								String id = request.getParameter("id");
								String name = request.getParameter("name");
								String enrollment = request.getParameter("enrollment");
								String mobile = request.getParameter("mobile");
								String email = request.getParameter("email");
								
								try {
									Class.forName("com.mysql.jdbc.Driver");
									Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/database_name","username","password");
									PreparedStatement ps=con.prepareStatement("SELECT * FROM table_name WHERE id=?");
									ps.setString(1,id);
									ResultSet rs=ps.executeQuery();
									if(rs.next()) {
										name = rs.getString("name");
										enrollment = rs.getString("enrollment");
										mobile = rs.getString("mobile");
										email = rs.getString("email");
									}
									con.close();
								} catch(Exception e) {
									out.println(e);
								}
							%>
			
						<div class="form-group">
							<label for="mobile">name:</label> <input type="text" value="<%= name%>"
								class="form-control" id="name" placeholder="name"
								name="name" required>
						</div>
			
						<div class="form-group">
							<label>Student enrollment</label> <input type="text"
							value="<%= enrollment%>" class="form-control"
							name="enrollment" minlength="1">
						</div>

						<div class="form-group">
							<label for="mobile">mobile:</label> <input type="text" value="<%= mobile%>"
								class="form-control" id="mobile" placeholder="mobile"
								name="mobile" required>
						</div>

						<div class="form-group">
							<label for="email">email:</label> <input type="text" value="<%= email%>"
								class="form-control" id="email" placeholder="email"
								name="email" required>
						</div>
						<button type="submit" class="btn btn-primary" action="update.jsp">Update</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>