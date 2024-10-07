<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
     <%
       List<Alumno> alu=(ArrayList<Alumno>)request.getAttribute("dato");
       String nome=(String)request.getParameter("nome");
     %>    
     <h2 class="text-blue">Lista de Alumnos de  <%=nome%></h2>
     <table class="table table-hover">
         <thead>
             <tr class="text-white bg-dark">
                 <th>Codigo<th>Nombre y Apellido<th>Foto<td>accion      
         </thead>         
       <%
          for(Alumno x:alu){
          out.print("<tr><td>"+x.getCoda()+"<td>"+x.apeNom());
          %>
          <td><img src="fotos/<%=x.getCoda()%>.jpg" width="90" height="90"
                   class="img-circle" onerror="src='fotos/sin_foto.jpg'">
          <td><a href="control?opc=2&id=<%=x.getCoda()%>" class="btn btn-success">pagos</a>
              <a href="control?opc=3&id=<%=x.getCoda()%>" class="btn btn-success">Notas</a>
              
          <%
           }   
      %>     
     </table>
    </body>
</html>




