package manegbean;

import dao.Negocio;
import modelo.Empresas;
import modelo.Productos;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import java.util.List;

@ManagedBean
@SessionScoped
public class ControlProv {

    // Atributos
    private List<Empresas> listaProveedores;
    private List<Productos> listaProductos;
    private Empresas proveedor = new Empresas();
    private String idEmpresa;
    private Negocio negocio = new Negocio();  // Instancia de la clase Negocio

    // Método para cargar la lista de proveedores
    public void cargarProveedores() {
        listaProveedores = negocio.LisProv();
    }

    // Método para agregar un nuevo proveedor
    public void agregarProveedor() {
        negocio.agregarProveedor(proveedor);
        cargarProveedores();  // Recargar la lista de proveedores después de agregar uno nuevo
    }

    // Método para obtener los productos de un proveedor seleccionado
    public void obtenerProductosPorEmpresa() {
        if (idEmpresa != null && !idEmpresa.isEmpty()) {
            listaProductos = negocio.ListProd(idEmpresa);
        }
    }

    // Getters y Setters
    public List<Empresas> getListaProveedores() {
        return listaProveedores;
    }

    public void setListaProveedores(List<Empresas> listaProveedores) {
        this.listaProveedores = listaProveedores;
    }

    public List<Productos> getListaProductos() {
        return listaProductos;
    }

    public void setListaProductos(List<Productos> listaProductos) {
        this.listaProductos = listaProductos;
    }

    public Empresas getProveedor() {
        return proveedor;
    }

    public void setProveedor(Empresas proveedor) {
        this.proveedor = proveedor;
    }

    public String getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(String idEmpresa) {
        this.idEmpresa = idEmpresa;
    }
}
