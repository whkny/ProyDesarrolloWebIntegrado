
package modelo;

public class Productos {
 
    
  private String  id_producto ;
  private String nombre_producto ;
  private String descripcion;
  private double precio ;
  private int stock;
  private String id_empresa;
  private String id_marca;
    private String nombreEmpresa;
    private String marcaProducto;

    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    public String getMarcaProducto() {
        return marcaProducto;
    }

    public void setMarcaProducto(String marcaProducto) {
        this.marcaProducto = marcaProducto;
    }

    public String getId_producto() {
        return id_producto;
    }

    public void setId_producto(String id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
    if (precio < 0) {
        throw new IllegalArgumentException("El precio no puede ser negativo.");
    }
    this.precio = precio;
}

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
    if (stock < 0) {
        throw new IllegalArgumentException("El stock no puede ser negativo.");
    }
    this.stock = stock;
}

    public String getId_empresa() {
        return id_empresa;
    }

    public void setId_empresa(String id_empresa) {
        this.id_empresa = id_empresa;
    }

    public String getId_marca() {
        return id_marca;
    }

    public void setId_marca(String id_marca) {
        this.id_marca = id_marca;
    }
    
    
}
