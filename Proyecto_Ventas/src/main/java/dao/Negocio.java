package dao;

import java.sql.*;
import util.MySQLConexion;
import java.util.*;
import modelo.*;

public class Negocio {

    // LISTA PROVEEDORES
    public List<Empresas> LisProv() {
        List<Empresas> lista = new ArrayList<>();
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            cn = MySQLConexion.getConexion();
            String sql = "SELECT id_empresa, nombre_empresa, direccion, telefono, email FROM empresa";
            st = cn.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                Empresas p = new Empresas();
                p.setCod_emp(rs.getString("id_empresa"));
                p.setNom_emp(rs.getString("nombre_empresa"));
                p.setDirec_emp(rs.getString("direccion"));
                p.setTelef_emp(rs.getString("telefono"));
                p.setEmail_emp(rs.getString("email"));

                lista.add(p);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return lista;
    }

    // LISTA DE PRODUCTOS POR PROVEEDOR
    public List<Productos> ListProd(String id) {
        List<Productos> lista = new ArrayList<>();
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            cn = MySQLConexion.getConexion();
            String sql = "SELECT id_producto, nombre_producto, descripcion, precio, stock, id_empresa, id_marca FROM producto WHERE id_empresa=?";
            st = cn.prepareStatement(sql);
            st.setString(1, id);
            rs = st.executeQuery();

            while (rs.next()) {
                Productos p = new Productos();
                p.setId_producto(rs.getString("id_producto"));
                p.setNombre_producto(rs.getString("nombre_producto"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setPrecio(rs.getDouble("precio"));
                p.setStock(rs.getInt("stock"));
                p.setId_empresa(rs.getString("id_empresa"));
                p.setId_marca(rs.getString("id_marca"));
                lista.add(p);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return lista;
    }
    
    
    
    
    
    
    


    

// Método para agregar un nuevo proveedor
public boolean agregarProveedor(Empresas proveedor) {
    Connection cn = MySQLConexion.getConexion();
    boolean exito = false; // Variable para indicar el éxito de la operación
    try {
        String sql = "{CALL AgregarProveedor(?, ?, ?, ?)}"; // Llamada al procedimiento (sin el id_empresa)
        PreparedStatement st = cn.prepareStatement(sql);
        
        // Estableciendo los parámetros del procedimiento (sin el id_empresa)
        st.setString(1, proveedor.getNom_emp());
        st.setString(2, proveedor.getDirec_emp());
        st.setString(3, proveedor.getTelef_emp());
        st.setString(4, proveedor.getEmail_emp());

        // Ejecutando el procedimiento
        st.executeUpdate();
        exito = true; // Si no hay excepciones, la operación fue exitosa
    } catch (SQLException ex) {
        ex.printStackTrace(); // Manejo de excepciones
    } finally {
        try {
            if (cn != null) {
                cn.close(); // Cerrar la conexión
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return exito; // Retornar el resultado de la operación
}



    
// Método para modificar proveedor
public void modificarProveedor(Empresas proveedor) {
    Connection cn = MySQLConexion.getConexion();
    try {
        String sql = "{CALL modificarProveedor(?, ?, ?, ?, ?)}";
        CallableStatement st = cn.prepareCall(sql);
        st.setString(1, proveedor.getCod_emp());
        st.setString(2, proveedor.getNom_emp());
        st.setString(3, proveedor.getDirec_emp());
        st.setString(4, proveedor.getTelef_emp());
        st.setString(5, proveedor.getEmail_emp());
        st.execute();
    } catch (SQLException ex) {
        ex.printStackTrace();
    } finally {
        try {
            if (cn != null) {
                cn.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}

// Método para borrar proveedor
public void borrarProveedor(String codEmp) {
    Connection cn = MySQLConexion.getConexion();
    try {
        String sql = "{CALL borrarProveedor(?)}";
        CallableStatement st = cn.prepareCall(sql);
        st.setString(1, codEmp);
        st.execute();
    } catch (SQLException ex) {
        ex.printStackTrace();
    } finally {
        try {
            if (cn != null) {
                cn.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}

// LISTA Productos
    public List<Productos> ListProducto() {
        List<Productos> lista = new ArrayList<>();
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            cn = MySQLConexion.getConexion();
            String sql = "select p.id_producto, p.nombre_producto, p.descripcion, p.precio, p.stock, e.nombre_empresa, m.marca_producto  from producto p "
                    + "left join empresa e on e.id_empresa = p.id_empresa "
                    + "left join marca m on m.id_marca = p.id_marca";
            st = cn.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                Productos p = new Productos();
                p.setId_producto(rs.getString("id_producto"));
                p.setNombre_producto(rs.getString("nombre_producto"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setPrecio(rs.getDouble("precio"));
                p.setStock(rs.getInt("stock"));
                p.setNombreEmpresa(rs.getString("nombre_empresa"));
                p.setMarcaProducto(rs.getString("marca_producto"));

                lista.add(p);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return lista;
    }

    
   // GRAFICOS 
    
    
   public List<Integer> LisMes(int anio) {
        List<Integer> ventasPorMes = new ArrayList<>();
        String sql = "CALL spVentasPorMes(?)"; // Llamar al procedimiento almacenado

        try (Connection con = MySQLConexion.getConexion(); 
             PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setInt(1, anio);
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {
                ventasPorMes.add(rs.getInt("total")); // Obtener total de ventas por mes
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ventasPorMes;
    }

    
 // Nuevo método para obtener ventas por marca
public List<MarcaVenta> obtenerVentasPorMarca() {
    List<MarcaVenta> listaMarcas = new ArrayList<>();
    String sql = "CALL spVentasPorMarca()"; // Llamar al procedimiento almacenado

    try (Connection con = MySQLConexion.getConexion(); 
         PreparedStatement pst = con.prepareStatement(sql)) {
        ResultSet rs = pst.executeQuery();
        
        while (rs.next()) {
            MarcaVenta marcaVenta = new MarcaVenta();
            marcaVenta.setMarca(rs.getString("marca"));
            marcaVenta.setTotal(rs.getDouble("total")); 
            listaMarcas.add(marcaVenta); 
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return listaMarcas; // Retornar la lista de ventas por marca
}

    
    
    
    
}
