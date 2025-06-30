<%@ page import="java.sql.*" %>
        <link rel="stylesheet" href="style.css?v=3" media="screen">
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/videojuegos", "root", "1608");
Statement st = con.createStatement();

if ("POST".equalsIgnoreCase(request.getMethod())) {
    int id = Integer.parseInt(request.getParameter("id"));
    String Consola = request.getParameter("Consola");
    String Estado = request.getParameter("Estado");
    String Observaciones = request.getParameter("Observaciones");

    st.executeUpdate("UPDATE consola SET consola='" + Consola + "', Estado='" + Estado + "', Observaciones='" + Observaciones + "' WHERE id=" + id);
    con.close();
    out.println("<p>Consola actualizado.</p>");
    out.println("<script>setTimeout(function() { window.location.href = 'index2.html'; }, 1500);</script>");
    return;
}

int id = Integer.parseInt(request.getParameter("id"));
ResultSet rs = st.executeQuery("SELECT * FROM consola WHERE id=" + id);
rs.next();
%>

<form method="post">
  <input type="hidden" name="id" value="<%= id %>">
  <input type="hidden" name="Consola" value="<%= rs.getString("consola") %>"><br>
  Estado: <input type="text" name="Estado" value="<%= rs.getString("estado") %>"><br>
  Observaciones: <input type="text" name="Observaciones" value="<%= rs.getString("Observaciones") %>"><br>
  <input type="submit" value="Actualizar">
</form>

<%
con.close();
%>
