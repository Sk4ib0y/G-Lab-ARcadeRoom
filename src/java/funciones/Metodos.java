package funciones;

import java.io.File;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class Metodos {
    
    public List<String> obtenerImagenBD() throws Exception {
        List<String> imagenes=new ArrayList<>();
        Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/videojuegos?user=root&password=1608");
        Statement sentencia=con.createStatement();
        ResultSet rs=sentencia.executeQuery("SELECT imagen FROM videojuego");
        while (rs.next())
        {
         imagenes.add(rs.getString("imagen"));
        }
        
        rs.close();
        sentencia.close();
        con.close();
        
        return imagenes;
        }
    
    public List<String> buscador(String carpetaPath) throws Exception
    {
        List<String>imagenes=obtenerImagenBD();
        List<String> imagenesEncontradas=new ArrayList<>();
        File carpeta = new File(carpetaPath);
        File[] archivos= carpeta.listFiles();
        
        if(archivos==null)
        {
            System.out.println("La carpeta esta vacia o no existe");
        }
        
        for(String imagen : imagenes)
        {
            for(File archivo:archivos)
            {
                if(archivo.getName().contains(imagen))
                {
                    imagenesEncontradas.add(archivo.getName());
                    break;
                }
            }
        }
        return imagenesEncontradas;
    }
}
