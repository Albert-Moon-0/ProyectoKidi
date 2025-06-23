<%-- 
    Document   : pwa_footer
    Created on : 23 jun 2025, 11:39:02
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Registro del Service Worker -->
<script>
    // Verificar si el navegador soporta Service Workers
    if ('serviceWorker' in navigator) {
        window.addEventListener('load', function() {
            navigator.serviceWorker.register('<%= request.getContextPath() %>/service-worker.js')
                .then(function(registration) {
                    console.log('Service Worker registrado con éxito:', registration.scope);
                    
                    // Verificar si hay actualizaciones
                    registration.addEventListener('updatefound', function() {
                        const newWorker = registration.installing;
                        
                        newWorker.addEventListener('statechange', function() {
                            if (newWorker.state === 'installed' && navigator.serviceWorker.controller) {
                                // Hay una nueva versión disponible
                                showUpdateNotification();
                            }
                        });
                    });
                })
                .catch(function(error) {
                    console.log('Error al registrar Service Worker:', error);
                });
        });
    }

    // Mostrar notificación de actualización disponible
    function showUpdateNotification() {
        if (confirm('¡Hay una nueva versión de KIDI disponible! ¿Deseas actualizarla?')) {
            window.location.reload();
        }
    }

    // Detectar si la app está siendo ejecutada como PWA
    function isPWA() {
        return window.matchMedia('(display-mode: standalone)').matches || 
               window.navigator.standalone === true;
    }

    // Funciones para manejar el estado de la conexión
    function updateOnlineStatus() {
        const statusElement = document.getElementById('connection-status');
        if (navigator.onLine) {
            if (statusElement) {
                statusElement.style.display = 'none';
            }
            console.log('Conexión restaurada');
        } else {
            if (statusElement) {
                statusElement.style.display = 'block';
            }
            console.log('Sin conexión');
        }
    }

    // Event listeners para cambios de conexión
    window.addEventListener('online', updateOnlineStatus);
    window.addEventListener('offline', updateOnlineStatus);
    
    // Verificar estado inicial
    document.addEventListener('DOMContentLoaded', function() {
        updateOnlineStatus();
        
        // Si es PWA, ocultar elementos innecesarios
        if (isPWA()) {
            document.body.classList.add('pwa-mode');
        }
    });

    // Función para instalar la PWA (solo para navegadores compatibles)
    let deferredPrompt;
    
    window.addEventListener('beforeinstallprompt', function(e) {
        e.preventDefault();
        deferredPrompt = e;
        
        // Mostrar botón de instalación personalizado
        const installButton = document.getElementById('install-button');
        if (installButton) {
            installButton.style.display = 'block';
            installButton.addEventListener('click', function() {
                deferredPrompt.prompt();
                deferredPrompt.userChoice.then(function(choiceResult) {
                    if (choiceResult.outcome === 'accepted') {
                        console.log('PWA instalada');
                    }
                    deferredPrompt = null;
                    installButton.style.display = 'none';
                });
            });
        }
    });

    // Función para enviar notificación push (ejemplo)
    function sendPushNotification(title, body, icon) {
        if ('Notification' in window && Notification.permission === 'granted') {
            navigator.serviceWorker.ready.then(function(registration) {
                registration.showNotification(title, {
                    body: body,
                    icon: icon || '<%= request.getContextPath() %>/img/icons/icon-192x192.png',
                    badge: '<%= request.getContextPath() %>/img/icons/icon-72x72.png',
                    vibrate: [100, 50, 100],
                    data: {
                        dateOfArrival: Date.now(),
                        primaryKey: 1
                    }
                });
            });
        }
    }

    // Solicitar permisos de notificación
    function requestNotificationPermission() {
        if ('Notification' in window && Notification.permission === 'default') {
            Notification.requestPermission().then(function(permission) {
                if (permission === 'granted') {
                    console.log('Permisos de notificación concedidos');
                }
            });
        }
    }

    // Llamar al cargar la página
    document.addEventListener('DOMContentLoaded', requestNotificationPermission);
</script>

<!-- Indicador de estado de conexión -->
<div id="connection-status" style="
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    background: #ff6b6b;
    color: white;
    text-align: center;
    padding: 8px;
    font-size: 14px;
    z-index: 10000;
">
    📶 Sin conexión a internet - Trabajando en modo offline
</div>

<!-- Botón de instalación PWA (opcional) -->
<button id="install-button" style="
    display: none;
    position: fixed;
    bottom: 20px;
    right: 20px;
    background: #3B7DDD;
    color: white;
    border: none;
    padding: 12px 20px;
    border-radius: 25px;
    font-size: 14px;
    cursor: pointer;
    box-shadow: 0 4px 12px rgba(59, 125, 221, 0.3);
    z-index: 1000;
">
    📱 Instalar App
</button>

<!-- Estilos adicionales para PWA -->
<style>
    /* Estilos cuando la app está en modo PWA */
    .pwa-mode {
        /* Ajustes específicos para cuando se ejecuta como app */
        -webkit-user-select: none;
        -webkit-touch-callout: none;
    }
    
    /* Ocultar scroll bars en PWA para una experiencia más nativa */
    .pwa-mode::-webkit-scrollbar {
        display: none;
    }
    
    /* Animación para el botón de instalación */
    #install-button {
        animation: pulse-install 2s infinite;
    }
    
    @keyframes pulse-install {
        0% { transform: scale(1); }
        50% { transform: scale(1.05); }
        100% { transform: scale(1); }
    }
</style>
