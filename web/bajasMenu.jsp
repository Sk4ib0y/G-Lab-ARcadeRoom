<%@ page import="java.sql.*" %>
        <link rel="stylesheet" href="style.css?v=3" media="screen">

<%
int id = Integer.parseInt(request.getParameter("id"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/videojuegos", "root", "1608");
Statement st = con.createStatement();
st.executeUpdate("DELETE FROM menu WHERE id=" + id);
con.close();
%>
<p>Alimento eliminado.</p>
<a href="index2.html" class="back-link">Volver al Menú de Admin</a>
