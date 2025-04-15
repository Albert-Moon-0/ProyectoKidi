/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/* global echarts, data, datos */

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
/* global echarts */

const initcharts = () => {
    
    
    // Incluir los parámetros en la URL
    fetch(`DataGraficas.jsp`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            // Procesar los datos recibidos
            console.log("Datos recibidos:", data);
            
            // Verificar si hay datos antes de inicializar el gráfico
            if (data && data.actividades && data.actividades.length > 0) {
                const chart1 = echarts.init(document.getElementById("actividadesChart"));
                chart1.setOption(getOptionChart1(data.actividades));
                const chart2 = echarts.init(document.getElementById("logrosChart"));
                chart2.setOption(getOptionChart1(data.actividades));
            } else {
                console.warn("No se recibieron datos para las actividades");
                // Opcionalmente, mostrar un mensaje al usuario
                document.getElementById("actividadesChart").innerHTML = 
                    "<div style='text-align:center; padding:20px;'>No hay datos de actividades disponibles</div>";
            }
        })
        .catch(error => {
            console.error("Error al obtener los datos:", error);
        });
};


function getOptionChart1(datos) {
    
    if (!datos || datos.length === 0) {
        console.warn("No se recibieron datos para las actividades");
        return {}; // Devolver un objeto vacío o una configuración por defecto
    }
    
    const actividad = datos.map(item => item.actividad);
    const puntaje = datos.map(item => item.puntaje);
    
    return {
        title: {
            text: 'Desempeño actividades'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        toolbox: {
            feature: {
                saveAsImage:{}
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'category',                              
            data: actividad
        },
        yAxis: {
            type: 'value',
            max: 10
        },
        series: [
            {
                name: 'Calificación',
                type: 'bar',
                data: puntaje,
                itemStyle: {
                    color: '#6C8AE8'
                }
            }
        ]
    };
};

window.addEventListener('load', () => {
    initcharts();
});
