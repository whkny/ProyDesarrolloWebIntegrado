package dao;
import java.sql.*;
import util.MySQLConexion;
import java.util.*;
import modelo.*;

public class Negocio {
    
    
    
// LISTA PROVEEDORES
    
public List<Empresas> LisProv(){
     List<Empresas> lista=new ArrayList();
     Connection cn=MySQLConexion.getConexion();
     try{
      String sql="select  id_empresa, nombre_empresa, direccion, telefono, email  from Empresa";
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
    
    
    
    
 public List<Especial> LisEsp(){
     List<Especial> lista=new ArrayList();
     Connection cn=MySQLConexion.getConexion();
     try{
      String sql="select  idesp, nomesp from especialidad";
      PreparedStatement st=cn.prepareStatement(sql);
      ResultSet rs=st.executeQuery();
      while(rs.next()){
          Especial p=new Especial();
          p.setCode(rs.getString(1));
          p.setNomes(rs.getString(2));
          lista.add(p);
      }
     }catch(Exception ex){
        ex.printStackTrace();
     }
     return lista;
 }  



 
 //lista total de alumnos
 public List<Alumno> getAllAlu(){
     List<Alumno> lista=new ArrayList();
     Connection cn=MySQLConexion.getConexion();
     try{
      String sql="select  idalumno,apealumno,nomalumno,idesp,proce\n" +
"   from alumno";
      PreparedStatement st=cn.prepareStatement(sql);
      ResultSet rs=st.executeQuery();
      while(rs.next()){
          Alumno p=new Alumno();
          p.setCoda(rs.getString(1));
          p.setApea(rs.getString(2));
          p.setNoma(rs.getString(3));
          p.setCode(rs.getString(4));
          p.setProce(rs.getString(5));
          lista.add(p);
      }
     }catch(Exception ex){
        ex.printStackTrace();
     }
     return lista;
 }   
 //buscar por codigo
 public Alumno busAlu(String cod){
     Alumno p=null;
     Connection cn=MySQLConexion.getConexion();
     try{
      String sql="select  idalumno,apealumno,nomalumno,idesp,proce\n" +
"   from alumno where idalumno=?";
      PreparedStatement st=cn.prepareStatement(sql);
      st.setString(1, cod);
      ResultSet rs=st.executeQuery();
      if(rs.next()){
          p=new Alumno();
          p.setCoda(rs.getString(1));
          p.setApea(rs.getString(2));
          p.setNoma(rs.getString(3));
          p.setCode(rs.getString(4));
          p.setProce(rs.getString(5));
      }
     }catch(Exception ex){
        ex.printStackTrace();
     }
     return p;
 }   
 
 
 
 
 //lista de alumnos x especialidad
 public List<Alumno> LisAlu(String id){
     List<Alumno> lista=new ArrayList();
     Connection cn=MySQLConexion.getConexion();
     try{
      String sql="select  idalumno,apealumno,nomalumno\n" +
"   from alumno where idesp=?";
      PreparedStatement st=cn.prepareStatement(sql);
      st.setString(1, id);
      ResultSet rs=st.executeQuery();
      while(rs.next()){
          Alumno p=new Alumno();
          p.setCoda(rs.getString(1));
          p.setApea(rs.getString(2));
          p.setNoma(rs.getString(3));
          lista.add(p);
      }
     }catch(Exception ex){
        ex.printStackTrace();
     }
     return lista;
 }   
 //pagos
 public List<Pagos> LisPago(String id){
     List<Pagos> lista=new ArrayList();
     Connection cn=MySQLConexion.getConexion();
     try{
      String sql="select ciclo,ncuota,monto,fecha from pagos where idalumno=?";
      PreparedStatement st=cn.prepareStatement(sql);
      st.setString(1, id);
      ResultSet rs=st.executeQuery();
      while(rs.next()){
          Pagos p=new Pagos();
          p.setCiclo(rs.getString(1));
          p.setNcuota(rs.getInt(2));
          p.setMonto(rs.getDouble(3));
          p.setFecha(rs.getString(4));
          lista.add(p);
      }
     }catch(Exception ex){
        ex.printStackTrace();
     }
     return lista;
 }   
 //de notas 
 public List<Notas> LisNota(String id){
     List<Notas> lista=new ArrayList();
     Connection cn=MySQLConexion.getConexion();
     try{
      String sql="select c.idcurso,nomcurso,exaparcial,exafinal from curso c \n" +
"   join notas n on c.idcurso=n.idcurso where idalumno=?";
      PreparedStatement st=cn.prepareStatement(sql);
      st.setString(1, id);
      ResultSet rs=st.executeQuery();
      while(rs.next()){
          Notas p=new Notas();
          p.setCodc(rs.getString(1));
          p.setNomc(rs.getString(2));
          p.setExp(rs.getInt(3));
          p.setExf(rs.getInt(4));
          lista.add(p);
      }
     }catch(Exception ex){
        ex.printStackTrace();
     }
     return lista;
 }   
 
 
 
 public void adicion(Alumno a){
  Connection cn=MySQLConexion.getConexion();
  try{
  String sql="{call spadiAlu(?,?,?,?)}";   
  CallableStatement st=cn.prepareCall(sql);
  st.setString(1, a.getApea());
  st.setString(2, a.getNoma());
  st.setString(3, a.getCode());
  st.setString(4, a.getProce());
  st.executeUpdate();
 }catch(Exception ex){
     ex.printStackTrace();
 }
 
}
//modificacion
public void cambia(Alumno a){
  Connection cn=MySQLConexion.getConexion();
  try{
  String sql="{call spModiAlu(?,?,?,?,?)}";   
  CallableStatement st=cn.prepareCall(sql);
  st.setString(1, a.getCoda());
  st.setString(2, a.getApea());
  st.setString(3, a.getNoma());
  st.setString(4, a.getCode());
  st.setString(5, a.getProce());
  st.executeUpdate();
 }catch(Exception ex){
     ex.printStackTrace();
 }
 
} 
 //borrar
public void borra(String cod){
  Connection cn=MySQLConexion.getConexion();
  try{
  String sql="{call spDelAlu(?)}";   
  CallableStatement st=cn.prepareCall(sql);
  st.setString(1, cod);
  st.executeUpdate();
 }catch(Exception ex){
     ex.printStackTrace();
 }
 
} 
 
 
}