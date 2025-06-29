package funciones;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "verificarUsuario", urlPatterns = {"/verificarUsuario"})
public class verificarUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Servlet funciona");
        
        String usuario=req.getParameter("usuario");
        String contrasena=req.getParameter("contrasena");
        
        validaUser clase=new validaUser();
        boolean encontrado=clase.validarusuario(usuario, contrasena);
        
        if(encontrado)
        {
         resp.sendRedirect("vistadueno.jsp");//Redirige a la vista dueño aun no implementado  
            System.out.println("vista dueno");
        }
        else
        {
         resp.sendRedirect("index.html?error=1");//Redirige a la vista usuario   
            System.out.println("vista usuario");
        }
    }

    
}
