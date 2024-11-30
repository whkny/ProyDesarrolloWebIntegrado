<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.Negocio" %>
<%@ page import="modelo.MarcaVenta" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ventas - Vega's Store</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- Cargar Chart.js -->
    
    <!-- Enlace al archivo CSS -->
    <link rel="stylesheet" href="css/styles.css">

</head>
<body>

<h1>Ventas</h1>

<%
    Negocio negocio = new Negocio();
    List<Integer> ventas = negocio.LisMes(2024); // Obtener ventas para el año 2024
    List<MarcaVenta> ventasPorMarca = negocio.obtenerVentasPorMarca(); // Obtener ventas por marca
%>

<div class="grafico-container">
    <!-- Gráfico de ventas por mes -->
    <div>
        <canvas id="ventasChart"></canvas>
    </div>

    <!-- Gráfico de ventas por marca -->
    <div>
        <canvas id="ventasPorMarcaChart"></canvas>
    </div>
</div>

<script>
    // Gráfico de ventas por mes
    const ctxVentas = document.getElementById('ventasChart').getContext('2d');
    const ventasData = <%= ventas %>; // Convertir la lista de ventas a JavaScript

    const ventasChart = new Chart(ctxVentas, {
        type: 'bar',
        data: {
            labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            datasets: [{
                label: 'Total Ventas',
                data: ventasData,
                backgroundColor: 'rgba(75, 192, 192, 0.6)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // Gráfico de ventas por marca
    const ctxMarca = document.getElementById('ventasPorMarcaChart').getContext('2d');

    // Variables para almacenar los datos de ventas por marca
    const marcas = [];
    const totales = [];

    <%
        for (MarcaVenta marca : ventasPorMarca) {
            out.print("marcas.push('" + marca.getMarca() + "');");
            out.print("totales.push(" + marca.getTotal() + ");");
        }
    %>

    const marcasChart = new Chart(ctxMarca, {
        type: 'bar',
        data: {
            labels: marcas,
            datasets: [{
                label: 'Ventas por Marca',
                data: totales,
                backgroundColor: 'rgba(153, 102, 255, 0.6)',
                borderColor: 'rgba(153, 102, 255, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

</body>
</html>
