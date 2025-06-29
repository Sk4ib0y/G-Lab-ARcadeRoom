<%@page import="java.sql.*" %>
        <link rel="stylesheet" href="style.css?v=3" media="screen">

<%
request.setCharacterEncoding("UTF-8");
String nombre = request.getParameter("nombre");
String imagen = request.getParameter("imagen");
String genero = request.getParameter("genero");
String plataforma = request.getParameter("plataforma");

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/videojuegos", "root", "1608");
    Statement st = con.createStatement();
    st.executeUpdate(
        "INSERT INTO videojuego(nombre, imagen, genero, plataforma) VALUES('"
        +nombre+"','"+imagen+"','"+genero+"','"+plataforma+"')");
    con.close();
    out.println("<p>Registro insertado correctamente.</p>");
}catch(Exception e){
    out.println("<p>Error: "+e.getMessage()+"</p>");
}
%>
<a href="readVideojuego.jsp">Volver a la lista</a>
