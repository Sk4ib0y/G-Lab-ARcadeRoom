<%@ page import="java.sql.*" %>
        <link rel="stylesheet" href="style.css?v=3" media="screen">
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/videojuegos", "root", "1608");
Statement st = con.createStatement();

if ("POST".equalsIgnoreCase(request.getMethod())) {
    int id = Integer.parseInt(request.getParameter("id"));
    String elemento = request.getParameter("elemento");
    String precio = request.getParameter("precio");

    st.executeUpdate("UPDATE menu SET elemento='" + elemento + "', precio='" + precio + "' WHERE id=" + id);
    con.close();
    out.println("<p>Menu actualizado.</p>");
    out.println("<script>setTimeout(function() { window.location.href = 'index2.html'; }, 1500);</script>");
    return;
}

int id = Integer.parseInt(request.getParameter("id"));
ResultSet rs = st.executeQuery("SELECT * FROM menu WHERE id=" + id);
rs.next();
%>

<form method="post">
  <input type="hidden" name="id" value="<%= id %>">
  Elemento: <input type="text" name="elemento" value="<%= rs.getString("elemento") %>"><br>
  Imagen: <input type="text" name="precio" value="<%= rs.getString("precio") %>"><br>
  <input type="submit" value="Actualizar">
</form>

<%
con.close();
%>