<%@ page import="java.sql.*" %>
<link rel="stylesheet" href="style.css?v=3" media="screen">

<%
    String idConsola = request.getParameter("consolas");
    String idEstado = request.getParameter("estado");
    String observaciones = request.getParameter("observaciones");
    String consola = "";
    String estado = "";

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/videojuegos", "root", "1608");
    Statement st = con.createStatement();
    
    if (idConsola.equals("1")) {
        consola = "PS3";
    } else if (idConsola.equals("2")) {
        consola = "PS5";
    } else if (idConsola.equals("3")) {
        consola = "Xbox 360";
    } else if (idConsola.equals("4")) {
        consola = "Xbox Series S";
    } else if (idConsola.equals("5")) {
        consola = "Xbox Series X";
    } else if (idConsola.equals("6")) {
        consola = "Nintendo Switch";
    } else if (idConsola.equals("7")) {
        consola = "PC";
    }

    if (idEstado.equals("1")) {
        estado = "En uso";
    } else if (idEstado.equals("2")) {
        estado = "Disponible";
    } else if (idEstado.equals("3")) {
        estado = "En Reparacion";
    }

    if (observaciones == null || observaciones.trim().equals("")) {
        observaciones = "No Hay";
    } else {
        observaciones = observaciones;
    }

    st.executeUpdate("INSERT INTO consola (consola, estado, observaciones) VALUES ('" + consola + "', '" + estado + "', '" + observaciones + "')");

    con.close();

    out.println("<script>setTimeout(function() { window.location.href = 'index2.html'; }, 1500);</script>");
%>
<p>Consola guardada.</p>



