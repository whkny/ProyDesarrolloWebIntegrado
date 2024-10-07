<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
        <style type="text/css">
            .rojo{
                color: red;
                font-style: italic;
            }
            .azul{
                color:blue;
                font-weight: bold;
            }
            
            
        </style>
    
    </head>
    <body>
     <%
       List<Notas> lista=(ArrayList<Notas>)request.getAttribute("dato");
     //  String nome=(String)request.getParameter("nome");
     %>    
     <h2 class="text-blue">Lista de Notas</h2>
     <a href="#" onclick="history.back()" class="btn btn-success">Retornar
     </a> 
     <table class="table table-hover">
         <thead>
             <tr class="text-white bg-dark">
                 <th>Codc<th>Curso<th>Exp<td>Exf<td>Prome<td>Obser      
         </thead>         
       <% double sm=0;
          int con=0;
          String est;
          for(Notas x:lista){
          if(x.prome()>=11.5) est="azul"; else est="rojo";
          
          out.print("<tr><td>"+x.getCodc()+"<td>"+x.getNomc()+"<td>"
          +x.getExp()+"<td>"+x.getExf()+"<td class="+est+">"+x.prome()+"<td>"+x.Obser());
          sm=sm+x.prome(); con++;
           }
           double pcic=con>0?sm/con:0;
          %>
          <tr><td colspan="4">Promedio de ciclo<td><%=pcic%>    
     </table>
    </body>
</html>




