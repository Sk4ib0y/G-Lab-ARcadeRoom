package funciones;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "verificarUsuario", urlPatterns = {"/verificarUsuario"})
public class VerificarUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Servlet funciona");
        
        String usuario=req.getParameter("usuario");
        String contrasena=req.getParameter("contrasena");
        
        ValidaUser clase=new ValidaUser();
        boolean encontrado=clase.validarusuario(usuario, contrasena);
        
        if(encontrado)
        {
         resp.sendRedirect("index2.html");
            System.out.println("vista dueno");
        }
        else
        {
         resp.sendRedirect("index.html?error=1");
            System.out.println("vista usuario");
        }
    }

    
}
