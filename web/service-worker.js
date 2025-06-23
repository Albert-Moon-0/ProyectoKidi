/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const CACHE_NAME = 'kidi-pwa-v1.0.0';
const STATIC_CACHE_NAME = 'kidi-static-v1.0.0';
const DYNAMIC_CACHE_NAME = 'kidi-dynamic-v1.0.0';

// Archivos estáticos para cachear (recursos que no cambian frecuentemente)
const STATIC_ASSETS = [
  '/',
  '/Sistema/menu.jsp',
  '/Sistema/EstilosPMaterias.css', // Ajusta según tus archivos CSS
    '/Sistema/EstilosFormularios.css', // Ajusta según tus archivos CSS
  '/Imagenes/logo.png',
  '/img/icons/icon-192x192.png',
  '/img/icons/icon-512x512.png',
  'https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css',
  'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css',
  '/offline.html' // Página offline personalizada
];

// Archivos dinámicos que se cachearán bajo demanda
const DYNAMIC_ASSETS = [
  '/Espanol/',
  '/Mates/',
  '/Ingles/'
];

// Event listener para la instalación del service worker
self.addEventListener('install', event => {
  console.log('Service Worker: Installing...');
  
  event.waitUntil(
    caches.open(STATIC_CACHE_NAME)
      .then(cache => {
        console.log('Service Worker: Caching static assets');
        return cache.addAll(STATIC_ASSETS);
      })
      .catch(error => {
        console.error('Service Worker: Error caching static assets', error);
      })
  );
  
  // Activa inmediatamente el nuevo service worker
  self.skipWaiting();
});

// Event listener para la activación del service worker
self.addEventListener('activate', event => {
  console.log('Service Worker: Activating...');
  
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.map(cacheName => {
          // Elimina caches antiguos
          if (cacheName !== STATIC_CACHE_NAME && cacheName !== DYNAMIC_CACHE_NAME) {
            console.log('Service Worker: Deleting old cache', cacheName);
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
  
  // Toma control inmediatamente de todas las páginas
  self.clients.claim();
});

// Event listener para interceptar las peticiones de red
self.addEventListener('fetch', event => {
  const requestUrl = new URL(event.request.url);
  
  // Solo cachea peticiones GET
  if (event.request.method !== 'GET') {
    return;
  }
  
  // Estrategia de cache para diferentes tipos de recursos
  if (isStaticAsset(event.request.url)) {
    // Cache First para recursos estáticos
    event.respondWith(cacheFirst(event.request));
  } else if (isApiRequest(event.request.url)) {
    // Network First para APIs y JSP
    event.respondWith(networkFirst(event.request));
  } else if (isImageRequest(event.request)) {
    // Cache First para imágenes
    event.respondWith(cacheFirst(event.request));
  } else {
    // Network First por defecto
    event.respondWith(networkFirst(event.request));
  }
});

// Estrategia Cache First
async function cacheFirst(request) {
  try {
    const cachedResponse = await caches.match(request);
    if (cachedResponse) {
      return cachedResponse;
    }
    
    const networkResponse = await fetch(request);
    
    // Cachea la respuesta si es exitosa
    if (networkResponse.status === 200) {
      const cache = await caches.open(DYNAMIC_CACHE_NAME);
      cache.put(request, networkResponse.clone());
    }
    
    return networkResponse;
  } catch (error) {
    console.error('Cache First failed:', error);
    return await getOfflinePage();
  }
}

// Estrategia Network First
async function networkFirst(request) {
  try {
    const networkResponse = await fetch(request);
    
    // Cachea la respuesta si es exitosa
    if (networkResponse.status === 200) {
      const cache = await caches.open(DYNAMIC_CACHE_NAME);
      cache.put(request, networkResponse.clone());
    }
    
    return networkResponse;
  } catch (error) {
    console.log('Network failed, trying cache:', error);
    
    const cachedResponse = await caches.match(request);
    if (cachedResponse) {
      return cachedResponse;
    }
    
    // Si es una página de navegación, devuelve la página offline
    if (request.mode === 'navigate') {
      return await getOfflinePage();
    }
    
    throw error;
  }
}

// Función para obtener la página offline
async function getOfflinePage() {
  const cache = await caches.open(STATIC_CACHE_NAME);
  return await cache.match('/offline.html');
}

// Función para determinar si es un recurso estático
function isStaticAsset(url) {
  return url.includes('bootstrap') || 
         url.includes('font-awesome') || 
         url.includes('.css') || 
         url.includes('.js') ||
         url.includes('/img/');
}

// Función para determinar si es una petición a API o JSP
function isApiRequest(url) {
  return url.includes('.jsp') || 
         url.includes('/api/') ||
         url.includes('/Sistema/') ||
         url.includes('/Espanol/') ||
         url.includes('/Mates/') ||
         url.includes('/Ingles/');
}

// Función para determinar si es una petición de imagen
function isImageRequest(request) {
  return request.destination === 'image' ||
         request.url.includes('.png') ||
         request.url.includes('.jpg') ||
         request.url.includes('.jpeg') ||
         request.url.includes('.gif') ||
         request.url.includes('.svg');
}

// Event listener para mensajes del cliente
self.addEventListener('message', event => {
  if (event.data && event.data.type === 'SKIP_WAITING') {
    self.skipWaiting();
  }
});

// Sincronización en segundo plano (para funcionalidades futuras)
self.addEventListener('sync', event => {
  if (event.tag === 'background-sync') {
    event.waitUntil(doBackgroundSync());
  }
});

async function doBackgroundSync() {
  console.log('Service Worker: Background sync');
  // Aquí puedes agregar lógica para sincronizar datos cuando se recupere la conexión
}

// Manejo de notificaciones push (para funcionalidades futuras)
self.addEventListener('push', event => {
  const options = {
    body: event.data ? event.data.text() : 'Nueva notificación de KIDI',
    icon: '/img/icons/icon-192x192.png',
    badge: '/img/icons/icon-72x72.png',
    vibrate: [100, 50, 100],
    data: {
      dateOfArrival: Date.now(),
      primaryKey: 1
    },
    actions: [
      {
        action: 'explore',
        title: 'Ver más',
        icon: '/img/icons/icon-192x192.png'
      },
      {
        action: 'close',
        title: 'Cerrar',
        icon: '/img/icons/icon-192x192.png'
      }
    ]
  };
  
  event.waitUntil(
    self.registration.showNotification('KIDI', options)
  );
});

// Manejo de clicks en notificaciones
self.addEventListener('notificationclick', event => {
  event.notification.close();
  
  if (event.action === 'explore') {
    event.waitUntil(
      clients.openWindow('/Sistema/menu.jsp')
    );
  }
});
