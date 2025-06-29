<%@ page import="java.sql.*" %>
        <link rel="stylesheet" href="style.css?v=3" media="screen">

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/videojuegos", "root", "1608");
Statement st = con.createStatement();

if ("POST".equalsIgnoreCase(request.getMethod())) {
    int id = Integer.parseInt(request.getParameter("id"));
    String nombre = request.getParameter("consola");
    st.executeUpdate("UPDATE consola SET Consola='" + nombre + "' WHERE id=" + id);
    con.close();
    out.println("<p>Consola actualizada.</p>");
    out.println("<script>setTimeout(function() { window.location.href = 'index.html'; }, 1500);</script>");
    return;
}

int id = Integer.parseInt(request.getParameter("id"));
ResultSet rs = st.executeQuery("SELECT * FROM consola WHERE id=" + id);
rs.next();
%>

<form method="post">
  <input type="hidden" name="id" value="<%= id %>">
  Consola: <input type="text" name="consola" value="<%= rs.getString("Consola") %>"><br>
  <input type="submit" value="Actualizar">
</form>
<%
con.close();
%>
<a href="Indexxxx.html" class="back-link">Volver al Menú Principal</a>
