<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Alimentos</title>
</head>
        <link rel="stylesheet" href="style.css?v=3" media="screen">
<body>
<h2>Lista de Alimentos</h2>
<table border="1">
    <tr>
        <th>ID</th><th>Elemento</th><th>Precio</th><th>Acciones</th>
    </tr>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/videojuegos", "root", "1608");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM menu");

        while(rs.next()){
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("elemento") %></td>
        <td>$<%= rs.getString("precio") %></td>
        <td>
            <a href="bajasMenu.jsp?id=<%= rs.getInt("id") %>">Eliminar</a>
            <a href="cambiosMenu.jsp?id=<%= rs.getInt("id") %>">Editar</a>
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
<a href="index2.html">Volver al Menú de Administrador</a>
</body>
</html>
