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
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Colores personalizados */
        :root {
            --dark-color: #243642; /* Color para la cabecera, pie de página */
            --medium-dark-color: #387478; /* Color para botones y enlaces */
            --light-color: #629584; /* Color de fondo de secciones */
            --extra-light-color: #E2F1E7; /* Color de fondo general */
        }

        /* Estilos generales */
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: var(--extra-light-color); /* Fondo muy claro */
            color: var(--dark-color); /* Texto en color oscuro */
        }

        /* Estilos de la cabecera y el menú */
        header {
            background-color: var(--dark-color); /* Cabecera con color oscuro */
            color: white;
            padding: 20px;
            text-align: center;
        }

        nav {
            background-color: var(--medium-dark-color); /* Color intermedio para el menú */
            padding: 10px;
            text-align: center;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 18px;
            padding: 8px 16px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: var(--light-color); /* Color claro al hacer hover */
        }

        /* Estilos del contenido */
        h1, h2 {
            color: var(--dark-color);
            margin-top: 20px;
            text-align: center;
        }

        form {
            background-color: var(--light-color); /* Fondo de formularios en color claro */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            max-width: 600px;
        }

        input[type="text"],
        input[type="email"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid var(--dark-color); /* Borde oscuro */
            border-radius: 4px;
        }

        button {
            background-color: var(--medium-dark-color); /* Botones en color intermedio */
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 5px;
        }

        button:hover {
            background-color: var(--dark-color); /* Hover en color más oscuro */
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid var(--light-color); /* Bordes en color claro */
        }

        th {
            background-color: var(--extra-light-color); /* Cabecera de tabla en color claro */
        }

        tr:hover {
            background-color: var(--extra-light-color); /* Hover en filas de tabla */
        }

        /* Estilo de acciones en la tabla */
        .acciones button {
            background-color: var(--dark-color); /* Color oscuro para botones de acciones */
        }

        .acciones button:hover {
            background-color: var(--medium-dark-color); /* Hover en los botones de acciones */
        }

        /* Estilo del pie de página */
        footer {
            background-color: var(--dark-color); /* Pie de página con color oscuro */
            color: white;
            text-align: center;
            padding: 10px;
            position: relative; /* Cambiado de absolute a relative */
            bottom: 0;
            width: 100%;
            margin-top: 20px; /* Espaciado para evitar superposición con el contenido */
        }
    </style>
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
    <a href="tel:+123456789" class="btn-llamar">LLAMAR AHORA</a>
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

<!-- Agregar jQuery y DataTables -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

<script>
    $(document).ready(function() {
    // Inicializar DataTables
    $('table').DataTable({
        lengthMenu: [[7, 10, 25, -1], [7, 10, 25, "Todos"]],
        language: {
            url: 'https://cdn.datatables.net/plug-ins/1.11.5/i18n/Spanish.json', // Cargar idioma español
            paginate: {
                first: "Primero",   // Texto para el primer botón
                last: "Último",     // Texto para el último botón
                next: "Siguiente",   // Texto para el botón siguiente
                previous: "Anterior" // Texto para el botón anterior
            },
            // Otros textos en español
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
            { targets: -1, orderable: false } // Deshabilitar el ordenamiento en la columna de acciones
        ]
    });
});
</script>

<!-- Pie de página -->
<footer>
    <p>Derechos reservados - 2024</p>
</footer>

</body>
</html>
