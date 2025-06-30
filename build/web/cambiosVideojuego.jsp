<%@ page import="java.sql.*" %>
        <link rel="stylesheet" href="style.css?v=3" media="screen">
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/videojuegos", "root", "1608");
Statement st = con.createStatement();

if ("POST".equalsIgnoreCase(request.getMethod())) {
    int id = Integer.parseInt(request.getParameter("id"));
    String nombre = request.getParameter("nombre");
    String imagen = request.getParameter("imagen");
    String genero = request.getParameter("genero");
    String plataforma = request.getParameter("plataforma");

    st.executeUpdate("UPDATE videojuego SET nombre='" + nombre + "', imagen='" + imagen + "', genero='" + genero + "', plataforma='" + plataforma + "' WHERE id=" + id);
    con.close();
    out.println("<p>Videojuego actualizado.</p>");
    out.println("<script>setTimeout(function() { window.location.href = 'index2.html'; }, 1500);</script>");
    return;
}

int id = Integer.parseInt(request.getParameter("id"));
ResultSet rs = st.executeQuery("SELECT * FROM videojuego WHERE id=" + id);
rs.next();
%>

<form method="post">
  <input type="hidden" name="id" value="<%= id %>">
  Nombre: <input type="text" name="nombre" value="<%= rs.getString("nombre") %>"><br>
  Imagen: <input type="text" name="imagen" value="<%= rs.getString("imagen") %>"><br>
  Género: <input type="text" name="genero" value="<%= rs.getString("genero") %>"><br>
  Plataforma: <input type="text" name="plataforma" value="<%= rs.getString("plataforma") %>"><br>
  <input type="submit" value="Actualizar">
</form>

<%
con.close();
%>
