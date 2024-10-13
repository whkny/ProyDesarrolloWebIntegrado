<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Empresas,dao.Negocio" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LISTA EMPRESAS</title>
        <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
  <%@include file="menu1.jsp"%>
     <%
       Negocio obj=new Negocio();  
     %>    
     <h2 class="text-blue">Lista de Proveedores</h2>
     <table class="table table-hover">
         <thead>
             <tr class="text-white bg-dark">
                 <th>Codigo<th>Nombre<th>Telefono<th>Inventario      
         </thead>         
       <%
          for(Empresas x:obj.LisProv()){
          out.print("<tr><td>"+x.getCod_emp()+"<td>"+x.getNom_emp()+"<td>"+x.getTelef_emp());
          %>
          <td><a href="control?opc=1&id=<%=x.getCod_emp()%>&nome=<%=x.getNom_emp()%>" class="btn btn-success">Productos</a>   
          <%
           }   
      %>     
     </table>
    </body>
</html>




