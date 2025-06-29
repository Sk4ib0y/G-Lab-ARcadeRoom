<%@ page import="java.sql.*" %>
        <link rel="stylesheet" href="style.css?v=3" media="screen">

<%
int id = Integer.parseInt(request.getParameter("id"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/videojuegos", "root", "1608");
Statement st = con.createStatement();
st.executeUpdate("DELETE FROM consola WHERE id=" + id);
con.close();
%>
<p>Consola eliminada.</p>
<a href="index.html" class="back-link">Volver al Menú Principal</a>
