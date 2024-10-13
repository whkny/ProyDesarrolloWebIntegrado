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
    <link rel="stylesheet" href="styles.css"> <!-- Mantén el enlace a tu archivo CSS general -->
    <style>
        /* Estilos generales */
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100%;
            background-color: #f4f4f4;
        }

        /* Estilos de la cabecera y el menú (copiados del menú principal) */
        header {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
        }

        header h1 {
            margin: 0;
            font-size: 24px;
        }

        nav {
            position: absolute;
            top: 10px;
            right: 20px;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            background-color: rgba(0, 0, 0, 0.6);
            padding: 10px 20px;
            border-radius: 5px;
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
            background-color: rgba(255, 255, 255, 0.3);
        }

        /* Estilos para los formularios y tablas de proveedores */
        h1, h2 {
            color: #333;
            margin-top: 100px; /* Espacio para el menú superior */
        }

        form {
            margin-bottom: 20px;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        input[type="email"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #5cb85c;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 5px;
        }

        button:hover {
            background-color: #4cae4c;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .acciones button {
            background-color: #d9534f;
        }

        .acciones button:hover {
            background-color: #c9302c;
        }

        /* Estilo del pie de página */
        footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            padding: 10px;
            background-color: rgba(0, 0, 0, 0.5);
            text-align: center;
            color: white;
        }
    </style>
</head>
<body>

<!-- Cabecera y menú reutilizados del menú principal -->
<header>
    <h1> Sistema Control de Ventas - Proveedores</h1>
</header>

<nav>
    <a href="Menu_Principal.jsp">INICIO</a>
    <a href="pagCrudProv.jsp">PROVEEDORES</a>
    <a href="pagVentas.jsp">VENTAS</a>
    <a href="pagProducto.jsp">PRODUCTOS</a>
    <a href="tel:+123456789" class="btn-llamar">LLAMAR AHORA</a>
</nav>

<!-- Contenido de la página de gestión de proveedores -->
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
        document.getElementById('id').value = id;
        document.getElementById('nombre').value = nombre;
        document.getElementById('direccion').value = direccion;
        document.getElementById('telefono').value = telefono;
        document.getElementById('email').value = email;
        document.getElementById('form_opc').value = "3"; // Cambia a código de editar
    }
</script>

<!-- Pie de página reutilizado del menú principal -->
<footer>
    <p>&copy; 2024 Universidad Tecnológica del Perú</p>
</footer>

</body>
</html>
