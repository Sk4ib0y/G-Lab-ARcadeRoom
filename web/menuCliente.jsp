<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nuestro Menú</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #120a2e; 
            color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: flex-start; 
            min-height: 100vh;
            margin: 0;
            padding-top: 50px; 
        }
        .container {
            background: rgba(255, 255, 255, 0.08);
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.4);
            border: 1px solid rgba(255, 255, 255, 0.2);
            width: 90%;
            max-width: 600px; 
            text-align: center;
        }
        h2 {
            color: #00e6e6; 
            margin-bottom: 1.5rem;
            font-size: 2.2rem; 
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1.5rem;
            color: #f0f0f0;
        }
        th, td {
            padding: 12px 15px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            text-align: left;
        }
        th {
            background-color: rgba(255, 255, 255, 0.15);
            color: #e6007e; 
            font-weight: bold;
            text-transform: uppercase;
        }
        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.05);
        }
        tr:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }
        td:last-child {
            text-align: right; 
            font-weight: bold;
            color: #00e6e6; 
        }
        .volver-link {
            display: inline-block;
            margin-top: 2rem;
            color: #f0f0f0;
            text-decoration: none;
            font-size: 1.1rem;
            padding: 10px 20px;
            background-color: #e6007e;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }
        .volver-link:hover {
            background-color: #ff3399;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Nuestro Menú de Comidas y Bebidas</h2>
        
        <%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            List<String[]> menuItems = new ArrayList<>();

            try {
                Class.forName("com.mysql.jdbc.Driver"); 
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/videojuegos", "root", "1608");

                stmt = con.createStatement();
                String sql = "SELECT elemento, precio FROM menu ORDER BY elemento"; 
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    String elementoItem = rs.getString("elemento");
                    String precioItem = String.format("%.2f", rs.getDouble("precio"));
                    menuItems.add(new String[]{elementoItem, precioItem});
                }

            } catch (SQLException e) {
        %>
                <p style="color: red;">Lo sentimos, no pudimos cargar el menú en este momento. Por favor, inténtelo más tarde.</p>
                <%
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
        %>
                <p style="color: red;">Error interno del servidor al cargar el menú. Contacte al administrador.</p>
                <%
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>

        <table border="1">
            <thead>
                <tr>
                    <th>Ítem</th>
                    <th>Precio</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    if (menuItems.isEmpty()) {
                %>
                        <tr><td colspan="2">El menú está vacío. ¡Pronto tendremos deliciosas opciones para ti!</td></tr>
                <%
                    } else {
                        for (String[] item : menuItems) {
                %>
                            <tr>
                                <td><%= item[0] %></td> <td>$<%= item[1] %></td> </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        <br>
        <a href="index.html" class="volver-link">Volver a Inicio</a>
    </div>
</body>
</html>