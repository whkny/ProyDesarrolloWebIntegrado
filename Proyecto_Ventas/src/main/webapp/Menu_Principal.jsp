<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Principal - Vega's Store</title>
    <!-- Enlazando el archivo CSS -->
    <link rel="stylesheet" href="styles.css"> 
    <style>
        /* Estilos generales */
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100%;
        }

        /* Imagen de fondo */
        body {
            background: url('fotos/FONDOMENU.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
        }

        /* Encabezado del sitio */
        header {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.5); /* Fondo negro con transparencia */
        }

        header h1 {
            margin: 0;
            font-size: 24px;
        }

        /* Menú en la parte superior derecha con difuminado negro */
        nav {
            position: absolute;
            top: 10px;
            right: 20px;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            background-color: rgba(0, 0, 0, 0.6); /* Fondo negro semi-transparente */
            padding: 10px 20px;
            border-radius: 5px;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 18px; /* Aumentando el tamaño de las letras */
            padding: 8px 16px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: rgba(255, 255, 255, 0.3); /* Efecto hover con transparencia */
        }

        /* Botón con borde blanco */
        .btn-llamar {
            border: 2px solid white;
            padding: 8px 16px;
            border-radius: 5px;
        }

        /* Texto central */
        .central-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }

        .central-text h2 {
            font-size: 60px;
            margin: 0;
        }

        .central-text p {
            font-size: 30px;
            margin: 10px 0 0;
        }

        /* Estilo del pie de página */
        footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            padding: 10px;
            background-color: rgba(0, 0, 0, 0.5); /* Fondo negro semi-transparente */
            text-align: center;
            color: white;
        }

        @media (max-width: 768px) {
            nav {
                flex-direction: column;
                align-items: flex-start;
                padding: 10px;
                width: 100%;
            }

            nav a {
                margin: 5px 0;
                font-size: 16px;
            }

            .central-text h2 {
                font-size: 40px;
            }

            .central-text p {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>

<header>
    <h1>Menu Principal</h1>
</header>

<!-- Menú   -->
<nav>
    <a href="Menu_Principal.jsp">INICIO</a>
    <a href="pagCrudProv.jsp">PROVEEDORES</a>
    <a href="pagVentas.jsp">VENTAS</a>
    <a href="pagProducto.jsp">PRODUCTOS</a>
</nav>

<!-- Texto centrado   -->
<div class="central-text">
    <h2>Vega's Store</h2>
    <p>La máxima calidad para nuestros clientes. Encuentra productos de primera calidad en nuestra tienda.</p>
</div>

<footer>
    <p>&copy; 2024 Universidad Tecnológica del Perú</p>
</footer>

</body>
</html>
