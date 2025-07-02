package funciones;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "verificarimagen", urlPatterns = {"/verificarimagen"})
public class Verificarimagen extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ValidaImg metodos = new ValidaImg();
        String rutaReal = getServletContext().getRealPath("/imagenesvideojuegos");

        try {
            List<String> imagenesEncontradas = metodos.buscador(rutaReal);
            request.setAttribute("imagenes", imagenesEncontradas);
            request.getRequestDispatcher("/verificar.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
