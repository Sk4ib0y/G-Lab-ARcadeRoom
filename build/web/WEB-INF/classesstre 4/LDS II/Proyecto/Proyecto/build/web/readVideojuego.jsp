<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Videojuegos</title>
</head>
        <link rel="stylesheet" href="style.css?v=3" media="screen">
<body>
<h2>Lista de Videojuegos</h2>
<table border="1">
    <tr>
        <th>ID</th><th>Nombre</th><th>Imagen</th><th>Género</th><th>Plataforma</th><th>Acciones</th>
    </tr>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/videojuegos", "root", "1608");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM videojuego");

        while(rs.next()){
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("nombre") %></td>
        <td><%= rs.getString("imagen") %></td>
        <td><%= rs.getString("genero") %></td>
        <td><%= rs.getString("plataforma") %></td>
        <td>
            <a href="cambiosVideojuego.jsp?id=<%= rs.getInt("id") %>">Editar</a> 
            <a href="bajasVideojuego.jsp?id=<%= rs.getInt("id") %>">Eliminar</a>
        </td>
    </tr>
<%
        }
        con.close();
    } catch(Exception e){
        out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
    }
%>
</table>
<a href="index.html">Volver al menú</a>
</body>
</html>
