<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.date.*" %>
<%@ page import="java.sql.ResultSet.*" %>
<%    
    String name = request.getParameter("name");
    String enrollment = request.getParameter("enrollment");
    String targetDate= request.getParameter("targetDate");
    String mobile= request.getParameter("mobile");
    String email = request.getParameter("email");
    // Check if the task field was entered
    
    if (name == null || name.isEmpty()) {
        out.println("Please enter a name.");
    }
   else {
        try {          
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database_name", "username", "password");
            PreparedStatement ps = conn.prepareStatement("INSERT INTO table_name (name,enrollment,mobile,email) VALUES (?, ? ,?, ?)");
            ps.setString(1, name);
            ps.setString(2, enrollment);
            ps.setString(3, mobile);
            ps.setString(4, email);
            ResultSet rs=null;
            ps.executeUpdate();
        } catch (SQLException e) {
            out.println("Error connecting to database: " + e.getMessage());
        }
    }
    // Display all tasks in the database
    try {
        ResultSet rs = null;
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database_name", "username", "password");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM table_name");
        rs=ps.executeQuery();
        while (rs.next()) {
            out.println("<li> name : " + rs.getString("name") + "</li>");
            out.println("<li> enrollment: " + rs.getString("enrollment") + "</li>");
            out.println("<li> email: " + rs.getString("email") + "</li>");
        }
        out.println("</ul>");
    } catch (SQLException e) {
        out.println("Error connecting to database: " + e.getMessage());
    }
%>