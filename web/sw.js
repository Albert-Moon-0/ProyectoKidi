const CACHE_NAME = 'kidi-pwa-v1.0.0';


self.addEventListener('install', function(e) {
  console.log('Service Worker instalado');
  e.waitUntil(
    caches.open('kidi-pwa-v1.0.0').then(function(cache) {
      return cache.addAll([
        '/',
        '/index.html',
        '/iniciodesesion.jsp',
        '/manifest.json'
      ]);
    })
  );
});

self.addEventListener('fetch', function(e) {
  e.respondWith(
    caches.match(e.request).then(function(response) {
      return response || fetch(e.request);
    })
  );
});
