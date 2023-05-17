	<%@ page import="java.sql.*" %>
	<%@ page import="java.util.*" %>
	<%@ page import="java.date.*" %>
	<%@ page import="java.sql.ResultSet.*" %>
	<%	
	String name = request.getParameter("name");
	String enrollment = request.getParameter("enrollment");
	String mobile = request.getParameter("mobile");
	String email = request.getParameter("email");
  
	try {
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database_name", "username", "password");
		// Construct the SQL update statement
		String sql = "UPDATE table_name SET name='" + name + "', enrollment='" + enrollment + "', mobile='" + mobile + "' WHERE email='" + email + "'";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		response.sendRedirect("index.jsp");
		out.println("Data updated successfully.");
	} catch (SQLException e) {
		out.println("Error connecting to database: " + e.getMessage());
	}
  %>
