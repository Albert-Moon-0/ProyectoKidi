/* 
 * ScriptGraficas.js - Versión mejorada para evitar problemas de caché y variables globales
 */

// Encapsular todo en un IIFE para evitar contaminación del scope global
(function() {
    'use strict';
    
    // Variables locales para evitar conflictos globales
    let chartInstance = null;
    let isInitialized = false;
    
    const initcharts = () => {
        // Prevenir múltiples inicializaciones
        if (isInitialized) {
            console.log('Gráficos ya inicializados');
            return;
        }
        
        // Generar timestamp único para cache busting
        const timestamp = new Date().getTime();
        const randomParam = Math.random().toString(36).substr(2, 9);
        
        // Mostrar estado de carga
        const statusElement = document.getElementById("chartStatus");
        if (statusElement) {
            statusElement.style.display = 'block';
            statusElement.innerHTML = `
                <div><i class="fas fa-spinner fa-spin"></i></div>
                <div>Cargando datos del gráfico...</div>
            `;
        }
        
        // Incluir los parámetros en la URL con cache busting
        const fetchUrl = `DataGraficas.jsp?t=${timestamp}&r=${randomParam}`;
        
        fetch(fetchUrl, {
            method: 'GET',
            headers: {
                'Cache-Control': 'no-cache, no-store, must-revalidate',
                'Pragma': 'no-cache',
                'Expires': '0'
            }
        })
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            
            // Obtener el texto de la respuesta para debug
            return response.text().then(text => {
                console.log("Respuesta del servidor:", text);
                
                // Verificar si es JSON válido
                try {
                    return JSON.parse(text);
                } catch (jsonError) {
                    console.error("Error parsing JSON:", jsonError);
                    console.error("Contenido recibido:", text.substring(0, 500)); // Primeros 500 caracteres
                    throw new Error(`Respuesta no es JSON válido: ${text.substring(0, 100)}...`);
                }
            });
        })
        .then(data => {
            // Procesar los datos recibidos
            console.log("Datos recibidos:", data);
            
            // Ocultar mensaje de carga
            if (statusElement) {
                statusElement.style.display = 'none';
            }
            
            // Verificar si hay datos antes de inicializar el gráfico
            if (data && data.actividades && data.actividades.length > 0) {
                const chartElement = document.getElementById("actividadesChart");
                if (chartElement) {
                    // Limpiar instancia previa si existe
                    if (chartInstance) {
                        chartInstance.dispose();
                        chartInstance = null;
                    }
                    
                    // Mostrar el contenedor del gráfico
                    chartElement.style.display = 'block';
                    
                    // Inicializar el nuevo gráfico
                    chartInstance = echarts.init(chartElement);
                    chartInstance.setOption(getOptionChart1(data.actividades));
                    
                    // Ajustar tamaño de los gráficos cuando cambia el tamaño de la ventana
                    const resizeHandler = function() {
                        if (chartInstance) {
                            chartInstance.resize();
                        }
                    };
                    
                    // Remover listener previo si existe
                    window.removeEventListener('resize', resizeHandler);
                    window.addEventListener('resize', resizeHandler);
                    
                    isInitialized = true;
                } else {
                    console.error("Elemento actividadesChart no encontrado");
                }
            } else {
                console.warn("No se recibieron datos para las actividades");
                const chartElement = document.getElementById("actividadesChart");
                if (chartElement) {
                    chartElement.style.display = 'block';
                    chartElement.innerHTML = 
                        "<div style='text-align:center; padding:20px; color: #666;'>" +
                        "<i class='fas fa-chart-bar' style='font-size: 48px; margin-bottom: 10px;'></i>" +
                        "<br>No hay datos de actividades disponibles</div>";
                }
            }
            
            // Actualizar estadísticas con validación
            updateStatistics(data);
        })
        .catch(error => {
            console.error("Error al obtener los datos:", error);
            
            // Mostrar mensaje de error al usuario
            if (statusElement) {
                statusElement.innerHTML = `
                    <div style="color: #dc3545; text-align: center; padding: 20px;">
                        <i class="fas fa-exclamation-triangle" style="font-size: 24px; margin-bottom: 10px;"></i>
                        <br>Error al cargar los datos: ${error.message}
                        <br><small>Intenta recargar la página</small>
                    </div>
                `;
            }
        });
    };

    // Función para actualizar estadísticas con validación
    const updateStatistics = (data) => {
        try {
            if (data && data.actividadesSemana !== undefined) {
                const element = document.getElementById("numActvsSemana");
                if (element) element.textContent = data.actividadesSemana;
            }
            
            if (data && data.actividadesT !== undefined) {
                const element = document.getElementById("numActvs");
                if (element) element.textContent = data.actividadesT;
            }
            
            if (data && data.promedioGeneral !== undefined) {
                const element = document.getElementById("promG");
                if (element) element.textContent = data.promedioGeneral.toFixed(2);
            }
            
            // Actualizar materia con menor puntuación si está disponible
            if (data && data.materiaConMenorPuntuacion) {
                const element = document.getElementById("matBaja");
                if (element) element.textContent = data.materiaConMenorPuntuación;
            }
        } catch (error) {
            console.error("Error actualizando estadísticas:", error);
        }
    };

    // Función para generar opciones del gráfico
    function getOptionChart1(datos) {
        if (!datos || datos.length === 0) {
            console.warn("No se recibieron datos para las actividades");
            return {}; // Devolver un objeto vacío o una configuración por defecto
        }

        const materia = datos.map(item => item.materia);
        const promedio = datos.map(item => parseFloat(item.promedio) || 0);
        
        return {
            title: {
                text: 'Desempeño por Materias',
                left: 'center',
                textStyle: {
                    fontSize: 18,
                    fontWeight: 'bold'
                }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                },
                formatter: function(params) {
                    return `${params[0].name}<br/>${params[0].seriesName}: ${params[0].value}/10`;
                }
            },
            toolbox: {
                feature: {
                    saveAsImage: {
                        name: 'desempeno_materias'
                    }
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
                data: materia,
                axisLabel: {
                    rotate: 45,
                    fontSize: 12
                }
            },
            yAxis: {
                type: 'value',
                max: 10,
                min: 0
            },
            series: [
                {
                    name: 'Promedio',
                    type: 'bar',
                    data: promedio,
                    itemStyle: {
                        color: function(params) {
                            // Colores diferentes para cada materia
                            const colors = ['#6C8AE8', '#E8766C', '#6CE8A4', '#F4A460', '#9370DB'];
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
    }

    // Limpiar recursos al salir de la página
    window.addEventListener('beforeunload', function() {
        if (chartInstance) {
            chartInstance.dispose();
            chartInstance = null;
        }
    });

    // Inicializar cuando el DOM esté listo
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initcharts);
    } else {
        // DOM ya está listo
        initcharts();
    }

})();