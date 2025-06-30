<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de Consolas</title>
    </head>
    <link rel="stylesheet" href="style.css?v=3" media="screen">
    <body>
        <h2>Lista de Consolas</h2>
        <table border="1">
            <tr>
                <th>ID</th><th>Consola</th><th>Estado</th><th>Observaciones</th><th>Acciones</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/videojuegos", "root", "1608");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM consola");
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id")%></td>
                <td><%= rs.getString("Consola")%></td>
                <td><%= rs.getString("Estado")%></td>
                <td><%= rs.getString("Observaciones")%></td>
                <td>
                    <a href="cambiosConsola.jsp?id=<%= rs.getInt("id")%>">Editar</a> |
                    <a href="bajasConsola.jsp?id=<%= rs.getInt("id")%>">Eliminar</a>
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
            <h2>Conteo de Consolas</h2>
            <ul>
                <%    while (rs.next()) {
                        String nombre = rs.getString("consola");
                        int cantidad = rs.getInt("total");
                %>
                <li><%= nombre%>: <%= cantidad%></li>
                        <%
                            }
                            con.close();
                        %>
            </ul>
        </table>

        <a href="index2.html">Volver al men� de administrador</a>
    </body>
</html>
