<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Especial,dao.Negocio" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
  <%@include file="menu1.jsp"%>
     <%
       Negocio obj=new Negocio();  
     %>    
     <h2 class="text-blue">Lista de Especialidades</h2>
     <table class="table table-hover">
         <thead>
             <tr class="text-white bg-dark">
                 <th>Codigo<th>Nombre<th>accion      
         </thead>         
       <%
          for(Especial x:obj.LisEsp()){
          out.print("<tr><td>"+x.getCode()+"<td>"+x.getNomes());
          %>
          <td><a href="control?opc=1&id=<%=x.getCode()%>&nome=<%=x.getNomes()%>" class="btn btn-success">Alumno</a>   
          <%
           }   
      %>     
     </table>
    </body>
</html>




