<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database_name", "username", "password");
        pstmt = conn.prepareStatement("DELETE FROM table_name WHERE id=?");
        pstmt.setInt(1, Integer.parseInt(id)); 
        int rowsDeleted = pstmt.executeUpdate();

        if (rowsDeleted > 0) {
            response.sendRedirect("index.jsp");
            out.println("Record deleted successfully"); 
        } else {
            out.println("Record not found"); 
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage()); 
    } 
    
%>
