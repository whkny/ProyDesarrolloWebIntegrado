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
        <%@include file="menu1.jsp"%>
        <%
            List<Alumno> alu = (ArrayList<Alumno>) request.getAttribute("dato");

        %>    
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-header">
                            <h3>${titulo}</h3>
                        </div>    
                        <div class="card-body">
                            <form action="control?opc=${nro}" method="post">
                                <div class="form-group">
                                    <input type="hidden" name="coda" value="${alu.getCoda()}">      
                                </div>      
                                <div class="form-group">
                                    <label>Ingrese Apellido</label>
                                    <input class="form-control" name="ape" value="${alu.getApea()}">      
                                </div>      
                                <div class="form-group">
                                    <label>Ingrese Nombre</label>
                                    <input class="form-control" name="noma" value="${alu.getNoma()}">      
                                </div>      
                                <div class="form-group">
                                    <label>Especialidad</label>
                                    <input class="form-control" name="codes" value="${alu.getCode()}">      
                                </div>      
                                <div class="form-group">
                                    <label>Procedencia</label>
                                    <input class="form-control" name="proce" value="${alu.getProce()}">      
                                </div>      
                                <button class="btn btn-success">
                                    <i class="far fa-save"></i>
                                    Grabar
                                </button>
                            </form>           
                        </div>
                    </div>
                </div>   
                <div class="col-sm-8">
                    <h2 class="text-blue">Lista de Alumnos</h2>
                    <table class="table table-hover" id="tablax">
                        <thead>
                            <tr class="text-white bg-dark">
                                <th>Codigo<th>Nombre<td>Apellido<th>Foto<td>accion      
                        </thead>         
                        <%           for (Alumno x : alu) {
                                out.print("<tr><td>" + x.getCoda() + "<td>" + x.getNoma() + "<td>" + x.getApea());
                        %>
                        <td><img src="fotos/<%=x.getCoda()%>.jpg" width="90" height="90"
                                 class="img-circle" onerror="src='fotos/sin_foto.jpg'">
                        <td><a href="control?opc=5&id=<%=x.getCoda()%>" class="btn btn-success">
                                <i class="far fa-edit"></i>
                            </a>
                            <a href="#" onclick="valida('<%=x.getCoda()%>')" class="btn btn-success">
                                <i class="far fa-trash-alt"></i>    
                            </a>

                            <%
                                }
                            %>     
                    </table>            
                </div>
            </div>  
        </div> 
        <script>
            function valida(cod) {
                alert(cod);
                swal({
                    title: "Seguro de borrar?",
                    text: "una vez borrado,ya no se puede recuperar!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((willDelete) => {
                            if (willDelete) {
                             //llamar al servlet   
                         location.href='control?opc=6&id=>'+cod;    
                             swal("Poof! Your record has been deleted!", {
                                    icon: "success",
                                });
                                
                                
                            } else {
                                swal("Your imaginary file is safe!");
                            }
                        });

            }
        </script>    



        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <!-- JQUERY -->
        <script src="https://code.jquery.com/jquery-3.4.1.js"
                integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
        </script>
        <!-- DATATABLES -->
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js">
        </script>
        <!-- BOOTSTRAP -->
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js">
        </script>
        <script>
            $(document).ready(function () {
                $('#tablax').DataTable({
                    language: {
                        processing: "Tratamiento en curso...",
                        search: "Buscar&nbsp;:",
                        lengthMenu: "Agrupar de _MENU_ items",
                        info: "Mostrando del item _START_ al _END_ de un total de _TOTAL_ items",
                        infoEmpty: "No existen datos.",
                        infoFiltered: "(filtrado de _MAX_ elementos en total)",
                        infoPostFix: "",
                        loadingRecords: "Cargando...",
                        zeroRecords: "No se encontraron datos con tu busqueda",
                        emptyTable: "No hay datos disponibles en la tabla.",
                        paginate: {
                            first: "Primero",
                            previous: "Anterior",
                            next: "Siguiente",
                            last: "Ultimo"
                        },
                        aria: {
                            sortAscending: ": active para ordenar la columna en orden ascendente",
                            sortDescending: ": active para ordenar la columna en orden descendente"
                        }
                    },
                    scrollY: 400,
                    lengthMenu: [[7, 10, 25, -1], [7, 10, 25, "All"]],
                });
            });
        </script>

    </body>
</html>




