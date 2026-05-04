self.addEventListener('install', (event) => {
    // Aktiviert den Service Worker sofort
    self.skipWaiting();
});

self.addEventListener('activate', (event) => {
    // Übernimmt die Kontrolle über die Seiten sofort
    event.waitUntil(clients.claim());
});

self.addEventListener('fetch', (event) => {
    // Fängt standardmäßig nichts ab, sorgt aber dafür, dass der Browser die PWA erkennt.
});