<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="modelo.Empresas"%>
<%@ page import="dao.Negocio"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Proveedores</title>
    <!-- Enlazamos el archivo de estilos CSS -->
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

<header>
    <h1>Sistema Control de Ventas - Proveedores</h1>
</header>

    
<nav>
    <a href="Menu_Principal.jsp">INICIO</a>
    <a href="pagCrudProv.jsp">PROVEEDORES</a>
    <a href="pagVentas.jsp">VENTAS</a>
    <a href="pagProducto.jsp">PRODUCTOS</a>
</nav>

<h1>Gestión de Proveedores</h1>

<!-- Formulario para agregar/editar proveedor -->
<form action="Control" method="post">
    <input type="hidden" name="opc" value="2" id="form_opc" />
    <input type="hidden" name="id" id="id" value=""/>

    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" id="nombre" required />

    <label for="direccion">Dirección:</label>
    <input type="text" name="direccion" id="direccion" required />

    <label for="telefono">Teléfono:</label>
    <input type="text" name="telefono" id="telefono" required />

    <label for="email">Email:</label>
    <input type="email" name="email" id="email" required />

    <button type="submit">Guardar Proveedor</button>
</form>

<h2>Lista de Proveedores</h2>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Dirección</th>
            <th>Teléfono</th>
            <th>Email</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <%
            Negocio negocio = new Negocio();
            List<Empresas> listaProveedores = negocio.LisProv();
            for (Empresas proveedor : listaProveedores) {
        %>
        <tr>
            <td><%= proveedor.getCod_emp() %></td>
            <td><%= proveedor.getNom_emp() %></td>
            <td><%= proveedor.getDirec_emp() %></td>
            <td><%= proveedor.getTelef_emp() %></td>
            <td><%= proveedor.getEmail_emp() %></td>
            <td class="acciones">
                <form action="Control" method="post" style="display:inline;">
                    <input type="hidden" name="opc" value="3" />
                    <input type="hidden" name="id" value="<%= proveedor.getCod_emp() %>" />
                    <input type="hidden" name="nombre" value="<%= proveedor.getNom_emp() %>" />
                    <input type="hidden" name="direccion" value="<%= proveedor.getDirec_emp() %>" />
                    <input type="hidden" name="telefono" value="<%= proveedor.getTelef_emp() %>" />
                    <input type="hidden" name="email" value="<%= proveedor.getEmail_emp() %>" />
                    <button type="submit" onclick="cargarDatos('<%= proveedor.getCod_emp() %>', '<%= proveedor.getNom_emp() %>', '<%= proveedor.getDirec_emp() %>', '<%= proveedor.getTelef_emp() %>', '<%= proveedor.getEmail_emp() %>'); return false;">Editar</button>
                </form>
                <form action="Control" method="post" style="display:inline;">
                    <input type="hidden" name="opc" value="4" />
                    <input type="hidden" name="id" value="<%= proveedor.getCod_emp() %>" />
                    <button type="submit" onclick="return confirm('¿Estás seguro de que deseas eliminar este proveedor?');">Eliminar</button>
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

<!-- Script para cargar datos en el formulario al editar -->
<script>
    function cargarDatos(id, nombre, direccion, telefono, email) {
        document.getElementById("id").value = id;
        document.getElementById("nombre").value = nombre;
        document.getElementById("direccion").value = direccion;
        document.getElementById("telefono").value = telefono;
        document.getElementById("email").value = email;
        document.getElementById("form_opc").value = 3;
    }
</script>

<!-- jQuery y DataTables -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

<script>
    $(document).ready(function() {
    // Inicializar DataTables
    $('table').DataTable({
        lengthMenu: [[7, 10, 25, -1], [7, 10, 25, "Todos"]],
        language: {
            url: 'https://cdn.datatables.net/plug-ins/1.11.5/i18n/Spanish.json',  
            paginate: {
                first: "Primero",   
                last: "Último",      
                next: "Siguiente",   
                previous: "Anterior"  
            },
 
            info: "Mostrando del _START_ al _END_ de _TOTAL_ Resultados",
            infoEmpty: "No hay resultados disponibles",
            infoFiltered: "(filtrado de _MAX_ resultados totales)",
            lengthMenu: "Mostrando _MENU_ Resultados",
            search: "Buscar:",
            processing: "Procesando...",
        },
        paging: true,
        pagingType: "full_numbers",
        searchDelay: 250,
        columnDefs: [
            { targets: -1, orderable: false }  
        ]
    });
});
</script>

<!-- Pie de página -->
<footer>
    <p>UTP - 2024</p>
</footer>

</body>
</html>
