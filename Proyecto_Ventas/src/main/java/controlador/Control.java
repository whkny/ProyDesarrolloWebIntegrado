package controlador;

import dao.Negocio;
import modelo.Empresas;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Control", urlPatterns = {"/Control"})
public class Control extends HttpServlet {

    Negocio negocio = new Negocio();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int op = Integer.parseInt(request.getParameter("opc"));

        switch (op) {
            case 2: grabarProveedor(request, response);
                break;
            case 3: editarProveedor(request, response);
                break;
            case 4: borrarProveedor(request, response);
                break;
            default: response.sendRedirect("pagCrudProv.jsp");
                break;
        }
    }

    private void grabarProveedor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenemos los datos del formulario
        String id = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String email = request.getParameter("email");

        // Creamos una nueva instancia de la clase Empresas
        Empresas proveedor = new Empresas();
        proveedor.setCod_emp(id);
        proveedor.setNom_emp(nombre);
        proveedor.setDirec_emp(direccion);
        proveedor.setTelef_emp(telefono);
        proveedor.setEmail_emp(email);

        // Llamamos al método del DAO para grabar el proveedor
        negocio.agregarProveedor(proveedor);

        // Redirigimos a la página de proveedores
        response.sendRedirect("pagCrudProv.jsp");
    }

    private void editarProveedor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenemos los datos del formulario
        String id = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String email = request.getParameter("email");

        // Creamos una instancia de la clase Empresas
        Empresas proveedor = new Empresas();
        proveedor.setCod_emp(id);
        proveedor.setNom_emp(nombre);
        proveedor.setDirec_emp(direccion);
        proveedor.setTelef_emp(telefono);
        proveedor.setEmail_emp(email);

        // Llamamos al método para editar el proveedor
        negocio.modificarProveedor(proveedor);

        // Redirigimos a la pagina de proveedores
        response.sendRedirect("pagCrudProv.jsp");
    }

    private void borrarProveedor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenemos el ID del proveedor a borrar
        String id = request.getParameter("id");

        // Llamamos al método del DAO para borrar el proveedor
        negocio.borrarProveedor(id);

        // Redirigimos a la pagina de proveedores
        response.sendRedirect("pagCrudProv.jsp");
    }
}
