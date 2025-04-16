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
                // Ajustar tamaño de los gráficos cuando cambia el tamaño de la ventana
                window.addEventListener('resize', function() {
                    chart1.resize();
                });
                
            } else {
                console.warn("No se recibieron datos para las actividades");
                // Opcionalmente, mostrar un mensaje al usuario
                document.getElementById("actividadesChart").innerHTML = 
                    "<div style='text-align:center; padding:20px;'>No hay datos de actividades disponibles</div>";
            }
            // En tu código JavaScript, dentro del bloque .then(data => {...})
            if (data && data.actividadesSemana !== undefined) {
                document.getElementById("numActvsSemana").textContent = data.actividadesSemana;
            }
            if (data && data.actividadesT !== undefined) {
                document.getElementById("numActvs").textContent = data.actividadesT;
            }
            if (data && data.promedioGeneral !== undefined) {
                document.getElementById("promG").textContent = data.promedioGeneral.toFixed(2);
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

    
    const materia = datos.map(item => item.materia);
    const promedio = datos.map(item => item.promedio);
    
    return {
        title: {
            text: 'Desempeño Materias'
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
            data: materia
        },
        yAxis: {
            type: 'value',
            max: 10
        },
        series: [
            {
                name: 'Promedio',
                type: 'bar',
                data: promedio,
                itemStyle: {
                    color: function(params) {
                        // Colores diferentes para cada materia
                        const colors = ['#6C8AE8', '#E8766C', '#6CE8A4'];
                        return colors[params.dataIndex % colors.length];
                    }
                },
                label: {
                    show: true,
                    position: 'top',
                    formatter: '{c}/10'
                }
            }
        ]
    };
};

window.addEventListener('load', () => {
    initcharts();
});
