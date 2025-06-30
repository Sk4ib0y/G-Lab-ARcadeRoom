<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de Precios</title>
    </head>
    <link rel="stylesheet" href="style.css?v=3" media="screen">
    <body>
        <h1>Lista de Precios</h1>
        <table border="1">
            <tr>
                <th>ID</th><th>Consola</th><th>Precio</th><th>Pantalla</th><th>Acciones</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/videojuegos", "root", "1608");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM consola_precio");
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id")%></td>
                <td><%= rs.getString("Consola")%></td>
                <td>$<%= rs.getString("Precio")%></td>
                <td><%= rs.getString("Pantalla")%></td>
                <td>
                    <a href="cambiosPrecios.jsp?id=<%= rs.getInt("id")%>">Editar</a> |
                    <a href="bajasPrecios.jsp?id=<%= rs.getInt("id")%>">Eliminar</a>
                </td>
            </tr>
            <%
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("<tr><td colspan='3'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
            <%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/videojuegos", "root", "1608");
                Statement st = con.createStatement();
                String sql = "SELECT consola, COUNT(*) AS total FROM consola GROUP BY consola";
                ResultSet rs = st.executeQuery(sql);

            %>

        </table>

        <a href="index2.html">Volver al menú de administrador</a>
    </body>
</html>