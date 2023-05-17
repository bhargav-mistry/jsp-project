
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.date.*" %>
<%@ page import="java.sql.ResultSet.*" %>
<%
    String name = request.getParameter("name");
    String enrollment = request.getParameter("enrollment");
    String mobile= request.getParameter("mobile");
    String email = request.getParameter("email");
   
    String t="email";
    String ts="enrollment";
    String ta="Action";
    // Check if the task field was entered
    
    if (name == null || name.isEmpty()) {
        out.println("Please enter a name.");
    }
   else {
        try {          
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database_name", "username", "password");
            PreparedStatement ps = conn.prepareStatement("INSERT INTO table_name (name,enrollment,mobile,email) VALUES (?, ? , ?, ?)");
            ps.setString(1, name);
            ps.setString(2, enrollment);
            ps.setString(3, mobile);
            ps.setString(4, email);
            ResultSet rs=null;
            ps.executeUpdate();
            response.sendRedirect("index.jsp");
        } catch (SQLException e) {
            out.println("Error connecting to database: " + e.getMessage());
        }
    }

%>