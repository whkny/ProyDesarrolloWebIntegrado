<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Productos" %>
<%@ page import="modelo.Empresas" %>
<%@ page import="dao.Negocio" %>
<!DOCTYPE html>
<html>
<head>
    <title>Listado de Productos</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Listado de Productos</h1>
        </header>

        <!-- Filtros -->
        <div class="filtros">
            <label for="buscarGeneral">Buscar: </label>
            <input type="text" id="buscarGeneral" placeholder="Buscar productos...">

            <label for="filtroProveedor">Filtrar por Proveedor: </label>
            <select id="filtroProveedor">
                <option value="">Todos los Proveedores</option>
                <%
                    // Obtener la lista de proveedores
                    Negocio negocio = new Negocio();
                    List<Empresas> listaProveedores = negocio.LisProv();
                    for (Empresas proveedor : listaProveedores) {
                %>
                    <option value="<%= proveedor.getNom_emp() %>"><%= proveedor.getNom_emp() %></option>
                <%
                    }
                %>
            </select>
        </div>

        <!-- Tabla de productos -->
        <table id="tablaProductos">
            <thead>
                <tr>
                    <th>ID Producto</th>
                    <th>Nombre Producto</th>
                    <th>Descripción</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th>Proveedor</th>
                    <th>Marca</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Obtener la lista de productos
                    List<Productos> listaProductos = negocio.ListProducto();
                    for (Productos producto : listaProductos) {
                %>
                <tr>
                    <td><%= producto.getId_producto() %></td>
                    <td><%= producto.getNombre_producto() %></td>
                    <td><%= producto.getDescripcion() %></td>
                    <td><%= producto.getPrecio() %></td>
                    <td><%= producto.getStock() %></td>
                    <td><%= producto.getNombreEmpresa() %></td>
                    <td><%= producto.getMarcaProducto() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <footer>
            <a href="Menu_Principal.jsp" class="boton-regreso">Volver al Menú Principal</a>
        </footer>
    </div>

    <!-- Scripts para DataTables y jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
            // Inicializar DataTables
            var table = $('#tablaProductos').DataTable({
                "lengthMenu": [[7, 10, 25, -1], [7, 10, 25, "Todos"]],
                "searching": true, // Permitir búsqueda general, pero oculta la caja predeterminada
                "paging": true,    // Activar la paginación
                "info": true,      // Mostrar información
                "dom": 'lrtip',    // Ocultar el search box por defecto
                "language": {
                    "lengthMenu": "Mostrar _MENU_ registros por página",
                    "zeroRecords": "No se encontraron resultados",
                    "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                    "infoEmpty": "Mostrando 0 a 0 de 0 registros",
                    "infoFiltered": "(filtrado de _MAX_ registros en total)",
                    "search": "Buscar:",
                    "paginate": {
                        "first": "Primero",
                        "last": "Último",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    },
                    "loadingRecords": "Cargando...",
                    "processing": "Procesando...",
                    "emptyTable": "No hay datos disponibles en la tabla",
                    "thousands": ",",
                    "decimal": ".",
                    "aria": {
                        "sortAscending": ": activar para ordenar la columna de manera ascendente",
                        "sortDescending": ": activar para ordenar la columna de manera descendente"
                    }
                }
            });

            // Filtrar por proveedor
            $('#filtroProveedor').on('change', function() {
                var selectedProveedor = $(this).val();
                if (selectedProveedor) {
                    table.columns(5).search('^' + selectedProveedor + '$', true, false).draw();
                } else {
                    table.columns(5).search('').draw(); // Mostrar todos si no hay proveedor seleccionado
                }
            });

            // Búsqueda general
            $('#buscarGeneral').on('keyup', function() {
                table.search(this.value).draw();
            });
        });
    </script>
</body>
</html>
