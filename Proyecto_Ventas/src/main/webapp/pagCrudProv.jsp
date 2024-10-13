<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="modelo.Empresas"%>
<%@ page import="dao.Negocio"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Proveedores</title>
    <link rel="stylesheet" href="styles.css"> <!-- Incluye tus estilos -->
</head>
<body>

    <h1>Gestión de Proveedores</h1>

    <!-- Formulario para agregar/editar proveedor -->
    <form action="Control" method="post">
        <input type="hidden" name="opc" value="2" id="form_opc" /> <!-- Código para grabar -->
        <input type="hidden" name="id" id="id" value=""/>
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" id="nombre" required /><br/>

        <label for="direccion">Dirección:</label>
        <input type="text" name="direccion" id="direccion" required /><br/>

        <label for="telefono">Teléfono:</label>
        <input type="text" name="telefono" id="telefono" required /><br/>

        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required /><br/>

        <button type="submit">Guardar Proveedor</button>
    </form>

    <h2>Lista de Proveedores</h2>
    <table border="1">
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
                <td>
                    <form action="Control" method="post" style="display:inline;">
                        <input type="hidden" name="opc" value="3" /> <!-- Código para editar -->
                        <input type="hidden" name="id" value="<%= proveedor.getCod_emp() %>" />
                        <input type="hidden" name="nombre" value="<%= proveedor.getNom_emp() %>" />
                        <input type="hidden" name="direccion" value="<%= proveedor.getDirec_emp() %>" />
                        <input type="hidden" name="telefono" value="<%= proveedor.getTelef_emp() %>" />
                        <input type="hidden" name="email" value="<%= proveedor.getEmail_emp() %>" />
                        <button type="submit" onclick="cargarDatos('<%= proveedor.getCod_emp() %>', '<%= proveedor.getNom_emp() %>', '<%= proveedor.getDirec_emp() %>', '<%= proveedor.getTelef_emp() %>', '<%= proveedor.getEmail_emp() %>'); return false;">Editar</button>
                    </form>
                    <form action="Control" method="post" style="display:inline;">
                        <input type="hidden" name="opc" value="4" /> <!-- Código para borrar -->
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
</body>
</html>
