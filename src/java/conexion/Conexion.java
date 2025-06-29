package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Conexion 
{
    private Connection conexion=null;
    private Statement sentencia=null;
    public static String contraseña="1608";
    public static String user="root";
    public static String bd="videojuegos";
    public static String server = "127.0.0.1";

    public Conexion() {
    }
    
    public boolean testDriver()
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            return true;
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        return false;
    }

    private boolean loadConnection(String user, String password, String db, String server)
    {
        String url = null;
        if (user == null || password == null || db == null || server == null)
        {
            return false;
        }
        if ("".equals(user) || "".equals(password) || "".equals(db) || "".equals(server))
        {
            return false;
        }
        url = String.format("jdbc:mysql://%s/%s?user=%s&password=%s", server, db, user, password);
        try
        {
            if (!testDriver( ) )
            {
                return false;
            }
            conexion = DriverManager.getConnection(url);
            return conexion != null;
        }
        catch (SQLException ex)
        {
            System.out.println("Error al intentar conectar");
            ex.printStackTrace();
        }
        return false;
    }

    public boolean openConnection()
    {
        try
        {
            if( conexion == null || conexion.isClosed() )
            {
                if( !loadConnection( user, contraseña, bd, server ) )
                {
                    return false;
                }
            }
            return true;
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            return false;
        }
    }

    public void closeConnection( )
    {
        try
        {
            if (conexion == null)
            {
                return;
            }
            if (conexion.isClosed())
            {
                return;
            }
            conexion.close();
        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
    }

    public Connection getConexion() {
        return conexion;
    }

    public void setConexion(Connection conexion) {
        this.conexion = conexion;
    }

    
}

