package funciones;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class validaUser {

    public boolean validarusuario(String usuario, String contrasena) {
        try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/videojuegos", "root", "1608");     
            PreparedStatement ps = con.prepareStatement("SELECT * FROM usuario WHERE usuario=? and contrasena=?");
            ps.setString(1, usuario);
            ps.setString(2, contrasena);

            ResultSet rs = ps.executeQuery();
            boolean existe=rs.next();
            System.out.println("Usuario existente en la bd? " + existe);

            return existe;

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
