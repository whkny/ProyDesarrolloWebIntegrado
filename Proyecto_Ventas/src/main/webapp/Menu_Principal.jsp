<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Principal</title>
    <link rel="stylesheet" href="styles.css"> <!-- Enlazando el archivo CSS -->
    <style>
        /* Estilos del menú */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-align: center;
        }

        nav {
            background-color: #333;
            overflow: hidden;
        }

        nav a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: #ddd;
            color: black;
        }

        .menu-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px 0;
        }

        .menu-item {
            margin: 0 15px;
            padding: 15px;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .menu-item:hover {
            background-color: #45a049;
            cursor: pointer;
        }

        footer {
            text-align: center;
            padding: 10px;
            background-color: #333;
            color: white;
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

<header>
    <h1>UTP Store</h1>
</header>

<nav>
    <div class="menu-container">
        <div class="menu-item" onclick="window.location.href='pagCrudProv.jsp'">Proveedores</div>
        <div class="menu-item" onclick="window.location.href='pagProducto.jsp'">Productos</div>
        <div class="menu-item" onclick="window.location.href='pagVentas.jsp'">Ventas</div>
    </div>
</nav>

<main>
    <h2>Menu Principal</h2>
    <p>   </p>
</main>

<footer>
    <p>&copy; Universidad Tecnologica del Peru</p>
</footer>

</body>
</html>
