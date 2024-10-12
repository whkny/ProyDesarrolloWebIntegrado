package dao;
import java.sql.*;
import util.MySQLConexion;
import java.util.*;
import modelo.*;

public class Negocio {
    
// PROYECTO VENTAS    
    
// LISTA PROVEEDORES
    
public List<Empresas> LisProv(){
     List<Empresas> lista=new ArrayList();
     Connection cn=MySQLConexion.getConexion();
     try{
      String sql="select  id_empresa, nombre_empresa, direccion, telefono, email  from empresa";
      PreparedStatement st=cn.prepareStatement(sql);
      ResultSet rs=st.executeQuery();
      while(rs.next()){
          Empresas p=new Empresas();
          p.setCod_emp(rs.getString(1));
          p.setNom_emp(rs.getString(2));
          p.setDirec_emp(rs.getString(3));
          p.setTelef_emp(rs.getString(4));
          p.setEmail_emp(rs.getString(5));
         
          lista.add(p);
      }
     }catch(Exception ex){
        ex.printStackTrace();
     }
     return lista;
 }      
    

// LISTA DE PRODUCTOS POR PROVEEDOR

 public List<Productos> ListProd(String id){
     List<Productos> lista=new ArrayList();
     Connection cn=MySQLConexion.getConexion();
     try{
      String sql="select  idalumno,apealumno,nomalumno\n" +
"   from alumno where idesp=?";
      PreparedStatement st=cn.prepareStatement(sql);
      st.setString(1, id);
      ResultSet rs=st.executeQuery();
      while(rs.next()){
          Productos p=new Productos();
          p.setId_producto(rs.getString(1));
          p.setNombre_producto(rs.getString(2));
          p.setDescripcion(rs.getString(3));
          p.setId_empresa(rs.getString(4));
          p.setId_marca(rs.getString(5));
          p.setPrecio(rs.getDouble(6));
          p.setStock(rs.getInt(7));
          lista.add(p);
      }
     }catch(Exception ex){
        ex.printStackTrace();
     }
     return lista;
 }   


 } 
    