<%@ page import="java.sql.*" %>
        <link rel="stylesheet" href="style.css?v=3" media="screen">
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/videojuegos", "root", "1608");
Statement st = con.createStatement();

if ("POST".equalsIgnoreCase(request.getMethod())) {
    int id = Integer.parseInt(request.getParameter("id"));
    String consola = request.getParameter("consola");
    String precio = request.getParameter("precio");
    String pantalla = request.getParameter("pantalla");

    st.executeUpdate("UPDATE consola_precio SET precio='" + precio + "', pantalla='" + pantalla + "', consola='" + consola + "' WHERE id=" + id);
    con.close();
    out.println("<p>Precio actualizado.</p>");
    out.println("<script>setTimeout(function() { window.location.href = 'index2.html'; }, 1500);</script>");
    return;
}

int id = Integer.parseInt(request.getParameter("id"));
ResultSet rs = st.executeQuery("SELECT * FROM consola_precio WHERE id=" + id);
rs.next();
%>

<form method="post">
  <input type="hidden" name="id" value="<%= id %>">
  Consola: <input type="text" name="consola" value="<%= rs.getString("consola") %>"><br>
  Precio: <input type="text" name="precio" value="<%= rs.getString("precio") %>"><br>
  Pantalla: <input type="text" name="pantalla" value="<%= rs.getString("pantalla") %>"><br>
  <input type="submit" value="Actualizar">
</form>

<%
con.close();
%>