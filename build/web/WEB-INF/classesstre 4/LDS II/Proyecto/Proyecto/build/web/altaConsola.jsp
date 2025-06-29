<%@ page import="java.sql.*" %>
        <link rel="stylesheet" href="style.css?v=3" media="screen">

<%
String consola = request.getParameter("consola");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/videojuegos", "root", "1608");
Statement st = con.createStatement();
st.executeUpdate("INSERT INTO consola(Consola) VALUES('" + consola + "')");
con.close();
out.println("<script>setTimeout(function() { window.location.href = 'index.html'; }, 1500);</script>");
%>
<p>Consola guardada.</p>

