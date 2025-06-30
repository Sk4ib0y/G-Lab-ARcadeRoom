<%@page import="java.sql.*" %>
        <link rel="stylesheet" href="style.css?v=3" media="screen">

<%
request.setCharacterEncoding("UTF-8");
String elemento = request.getParameter("elemento");
String precio = request.getParameter("precio");

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/videojuegos", "root", "1608");
    Statement st = con.createStatement();
    st.executeUpdate(
        "INSERT INTO menu(elemento, precio) VALUES('"
        +elemento+"','"+precio+"')");
    con.close();
    out.println("<p>Registro insertado correctamente.</p>");
}catch(Exception e){
    out.println("<p>Error: "+e.getMessage()+"</p>");
}
%>
<a href="readMenu.jsp">Volver a la lista</a>
